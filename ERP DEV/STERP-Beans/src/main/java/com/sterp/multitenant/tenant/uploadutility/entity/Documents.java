package com.sterp.multitenant.tenant.uploadutility.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.sterp.multitenant.tenant.model.Type;
import com.sterp.multitenant.tenant.settings.template.entity.SuperBean;

@Entity
@Table(name = "documents")
public class Documents extends SuperBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3365556811451078509L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "document_folder_id")
	private Long documentFolderId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "document_folder_id", updatable = false, insertable = false, nullable = true)
	private DocumentFolder documentFolder;
	
	@Column(name = "type_id")
	private Long typeId;
	
	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "type_id", updatable = false, insertable = false, nullable = true)
	private Type type;
	
	@Column(name = "document_name")
	private String documentName;
	@Column(name = "ref_doc")
	private Long refDoc;
	@Column(name = "shown_in_module")
	private boolean shownInModule;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "document_id")
	Set<DocumentVersion> documentVersions;
	
	@Transient
	private int[] files;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDocumentFolderId() {
		return documentFolderId;
	}

	public void setDocumentFolderId(Long documentFolderId) {
		this.documentFolderId = documentFolderId;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public Long getRefDoc() {
		return refDoc;
	}

	public void setRefDoc(Long refDoc) {
		this.refDoc = refDoc;
	}
	public boolean isShownInModule() {
		return shownInModule;
	}

	public void setShownInModule(boolean shownInModule) {
		this.shownInModule = shownInModule;
	}

	public Set<DocumentVersion> getDocumentVersions() {
		return documentVersions;
	}

	public void setDocumentVersions(Set<DocumentVersion> documentVersions) {
		this.documentVersions = documentVersions;
	}

	public DocumentFolder getDocumentFolder() {
		return documentFolder;
	}

	public void setDocumentFolder(DocumentFolder documentFolder) {
		this.documentFolder = documentFolder;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public int[] getFiles() {
		return files;
	}

	public void setFiles(int[] files) {
		this.files = files;
	}

	
	

}
