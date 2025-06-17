package com.resustainability.reirm.reone;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.resustainability.reisp.common.DateForUser;
import com.resustainability.reisp.common.EMailSender;
import com.resustainability.reisp.common.Mail;
import com.resustainability.reisp.constants.PageConstants;
import com.resustainability.reisp.model.Project;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.User;
import com.resustainability.reisp.model.UserPaginationObject;
import com.resustainability.reisp.service.LocationService;
import com.resustainability.reisp.service.ProjectService;
import com.resustainability.reisp.service.RoleMappingService;
import com.resustainability.reisp.service.UserService;

import net.minidev.json.JSONObject;

@RestController
@RequestMapping("/reone")
public class RestUserController {
	@InitBinder
    public void initBinder(WebDataBinder binder) { 
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
	Logger logger = Logger.getLogger(RestUserController.class);
	
	@Autowired
	UserService service;
	
	@Autowired
	LocationService service3;
	
	@Autowired
	RoleMappingService service4;
	
	@Autowired
	ProjectService service5;
	
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
	
	@RequestMapping(value = "/user", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView user(@RequestBody User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.user);
		User obj = null;
		try {
			List<RoleMapping> projectsList = service4.getProjectsList(null);
			model.addObject("projectsList", projectsList);
			
			List<RoleMapping> deptList = service.getDeptsList();
			model.addObject("deptList", deptList);
			
			List<Project> sbuList = service5.getSBUsList(null);
			model.addObject("sbuList", sbuList);
			
			List<User> objList = service.getReportingTosList(obj);
			model.addObject("objList", objList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/update-user-details", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView updateUserSelf(@RequestBody User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.updateSelfUser);
		User obj = null;
		try {
			List<RoleMapping> projectsList = service4.getProjectsList(null);
			model.addObject("projectsList", projectsList);
			
			List<RoleMapping> deptList = service.getDeptsList();
			model.addObject("deptList", deptList);
			
			List<Project> sbuList = service5.getSBUsList(null);
			model.addObject("sbuList", sbuList);
			
			List<User> objList = service.getReportingTosList(obj);
			model.addObject("objList", objList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/send-verification-code", method = {RequestMethod.POST, RequestMethod.GET},produces=MediaType.APPLICATION_JSON_VALUE)
	public String sendVerificationCode(@RequestBody User user, HttpSession session) throws JsonProcessingException {
		String json = null;
		ObjectMapper objectMapper = new ObjectMapper();
		boolean flag = false;
		try {
			User userDetails = null;
			userDetails = service.validateUser(user);
			if(!StringUtils.isEmpty(userDetails)) {
				EMailSender emailSender = new EMailSender();
				Mail mail = new Mail();
				mail.setMailTo(user.getEmail_id());
				mail.setMailSubject("Verification Code");
				String body = "Hi,<br>"
						+ "We have received a request to log in to your ReOne account. To ensure your security, "
						+ "we require you to enter a one-time password (OTP) to complete the login process.<br>"
						+ "Your OTP code is: [ <b>"+user.getOtp_code()+"</b> ]. Please enter this code within <b>3 minutes </b> to complete the login process.<br>"
						+ "If you did not initiate this request, please contact support team immediately."
						+ "<br>Thank you for choosing this service."
						+ "<br>"
						+ "<br>Best Regards,"
						+ "<p style='color : red'><b>ReOne</b></p>"
						+ "<img src='https://internal.resustainability.com/index/resources/images/app-logo.svg' width='100'  class='card-img'>";
				String subject = "Verification Code | ReOne Application!";
			 flag = 	emailSender.send(mail.getMailTo(), mail.getMailSubject(), body,user,subject);
			 	if(flag) {
					json = objectMapper.writeValueAsString("OTP Sent Succesfully.");
				}else {
					json = objectMapper.writeValueAsString("Sending OTP failed.");
				}
			}else {
				json = objectMapper.writeValueAsString("User not Found");
			}
			
		
		} catch (Exception e) {
			e.printStackTrace();
			json = objectMapper.writeValueAsString("Sending OTP failed.");
		}
		return json;
	}

	
	@RequestMapping(value = "/update-self-user", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	public String updateUserSelf(@RequestBody User obj,RedirectAttributes attributes,HttpSession session) throws JsonProcessingException {
		boolean flag = false;
		String userId = null;
		String userName = null,email=null;
		String json = null;
		ModelAndView model = new ModelAndView();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			model.setViewName("redirect:/home");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			email = (String) session.getAttribute("USER_EMAIL");
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		    String dt = formatter.format(new Date());
			String endDate = DateForUser.date();
			obj.setEnd_date(endDate);
			obj.setModified_by(userId);
			obj.setUser_id(userId);
			obj.setEmail_id(email);
			obj.setCreated_date(dt);
			flag = service.addUserSelf(obj);
			HashMap<String, String> jsonList = new HashMap<String, String>();
			if(flag == true) {
				
				attributes.addFlashAttribute("success", "User Updated Succesfully.");
				if(!StringUtils.isEmpty(obj.getUser_id())){
					User userDetails = service.validateUser(obj);
							session.setAttribute("user", userDetails);
							session.setAttribute("NUMBER", userDetails.getContact_number());
							session.setAttribute("REPORTING_TO_NAME", obj.getReporting_user_name());
							session.setAttribute("BASE_SBU", userDetails.getBase_sbu());
							session.setAttribute("SBU_NAME", userDetails.getSbu_name());
							session.setAttribute("BASE_PROJECT", userDetails.getProject_name());
							session.setAttribute("BASE_DEPARTMENT", userDetails.getBase_department());
							session.setAttribute("DEPARTMENT_NAME", userDetails.getDepartment_name());
							session.setAttribute("BASE_PROJECT_CODE", userDetails.getBase_project());
							session.setAttribute("REPORTING_TO", obj.getReporting_to());
							
							jsonList.put("SBU",userDetails.getBase_sbu());
							jsonList.put("SBU_NAME",userDetails.getSbu_name());
							jsonList.put("PROJECT_CODE",userDetails.getBase_project());
							jsonList.put("Project",userDetails.getProject_name());
							jsonList.put("DEPARTMENT",userDetails.getBase_department());
							jsonList.put("DEPARTMENT_NAME",userDetails.getDepartment_name());
							jsonList.put("REPORTING_TO",userDetails.getReporting_to());
							jsonList.put("REPORTING_TO_NAME",userDetails.getReporting_user_name());
							
				}
				json = objectMapper.writeValueAsString(jsonList);
			}
			else {
				json = objectMapper.writeValueAsString("Updating User is failed. Try again.");
				attributes.addFlashAttribute("error","Updating User is failed. Try again.");
			}
		} catch (Exception e) {
			json = objectMapper.writeValueAsString("Updating User is failed. Try again.");
			attributes.addFlashAttribute("error","Updating User is failed. Try again.");
			e.printStackTrace();
		}
		return json;
	}
	
	@RequestMapping(value = "/ajax/getUserList1", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getLcationsList(@RequestBody User obj,HttpSession session) {
		List<User> companiesList = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			companiesList = service.getUsersList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getLcationsList : " + e.getMessage());
		}
		return companiesList;
	}
	
	@RequestMapping(value = "/ajax/getUserList", method = { RequestMethod.POST, RequestMethod.GET })
	public void getUsersList(@RequestBody User obj, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		PrintWriter pw = null;
		//JSONObject json = new JSONObject();
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

			List<User> budgetList = new ArrayList<User>();

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

			UserPaginationObject personJsonObject = new UserPaginationObject();
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
	public int getTotalRecords(User obj, String searchParameter) {
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
	public List<User> createPaginationData(int startIndex, int offset, User obj, String searchParameter) {
		List<User> objList = null;
		try {
			objList = service.getUserList(obj, startIndex, offset, searchParameter);
		} catch (Exception e) {
			logger.error("createPaginationData : " + e.getMessage());
		}
		return objList;
	}
	@RequestMapping(value = "/ajax/getUserFilterList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getUserFilterList(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		try {
			objsList = service.getUserFilterList(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getUserFilterList : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/ajax/getRoleFilterListInUser", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getRoleFilterListInUser(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		try {
			objsList = service.getRoleFilterListInUser(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getRoleFilterListInUser : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/ajax/getSBUFilterListInUser", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getSBUFilterListInUser(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		try {
			objsList = service.getSBUFilterListInUser(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getSBUFilterListInUser : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/ajax/getProjectFilterListInUser", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getProjectFilterListInUser(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		try {
			objsList = service.getProjectFilterListInUser(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getProjectFilterListInUser : " + e.getMessage());
		}
		return objsList;
	}


	@RequestMapping(value = "/ajax/getStatusFilterListFromUser", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<User> getStatusFilterListFromUser(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		try {
			objsList = service.getStatusFilterListFromUser(obj);
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getStatusFilterListFromUser : " + e.getMessage());
		}
		return objsList;
	}

	@RequestMapping(value = "/add-user", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addUser(@RequestBody User obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/user");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		    String dt = formatter.format(new Date());
			String endDate = DateForUser.date();
			obj.setEnd_date(endDate);
			obj.setCreated_by(userId);
			obj.setCreated_date(dt);
			flag = service.addUser(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "User Added Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Adding User is failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error","Adding User is failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/update-user", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateUser(@RequestBody User obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/user");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
		    String dt = formatter.format(new Date());
			obj.setModified_by(userId);
			obj.setModified_date(dt);
			flag = service.updateUser(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "User Updated Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Updating User is failed. Try again.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			attributes.addFlashAttribute("error","Updating User is failed. Try again.");
		}
		return model;
	}
	
	@RequestMapping(value = "/export-user", method = {RequestMethod.GET,RequestMethod.POST})
	public void exportUser(HttpServletRequest request, HttpServletResponse response,HttpSession session,@RequestBody User obj,RedirectAttributes attributes){
		ModelAndView view = new ModelAndView(PageConstants.user);
		List<User> dataList = new ArrayList<User>();
		String userId = null;String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");userName = (String) session.getAttribute("USER_NAME");
			view.setViewName("redirect:/user");
			int time = obj.getTime_period();
			if(!StringUtils.isEmpty(obj.getTimePeriod())) {
				time = Integer.parseInt(obj.getTimePeriod());
			}
			
			obj.setTime_period(time);
			dataList = service.getUsersList(obj); 
			if(dataList != null && dataList.size() > 0){
	            XSSFWorkbook  workBook = new XSSFWorkbook ();
	            XSSFSheet sheet = workBook.createSheet(WorkbookUtil.createSafeSheetName("User"));
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
		        
		        XSSFRow heading = sheet.createRow(1);
		        String header = "User - Report" ;
		        Cell cell1 = heading.createCell(0);
		        cell1.setCellStyle(greenStyle);
				cell1.setCellValue(header);
				
				
	            XSSFRow headingRow = sheet.createRow(2);
	        	String headerString = "#,User,Email,Project,SBU ,Department,Active Hours,Last Login, Status" + 
	    				"";
	            String[] firstHeaderStringArr = headerString.split("\\,");
	            
	            for (int i = 0; i < firstHeaderStringArr.length; i++) {		        	
		        	Cell cell = headingRow.createCell(i);
			        cell.setCellStyle(greenStyle);
					cell.setCellValue(firstHeaderStringArr[i]);
				}
	            
	            short rowNo = 3,sNo = 1;
	            for (User obj1 : dataList) {
	                XSSFRow row = sheet.createRow(rowNo);
	                int c = 0;
	            
	                Cell cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(sNo++);
				
	                cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getUser_id() +" - "+obj1.getUser_name());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getEmail_id());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getBase_project());
					
					cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getBase_sbu());
					
				    cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getBase_department());
					
					cell = row.createCell(c++);
					cell.setCellStyle(whiteStyle);
					if(StringUtils.isEmpty(obj1.getMinutes())) {
						cell.setCellValue("0 hrs");
					}else {
						cell.setCellValue(obj1.getMinutes()+" hrs");
					}
					
			
					cell = row.createCell(c++);
					cell.setCellStyle(whiteStyle);
					if(StringUtils.isEmpty(obj1.getLast_login())) {
						cell.setCellValue("Never Logged in");
					}else {
						cell.setCellValue(obj1.getLast_login());
					}
					
					
				    cell = row.createCell(c++);
					cell.setCellStyle(sectionStyle);
					cell.setCellValue(obj1.getStatus());
					
	                rowNo++;
	            }
	            for(int columnIndex = 1; columnIndex < firstHeaderStringArr.length; columnIndex++) {
	        		sheet.setColumnWidth(columnIndex, 25 * 200);
				}
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HHmmss");
                Date date = new Date();
                String fileName = "User_"+dateFormat.format(date);
                
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
			logger.error("exportUser : : User Id - "+userId+" - User Name - "+userName+" - "+e.getMessage());
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
	
	@RequestMapping(value = "/ajax/getUserActionsForNotification", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String getUserActionsForNotification(@RequestBody User obj,HttpSession session) {
		List<User> objsList = null;
		String json = null;
		 ObjectMapper objectMapper = new ObjectMapper();
		 String userId = null;
			String userName = null;
			try {
				userId = (String) session.getAttribute("USER_ID");
				userName = (String) session.getAttribute("USER_NAME");
				obj.setUser_id(userId);
			objsList = service.getUserActionsForNotification(obj);
			JSONObject payload = null;
			objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

			 json = objectMapper.writeValueAsString(objsList);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getUserActionsForNotification : " + e.getMessage());
		}
		return json;
	}


}
