package com.resustainability.reisp.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
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
import org.apache.poi.ss.usermodel.charts.AxisPosition;
import org.apache.poi.ss.util.WorkbookUtil;
import org.apache.poi.xddf.usermodel.chart.LegendPosition;
import org.apache.poi.xddf.usermodel.chart.XDDFCategoryAxis;
import org.apache.poi.xddf.usermodel.chart.XDDFChartLegend;
import org.apache.poi.xddf.usermodel.chart.XDDFValueAxis;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFChart;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.resustainability.reisp.common.DateParser;
import com.resustainability.reisp.constants.PageConstants;
import com.resustainability.reisp.model.IRM;
import com.resustainability.reisp.model.IRMPaginationObject;
import com.resustainability.reisp.model.Project;
import com.resustainability.reisp.model.ProjectLocation;
import com.resustainability.reisp.model.RoleMapping;
import com.resustainability.reisp.model.User;
import com.resustainability.reisp.model.UserPaginationObject;
import com.resustainability.reisp.service.IRMService;
import com.resustainability.reisp.service.IRMService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.AreaReference;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellReference;
import org.apache.poi.xddf.usermodel.XDDFColor;
import org.apache.poi.xddf.usermodel.XDDFShapeProperties;
import org.apache.poi.xddf.usermodel.XDDFSolidFillProperties;
import org.apache.poi.xddf.usermodel.chart.BarDirection;
import org.apache.poi.xddf.usermodel.chart.ChartTypes;
import org.apache.poi.xddf.usermodel.chart.XDDFBarChartData;
import org.apache.poi.xddf.usermodel.chart.XDDFCategoryAxis;
import org.apache.poi.xddf.usermodel.chart.XDDFCategoryDataSource;
import org.apache.poi.xddf.usermodel.chart.XDDFChartData;
import org.apache.poi.xddf.usermodel.chart.XDDFChartLegend;
import org.apache.poi.xddf.usermodel.chart.XDDFDataSourcesFactory;
import org.apache.poi.xddf.usermodel.chart.XDDFNumericalDataSource;
import org.apache.poi.xddf.usermodel.chart.XDDFValueAxis;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFChart;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFDrawing;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openxmlformats.schemas.drawingml.x2006.chart.CTBoolean;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
@Controller
public class IRMController {

	@InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }
	Logger logger = Logger.getLogger(IRMController.class);
	
	@Autowired
	IRMService service;
	
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
	
	
	@RequestMapping(value = "/irm", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView irm(@ModelAttribute User user,IRM obj, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.irmMain);
		String userId = null;
		String userName = null;
		String role = null;
		List<IRM> companiesList = new ArrayList<IRM>();
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			//companiesList = service.getIRMList(obj);
			 if(companiesList.size() > 0) {
				 model.addObject("all_irm", companiesList.get(0).getAll_irm());
				 model.addObject("active_irm", companiesList.get(0).getActive_irm());
				 model.addObject("inActive_irm", companiesList.get(0).getInActive_irm());
				 model.addObject("not_assigned", companiesList.get(0).getNot_assigned());
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/irm-report", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView irmReport(@ModelAttribute User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.irmReport);
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/ajax/getIRMList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getIRMList(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> companiesList = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			//obj.setFrom_date(DateParser.parseTrickyDate(obj.getFrom_date()));
			//obj.setTo_date(DateParser.parseTrickyDate(obj.getTo_date()));
			companiesList = service.getIRMList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getIRMList : " + e.getMessage());
		}
		return companiesList;
	}
	
	@RequestMapping(value = "/ajax/getIRMListLaztLoad", method = { RequestMethod.POST, RequestMethod.GET })
	public void getIRMListLaztLoad(@ModelAttribute IRM obj, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		PrintWriter pw = null;
		//JSONObject json = new JSONObject();
		String json2 = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}

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

			List<IRM> budgetList = new ArrayList<IRM>();

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

			IRMPaginationObject personJsonObject = new IRMPaginationObject();
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
	public int getTotalRecords(IRM obj, String searchParameter) {
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
	public List<IRM> createPaginationData(int startIndex, int offset, IRM obj, String searchParameter) {
		List<IRM> objList = null;
		try {
			objList = service.getIRMLAzyList(obj, startIndex, offset, searchParameter);
		} catch (Exception e) {
			logger.error("createPaginationData : " + e.getMessage());
		}
		return objList;
	}
	
	@RequestMapping(value = "/ajax/getIRMListLaztLoadR", method = { RequestMethod.POST, RequestMethod.GET })
	public void getIRMListLaztLoadR(@ModelAttribute IRM obj, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		PrintWriter pw = null;
		//JSONObject json = new JSONObject();
		String json2 = null; 
		String userId = null;
		String userName = null;
		String role = null;
		try {
			//userId = (String) session.getAttribute("USER_ID");
			//userName = (String) session.getAttribute("USER_NAME");
			//role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}

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

			List<IRM> budgetList = new ArrayList<IRM>();

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

			IRMPaginationObject personJsonObject = new IRMPaginationObject();
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
	@RequestMapping(value = "/ajax/getIRMListReport", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getIRMListReport(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> companiesList = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			//obj.setFrom_date(DateParser.parseTrickyDate(obj.getFrom_date()));
			//obj.setTo_date(DateParser.parseTrickyDate(obj.getTo_date()));
			companiesList = service.getIRMList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getIRMList : " + e.getMessage());
		}
		return companiesList;
	}
	
	@RequestMapping(value = "/ajax/getIRMHistoryList", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getIRMHistoryList(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> companiesList = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			obj.setFrom_date(DateParser.parseTrickyDate(obj.getFrom_date()));
			obj.setTo_date(DateParser.parseTrickyDate(obj.getTo_date()));
			companiesList = service.getIRMHistoryList(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getIRMHistoryList : " + e.getMessage());
		}
		return companiesList;
	}
	
	
	@RequestMapping(value = "/update-irm-form", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView irmUpdateForm(@ModelAttribute IRM irm, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.irmUpdate);
		try {
			List <IRM> projectsList = service.getProjectstListIRMUpdate(irm);
			model.addObject("projectsList", projectsList);

			List <IRM> deptsList = service.getDepartmentsIRMUpdate(irm);
			model.addObject("deptsList", deptsList);
			
			List <IRM> locationsList = service.getLocationstListIRMUpdate(irm);
			model.addObject("locationsList", locationsList);
			
			List <IRM> userList = service.getUserListIRMUpdate(irm);
			model.addObject("userList", userList);
			
			IRM IRMDetails = service.getIRMDocumentDEtails(irm);
			model.addObject("IRMDetails", IRMDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/update-irm-form/{document_code}", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView irmUpdateFormWithID(@ModelAttribute IRM irm,@PathVariable("document_code") String document_code , HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.irmUpdate);
		try {
			irm.setDepartment_code(document_code);
			List <IRM> projectsList = service.getProjectstListIRMUpdate(irm);
			model.addObject("projectsList", projectsList);

			List <IRM> deptsList = service.getDepartmentsIRMUpdate(irm);
			model.addObject("deptsList", deptsList);
			
			List <IRM> locationsList = service.getLocationstListIRMUpdate(irm);
			model.addObject("locationsList", locationsList);
			
			IRM IRMDetails = service.getIRMDocumentDEtails(irm);
			model.addObject("IRMDetails", IRMDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/ajax/getSBUFilterListFromIRM", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getSBUFilterListFromIRM(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			departments = service.getSBUFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getSBUFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getProjectFilterListFromIRM", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getProjectFilterListFromIRM(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			departments = service.getProjectFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getProjectFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getIncidentFilterListFromIRM", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getIncidentFilterListFromIRM(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			departments = service.getIncidentFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getIncidentFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getStatusFilterListFromIRM", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getStatusFilterListFromIRM(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			obj.setUser(userId);
			obj.setRole(role);
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			departments = service.getStatusFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getStatusFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getSBUFilterListFromIRMReport", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getSBUFilterListFromIRMReport(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			obj.setRole(role);
			departments = service.getSBUFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getSBUFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getProjectFilterListFromIRMReport", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getProjectFilterListFromIRMReport(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			obj.setRole(role);
			departments = service.getProjectFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getProjectFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getIncidentFilterListFromIRMReport", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getIncidentFilterListFromIRMReport(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			obj.setRole(role);
			departments = service.getIncidentFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getIncidentFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getStatusFilterListFromIRMReport", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<IRM> getStatusFilterListFromIRMReport(@ModelAttribute IRM obj,HttpSession session) {
		List<IRM> departments = null;
		String userId = null;
		String userName = null;
		String role = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			role = (String) session.getAttribute("BASE_ROLE");
			if(!StringUtils.isEmpty(obj.getFrom_and_to())) {
				if(obj.getFrom_and_to().contains("to")) {
					String [] dates = obj.getFrom_and_to().split("to");
					obj.setFrom_date(dates[0].trim());
					obj.setTo_date(dates[1].trim());
				}else {
					obj.setFrom_date(obj.getFrom_and_to());
				}
			}
			obj.setRole(role);
			departments = service.getStatusFilterListFromIRM(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getStatusFilterListFromIRM : " + e.getMessage());
		}
		return departments;
	}
	
	
	
	@RequestMapping(value = "/irm-add-incident", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView irmAddIncident(@ModelAttribute User user, HttpSession session) {
		ModelAndView model = new ModelAndView(PageConstants.irmAdd);
		try {
			user.setUser_id((String) session.getAttribute("USER_ID"));
			
			List <Project> projectsList = service.getProjectstList(user);
			model.addObject("projectsList", projectsList);
			
			List <RoleMapping> L2List = service.geL2List(user);
			Set<String> lList = new HashSet<>();
			L2List = L2List.stream()
		            .filter(e -> lList.add(e.getProject()))
		            .collect(Collectors.toList());
			
			model.addObject("L2List", L2List);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return model;
	}
	
	
	@RequestMapping(value = "/ajax/getDepartments", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getDepartments(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> departments = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			departments = service.getDepartments(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getDepartments : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getRoleMappedOrNot", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getRoleMappedOrNot(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> departments = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			departments = service.getRoleMappedOrNot(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getRoleMappedOrNot : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/ajax/getLocations", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ProjectLocation> getLocations(@ModelAttribute ProjectLocation obj,HttpSession session) {
		List<ProjectLocation> location = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			location = service.getLocations(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getLocations : " + e.getMessage());
		}
		return location;
	}
	
	@RequestMapping(value = "/ajax/getRoleMappingforIRMForm", method = {RequestMethod.GET,RequestMethod.POST},produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<RoleMapping> getRoleMappingforIRMForm(@ModelAttribute RoleMapping obj,HttpSession session) {
		List<RoleMapping> departments = null;
		String userId = null;
		String userName = null;
		try {
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			obj.setProject(obj.getProject_code());
			departments = service.getRoleMappingforIRMForm(obj);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("getRoleMappingforIRMForm : " + e.getMessage());
		}
		return departments;
	}
	
	@RequestMapping(value = "/irm-submit", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView irmSubmit(@ModelAttribute IRM obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/irm");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			obj.setUser_id(userId);
			obj.setUser_name(userName);
			String email = (String) session.getAttribute("USER_EMAIL");
			obj.setEmail(email);
			obj.setCreated_by(userId);
			Calendar now = Calendar.getInstance();
		    DateFormat df = new SimpleDateFormat("_yyMM_");
		    String result = df.format(now.getTime());
			String u_id = service.getUniqueID(obj);
			obj.setDocument_code("IRM"+result+u_id);
			flag = service.irmSubmit(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", obj.getDocument_code()+" - Incident Created Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error"," Submiting Incident is failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error"," Submiting Incident is failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	
	@RequestMapping(value = "/submit-new-files", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView irmUpdateFilesSubmit(@ModelAttribute IRM obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/irm");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			obj.setUser_id(userId);
			obj.setUser_name(userName);
			String email = (String) session.getAttribute("USER_EMAIL");
			obj.setEmail(email);
			obj.setCreated_by(userId);
			flag = service.irmUpdateFilesSubmit(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "Files Updated for Incident"+obj.getDocument_code_files()+" Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Updating Files failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error","Updating Files failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/irm-update-submit", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView irmUpdateSubmit(@ModelAttribute IRM obj,RedirectAttributes attributes,HttpSession session) {
		boolean flag = false;
		String userId = null;
		String userName = null;
		ModelAndView model = new ModelAndView();
		try {
			model.setViewName("redirect:/irm");
			userId = (String) session.getAttribute("USER_ID");
			userName = (String) session.getAttribute("USER_NAME");
			obj.setUser_id(userId);
			obj.setUser_name(userName);
			String email = (String) session.getAttribute("USER_EMAIL");
			obj.setEmail(email);
			obj.setCreated_by(userId);
			flag = service.irmUpdateSubmit(obj);
			if(flag == true) {
				attributes.addFlashAttribute("success", "Incident Updated Succesfully.");
			}
			else {
				attributes.addFlashAttribute("error","Updating Incident is failed. Try again.");
			}
		} catch (Exception e) {
			attributes.addFlashAttribute("error","Updating Incident is failed. Try again.");
			e.printStackTrace();
		}
		return model;
	}
	

	@RequestMapping(value = "/export-irm", method = {RequestMethod.GET, RequestMethod.POST})
	public void exportIRM(HttpServletRequest request, HttpServletResponse response, HttpSession session,
	                      @ModelAttribute IRM obj, RedirectAttributes attributes) {

	    ModelAndView view = new ModelAndView(PageConstants.irmMain);
	    List<IRM> dataList = new ArrayList<>();
	    String userId = null;
	    String userName = null;

	    try {
	        userId = (String) session.getAttribute("USER_ID");
	        userName = (String) session.getAttribute("USER_NAME");
	        view.setViewName("redirect:/irm");

	        if (!StringUtils.isEmpty(obj.getFrom_and_to())) {
	            if (obj.getFrom_and_to().contains("to")) {
	                String[] dates = obj.getFrom_and_to().split("to");
	                obj.setFrom_date(dates[0].trim());
	                obj.setTo_date(dates[1].trim());
	            } else {
	                obj.setFrom_date(obj.getFrom_and_to());
	                obj.setTo_date(obj.getFrom_and_to()); // single date case
	            }
	        }

	        dataList = service.getIRMList(obj);

	        if (dataList != null && !dataList.isEmpty()) {
	            XSSFWorkbook workBook = new XSSFWorkbook();

	            // Aggregate data
	            class Agg {
	                int duringWeek = 0;
	                int ytd = 0;
	                int complied = 0;
	                int inProgress = 0;
	            }

	            LocalDate now = LocalDate.now();
	            LocalDate weekStart = now.minusDays(6);
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MMM-yy");

	            String fromDate = obj.getFrom_date() != null ? obj.getFrom_date() : "N/A";
	            String toDate = obj.getTo_date() != null ? obj.getTo_date() : "N/A";
	            String dynamicTitle = "Aayush Observations status from " + fromDate + " to " + toDate;

	            Map<String, Map<String, Agg>> aggMap = new HashMap<>();

	            for (IRM irm : dataList) {
	                if (irm.getSbu_code() == null || irm.getProject_code() == null) {
	                    continue;
	                }

	                String sbu = irm.getSbu_code();
	                String project = irm.getProject_name();

	                String createdDate = irm.getCreated_date();
	                if (createdDate == null || createdDate.trim().isEmpty()) {
	                    continue;
	                }

	                String dateStr;
	                try {
	                    dateStr = createdDate.split("\\s+")[0].trim();
	                } catch (Exception ex) {
	                    continue;
	                }

	                LocalDate date;
	                try {
	                    date = LocalDate.parse(dateStr, formatter);
	                } catch (Exception ex) {
	                    continue;
	                }

	                boolean isThisWeek = !date.isBefore(weekStart);
	                String status = irm.getStatus();
	                boolean isComplied = status != null && "Resolved".equals(status);

	                Map<String, Agg> projectMap = aggMap.computeIfAbsent(sbu, k -> new HashMap<>());
	                Agg agg = projectMap.computeIfAbsent(project, k -> new Agg());

	                agg.ytd++;
	                if (isThisWeek) agg.duringWeek++;
	                if (isComplied) agg.complied++;
	                else agg.inProgress++;
	            }

	            // Cell styles
	            byte[] blueRGB   = new byte[]{(byte)0, (byte)176, (byte)240};
	            byte[] yellowRGB = new byte[]{(byte)255, (byte)192, (byte)0};
	            byte[] greenRGB  = new byte[]{(byte)146, (byte)208, (byte)80};
	            byte[] redRGB    = new byte[]{(byte)255, (byte)0, (byte)0};
	            byte[] whiteRGB  = new byte[]{(byte)255, (byte)255, (byte)255};

	            boolean isWrapText = true;
	            boolean isBoldText = true;
	            boolean isItalicText = false;
	            int fontSize = 11;
	            String fontName = "Times New Roman";

	            CellStyle blueStyle   = cellFormating(workBook, blueRGB,   HorizontalAlignment.CENTER, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);
	            CellStyle yellowStyle = cellFormating(workBook, yellowRGB, HorizontalAlignment.CENTER, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);
	            CellStyle greenStyle  = cellFormating(workBook, greenRGB,  HorizontalAlignment.CENTER, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);
	            CellStyle redStyle    = cellFormating(workBook, redRGB,    HorizontalAlignment.CENTER, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);
	            CellStyle whiteStyle  = cellFormating(workBook, whiteRGB,  HorizontalAlignment.CENTER, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);

	            CellStyle indexWhiteStyle = cellFormating(workBook, whiteRGB, HorizontalAlignment.LEFT, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);

	            isWrapText = true; isBoldText = false; isItalicText = false; fontSize = 9; fontName = "Times New Roman";
	            CellStyle sectionStyle = cellFormating(workBook, whiteRGB, HorizontalAlignment.LEFT, VerticalAlignment.CENTER, isWrapText, isBoldText, isItalicText, fontSize, fontName);

	            List<String> sbuList = new ArrayList<>(aggMap.keySet());
	            sbuList.sort(Comparator.naturalOrder());

	            // Summary data preparation
	            List<Object[]> summaryData = new ArrayList<>();
	            int grandDuring = 0, grandYtd = 0, grandComplied = 0;
	            for (String sbu : sbuList) {
	                Map<String, Agg> projs = aggMap.get(sbu);
	                int sDuring = 0, sYtd = 0, sComplied = 0, sInProgress = 0;
	                for (Agg a : projs.values()) {
	                    sDuring += a.duringWeek;
	                    sYtd += a.ytd;
	                    sComplied += a.complied;
	                    sInProgress += a.inProgress;
	                }
	                double sPerc = sYtd > 0 ? (double) sComplied / sYtd * 100 : 0;
	                summaryData.add(new Object[]{sbu, sDuring, sYtd, sComplied, sPerc});
	                grandDuring += sDuring;
	                grandYtd += sYtd;
	                grandComplied += sComplied;
	            }
	            double grandPerc = grandYtd > 0 ? (double) grandComplied / grandYtd * 100 : 0;

	            // ────────────────────────────────────────────────
	            // Per-SBU sheets with chart
	            // ────────────────────────────────────────────────
	            for (String sbu : sbuList) {
	                XSSFSheet sheet = workBook.createSheet(WorkbookUtil.createSafeSheetName(sbu));

	                // Title - merged across all columns
	                XSSFRow titleRow = sheet.createRow(0);
	                Cell titleCell = titleRow.createCell(0);
	                titleCell.setCellValue(dynamicTitle);
	                titleCell.setCellStyle(yellowStyle);
	                sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 7));

	                // Headers
	                XSSFRow headingRow = sheet.createRow(1);
	                String[] headers = {"S.No", "BU", "Site /Project name", "During this week", "YTD", "Complied", "In Progress", "% of compliance"};
	                for (int i = 0; i < headers.length; i++) {
	                    Cell cell = headingRow.createCell(i);
	                    cell.setCellStyle(greenStyle);
	                    cell.setCellValue(headers[i]);
	                }

	                // Data rows
	                Map<String, Agg> projects = aggMap.get(sbu);
	                List<String> projectList = new ArrayList<>(projects.keySet());
	                projectList.sort(Comparator.naturalOrder());

	                int rowNo = 2;
	                int firstDataRowIndex = rowNo;
	                int sno = 1;
	                int totalDuring = 0, totalYtd = 0, totalComplied = 0, totalInProgress = 0;

	                for (String project : projectList) {
	                    Agg agg = projects.get(project);
	                    double perc = agg.ytd > 0 ? (double) agg.complied / agg.ytd * 100 : 0;

	                    XSSFRow row = sheet.createRow(rowNo++);
	                    int c = 0;

	                    row.createCell(c++).setCellValue(sno++);
	                    row.createCell(c++).setCellValue(""); // BU placeholder
	                    row.createCell(c++).setCellValue(project);
	                    row.createCell(c++).setCellValue(agg.duringWeek);
	                    row.createCell(c++).setCellValue(agg.ytd);
	                    row.createCell(c++).setCellValue(agg.complied);
	                    row.createCell(c++).setCellValue(agg.inProgress);
	                    row.createCell(c++).setCellValue(perc);

	                    totalDuring += agg.duringWeek;
	                    totalYtd += agg.ytd;
	                    totalComplied += agg.complied;
	                    totalInProgress += agg.inProgress;
	                }

	                // BU merge logic - only when multiple rows
	                if (!projectList.isEmpty()) {
	                    int lastDataRow = rowNo - 1;
	                    Cell buCell = sheet.getRow(firstDataRowIndex).createCell(1);
	                    buCell.setCellValue(sbu);
	                    buCell.setCellStyle(sectionStyle);

	                    if (projectList.size() >= 2) {
	                        sheet.addMergedRegion(new CellRangeAddress(firstDataRowIndex, lastDataRow, 1, 1));
	                    }
	                }

	                // Total row
	                XSSFRow totalRow = sheet.createRow(rowNo);
	                int tc = 0;
	                totalRow.createCell(tc++).setCellStyle(sectionStyle);
	                totalRow.createCell(tc++).setCellValue("TOTAL");
	                totalRow.createCell(tc++).setCellStyle(sectionStyle);
	                totalRow.createCell(tc++).setCellValue(totalDuring);
	                totalRow.createCell(tc++).setCellValue(totalYtd);
	                totalRow.createCell(tc++).setCellValue(totalComplied);
	                totalRow.createCell(tc++).setCellValue(totalInProgress);
	                double totalPerc = totalYtd > 0 ? (double) totalComplied / totalYtd * 100 : 0;
	                totalRow.createCell(tc++).setCellValue(totalPerc);

	                // Auto-size columns
	                for (int i = 0; i < headers.length; i++) {
	                    sheet.autoSizeColumn(i);
	                }

	                // ────────────────────────────────────────────────
	                // Chart for this SBU sheet
	                // ────────────────────────────────────────────────
	                if (rowNo > 2) { // at least one data row
	                    XSSFDrawing drawing = sheet.createDrawingPatriarch();
	                    XSSFClientAnchor anchor = drawing.createAnchor(0, 0, 0, 0, 9, 0, 25, 25); // right of table
	                    XSSFChart chart = drawing.createChart(anchor);
	                    chart.setTitleText(sbu);
	                    chart.setTitleOverlay(false);

	                    XDDFChartLegend legend = chart.getOrAddLegend();
	                    legend.setPosition(LegendPosition.BOTTOM);

	                    XDDFCategoryAxis bottomAxis = chart.createCategoryAxis(org.apache.poi.xddf.usermodel.chart.AxisPosition.BOTTOM);
	                    bottomAxis.setTitle("Site / Project");

	                    XDDFValueAxis leftAxis = chart.createValueAxis(org.apache.poi.xddf.usermodel.chart.AxisPosition.LEFT);
	                    leftAxis.setTitle("Count");

	                    int firstDataRow = 2;
	                    int lastDataRow = rowNo - 1; // exclude TOTAL

	                    CellRangeAddress sitesRange = new CellRangeAddress(firstDataRow, lastDataRow, 2, 2);
	                    XDDFCategoryDataSource sites = XDDFDataSourcesFactory.fromStringCellRange(sheet, sitesRange);

	                    CellRangeAddress duringRange = new CellRangeAddress(firstDataRow, lastDataRow, 3, 3);
	                    XDDFNumericalDataSource<Double> during = XDDFDataSourcesFactory.fromNumericCellRange(sheet, duringRange);

	                    CellRangeAddress ytdRange = new CellRangeAddress(firstDataRow, lastDataRow, 4, 4);
	                    XDDFNumericalDataSource<Double> ytds = XDDFDataSourcesFactory.fromNumericCellRange(sheet, ytdRange);

	                    CellRangeAddress compliedRange = new CellRangeAddress(firstDataRow, lastDataRow, 5, 5);
	                    XDDFNumericalDataSource<Double> complieds = XDDFDataSourcesFactory.fromNumericCellRange(sheet, compliedRange);

	                    XDDFBarChartData data = (XDDFBarChartData) chart.createData(ChartTypes.BAR, bottomAxis, leftAxis);
	                    data.setBarDirection(BarDirection.COL);

	                    XDDFBarChartData.Series seriesDuring   = (XDDFBarChartData.Series) data.addSeries(sites, during);
	                    XDDFBarChartData.Series seriesYtd      = (XDDFBarChartData.Series) data.addSeries(sites, ytds);
	                    XDDFBarChartData.Series seriesComplied = (XDDFBarChartData.Series) data.addSeries(sites, complieds);

	                    seriesDuring.setTitle("During this week", null);
	                    seriesYtd.setTitle("YTD", null);
	                    seriesComplied.setTitle("Complied", null);

	                    chart.plot(data);

	                    // Colors
	                    XDDFSolidFillProperties fillDuring = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)255, (byte)102, (byte)0})); // orange
	                    XDDFShapeProperties spDuring = seriesDuring.getShapeProperties();
	                    if (spDuring == null) spDuring = new XDDFShapeProperties();
	                    spDuring.setFillProperties(fillDuring);
	                    seriesDuring.setShapeProperties(spDuring);

	                    XDDFSolidFillProperties fillYtd = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)192, (byte)0, (byte)0})); // red
	                    XDDFShapeProperties spYtd = seriesYtd.getShapeProperties();
	                    if (spYtd == null) spYtd = new XDDFShapeProperties();
	                    spYtd.setFillProperties(fillYtd);
	                    seriesYtd.setShapeProperties(spYtd);

	                    XDDFSolidFillProperties fillComplied = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)0, (byte)176, (byte)80})); // green
	                    XDDFShapeProperties spComplied = seriesComplied.getShapeProperties();
	                    if (spComplied == null) spComplied = new XDDFShapeProperties();
	                    spComplied.setFillProperties(fillComplied);
	                    seriesComplied.setShapeProperties(spComplied);
	                }
	            }

	            // ────────────────────────────────────────────────
	            // Summary sheet with chart
	            // ────────────────────────────────────────────────
	            XSSFSheet summarySheet = workBook.createSheet("Summary");

	            // Title - merged
	            XSSFRow sTitleRow = summarySheet.createRow(0);
	            Cell sTitleCell = sTitleRow.createCell(0);
	            sTitleCell.setCellValue(dynamicTitle);
	            sTitleCell.setCellStyle(yellowStyle);
	            summarySheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 4));

	            // Headers
	            XSSFRow sHeadingRow = summarySheet.createRow(1);
	            String[] sHeaders = {"BU", "During this week", "During this FY", "Complied", "% Compliance"};
	            for (int i = 0; i < sHeaders.length; i++) {
	                Cell cell = sHeadingRow.createCell(i);
	                cell.setCellStyle(greenStyle);
	                cell.setCellValue(sHeaders[i]);
	            }

	            int sRowNo = 2;
	            for (Object[] d : summaryData) {
	                XSSFRow row = summarySheet.createRow(sRowNo++);
	                int c = 0;
	                row.createCell(c++).setCellValue((String) d[0]);
	                row.createCell(c++).setCellValue((Integer) d[1]);
	                row.createCell(c++).setCellValue((Integer) d[2]);
	                row.createCell(c++).setCellValue((Integer) d[3]);
	                row.createCell(c++).setCellValue((Double) d[4]);
	            }

	            XSSFRow gTotalRow = summarySheet.createRow(sRowNo);
	            gTotalRow.createCell(0).setCellValue("Total");
	            gTotalRow.createCell(1).setCellValue(grandDuring);
	            gTotalRow.createCell(2).setCellValue(grandYtd);
	            gTotalRow.createCell(3).setCellValue(grandComplied);
	            gTotalRow.createCell(4).setCellValue(grandPerc);

	            for (int i = 0; i < sHeaders.length; i++) {
	                summarySheet.autoSizeColumn(i);
	            }

	            // Chart for Summary sheet
	            if (sRowNo > 2) {
	                XSSFDrawing drawing = summarySheet.createDrawingPatriarch();
	                XSSFClientAnchor anchor = drawing.createAnchor(0, 0, 0, 0, 6, 3, 22, 28);
	                XSSFChart chart = drawing.createChart(anchor);
	                chart.setTitleText("Summary - All SBUs");
	                chart.setTitleOverlay(false);

	                XDDFChartLegend legend = chart.getOrAddLegend();
	                legend.setPosition(LegendPosition.BOTTOM);

	                XDDFCategoryAxis bottomAxis = chart.createCategoryAxis(org.apache.poi.xddf.usermodel.chart.AxisPosition.BOTTOM);
	                bottomAxis.setTitle("BU");

	                XDDFValueAxis leftAxis = chart.createValueAxis(org.apache.poi.xddf.usermodel.chart.AxisPosition.LEFT);
	                leftAxis.setTitle("Count");

	                int firstDataRow = 2;
	                int lastDataRow = sRowNo - 1;

	                CellRangeAddress buRange = new CellRangeAddress(firstDataRow, lastDataRow, 0, 0);
	                XDDFCategoryDataSource buNames = XDDFDataSourcesFactory.fromStringCellRange(summarySheet, buRange);

	                CellRangeAddress duringRange = new CellRangeAddress(firstDataRow, lastDataRow, 1, 1);
	                XDDFNumericalDataSource<Double> during = XDDFDataSourcesFactory.fromNumericCellRange(summarySheet, duringRange);

	                CellRangeAddress ytdRange = new CellRangeAddress(firstDataRow, lastDataRow, 2, 2);
	                XDDFNumericalDataSource<Double> ytds = XDDFDataSourcesFactory.fromNumericCellRange(summarySheet, ytdRange);

	                CellRangeAddress compliedRange = new CellRangeAddress(firstDataRow, lastDataRow, 3, 3);
	                XDDFNumericalDataSource<Double> complieds = XDDFDataSourcesFactory.fromNumericCellRange(summarySheet, compliedRange);

	                XDDFBarChartData data = (XDDFBarChartData) chart.createData(ChartTypes.BAR, bottomAxis, leftAxis);
	                data.setBarDirection(BarDirection.COL);

	                XDDFBarChartData.Series seriesDuring   = (XDDFBarChartData.Series) data.addSeries(buNames, during);
	                XDDFBarChartData.Series seriesYtd      = (XDDFBarChartData.Series) data.addSeries(buNames, ytds);
	                XDDFBarChartData.Series seriesComplied = (XDDFBarChartData.Series) data.addSeries(buNames, complieds);

	                seriesDuring.setTitle("During this week", null);
	                seriesYtd.setTitle("During this FY", null);
	                seriesComplied.setTitle("Complied", null);

	                chart.plot(data);

	                // Colors
	                XDDFSolidFillProperties fillDuring = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)255, (byte)102, (byte)0}));
	                XDDFShapeProperties spDuring = seriesDuring.getShapeProperties();
	                if (spDuring == null) spDuring = new XDDFShapeProperties();
	                spDuring.setFillProperties(fillDuring);
	                seriesDuring.setShapeProperties(spDuring);

	                XDDFSolidFillProperties fillYtd = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)192, (byte)0, (byte)0}));
	                XDDFShapeProperties spYtd = seriesYtd.getShapeProperties();
	                if (spYtd == null) spYtd = new XDDFShapeProperties();
	                spYtd.setFillProperties(fillYtd);
	                seriesYtd.setShapeProperties(spYtd);

	                XDDFSolidFillProperties fillComplied = new XDDFSolidFillProperties(XDDFColor.from(new byte[]{(byte)0, (byte)176, (byte)80}));
	                XDDFShapeProperties spComplied = seriesComplied.getShapeProperties();
	                if (spComplied == null) spComplied = new XDDFShapeProperties();
	                spComplied.setFillProperties(fillComplied);
	                seriesComplied.setShapeProperties(spComplied);
	            }

	            // Export
	            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HHmmss");
	            Date date = new Date();
	            String fileName = "Aayush_" + dateFormat.format(date);

	            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	            response.addHeader("Content-Disposition", "attachment; filename=" + fileName + ".xlsx");

	            workBook.write(response.getOutputStream());
	            workBook.close();
	            response.getOutputStream().flush();

	            attributes.addFlashAttribute("success", dataExportSucess);
	        } else {
	            attributes.addFlashAttribute("error", dataExportNoData);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        attributes.addFlashAttribute("error", commonError);
	    }
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
