package com.sterp.multitenant.tenant.settings.smtp.service;

import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.settings.smtp.entity.SMTPSettings;

public interface SMTPSettingsService {

	public Long getCount();

	public Session smtpConfig(HttpServletRequest request);

	public Session smtpConfig(int id);

	public Session smtpTestMailConfigProvider(SMTPSettings smtpSettingsDto);

	public void addSmtpConfig(HttpServletRequest request, SMTPSettings smtpSetting, MultipartFile[] files);

	public Page<SMTPSettings> smtpConfigList(Pageable pageable, String search);

	public SMTPSettings getById(Long id, boolean isCacheable);

	public Map<String, Object> getSelectionList(boolean isCacheable);

	public Map<String, Object> getFilteredList(HttpServletRequest request, Map<String, Object> params);
}
