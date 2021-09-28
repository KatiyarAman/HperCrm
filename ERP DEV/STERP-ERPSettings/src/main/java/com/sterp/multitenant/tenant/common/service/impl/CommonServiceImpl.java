package com.sterp.multitenant.tenant.common.service.impl;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialException;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Row.MissingCellPolicy;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sterp.multitenant.tenant.branch.entity.Branch;
import com.sterp.multitenant.tenant.common.dao.CommonDao;
import com.sterp.multitenant.tenant.common.service.CommonService;
import com.sterp.multitenant.tenant.core.services.AppService;
import com.sterp.multitenant.tenant.core.services.ScreenFilterService;
import com.sterp.multitenant.tenant.dto.BranchResponse;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDataTravelObject;
import com.sterp.multitenant.tenant.dto.CommonDropdownResponseDto;
import com.sterp.multitenant.tenant.dto.CommonPagingResponse;
import com.sterp.multitenant.tenant.dto.CommonRequestFilterDTO;
import com.sterp.multitenant.tenant.entity.UserEntity;
import com.sterp.multitenant.tenant.exceptionhandler.CustomException;
import com.sterp.multitenant.tenant.settings.approval.service.ApprovalSettingsService;
import com.sterp.multitenant.tenant.settings.codegeneration.service.CodeGenerationService;
import com.sterp.multitenant.tenant.settings.template.entity.ScreenFilter;
import com.sterp.multitenant.tenant.settings.template.entity.dto.DefaultSortDto;
import com.sterp.multitenant.tenant.settings.template.entity.dto.ScreenFilterDTO;
import com.sterp.multitenant.tenant.uploadutility.dto.ExcelResponse;
import com.sterp.multitenant.tenant.uploadutility.dto.IfDefaultLoggedInData;
import com.sterp.multitenant.tenant.uploadutility.entity.DocumentVersion;
import com.sterp.multitenant.tenant.uploadutility.entity.Documents;
import com.sterp.multitenant.tenant.uploadutility.service.DocumentUploadService;

import io.jsonwebtoken.Claims;

@Service
public class CommonServiceImpl implements CommonService {

	@Autowired
	CommonDao commonDao;

	@Autowired
	ModelMapper mapper;
	
	@Autowired
	AppService appService;
	
	@Autowired
	ObjectMapper objectMapper;

	@Autowired
	ScreenFilterService screenFilterService;
	
	@Autowired
	CodeGenerationService codeGenerationService;
	
	@Autowired
	ApprovalSettingsService approvalSettingsService;
	
	@Autowired
	DocumentUploadService documentUploadService;
	
//	@Value("${files.path}")
    private String filesPath;
	
	@Override
	public Map<String, Object> addUpdate(HttpServletRequest request, Object obj, MultipartFile[] files){
		Map<String, Object> response = new HashedMap<String, Object>();
		
		String module = request.getAttribute("moduleId").toString();
		long moduleId = Long.parseLong(module);
		
		UserEntity currentUser = appService.getCurrentUser();
		Claims claims=(Claims) request.getAttribute("claims");
		String defaultloginbranch=claims.get("defaultloginbranch").toString();
		//Long loginBranchId  = Long.valueOf((Integer) request.getAttribute("defaultloginbranch"));
		Long loginBranchId=Long.valueOf(defaultloginbranch);
		Long loginCompanyId = getById(Branch.class, loginBranchId).getCompanyId();
		int modulePrefix = 0;
		String transactionNo = "";
		Object storedObj = null;
		
		Class<? extends Object> currentClass = obj.getClass();
		Field field = null;
		Long docId = 0L;
		Long docIdAfterSave = 0L;
		Long status = 0L;
		try {
			field = currentClass.getDeclaredField("id");
			field.setAccessible(true);
			docId = (Long) field.get(obj);
			
			field = currentClass.getSuperclass().getDeclaredField("createdBy");
			field.setAccessible(true);
			field.set(obj, currentUser.getId());
			
			field = currentClass.getSuperclass().getDeclaredField("modifiedBy");
			field.setAccessible(true);
			field.set(obj, currentUser.getId());
			
			field = currentClass.getSuperclass().getDeclaredField("branchId");
			field.setAccessible(true);
			field.set(obj, loginBranchId);
			
			field = currentClass.getSuperclass().getDeclaredField("companyId");
			field.setAccessible(true);
			field.set(obj, loginCompanyId);
			
			/* Generate code for Zone */
			List<CommonDropdownResponseDto> fields = getAutogeneratedFields("CommonDropdownResponseDto", moduleId);
			final Long docIdLambda = docId;
			fields.forEach((fieldIdAndFieldName) -> {
				Field field1 = null;
				try {
					field1 = currentClass.getDeclaredField(fieldIdAndFieldName.getName());
					field1.setAccessible(true);
					System.out.println(field1.get(obj));
					if(field1.get(obj) == null || field1.get(obj) == "") {
						field1.set(obj, codeGenerationService.generateCode(currentClass, docIdLambda, request, moduleId, fieldIdAndFieldName, modulePrefix, 0L));
					}
					
				} catch (IllegalArgumentException | IllegalAccessException | NoSuchFieldException | SecurityException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				//obj.setZoneCode(codeGenerationService.generateCode(currentClass ,request, moduleId, fiel, modulePrefix, 0L));
			});
			storedObj = (docId ==null  || docId ==0 ? commonDao.add(obj) : commonDao.update(obj));
			Class<? extends Object> storedClass = storedObj.getClass();
			
			field = storedClass.getDeclaredField("id");
			field.setAccessible(true);
			docIdAfterSave = (Long) field.get(storedObj);
			
			field = storedClass.getSuperclass().getDeclaredField("status");
			field.setAccessible(true);
			status = (Long) field.get(storedObj);
			
			String transactionNoField = "";
			if(fields != null && fields.size()>0) {
				transactionNoField = fields.get(0).getName();
			
				field = storedClass.getDeclaredField(transactionNoField);
				field.setAccessible(true);
				transactionNo = (String) field.get(storedObj);
			}
			
			Long createdBy = currentUser.getId();
//			Long approvalStatus = (docId == 0 ? this.approvalSettingsService.getApprovalSetting(false, moduleId,
//									docIdAfterSave, transactionNo, 2500, null, 25, createdBy, status, 0L) : 
//							this.approvalSettingsService.updateApproval(false, moduleId, "Approval", docIdAfterSave,
//									currentUser.getId(), transactionNo, 2500, null, 25, 23L, createdBy,"This is returned", status));
//			
//			field = currentClass.getSuperclass().getDeclaredField("status");
//			field.setAccessible(true);
//			field.set(storedObj, approvalStatus);
		} 
		catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e1) {
			System.err.println(e1);
			throw new CustomException("Field Not Found in Bean !");
		}
		
		Object data =  commonDao.update(storedObj);
		response.put("data", data);
		response.put("message", ( docId == null ||docId == 0 ? data.getClass().getSimpleName() + " Add Successfully" 
				: data.getClass().getSimpleName() + " Update Successfully"));
		try {
			if(Arrays.stream(currentClass.getSuperclass().getDeclaredFields()).anyMatch(f->f.getName().equals("documents"))) {
				Class<? extends Object> folderClass = data.getClass();
				String name = "";
				String folderName = getFolderFields(moduleId);
				if(folderName != null) {
					 field =  folderClass.getDeclaredField(folderName);
					 field.setAccessible(true);
					 name = (String) field.get(data);
				}
				
				field=currentClass.getSuperclass().getDeclaredField("branchId");
				field.setAccessible(true);
				loginBranchId = moduleId==124? docIdAfterSave: (Long) field.get(data);
				field = currentClass.getSuperclass().getDeclaredField("companyId");
				field.setAccessible(true);
				loginCompanyId = moduleId == 112 ? docIdAfterSave : (Long) field.get(data);
				field = folderClass.getSuperclass().getDeclaredField("documents");
				field.setAccessible(true);
				List<Documents> documents = (List<Documents>) field.get(data);
				if(documents != null && documents.size() > 0) {
					BranchResponse branchResponse = this.appService.getBranchCompanyByDefault(loginBranchId);
					this.documentUploadService.uploadDocuments(documents, files, new IfDefaultLoggedInData(loginCompanyId,loginBranchId,branchResponse.getCompanyName(),
							branchResponse.getBranchName(), this.appService.getCurrentUser().getId(),0L), docIdAfterSave, name, request);
					System.out.println("TEST1");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("TEST");
		}
		return response;
	}

	@Override
	public String getFolderFields(long moduleId) {
		// TODO Auto-generated method stub 
		return commonDao.getFolderFields(moduleId);
	}


	@Override public Map<String, Object> addUpdate(Object obj) { 
		Map<String, Object> response = new HashedMap<String, Object>();
		Class<? extends Object> currentClass = obj.getClass();
		
		Field field = null;
		Long docId = 0L;
		try {
			field = currentClass.getDeclaredField("id");
			field.setAccessible(true);
			docId = (Long) field.get(obj);
		} catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
			throw new CustomException("Field id Not Found in Bean !");
		}
		
		Object storedObj = (docId == 0 ? commonDao.add(obj) : commonDao.update(obj));

		response.put("data", storedObj);
		response.put("message", (docId == 0 ? storedObj.getClass().getSimpleName() + " Add Successfully" 
				: storedObj.getClass().getSimpleName() + " Update Successfully"));
		return response;
	}
	 

	@Override
	public List<CommonDropdownResponseDataTravelObject> getSelectionList(String T, String id, String name,
			List<CommonRequestFilterDTO> filters) {
		StringBuilder query = new StringBuilder(
				"Select " + id + "," + name + " from " + T + " where status='" + 1 + "'");
		if (filters.size() > 0)
			filters.forEach((filter) -> {
				query.append(" and " + filter.getField() + "=" + filter.getValue());
			});
		return commonDao.getSelectionList(query.toString());
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> CommonPagingResponse<T> getCommonFilteredList(Class<T> T, Map<String, Object> params){
		UserEntity currentUser = this.appService.getCurrentUser();
		if (currentUser == null)
			throw new CustomException("Session has been timed out!");
		long userId = currentUser.getId();
		int page = 1;
		int limit = 10;
		String search = null;
		String sort = null;
		String order = null;
		String filter = null;
		Long moduleId = (Long)params.get("module_id");
		boolean filterRemove = false;
		List<ScreenFilterDTO> screenFilterDTO = Collections.emptyList();
		DefaultSortDto defaultSort = null;
		Map<String, Object> advanceSearch = new HashedMap<String, Object>();
		Map<String, Object> advanceSearchAnd = new HashedMap<String, Object>();
		Map<String, Object> advanceSort = new HashedMap<String, Object>();
		Map<String, Object> customFilter = new HashedMap<String, Object>();
		for (Map.Entry<String, Object> entry : params.entrySet()) {
			try {
				if (((String) entry.getKey()).contains("_page")) {
					page = Integer.parseInt(entry.getValue().toString());
				} else if (((String) entry.getKey()).contains("_limit")) {
					limit = Integer.parseInt(entry.getValue().toString());
				} else if (((String) entry.getKey()).contains("_order")) {
					order = (String) entry.getValue();
				} else if (((String) entry.getKey()).contains("_sort")) {
					sort = (String) entry.getValue();
				} else if (((String) entry.getKey()).contains("_search")) {
					search = (String) entry.getValue();
				}else if (((String) entry.getKey()).equals("screen_filter")) {
					filter = (String) entry.getValue();
					screenFilterDTO = objectMapper.readValue(filter, new TypeReference<List<ScreenFilterDTO>>() {
					});
				} else if (((String) entry.getKey()).equals("advanceSearch")) {
					advanceSearch = objectMapper.readValue((String) entry.getValue(), Map.class);
				} else if (((String) entry.getKey()).equals("advanceSearchAnd")) {
					advanceSearchAnd = objectMapper.readValue((String) entry.getValue(), Map.class);
				} else if (((String) entry.getKey()).equals("advanceSort")) {
					advanceSort = objectMapper.readValue((String) entry.getValue(), Map.class);
				} else if (((String) entry.getKey()).contains("filter_remove")) {
					filterRemove = Boolean.parseBoolean((String) entry.getValue());
				} else if (((String) entry.getKey()).equals("defaultSort")) {
					defaultSort = objectMapper.readValue((String) entry.getValue(), DefaultSortDto.class);
				}else if (((String) entry.getKey()).equals("customFilter")) {
					customFilter = objectMapper.readValue((String) entry.getValue(), Map.class);
				}
				
			} 
			catch (IOException e) {
				throw new CustomException("Param not found for search !");
			}
		}
		int start = (page - 1) * limit;
		
		List<ScreenFilterDTO> storedScreenFilter = this.screenFilterService.getScreenFilter(userId, moduleId);
		//Type screenFilterModel = new TypeToken<List<ScreenFilter>>() {}.getType();
		if (!storedScreenFilter.isEmpty() && filterRemove == true) {
			this.screenFilterService.deleteAll(mapToScreenFilter(storedScreenFilter));
			screenFilterDTO = Collections.emptyList();
		} else if(!storedScreenFilter.isEmpty() && screenFilterDTO.isEmpty()) {
			screenFilterDTO = Collections.emptyList();
			screenFilterDTO = storedScreenFilter;
		}else {
			screenFilterDTO.forEach(a -> {
				a.setUserId(userId);
				a.setModuleId(moduleId);
			});
			this.screenFilterService.save(mapToScreenFilter(screenFilterDTO));
			screenFilterDTO = Collections.emptyList();
			screenFilterDTO = this.screenFilterService.getScreenFilter(userId, moduleId);
		}

		if ((sort == null) || (sort.isEmpty())) {
			sort = "id";
		}
		if ((order == null) || (order.isEmpty())) {
			order = Sort.Direction.ASC.toString();
		}

		return commonDao.getCommonFilteredList(T, start, limit, search, advanceSearch, advanceSearchAnd, sort, order, screenFilterDTO, moduleId, advanceSort, defaultSort, userId, customFilter);
	}

	private List<ScreenFilter> mapToScreenFilter(List<ScreenFilterDTO> filters) {
		List<ScreenFilter> screenFilters = new ArrayList<ScreenFilter>();
		if (filters != null) {
			filters.forEach((dto) -> {
				ScreenFilter screen = new ScreenFilter();
				screen.setId(dto.getId());
				screen.setUserId(dto.getUserId());
				screen.setModuleId(dto.getModuleId());
				screen.setFieldIndexingId(dto.getFieldIndexingId());
				screen.setHidden(dto.isHidden());
				screen.setFilterRange(dto.getFilterRange());
				screen.setFilterValue(dto.getFilterValue());
				screen.setSortFlag(dto.isSortFlag());
				screen.setSortOrder(dto.getSortOrder());
				screenFilters.add(screen);
			});
			return screenFilters;
		}
		return null;
	}

	@Override
	public <T> T getById(Class<T> T, Long id) {
		return commonDao.getById(T, id);
	}

	@Override
	public List<CommonDropdownResponseDto> getAutogeneratedFields(String T, long moduleId) {
		return commonDao.getAutogeneratedFields(T, moduleId);
	}
	
	
	@Override
	public <T> String getLastGeneratedCode(Class<T> T, Long branchId, Long companyId, String field) {
		return commonDao.getLastGeneratedCode(T, branchId, companyId, field);
	}

	@Override
	public <R> String getRefLastGeneratedCode(Class<R> R, long refDocId, String field) {
		return commonDao.getLastGeneratedCode(R, refDocId, field);
	}
	
	@Override
	public <T> List<T> getCommonList(Class<T> T){
		return commonDao.getCommonList(T);
	} 

	@Override
	public List getCommonListByNativeQuery() {
		return commonDao.getCommonListByNativeQuery();
	}


	@Override
	public <T> List<T> getCustomFieldByModuleId(Class<T> T, Long moduleId) {
		return commonDao.getCustomFieldByModuleId(T, moduleId);
	}
	
	@Override
	public <T> List<T> getByFilters(Class<T> T, Map<String, Object> filters) {
		return commonDao.getByFilters(T, filters);
	}
	
	@Override
	public List<ExcelResponse> callReadFile(MultipartFile files, String fileName) throws IOException {
		Workbook workbook = null;
		if (files instanceof File) {
			FileInputStream excelInputStream = new FileInputStream((File) files);
			if (fileName.contains(".xlsx"))
				workbook = new XSSFWorkbook(excelInputStream);
			else if (fileName.contains(".xls"))
				workbook = new HSSFWorkbook(excelInputStream);
			else {
				excelInputStream.close();
				throw new CustomException("The file you have requested for must be in .xlsx or .xls format. "
						+ "Please try again with appropite file. If you still face the same problem please contact out technical team.");
			}
		}
		if (files instanceof MultipartFile) {
			byte[] fileByteArray = ((MultipartFile) files).getBytes();
			InputStream finStream = new ByteArrayInputStream(fileByteArray);
			if (fileName.contains(".xlsx"))
				workbook = new XSSFWorkbook(finStream);
			else if (fileName.contains(".xls"))
				workbook = new HSSFWorkbook(finStream);
			else {
				finStream.close();
				throw new CustomException("The file you have requested for must be in .xlsx or .xls format. "
						+ "Please try again with appropite file. If you still face the same problem please contact out technical team.");
			}
		}
		List<ExcelResponse> excelReturn = new ArrayList<ExcelResponse>();
		int sheetNumber = workbook.getNumberOfSheets();
		for (int i = 0; i < sheetNumber; i++) {
			ExcelResponse excel = new ExcelResponse();
			Sheet sheet = workbook.getSheetAt(i);
			excel.setSheetName(sheet.getSheetName());
			excel.setData(readFile(workbook, sheet));
			excelReturn.add(excel);
//			excelReturn.add(sheet.getSheetName(), readFile(workbook, sheet));
		}
		workbook.close();
		return excelReturn;
	}
	
	public List<Map<String, List<String>>> readFile(Workbook workbook, Sheet sheet) {
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
		List<Map<String, List<String>>> dataContent = new ArrayList<Map<String,List<String>>>();
		for (int i = 0; i < sheet.getPhysicalNumberOfRows(); i++) {
			Row row = sheet.getRow(i);
			Map<String, List<String>> response = new HashMap<>();
			List<String> cellData = new ArrayList<String>();
			if (row != null) {
				int cellLastCount = row.getLastCellNum();
				for (int cn = 0; cn < cellLastCount; cn++) {
					Cell c = row.getCell(cn, MissingCellPolicy.RETURN_BLANK_AS_NULL);
					if (c != null) {
						DataFormatter formatter = new DataFormatter();
						cellData.add(formatter.formatCellValue(c, evaluator) + "");
					} else
						cellData.add("");
				}
			}
			response.put("DATA", cellData);
			response.put("MERGED_RANGE", getNbOfMergedRegions(sheet, i));
			dataContent.add(response);
		}

		return dataContent;

	}
	
	public static List<String> getNbOfMergedRegions(Sheet sheet, int row) {
		@SuppressWarnings("unused")
		int count = 0;
		List<String> addresses = new ArrayList<String>();
		for (int i = 0; i < sheet.getNumMergedRegions(); ++i) {
			CellRangeAddress range = sheet.getMergedRegion(i);
			if (range.getFirstRow() <= row && range.getLastRow() >= row) {
				addresses.add(range.formatAsString());
				++count;
			}
		}
		return addresses;
	}

	@Override
	public List<Documents> getDocuments(Long id, Long moduleId) {
		
		return this.documentUploadService.getDocuments(id,moduleId);
	}

	@Override
	public Resource download(Long id,Long vid) {
		Documents document = this.documentUploadService.getBydId(id);
		String fileName = "";
		for (DocumentVersion dv : document.getDocumentVersions()) {
			if(dv.getId() == vid) {
				fileName = dv.getOriginalPath();
			}
		}
		
		try {
            Path file = Paths.get(fileName);
            Resource resource = new UrlResource(file.toUri());

            if (resource.exists() || resource.isReadable()) {
                return resource;
            } else {
                throw new RuntimeException("Could not read the file!");
            }
        } catch (MalformedURLException e) {
            throw new RuntimeException("Error: " + e.getMessage());
        }
	}

	@Override
	public Map<String, Object> uploadData(Map<String, Object> object, MultipartFile[] files,
			HttpServletRequest request,Object obj) throws SerialException, SQLException {
		Class<? extends Object> currentClass = obj.getClass();
		Field field = null;
		// TODO Auto-generated method stub
		String module = request.getHeader("moduleId");
		long moduleId = Long.parseLong(module);
		UserEntity currentUser = appService.getCurrentUser();
		Claims claims=(Claims) request.getAttribute("claims");
		String defaultloginbranch=claims.get("defaultloginbranch").toString();
		//Long loginBranchId  = Long.valueOf((Integer) request.getAttribute("defaultloginbranch"));
		Long loginBranchId=Long.valueOf(defaultloginbranch);
		Long loginCompanyId = getById(Branch.class, loginBranchId).getCompanyId();
		BranchResponse branchResponse = this.appService.getBranchCompanyByDefault(loginBranchId);
		return this.documentUploadService.uploadData(object,files,request,new IfDefaultLoggedInData(loginCompanyId,loginBranchId,branchResponse.getCompanyName(),
				branchResponse.getBranchName(), this.appService.getCurrentUser().getId(),0L));
	}

	@Override
	public Map<String, Object> moduleDocuments(Map<String, Object> object, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return this.documentUploadService.moduleDocuments(object,request);
	}
}
