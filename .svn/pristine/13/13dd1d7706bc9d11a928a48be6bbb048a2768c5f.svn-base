package com.sterp.multitenant.tenant.uploadutility.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.dto.DocumentRequestDTO;
import com.sterp.multitenant.tenant.uploadutility.dto.IfDefaultLoggedInData;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;

public interface DocumentUploadService {
	public void uploadDocuments(List<Documents> documents, MultipartFile[] files,
			IfDefaultLoggedInData defaultLoggedInData, Long documentId, String documentName,
			HttpServletRequest request) throws SerialException, SQLException;

	public void fetchDocuments(IfDefaultLoggedInData defaultLoggedInData, HttpServletRequest request);

	public List<Documents> getDocuments(Long id, Long moduleId);

	public Documents getBydId(Long id);

	public Map<String, Object> uploadData(Map<String, Object> object, MultipartFile[] files,
			HttpServletRequest request, IfDefaultLoggedInData ifDefaultLoggedInData) throws SerialException, SQLException;

	public Map<String, Object> moduleDocuments(Map<String, Object> object, HttpServletRequest request);

//	public DocumentFolder documentFolderByName(String documentFolder);
}
