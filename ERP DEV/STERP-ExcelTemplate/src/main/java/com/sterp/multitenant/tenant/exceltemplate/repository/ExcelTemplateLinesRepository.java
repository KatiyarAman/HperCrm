package com.sterp.multitenant.tenant.exceltemplate.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sterp.multitenant.tenant.uploadutility.entity.ExcelTemplateLines;

@Repository
public interface ExcelTemplateLinesRepository extends JpaRepository<ExcelTemplateLines, Long>{

}
