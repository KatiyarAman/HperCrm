package com.sterp.multitenant.tenant.exceltemplate.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate;

@Repository
public interface ExcelTemplateRepository extends JpaRepository<ExcelTemplate, Long> {

	ExcelTemplate findByTemplateName(String templateName);
	
	@Query(value = "select new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(excel.id, excel.templateName)"
			+ " from com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate excel where excel.status=:status ORDER BY excel.templateName")
	List<CommonDropdownResponseDataTravelObject> getSelectionList(long status);
	
	@Query(value = "select new com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject(excel.id, excel.templateName)"
			+ " from com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate excel where excel.status=:status and excel.moduleId=:moduleId ORDER BY excel.templateName")
	List<CommonDropdownResponseDataTravelObject> getSelectionListByModuleId(long status, Long moduleId);
	
	@Query(value="SELECT e from com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplate e where e.status=2 and e.moduleId=:moduleId ORDER BY e.templateName ")
	List<ExcelTemplate> findByModuleId(Long moduleId);

}
