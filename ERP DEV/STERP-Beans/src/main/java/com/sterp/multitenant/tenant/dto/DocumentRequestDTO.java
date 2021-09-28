package com.sterp.multitenant.tenant.dto;

import java.io.Serializable;
import java.util.Set;

import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentFolder;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentVersion;

public class DocumentRequestDTO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String idtitle;
	private String documentName;
	private String documentNametitle;
	private int[] files;
	private String filestitle;
	private long typeId;
	private String typeIdtitle;
	private Set<DocumentVersion> documentVersions;
	private Type type;
	private DocumentFolder documentFolder;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getIdtitle() {
		return idtitle;
	}

	public void setIdtitle(String idtitle) {
		this.idtitle = idtitle;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentNametitle() {
		return documentNametitle;
	}

	public void setDocumentNametitle(String documentNametitle) {
		this.documentNametitle = documentNametitle;
	}

	public int[] getFiles() {
		return files;
	}

	public void setFiles(int[] files) {
		this.files = files;
	}

	public String getFilestitle() {
		return filestitle;
	}

	public void setFilestitle(String filestitle) {
		this.filestitle = filestitle;
	}

	public long getTypeId() {
		return typeId;
	}

	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}

	public String getTypeIdtitle() {
		return typeIdtitle;
	}

	public void setTypeIdtitle(String typeIdtitle) {
		this.typeIdtitle = typeIdtitle;
	}

	public Set<DocumentVersion> getDocumentVersions() {
		return documentVersions;
	}

	public void setDocumentVersions(Set<DocumentVersion> documentVersions) {
		this.documentVersions = documentVersions;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public DocumentFolder getDocumentFolder() {
		return documentFolder;
	}

	public void setDocumentFolder(DocumentFolder documentFolder) {
		this.documentFolder = documentFolder;
	}
	
	

}
