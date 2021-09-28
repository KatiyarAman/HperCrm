package com.sterp.multitenant.tenant.settings.smtp.service.impl;

import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Sort;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import com.sterp.multitenant.tenant.branch.entity.Branch;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.CustomException;
import com.sterp.multitenant.tenant.settings.smtp.dto.MailBody;
import com.sterp.multitenant.tenant.settings.smtp.entity.SMTPSettings;
import com.sterp.multitenant.tenant.settings.smtp.service.EmailService;
import com.sterp.multitenant.tenant.settings.smtp.service.SMTPSettingsService;

import io.jsonwebtoken.Claims;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	SMTPSettingsService SMTPSettingsService;

	@Autowired
	ModelMapper modelMapper;

	@Autowired
	AppService appService;
	
	@Autowired
	SpringTemplateEngine templateEngine;

	@Override
	public Map<String, Object> composeMail(HttpServletRequest request,MailBody mailBody, MultipartFile[] attachments) {
		Map<String, Object> response = new HashMap<String, Object>();
		try {
			UserEntity currentUser = this.appService.getCurrentUser();
			MimeMessage message = new MimeMessage(SMTPSettingsService.smtpConfig(request));
//			 MimeBodyPart htmlPart = new MimeBodyPart();
//			 Multipart multiPart = new MimeMultipart();
//		        htmlPart.setContent(bodyHtml, "text/html; charset=UTF-8");
			MimeMessageHelper helper = new MimeMessageHelper(message, MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
					StandardCharsets.UTF_8.name());

			Map<String, Object> props = new HashMap<String, Object>();
			props.put("mailBody", mailBody.getBody());
			Context context = new Context();
			context.setVariables(props);
			String html = templateEngine.process("mail/mail", context); //mailBody.getBody();// 
			
			String[] tos = mailBody.getRecipient().split(",");// mail.getTos().stream().toArray(String[]::new);
			
			if(mailBody.getCopyRecipent()!=null && !mailBody.getCopyRecipent().equals("")) {
				String[] cc = mailBody.getCopyRecipent().split(",");
				if(cc.length > 0){
					helper.setCc(cc);
				}
			}
			for (int i = 0; i < tos.length; i++) {
				helper.setTo(tos[i]);
				helper.setText(html,true);
				helper.setSubject(mailBody.getSubject());
				helper.setFrom(currentUser.getEmail());
				for (MultipartFile attachment : attachments) {
					helper.addAttachment(attachment.getOriginalFilename(), new ByteArrayResource(attachment.getBytes()));
				}
				Transport.send(message);
			}
			
			
			response.put("message", "Mail Send Successfully!");
		} catch (Exception e) {
			throw new CustomException(e.getMessage());
		}
		return response;
	}

	@Override
	public Map<String, Object> sendConfigurationTestMail(HttpServletRequest request,SMTPSettings smtpSettingsDto,MultipartFile[] files) {
		Map<String, Object> response = new HashMap<String, Object>();
		if (smtpSettingsDto.isTest()) {
			Session session = this.SMTPSettingsService.smtpTestMailConfigProvider(smtpSettingsDto);
			MimeMessage message = new MimeMessage(session);
			try {
				message.setFrom(new InternetAddress(smtpSettingsDto.getUsername()));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(smtpSettingsDto.getUsername()));
				message.setSubject("Testing Email SMTP Configuration.");
				message.setText("Dear Mail Crawler," + "\n\n Please do not spam my email!");
				Transport.send(message);
				// System.out.println(this.sendSms());
//				response.put("message", "Test mail sent successfully. You are good to go!");
				this.SMTPSettingsService.addSmtpConfig(request,smtpSettingsDto,files);
				response.put("message", "Test mail sent successfully and Mail configuration saved successfully.");
			} catch (Exception e) {
				e.printStackTrace();
				throw new CustomException(e.getMessage());
			}
		} else {
			this.SMTPSettingsService.addSmtpConfig(request,smtpSettingsDto,files);
			response.put("message", "Mail configuration saved successfully.");
		}
		return response;
	}

	@Override
	public Map<String, Object> getSMTPConfigList(int page, int limit, String search, String sort, String order,
			boolean filterRemove, int screenId) {
		UserEntity currentUser = this.appService.getCurrentUser();
		if (currentUser == null)
			throw new CustomException("Session has been timed out!");

		Map<String, Object> response = new HashMap<String, Object>();
		if ((sort == null) || (sort.isEmpty())) {
			sort = "id";
		}
		if ((order == null) || (order.isEmpty())) {
			order = Sort.Direction.ASC.toString();
		}
		int totalCount = this.SMTPSettingsService.getCount().intValue();
		Page<SMTPSettings> smtpSettings = null;

		if (totalCount == 0) {
			throw new CustomException("No Record Found");
		}

		smtpSettings = this.SMTPSettingsService.smtpConfigList(
				this.appService.createPageRequest((page - 1), limit, order.toUpperCase(), sort), search);

		if (!smtpSettings.isEmpty()) {
			response.put("data", smtpSettings);
			response.put("filter", Collections.emptyList());
			response.put("total", this.SMTPSettingsService.getCount());
			return response;
		} else {
			response.put("error", "No Record Found!");
			response.put("filter", Collections.emptyList());
			return response;
		}
	}

	@Override
	public SMTPSettings getById(Long id, boolean isCacheable) {
		SMTPSettings smtp = this.SMTPSettingsService.getById(id,isCacheable);
		return smtp;
	}

	@Override
	public Map<String, Object> getSelectionList(boolean isCacheable) {
		// TODO Auto-generated method stub
		return this.SMTPSettingsService.getSelectionList(isCacheable);
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest request, Map<String, Object> params) {
		// TODO Auto-generated method stub
		return this.SMTPSettingsService.getFilteredList(request,params);
	}

//	public String sendSms() {
//		try {
//			// Construct data
//			String apiKey = "apikey=" + "0/S4JqkPwMg-xsSWyVCzTsW02DdyNpbiRNnaKi93ER";
//			String message = "&message=" + "Hello Sanjay";
//			String sender = "&sender=" + "TXTLCL";
//			String numbers = "&numbers=" + "7827230454";
//
//			// Send data
//			HttpURLConnection conn = (HttpURLConnection) new URL("https://api.textlocal.in/send/?").openConnection();
//			String data = apiKey + numbers + message + sender;
//			conn.setDoOutput(true);
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Content-Length", Integer.toString(data.length()));
//			conn.getOutputStream().write(data.getBytes("UTF-8"));
//			final BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			final StringBuffer stringBuffer = new StringBuffer();
//			String line;
//			while ((line = rd.readLine()) != null) {
//				stringBuffer.append(line);
//			}
//			rd.close();
//
//			return stringBuffer.toString();
//		} catch (Exception e) {
//			System.out.println("Error SMS " + e);
//			return "Error " + e;
//		}
//	}

}
