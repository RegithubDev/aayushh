package com.resustainability.reisp.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.resustainability.reisp.constants.PageConstants;
import com.resustainability.reisp.model.IRM;
import com.resustainability.reisp.model.RMPaginationObject;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.User;
import com.resustainability.reisp.service.RoleMappingService;

@Controller
public class RoleMappingController {
	@InitBinder
    public void initBinder(WebDataBinder binder) { 
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
	Logger logger = Logger.getLogger(RoleMappingController.class);
	
	@Autowired
	RoleMappingService service;
	
	@Value("${common.error.message}")
	public String commonError;
	
	@Value("${record.dataexport.success}")
	public String dataExportSucess;
	
	@Value("${record.dataexport.invalid.directory}")
	public String dataExportInvalid;
	
	@Value("${record.dataexport.error}")
	public String dataExportError;
	
	@Value("${record.dataexport.nodata}")
	public String dataExportNoData;
	
	@Value("${template.upload.common.error}")
	public String uploadCommonError;
	
	@Value("${template.upload.formatError}")
	public String uploadformatError;
	
	@RequestMapping(value = "/role-mapping", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView roleMapping(@ModelAttribute User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.roleMapping);
		RoleMapping obj = null;
		try {
			List<RoleMapping> projectsList = service.getProjectsList(obj);
			model.addObject("projectsList", projectsList);
			
			List<RoleMapping> deptList = service.getDeptsList(obj);
			


			Set<String> emailList = new HashSet<>();
			deptList = deptList.stream()
		            .filter(e -> emailList.add(e.getDepartment_code()))
		            .collect(Collectors.toList());
			model.addObject("deptList", deptList);
			
			List<RoleMapping> empList = service.getEmpstList(obj);
			model.addObject("empList", empList);
			
			//List<RoleMapping> rolestList = service.getRolestList(obj);
			//model.addObject("rolestList", rolestList);
			
			//List<RoleMapping> incidentsList = service.getRoleMappingsList(obj);
			//model.addObject("incidentsList", incidentsList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/ajax/getEmpstList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getEmpstList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> companiesList = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			companiesList = service.getEmpstList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getEmpstList : " + e.getMessage());
		}
		return companiesList;
	}
	
	@RequestMapping(value = "/ajax/getRoleMappings1", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getCompaniesList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> companiesList = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			companiesList = service.getRoleMappingsList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getCompaniesList : " + e.getMessage());
		}
		return companiesList;
	}
	
	@RequestMapping(value = "/ajax/getRoleMappings", method = { RequestMethod.POST, RequestMethod.GET })
	public void getRoleMappingListLaztLoad(@ModelAttribute RoleMapping obj, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		PrintWriter pw = null;
		String json2 = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");

			pw = response.getWriter();
			//Fetch the page number from client
			Integer pageNumber = 0;
			Integer pageDisplayLength = 0;
			if (null != request.getParameter("iDisplayStart")) {
				pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));
				pageNumber = (Integer.valueOf(request.getParameter("iDisplayStart")) / pageDisplayLength) + 1;
			}
			//Fetch search parameter
			String searchParameter = request.getParameter("sSearch");

			//Fetch Page display length
			pageDisplayLength = Integer.valueOf(request.getParameter("iDisplayLength"));

			List<RoleMapping> budgetList = new ArrayList<RoleMapping>();

			//Here is server side pagination logic. Based on the page number you could make call 
			//to the data base create new list and send back to the client. For demo I am shuffling 
			//the same list to show data randomly
			int startIndex = 0;
			int offset = pageDisplayLength;

			if (pageNumber == 1) {
				startIndex = 0;
				offset = pageDisplayLength;
				budgetList = createPaginationData(startIndex, offset, obj, searchParameter);
			} else {
				startIndex = (pageNumber * offset) - offset;
				offset = pageDisplayLength;
				budgetList = createPaginationData(startIndex, offset, obj, searchParameter);
			}

			//Search functionality: Returns filtered list based on search parameter
			//budgetList = getListBasedOnSearchParameter(searchParameter,budgetList);

			int totalRecords = getTotalRecords(obj, searchParameter);

			RMPaginationObject personJsonObject = new RMPaginationObject();
			//Set Total display record
			personJsonObject.setiTotalDisplayRecords(totalRecords);
			//Set Total record
			personJsonObject.setiTotalRecords(totalRecords);
			personJsonObject.setAaData(budgetList);

			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			json2 = gson.toJson(personJsonObject);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(
					"getUsersList : User Id - " + userId + " - User Name - " + userName + " - " + e.getMessage());
		}

		pw.println(json2);
	}

	/**
	 * @param searchParameter 
	 * @param activity 
	 * @return
	 */
	public int getTotalRecords(RoleMapping obj, String searchParameter) {
		int totalRecords = 0;
		try {
			totalRecords = service.getTotalRecords(obj, searchParameter);
		} catch (Exception e) {
			logger.error("getTotalRecords : " + e.getMessage());
		}
		return totalRecords;
	}

	/**
	 * @param pageDisplayLength
	 * @param offset 
	 * @param activity 
	 * @param clientId 
	 * @return
	 */
	public List<RoleMapping> createPaginationData(int startIndex, int offset, RoleMapping obj, String searchParameter) {
		List<RoleMapping> objList = null;
		try {
			objList = service.getRoleMappingsList(obj, startIndex, offset, searchParameter);
		} catch (Exception e) {
			logger.error("createPaginationData : " + e.getMessage());
		}
		return objList;
	}
	@RequestMapping(value = "/ajax/getFilteredRolesList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getFilteredRolesList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getFilteredRolesList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getDeptFilterList : " + e.getMessage());
		}
		return objsList;
	}
	
	@RequestMapping(value = "/ajax/getDeptFilterListFromRoleMapping", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getDeptFilterList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getDeptFilterList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getDeptFilterList : " + e.getMessage());
		}
		return objsList;
	}
	
	@RequestMapping(value = "/ajax/getMappingUserSecurity", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getMappingUserSecurity(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getMappingUserSecurity(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getMappingUserSecurity : " + e.getMessage());
		}
		return objsList;
	}
	
	
	@RequestMapping(value = "/ajax/getProjectFilterFromRoleMapping", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getProjectFilterFromRoleMapping(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> companiesList = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			companiesList = service.getProjectFilterFromRoleMapping(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getProjectFilterFromRoleMapping : " + e.getMessage());
		}
		return companiesList;
	}

	@RequestMapping(value = "/ajax/getempFilterListInRoleMapping", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getempFilterList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getempFilterList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getempFilterList : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/ajax/getRoleMasterFilterListinRoleMapping", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getRoleMasterFilterList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getRoleMasterFilterList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getempFilterList : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/ajax/getFilteredDeptList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getFilteredDeptList(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> objsList = null;
		try {
			objsList = service.getDeptsList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getempFilterList : " + e.getMessage());
		}
		return objsList;
	}

	
		@RequestMapping(value = "/add-role-mapping", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addRoleMapping(@ModelAttribute RoleMapping obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/done-rp");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			obj.setUser_id(userId);
			obj.setUser_name(userName);
			flag = service.addRoleMapping(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "RoleMapping Added Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Adding RoleMapping is failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error","Adding RoleMapping is failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/done-rp", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView roleMappingSupport(@ModelAttribute User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.done);
		try {
			model.addObject("redirect", "role-mapping");
			model.addObject("module", "Role Mapping");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/update-role-mapping", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateRoleMapping(@ModelAttribute RoleMapping obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/done-rp");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			flag = service.updateRoleMapping(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "RoleMapping Updated Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Updating RoleMapping is failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error","Updating RoleMapping is failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	@RequestMapping(value = "/export-role-mapping", method = {RequestMethod.GET,RequestMethod.POST})
	public void exportRoleMapping(HttpServletRequest request, HttpServletResponse response,HttpSession session,@ModelAttribute RoleMapping obj,RedirectAttributes attributes){
		ModelAndView view = new ModelAndView(PageConstants.roleMapping);
		List<RoleMapping> dataList = new ArrayList<RoleMapping>();
		String userId = null;String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");userName = (String) session.getAttribute("USER_NAME");
			view.setViewName("redirect:/role-mapping");
			dataList = service.getRoleMappingsList(obj); 
			if(dataList != null && dataList.size() > 0){
	            XSSFWorkbook  workBook = new XSSFWorkbook ();
	            XSSFSheet sheet = workBook.createSheet(WorkbookUtil.createSafeSheetName("RoleMapping"));
		        workBook.setSheetOrder(sheet.getSheetName(), 0);
		        
		        byte[] blueRGB = new byte[]{(byte)0, (byte)176, (byte)240};
		        byte[] yellowRGB = new byte[]{(byte)255, (byte)192, (byte)0};
		        byte[] greenRGB = new byte[]{(byte)146, (byte)208, (byte)80};
		        byte[] redRGB = new byte[]{(byte)255, (byte)0, (byte)0};
		        byte[] whiteRGB = new byte[]{(byte)255, (byte)255, (byte)255};
		        
		        boolean isWrapText = true;boolean isBoldText = true;boolean isItalicText = false; int fontSize = 11;String fontName = "Times New Roman";
		        CellStyle blueStyle = cellFormating(workBook,blueRGB,HorizontalAlignment.CENTER,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        CellStyle yellowStyle = cellFormating(workBook,yellowRGB,HorizontalAlignment.CENTER,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        CellStyle greenStyle = cellFormating(workBook,greenRGB,HorizontalAlignment.CENTER,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        CellStyle redStyle = cellFormating(workBook,redRGB,HorizontalAlignment.CENTER,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        CellStyle whiteStyle = cellFormating(workBook,whiteRGB,HorizontalAlignment.CENTER,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        
		        CellStyle indexWhiteStyle = cellFormating(workBook,whiteRGB,HorizontalAlignment.LEFT,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        
		        isWrapText = true;isBoldText = false;isItalicText = false; fontSize = 9;fontName = "Times New Roman";
		        CellStyle sectionStyle = cellFormating(workBook,whiteRGB,HorizontalAlignment.LEFT,VerticalAlignment.CENTER,isWrapText,isBoldText,isItalicText,fontSize,fontName);
		        
		        
	            XSSFRow headingRow = sheet.createRow(0);
	        	String headerString = "#,Project,Department,Approver ,Approver level ,Incident type" + 
	    				"";
	            String[] firstHeaderStringArr = headerString.split("\\,");
	            
	            for (int i = 0; i < firstHeaderStringArr.length; i++) {		        	
		        	Cell cell = headingRow.createCell(i);
			        cell.setCellStyle(greenStyle);
					cell.setCellValue(firstHeaderStringArr[i]);
				}
	            
	            short rowNo = 1;
	            for (RoleMapping obj1 : dataList) {
	                XSSFRow row = sheet.createRow(rowNo);
	                int c = 0;
	                Cell cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(c);
					
	                cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getProject_code() +" - "+obj1.getProject_name());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getDepartment_code() +" - "+obj1.getDepartment_name());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getUser_id() +" - "+obj1.getUser_name());
					
	                cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue (obj1.getRole_code());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue (obj1.getIncident_type());
					
	                rowNo++;
	            }
	            for(int columnIndex = 0; columnIndex < firstHeaderStringArr.length; columnIndex++) {
	        		sheet.setColumnWidth(columnIndex, 25 * 200);
	        		sheet.setColumnWidth(2, 25 * 500);
				}
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HHmmss");
                Date date = new Date();
                String fileName = "RoleMapping_"+dateFormat.format(date);
                
	            try{
	                /*FileOutputStream fos = new FileOutputStream(fileDirectory +fileName+".xls");
	                workBook.write(fos);
	                fos.flush();*/
	            	
	               response.setContentType("application/.csv");
	 			   response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	 			   response.setContentType("application/vnd.ms-excel");
	 			   // add response header
	 			   response.addHeader("Content-Disposition", "attachment; filename=" + fileName+".xlsx");
	 			   
	 			    //copies all bytes from a file to an output stream
	 			   workBook.write(response.getOutputStream()); // Write workbook to response.
		           workBook.close();
	 			    //flushes output stream
	 			    response.getOutputStream().flush();
	            	
	                
	                attributes.addFlashAttribute("success",dataExportSucess);
	            	//response.setContentType("application/vnd.ms-excel");
	            	//response.setHeader("Content-Disposition", "attachment; filename=filename.xls");
	            	//XSSFWorkbook  workbook = new XSSFWorkbook ();
	            	// ...
	            	// Now populate workbook the usual way.
	            	// ...
	            	//workbook.write(response.getOutputStream()); // Write workbook to response.
	            	//workbook.close();
	            }catch(FileNotFoundException e){
	                //e.printStackTrace();
	                attributes.addFlashAttribute("error",dataExportInvalid);
	            }catch(IOException e){
	                //e.printStackTrace();
	                attributes.addFlashAttribute("error",dataExportError);
	            }
         }else{
        	 attributes.addFlashAttribute("error",dataExportNoData);
         }
		}catch(Exception e){	
			e.printStackTrace();
			logger.error("exportRoleMapping : : User Id - "+userId+" - User Name - "+userName+" - "+e.getMessage());
			attributes.addFlashAttribute("error", commonError);			
		}
		//return view;
	}
	

	private CellStyle cellFormating(XSSFWorkbook workBook,byte[] rgb,HorizontalAlignment hAllign, VerticalAlignment vAllign, boolean isWrapText,boolean isBoldText,boolean isItalicText,int fontSize,String fontName) {
		CellStyle style = workBook.createCellStyle();
		//Setting Background color  
		//style.setFillBackgroundColor(IndexedColors.AQUA.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		
		if (style instanceof XSSFCellStyle) {
		   XSSFCellStyle xssfcellcolorstyle = (XSSFCellStyle)style;
		   xssfcellcolorstyle.setFillForegroundColor(new XSSFColor(rgb, null));
		}
		//style.setFillPattern(FillPatternType.ALT_BARS);
		style.setBorderBottom(BorderStyle.MEDIUM);
		style.setBorderTop(BorderStyle.MEDIUM);
		style.setBorderLeft(BorderStyle.MEDIUM);
		style.setBorderRight(BorderStyle.MEDIUM);
		style.setAlignment(hAllign);
		style.setVerticalAlignment(vAllign);
		style.setWrapText(isWrapText);
		
		Font font = workBook.createFont();
        //font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
        font.setFontHeightInPoints((short)fontSize);  
        font.setFontName(fontName);  //"Times New Roman"
        
        font.setItalic(isItalicText); 
        font.setBold(isBoldText);
        // Applying font to the style  
        style.setFont(font); 
        
        return style;
	}
}
