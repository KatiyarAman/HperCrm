package com.sterp.multitenant.tenant.settings.smtp.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.settings.smtp.dto.MailBody;
import com.sterp.multitenant.tenant.settings.smtp.entity.SMTPSettings;

public interface EmailService {
	public Map<String, Object> composeMail(HttpServletRequest request, MailBody mailBody, MultipartFile[] attachments);

	public Map<String, Object> sendConfigurationTestMail(HttpServletRequest request, SMTPSettings smtpSettingsDto, MultipartFile[] multipartfile);

	public Map<String, Object> getSMTPConfigList(int page, int limit, String search, String sort, String order,
			boolean filterRemove, int screenId);

	public SMTPSettings getById(Long id, boolean isCacheable);

	public Map<String, Object> getSelectionList(boolean b);

	public Map<String, Object> getFilteredList(HttpServletRequest httpServletRequest, Map<String, Object> params);
}
