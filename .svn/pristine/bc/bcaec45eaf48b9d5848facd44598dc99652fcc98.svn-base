package com.sterp.multitenant.tenant.uploadutility.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.uploadutility.entity.DocumentFolder;

@Repository
public interface DocumentFolderRepository extends JpaRepository<DocumentFolder, Long> {

//	DocumentFolder findByFolderNameAndStatus(String folderName, Long status);

	Optional<DocumentFolder> findByFolderNameAndStatusAndModuleId(String folderName, Long status,long moduleId);

	Optional<DocumentFolder> findByfolderName(String folderName);
	
	Optional<DocumentFolder> findByFolderNameAndStatusAndModuleIdAndParentFolderId(String folderName, Long status,long moduleId, long folderId);
	
	Optional<DocumentFolder> findByParentFolderIdAndStatusAndModuleId(Long parentFolderId, long status,long moduleId);
	
	Optional<DocumentFolder> findByParentFolderIdAndStatusAndModuleIdAndFolderName(Long parentFolderId, long status,long moduleId, String folderName);

	List<DocumentFolder> findByParentFolderIdAndStatus(long parentFolderId, long status);
	
	@Query(nativeQuery = true,value="with recursive cte as ("
			+ "  select     *"
			+ "  from       document_folder"
			+ "  where      id=:id"
			+ "  union all"
			+ "  select     d.*"
			+ "  from       document_folder d"
			+ "  inner join cte"
			+ "          on d.id = cte.parent_folder_id"
			+ ")"
			+ "select * from cte order by id;")
	List<DocumentFolder> findByParentFolderId(long id);

}
