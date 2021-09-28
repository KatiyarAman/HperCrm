package com.sterp.multitenant.tenant.settings.smtp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.branch.entity.Branch;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.dto.CommonPagingResponse;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.CustomException;
import com.sterp.multitenant.tenant.exceptionhandler.ResourceNotFoundException;
import com.sterp.multitenant.tenant.followup.entity.FollowUps;
import com.sterp.multitenant.tenant.settings.smtp.entity.SMTPSettings;
import com.sterp.multitenant.tenant.settings.smtp.repository.SMTPSettingsRepository;
import com.sterp.multitenant.tenant.settings.smtp.service.SMTPSettingsService;

import io.jsonwebtoken.Claims;

@Service
public class SMTPSettingsServiceImpl implements SMTPSettingsService {

	@Autowired
	SMTPSettingsRepository SMTPSettingsRepository;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	AppService appService;

	@Override
	public Long getCount() {
		return this.SMTPSettingsRepository.count();
	}

	@Override
	public Session smtpConfig(HttpServletRequest request) {

		Claims claims=(Claims) request.getAttribute("claims");
		String defaultloginbranch=claims.get("defaultloginbranch").toString();
		Long loginBranchId=Long.valueOf(defaultloginbranch);
		Long loginCompanyId = this.commonService.getById(Branch.class, loginBranchId).getCompanyId();
		List<SMTPSettings> smtpSettings = SMTPSettingsRepository.findCustomByCompany(loginCompanyId,true);
		if (smtpSettings.size() != 0) {
			SMTPSettings smtpSetting = smtpSettings.get(0);
			final String username = smtpSetting.getUsername();
			final String password = smtpSetting.getPassword();
			Properties prop = new Properties();
			prop.put("mail.smtp.host", smtpSetting.getHost());
			prop.put("mail.smtp.port", smtpSetting.getPort());// "587"
			prop.put("mail.smtp.auth", smtpSetting.isAuth());
			prop.put("mail.smtp.connectiontimeout", 5000);
			prop.put("mail.smtp.timeout", 5000);
			prop.put("mail.smtp.writetimeout", 5000);
			prop.put("mail.smtp.socketFactory.port", smtpSetting.getSocketFactoryPort());// "465"
			prop.put("mail.smtp.socketFactory.class", smtpSetting.getSocketFactoryClass());// "javax.net.ssl.SSLSocketFactory"
			prop.put("mail.smtp.ssl.enable", smtpSetting.isSsl());
			Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			return session;
		} else {
			throw new CustomException("SMTP Configuration not found.");
		}
	}

	@Override
	public Session smtpConfig(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Session smtpTestMailConfigProvider(SMTPSettings smtpSettingsDto) {
//		#spring.mail.properties.mail.smtp.auth=true
//				#spring.mail.properties.mail.smtp.connectiontimeout=5000
//				#spring.mail.properties.mail.smtp.timeout=5000
//				#spring.mail.properties.mail.smtp.writetimeout=5000
		try {
			final String username = smtpSettingsDto.getUsername();
			final String password = smtpSettingsDto.getPassword();
			Properties prop = new Properties();
			prop.put("mail.smtp.host", smtpSettingsDto.getHost());
			prop.put("mail.smtp.port", smtpSettingsDto.getPort());// "587"
			prop.put("mail.smtp.auth", smtpSettingsDto.isAuth());
			prop.put("mail.smtp.connectiontimeout", 5000);
			prop.put("mail.smtp.timeout", 5000);
			prop.put("mail.smtp.writetimeout", 5000);
			prop.put("mail.smtp.socketFactory.port", smtpSettingsDto.getSocketFactoryPort());// "465"
			prop.put("mail.smtp.socketFactory.class", smtpSettingsDto.getSocketFactoryClass());// "javax.net.ssl.SSLSocketFactory"
			prop.put("mail.smtp.ssl.enable", smtpSettingsDto.isSsl());
			prop.put("mail.smtp.starttls.enable", smtpSettingsDto.isStarttls());
			prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
			prop.put("mail.smtp.ssl.trust", smtpSettingsDto.getHost());
			Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});
			return session;
		} catch (Exception e) {
			throw new CustomException("SMTP Configuration not found.");
		}
	}

	@Override
	public void addSmtpConfig(HttpServletRequest request, SMTPSettings smtpSetting, MultipartFile[] files) {
		request.setAttribute("moduleId", request.getHeader("moduleId"));
		this.commonService.addUpdate(request, smtpSetting, files);
//		this.SMTPSettingsRepository.save(smtpSetting);
	}

	@Override
	public Page<SMTPSettings> smtpConfigList(Pageable pageable, String search) {
		if (!search.isEmpty()) {
			return this.SMTPSettingsRepository.findCustom(pageable, search);
		} else {
			return this.SMTPSettingsRepository.findAll(pageable);
		}
	}

	@Override
	public SMTPSettings getById(Long id, boolean isCacheable) {
		// TODO Auto-generated method stub
		return this.SMTPSettingsRepository.findById(id).get();
	}

	@Override
	public Map<String, Object> getSelectionList(boolean isCacheable) {
		Map<String, Object> response = new HashMap<String, Object>();
		List<CommonDropdownResponseDataTravelObject> smtp = this.SMTPSettingsRepository.getSelectionList();
		if (smtp.size() == 0) {
			throw new ResourceNotFoundException("No Active SMTP Settings found");
		}
		response.put("data", smtp);
		return response;
	}

	@Override
	public Map<String, Object> getFilteredList(HttpServletRequest request, Map<String, Object> params) {
		Map<String, Object> response = new HashMap<String, Object>();
		params.put("module_id", Long.parseLong(request.getHeader("moduleId")));
		CommonPagingResponse<SMTPSettings> smtp = this.commonService.getCommonFilteredList(SMTPSettings.class, params);
		response.put("data",smtp);
		return response;
	}

}
