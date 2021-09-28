package com.sterp.multitenant.tenant.uploadutility.service.impl;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sterp.multitenant.tenant.core.repository.TypeRepository;
import com.sterp.multitenant.tenant.exceptionhandler.CustomException;
import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.modules.entity.Modules;
import com.sterp.multitenant.tenant.service.ModuleServiceMain;
import com.sterp.multitenant.tenant.uploadutility.dto.IfDefaultLoggedInData;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentContent;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentFolder;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentVersion;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;
import com.sterp.multitenant.tenant.uploadutility.repository.DocumentContentRepository;
import com.sterp.multitenant.tenant.uploadutility.repository.DocumentFolderRepository;
import com.sterp.multitenant.tenant.uploadutility.repository.DocumentVersionRepository;
import com.sterp.multitenant.tenant.uploadutility.repository.DocumentsRepository;
import com.sterp.multitenant.tenant.uploadutility.service.DocumentUploadService;
import com.sterp.multitenant.tenant.uploadutility.utils.FileHashingMD;

@Service
public class DocumentUploadServiceImpl implements DocumentUploadService {

	@Autowired
	ModuleServiceMain moduleService;

	@Autowired
	DocumentFolderRepository documentFolderRepository;

	@Autowired
	DocumentVersionRepository documentVersionRepository;

	@Autowired
	DocumentsRepository documentsRepository;

	@Autowired
	FileStorageUploadServiceImpl fileStorageUploadServiceImpl;

	@Autowired
	DocumentContentRepository documentContentRepository;
	
	@Autowired
	TypeRepository typeRepo;

	@Autowired
	ServletContext ctx;

	@Override
	public void fetchDocuments(IfDefaultLoggedInData defaultLoggedInData, HttpServletRequest request) {
		// TODO Auto-generated method stub
		long moduleId = Long.parseLong(request.getHeader("moduleId"));
		String moduleName = moduleService.getModuleById(moduleId, false).getTitle();

//		StringBuilder pathPrefix = new StringBuilder();
		if (moduleName.equalsIgnoreCase("Company")) {
			// pathPrefix.
		} else if (moduleName.equalsIgnoreCase("Branch")) {

		} else {

		}

	}

	@Override
	public void uploadDocuments(List<Documents> documentRequestDTOList, MultipartFile[] files,
			IfDefaultLoggedInData defaultLoggedInData, Long refDocId, String name, HttpServletRequest request) throws SerialException, SQLException {

		long moduleId = Long.parseLong(request.getAttribute("moduleId").toString());
		String moduleName = moduleService.getModuleById(moduleId, false).getTitle();
		DocumentFolder saveDocumentFolder = new DocumentFolder();
		StringBuffer destination = new StringBuffer();
		if (moduleName.equalsIgnoreCase("Company")) {
			// Check if Folder already created with the existing company name.
			if (!this.documentFolderByName(name, moduleId)) {
				
				// Create the folder - Database level
				saveDocumentFolder = this.saveDocumentFolder(moduleId, name, defaultLoggedInData, null);
				// Start of iteration of DocumentRequestDto and storing it.
				saveDocumentAndTheirVersion(refDocId,documentRequestDTOList,defaultLoggedInData,destination,moduleId,name,saveDocumentFolder.getId(),files);
			} else {
				Modules parentModule = moduleService.getModuleByTitle("Company", false);
				saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				saveDocumentAndTheirVersion(refDocId,documentRequestDTOList,defaultLoggedInData,destination,moduleId,name,saveDocumentFolder.getId(),files);
						//version 2 pending......................
			}
		} else if (moduleName.equalsIgnoreCase("Branch")) {
			Modules parentModule = moduleService.getModuleByTitle("Company", false);

			if (!this.documentFolderByName(defaultLoggedInData.getCompanyName(), parentModule.getId())) {
				saveDocumentFolder = this.saveDocumentFolder(parentModule.getId(), defaultLoggedInData.getCompanyName(), defaultLoggedInData, null);
			} else {
			    saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			DocumentFolder saveChildDocumentFolder = new DocumentFolder();
			if (!this.documentFolderByName(name, moduleId)) {
				saveChildDocumentFolder = this.saveDocumentFolder(moduleId, name, defaultLoggedInData,
						saveDocumentFolder.getId());

			}else {
				saveChildDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveDocumentFolder.getId(),2L,moduleId).get();
			}
			destination.append(defaultLoggedInData.getCompanyName()+"/");
			saveDocumentAndTheirVersion(refDocId,documentRequestDTOList,defaultLoggedInData,destination,moduleId,name,saveChildDocumentFolder.getId(),files);
		} else {
			Modules parentModule = moduleService.getModuleByTitle("Company", false);

			if (!this.documentFolderByName(defaultLoggedInData.getCompanyName(), parentModule.getId())) {
				saveDocumentFolder = this.saveDocumentFolder(parentModule.getId(), defaultLoggedInData.getCompanyName(), defaultLoggedInData, null);
			} else {
			    saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			Modules branchModule = moduleService.getModuleByTitle("Branch", false);
			DocumentFolder saveChildDocumentFolder = new DocumentFolder();
			if (!this.documentFolderByName(defaultLoggedInData.getBranchName(), branchModule.getId())) {
				saveChildDocumentFolder = this.saveDocumentFolder(branchModule.getId(), defaultLoggedInData.getBranchName(), defaultLoggedInData,
						saveDocumentFolder.getId());
			} else {
				saveChildDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveDocumentFolder.getId(),2L,branchModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			DocumentFolder saveModuleFolder = new DocumentFolder();
			Modules module = moduleService.getModuleById(moduleId, false);
			if (!this.documentFolderByName(module.getTitle(), moduleId)) {
				saveModuleFolder = this.saveDocumentFolder(moduleId, module.getTitle(), defaultLoggedInData,
						saveChildDocumentFolder.getId());
			} else {
				saveModuleFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveChildDocumentFolder.getId(),2L,moduleId).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			DocumentFolder saveDocFolder = new DocumentFolder();
			if (!this.documentFolderByName(name, moduleId)) {
				saveDocFolder = this.saveDocumentFolder(moduleId, name, defaultLoggedInData,
						saveModuleFolder.getId());
			} else {
				saveDocFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleIdAndFolderName(saveModuleFolder.getId(),2L,moduleId,name).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			destination.append(defaultLoggedInData.getCompanyName()+"/"+defaultLoggedInData.getBranchName()+"/"+module.getTitle()+"/");
			saveDocumentAndTheirVersion(refDocId,documentRequestDTOList,defaultLoggedInData,destination,moduleId,name,saveDocFolder.getId(),files);
		}

	}

	private boolean documentFolderByName(String documentFolderName, Long moduleId) {
		System.out.println(documentFolderRepository.findAll());
		Optional<DocumentFolder> optional = this.documentFolderRepository
				.findByFolderNameAndStatusAndModuleId(documentFolderName, 2L, moduleId);
		if (optional.isPresent()) {
			return true;
		}
		return false;
	}
	
	private boolean documentFolderByNameAndParent(String documentFolderName, Long moduleId, Long parentId) {
		System.out.println(documentFolderRepository.findAll());
		Optional<DocumentFolder> optional = this.documentFolderRepository
				.findByFolderNameAndStatusAndModuleIdAndParentFolderId(documentFolderName, 2L, moduleId,parentId);
		if (optional.isPresent()) {
			return true;
		}
		return false;
	}

	public DocumentFolder saveDocumentFolder(long moduleId, String name, IfDefaultLoggedInData defaultLoggedInData,
			Long parentId) {
		DocumentFolder saveDocumentFolder = new DocumentFolder();
		saveDocumentFolder.setFolderName(name);
		saveDocumentFolder.setModuleId(moduleId);
		saveDocumentFolder.setParentFolderId(parentId);
		saveDocumentFolder.setCompanyId(defaultLoggedInData.getCompanyId());
		saveDocumentFolder.setBranchId(defaultLoggedInData.getBranchId());
		saveDocumentFolder.setCreatedBy(defaultLoggedInData.getCreatedById());
		saveDocumentFolder.setModifiedBy(defaultLoggedInData.getCreatedById());
		saveDocumentFolder.setCreatedDate(new Date(System.currentTimeMillis()));
		saveDocumentFolder.setModifiedDate(new Date(System.currentTimeMillis()));
		saveDocumentFolder.setStatus(2L);
		saveDocumentFolder = this.documentFolderRepository.save(saveDocumentFolder);

		return saveDocumentFolder;
	}
	
	
	public void saveDocumentAndTheirVersion(Long refDocId,List<Documents> documentRequestDTOList,IfDefaultLoggedInData defaultLoggedInData,StringBuffer destination,Long moduleId,String name,Long documentId,MultipartFile[] files) throws SerialException, SQLException
	{
		MessageDigest md5Digest = null;
		try {
			md5Digest = MessageDigest.getInstance("MD5");

			List<Documents> documentToBeStoredList = new ArrayList<Documents>();

//			List<DocumentVersion> uploadDocumentVersionResponse = new ArrayList<DocumentVersion>();

			for (int i = 0; i < documentRequestDTOList.size(); i++) {
//				destination.delete(0, destination.length());
				destination.append(name + "/");
				DocumentFolder saveDocumentFolderChild = new DocumentFolder();

				Documents documentRequestDTO = documentRequestDTOList.get(i);
				Type type = new Type();
				type = this.typeRepo.findById(documentRequestDTO.getTypeId()).get();
				if (!this.documentFolderByNameAndParent(type.getType() , moduleId,documentId)) {
					saveDocumentFolderChild = this.saveDocumentFolder(moduleId,
							type.getType(), defaultLoggedInData,
							documentId);
					destination.append(saveDocumentFolderChild.getFolderName() + "/");
				} else {
					saveDocumentFolderChild = this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleIdAndFolderName(documentId,2L,moduleId,type.getType()).get();
					destination.append(saveDocumentFolderChild.getFolderName() + "/");
				}
				
				Documents documents = new Documents();
				if(documentRequestDTO.getId()==null) {
					documents.setDocumentName(documentRequestDTO.getDocumentName());
					documents.setDocumentFolderId(saveDocumentFolderChild.getId());
					documents.setTypeId(documentRequestDTO.getTypeId());
					documents.setRefDoc(refDocId);
					documents.setStatus(2L);
					documents.setShownInModule(true);
					documents.setCreatedBy(defaultLoggedInData.getCreatedById());
					documents.setModifiedBy(defaultLoggedInData.getCreatedById());
					documents.setCreatedDate(new Date(System.currentTimeMillis()));
					documents.setModifiedDate(new Date(System.currentTimeMillis()));
					documents.setBranchId(defaultLoggedInData.getBranchId());
					documents.setCompanyId(defaultLoggedInData.getCompanyId());
				}else {
					documents = documentRequestDTO;
				}
				int[] fileArray = documentRequestDTO.getFiles();

				Set<DocumentVersion> documentVersionToStoreList = new HashSet<DocumentVersion>();
				if(fileArray != null && fileArray.length > 0) {
					for (int j = 0; j < fileArray.length; j++) {
						MultipartFile fileToUpload = files[fileArray[j]];
						String fileHash = FileHashingMD.getFileChecksum(md5Digest, fileToUpload.getBytes());
						DocumentVersion documentVersion = new DocumentVersion();
						if(documentRequestDTO.getId() != null) {
							documentVersion = this.documentVersionRepository
								.findByHashKeyAndStatusAndDocumentId(fileHash, 2L,documentRequestDTO.getId());
						}else {
							documentVersion = null;
						}
	
						if (documentVersion != null) {
							// same hashkey
						} else {
							// different hashkey
							// check if different or same fileName
//							if (this.documentVersionRepository.findByFileNameAndDocumentIdAndStatus(
//									fileToUpload.getOriginalFilename(), saveDocumentFolderChild.getId(),
//									2L) != null) {
//								// same fileName
//	
//							} else {
								// different fileName
								// check if file is being uploaded under fixed documentType
								// The current logic is considered as the document is not a fixed Document Type
								DocumentVersion documentVersionToStore = new DocumentVersion();
								
									documentVersionToStore = this.fileStorageUploadServiceImpl.storeTemplateSingle(
											fileToUpload, documentVersionToStore, destination, 2L);
	
									documentVersionToStore.setCompanyId(defaultLoggedInData.getCompanyId());
									documentVersionToStore.setBranchId(defaultLoggedInData.getBranchId());
								
								documentVersionToStoreList.add(documentVersionToStore);
//							}
						}
					}
					documents.setDocumentVersions(documentVersionToStoreList);
				}
				documentToBeStoredList.add(documents);
				// uploadDocumentVersionResponse.add(documentVersionToStore);
			}

			for (Documents uploadDocument : documentToBeStoredList) {
				uploadDocument = this.documentsRepository.saveAndFlush(uploadDocument);
						
				for (DocumentVersion uploadDocumentVersion : uploadDocument.getDocumentVersions()) {
					if (uploadDocumentVersion.getDocumentContent() != null) {
						DocumentContent content = uploadDocumentVersion.getDocumentContent();
						uploadDocumentVersion.setDocumentId(uploadDocument.getId());
						uploadDocumentVersion = this.documentVersionRepository.save(uploadDocumentVersion);
						long uploadDocumentVersionId = uploadDocumentVersion.getId();
						content.setDocumentVersionId(uploadDocumentVersionId);
						this.documentContentRepository.saveAndFlush(content);
					}
				}
			}
			System.out.println("Test..........");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getFilePath(String pathPrefix, DocumentVersion documentVersion, Documents uploadedDocument,
			DocumentFolder parentFolder) {

		Blob content = this.documentContentRepository.findByDocumentVersionId(documentVersion.getId())
				.getDocumentContent();

		StringBuilder destination = new StringBuilder(pathPrefix + "/");

		DocumentFolder parentFolderTemp = parentFolder;

		if (parentFolderTemp.getParentFolderId() != null) {
			parentFolderTemp = this.recurseToParent(parentFolderTemp);
		}

		this.recursiveSubDirectories(parentFolderTemp, "rename", destination, uploadedDocument.getDocumentFolderId());
		try {
			String fileName = documentVersion.getFileName();
			MessageDigest md5Digest = MessageDigest.getInstance("MD5");
			String filePath = ctx.getRealPath(destination.toString() + "/" + fileName);
			System.out.println("Path Location : " + filePath);
			File file = new File(filePath);
			if (file.exists()) {
				String fileHash = FileHashingMD.getFileChecksum(md5Digest,
						java.nio.file.Files.readAllBytes(file.toPath()));
				if (fileHash.equalsIgnoreCase(documentVersion.getHashKey())) {
					return filePath;
				} else {
					this.fileStorageUploadServiceImpl.storeFromDatabaseAsBlob(content.getBinaryStream(),
							documentVersion.getFileName(), destination.toString());
					File newSaved = new File(filePath);
					if (newSaved.exists()) {
						return filePath;
					} else {
						throw new CustomException(
								"Oops! Something went wrong. Please try again later. We are working on it.");
					}
				}
			} else {
				this.fileStorageUploadServiceImpl.storeFromDatabaseAsBlob(content.getBinaryStream(),
						documentVersion.getFileName(), destination.toString());
				File newSaved = new File(filePath);
				if (newSaved.exists()) {
					return filePath;
				} else {
					throw new CustomException(
							"Oops! Something went wrong. Please try again later. We are working on it.");
				}
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SerialException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * Recursive call to traverse to the root or parent folder this block check
	 * if @IRBDocumentFolder.ParentDocumentFolderId is 0 which indicates to be the
	 * root folder and is returned backed to the calling method
	 */
	public DocumentFolder recurseToParent(DocumentFolder parentFolder) {
		DocumentFolder parentFoldertemp = this.documentFolderRepository.findById(parentFolder.getParentFolderId())
				.get();
		if (parentFoldertemp != null && parentFoldertemp.getParentFolderId() == 0) {
			return parentFoldertemp;
		} else {
			return recurseToParent(parentFoldertemp);
		}
	}

	/**
	 * recursive call to create a directory list containing all the sub-directories
	 * information until child sub-directory is not found, and sub-directories list
	 * chain is returned to the calling method.
	 */
	private List<DocumentFolder> recursiveSubDirectories(DocumentFolder dd, String type,
			StringBuilder destinationReverse, Long selectedFolderId) {
		List<DocumentFolder> subDirectories = this.documentFolderRepository.findByParentFolderIdAndStatus(dd.getId(),
				2L);
		if (type.equalsIgnoreCase("rename")) {
			destinationReverse.append(dd.getFolderName() + "/");
			if (selectedFolderId == dd.getId()) {
				return subDirectories;
			}
		}
		if (subDirectories.size() != 0) {
			for (DocumentFolder documentFolder : subDirectories) {
				documentFolder.setSubDirectoriesList(
						this.recursiveSubDirectories(documentFolder, type, destinationReverse, selectedFolderId));
			}
		}
		return subDirectories;
	}

	@Override
	public List<Documents> getDocuments(Long id, Long moduleId) {
		List<Documents> documents = this.documentsRepository.getDocumentByRefDocAndModuleId(id,moduleId);
		for (Documents document : documents) {
			String destination = "";
			List<DocumentFolder> folders = this.documentFolderRepository.findByParentFolderId(document.getDocumentFolderId());
			for (DocumentFolder folder : folders) {
				destination+= folder.getFolderName()+"/";
			}
			for (DocumentVersion dv : document.getDocumentVersions()) {
				dv.setOriginalPath(this.fileStorageUploadServiceImpl.getFileName(destination, dv.getFileName()));
				dv.setFilePath(destination+"/"+dv.getFileName());
				dv.setDocumentContent(this.documentContentRepository.findByDocumentVersionId(dv.getId()));
			}
			
		}
		return documents;
	}

	@Override
	public Documents getBydId(Long id) {
		// TODO Auto-generated method stub
		
		Documents document = this.documentsRepository.findById(id).get();
		String destination = "";
		List<DocumentFolder> folders = this.documentFolderRepository.findByParentFolderId(document.getDocumentFolderId());
		for (DocumentFolder folder : folders) {
			destination+= folder.getFolderName()+"/";
		}
		for (DocumentVersion dv : document.getDocumentVersions()) {
			dv.setFilePath(destination+"/"+dv.getFileName());
			dv.setOriginalPath(this.fileStorageUploadServiceImpl.getFileName(destination, dv.getFileName()));
		}
		return document;
	}

	@Override
	public Map<String, Object> uploadData(Map<String, Object> object, MultipartFile[] files,
			HttpServletRequest request, IfDefaultLoggedInData defaultLoggedInData) throws SerialException, SQLException {
		long moduleId = Long.parseLong(request.getHeader("moduleId"));
		String moduleName = moduleService.getModuleById(moduleId, false).getTitle();
		DocumentFolder saveDocumentFolder = new DocumentFolder();
		StringBuffer destination = new StringBuffer();
		String fieldName = "";
		for (Map.Entry<String, Object> entry : object.entrySet()) {
			if (((String) entry.getKey()).contains("fieldName")) {
				fieldName = entry.getValue().toString();
			}
		}
		Map<String, Object> response = new HashedMap<String, Object>();
		if (moduleName.equalsIgnoreCase("Company")) {
			// Check if Folder already created with the existing company name.
			if (!this.documentFolderByName(defaultLoggedInData.getCompanyName(), moduleId)) {
				
				// Create the folder - Database level
				saveDocumentFolder = this.saveDocumentFolder(moduleId, defaultLoggedInData.getCompanyName(), defaultLoggedInData, null);
				// Start of iteration of DocumentRequestDto and storing it.
				
			} else {
				Modules parentModule = moduleService.getModuleByTitle("Company", false);
				saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				
						//version 2 pending......................
			}
			response = saveDocumentAndTheirVersionWithoutRef(defaultLoggedInData,destination,moduleId,fieldName,saveDocumentFolder.getId(),files);
		} else if (moduleName.equalsIgnoreCase("Branch")) {
			Modules parentModule = moduleService.getModuleByTitle("Company", false);

			if (!this.documentFolderByName(defaultLoggedInData.getCompanyName(), parentModule.getId())) {
				saveDocumentFolder = this.saveDocumentFolder(parentModule.getId(), defaultLoggedInData.getCompanyName(), defaultLoggedInData, null);
			} else {
			    saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			DocumentFolder saveChildDocumentFolder = new DocumentFolder();
			if (!this.documentFolderByName(defaultLoggedInData.getBranchName(), moduleId)) {
				saveChildDocumentFolder = this.saveDocumentFolder(moduleId, defaultLoggedInData.getBranchName(), defaultLoggedInData,
						saveDocumentFolder.getId());

			}else {
				saveChildDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveDocumentFolder.getId(),2L,moduleId).get();
			}
			destination.append(defaultLoggedInData.getCompanyName()+"/");
			response = saveDocumentAndTheirVersionWithoutRef(defaultLoggedInData,destination,moduleId,fieldName,saveChildDocumentFolder.getId(),files);
		} else {
			Modules parentModule = moduleService.getModuleByTitle("Company", false);

			if (!this.documentFolderByName(defaultLoggedInData.getCompanyName(), parentModule.getId())) {
				saveDocumentFolder = this.saveDocumentFolder(parentModule.getId(), defaultLoggedInData.getCompanyName(), defaultLoggedInData, null);
			} else {
			    saveDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(null,2L,parentModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			Modules branchModule = moduleService.getModuleByTitle("Branch", false);
			DocumentFolder saveChildDocumentFolder = new DocumentFolder();
			if (!this.documentFolderByName(defaultLoggedInData.getBranchName(), branchModule.getId())) {
				saveChildDocumentFolder = this.saveDocumentFolder(branchModule.getId(), defaultLoggedInData.getBranchName(), defaultLoggedInData,
						saveDocumentFolder.getId());
			} else {
				saveChildDocumentFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveDocumentFolder.getId(),2L,branchModule.getId()).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			DocumentFolder saveModuleFolder = new DocumentFolder();
			Modules module = moduleService.getModuleById(moduleId, false);
			if (!this.documentFolderByName(module.getTitle(), moduleId)) {
				saveModuleFolder = this.saveDocumentFolder(moduleId, module.getTitle(), defaultLoggedInData,
						saveChildDocumentFolder.getId());
			} else {
				saveModuleFolder=this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleId(saveChildDocumentFolder.getId(),2L,moduleId).get();
				//saveDocumentFolder = this.documentFolderRepository.findById(33L).get();
			}
			destination.append(defaultLoggedInData.getCompanyName()+"/"+defaultLoggedInData.getBranchName()+"/"+module.getTitle()+"/");
			response = saveDocumentAndTheirVersionWithoutRef(defaultLoggedInData,destination,moduleId,fieldName,saveModuleFolder.getId(),files);
		}
		return response;
	}
	
	public Map<String, Object> saveDocumentAndTheirVersionWithoutRef(IfDefaultLoggedInData defaultLoggedInData,StringBuffer destination,Long moduleId,String fieldName
			,Long folderId,MultipartFile[] files) throws SerialException, SQLException{
		MessageDigest md5Digest = null;
		try {
			md5Digest = MessageDigest.getInstance("MD5");
			DocumentFolder saveDocumentFolderChild = new DocumentFolder();
			if (!this.documentFolderByName(fieldName , moduleId)) {
				saveDocumentFolderChild = this.saveDocumentFolder(moduleId,fieldName, defaultLoggedInData,
						folderId);
				destination.append(saveDocumentFolderChild.getFolderName() + "/");
			} else {
				saveDocumentFolderChild = this.documentFolderRepository.findByParentFolderIdAndStatusAndModuleIdAndFolderName(folderId,2L,moduleId,fieldName).get();
				destination.append(saveDocumentFolderChild.getFolderName() + "/");
			}
			
			Documents documents = new Documents();
			documents.setDocumentFolderId(saveDocumentFolderChild.getId());
			documents.setStatus(2L);
			documents.setShownInModule(true);
			documents.setCreatedBy(defaultLoggedInData.getCreatedById());
			documents.setModifiedBy(defaultLoggedInData.getCreatedById());
			documents.setCreatedDate(new Date(System.currentTimeMillis()));
			documents.setModifiedDate(new Date(System.currentTimeMillis()));
			documents.setBranchId(defaultLoggedInData.getBranchId());
			documents.setCompanyId(defaultLoggedInData.getCompanyId());

			
			DocumentVersion documentVersion = new DocumentVersion();
			documentVersion = null;
			Documents savedDocuments = new Documents();
			Map<String , Object> response = new HashedMap<String, Object>();
			Set<DocumentVersion> documentVersionToStoreList = new HashSet<DocumentVersion>();
			if(files != null && files.length > 0) {
				for (int j = 0; j < files.length; j++) {
					MultipartFile fileToUpload = files[j];
					String fileHash = FileHashingMD.getFileChecksum(md5Digest, fileToUpload.getBytes());
					List<Documents> documentsSaved = this.documentsRepository.getDocumentByModuleId(moduleId);
					
					for (Documents documents2 : documentsSaved) {
						for (DocumentVersion documents3 : documents2.getDocumentVersions()) {
							if(documents3.getHashKey().equals(fileHash)) {
								documentVersion = documents3;
								savedDocuments = documents2;
							}
						}
					}

					if (documentVersion == null){
						DocumentVersion documentVersionToStore = new DocumentVersion();
						
						documentVersionToStore = this.fileStorageUploadServiceImpl.storeTemplateSingle(fileToUpload, documentVersionToStore, destination, 2L);

						documentVersionToStore.setCompanyId(defaultLoggedInData.getCompanyId());
						documentVersionToStore.setBranchId(defaultLoggedInData.getBranchId());
						
						documentVersionToStoreList.add(documentVersionToStore);
						documents.setDocumentVersions(documentVersionToStoreList);
						documents = this.documentsRepository.saveAndFlush(documents);
						for (DocumentVersion uploadDocumentVersion : documents.getDocumentVersions()) {
							if (uploadDocumentVersion.getDocumentContent() != null) {
								DocumentContent content = uploadDocumentVersion.getDocumentContent();
								uploadDocumentVersion.setDocumentId(documents.getId());
								uploadDocumentVersion = this.documentVersionRepository.save(uploadDocumentVersion);
								long uploadDocumentVersionId = uploadDocumentVersion.getId();
								content.setDocumentVersionId(uploadDocumentVersionId);
								this.documentContentRepository.saveAndFlush(content);
							}
						}
						savedDocuments = documents;
						response.put("message", "Uploaded Successfully");
						response.put("type", "Success");
					}else {

						response.put("message", "Already Existing");
						response.put("type", "Error");
					}
					
				}
				
			}
			
					
			
			
			String path = "";
			List<DocumentFolder> folders = this.documentFolderRepository.findByParentFolderId(documents.getDocumentFolderId());
			for (DocumentFolder folder : folders) {
				path+= folder.getFolderName()+"/";
			}
			for (DocumentVersion dv : savedDocuments.getDocumentVersions()) {
				dv.setFilePath(path+"/"+dv.getFileName());
				dv.setOriginalPath(this.fileStorageUploadServiceImpl.getFileName(path, dv.getFileName()));
			}
			response.put("file", savedDocuments);
			

			System.out.println("Test..........");
			return response;
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public Map<String, Object> moduleDocuments(Map<String, Object> object, HttpServletRequest request) {
		Long moduleId = Long.parseLong(request.getHeader("moduleId"));
		List<Documents> documents = this.documentsRepository.getDocumentByModuleId(moduleId);
		for (Documents document : documents) {
			String destination = "";
			List<DocumentFolder> folders = this.documentFolderRepository.findByParentFolderId(document.getDocumentFolderId());
			for (DocumentFolder folder : folders) {
				destination+= folder.getFolderName()+"/";
			}
			for (DocumentVersion dv : document.getDocumentVersions()) {
				dv.setFilePath(destination +"/"+dv.getFileName());
				dv.setOriginalPath(this.fileStorageUploadServiceImpl.getFileName(destination, dv.getFileName()));
				dv.setDocumentContent(this.documentContentRepository.findByDocumentVersionId(dv.getId()));
			}
			
		}
		Map<String, Object> response = new HashedMap<String, Object>();
		response.put("docs", documents);
		return response;
	}

}
