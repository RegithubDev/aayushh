<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding = "UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<!--
Template Name: Safety - Vuejs, HTML & Laravel Admin Dashboard Template
Author: PixInvent
Website: http://www.pixinvent.com/
Contact: hello@pixinvent.com
Follow: www.twitter.com/pixinvents
Like: www.facebook.com/pixinvents
Purchase: https://1.envato.market/vuexy_admin
Renew Support: https://1.envato.market/vuexy_admin
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.

-->
<html class="loading" lang="en" data-textdirection="ltr">
  <!-- BEGIN: Head--> 
  
<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/horizontal-menu-template/table-datatable-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Aug 2022 05:37:16 GMT -->
<head>
   

 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Safety admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 IRM with unlimited possibilities.">
    <meta name="keywords" content="admin template,IRM, Safety admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
  <title>IRM</title>
       <link rel="icon" type="image/png" sizes="96x96" href="/reirm/resources/images/protect-favicon.png" >
	<script src="/reirm/resources/js/jQuery-v.3.5.min.js"  ></script>
    <!-- BEGIN: Vendor CSS-->
      <link rel="apple-touch-icon" href="/reirm/resources/images/ico/apple-icon-120.html">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;1,400;1,500;1,600" rel="stylesheet">
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/vendors.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/tables/datatable/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/tables/datatable/responsive.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/tables/datatable/buttons.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/tables/datatable/rowGroup.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/pickers/pickadate/pickadate.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
        <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/extensions/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/plugins/extensions/ext-component-toastr.min.css">
    <!-- END: Vendor CSS-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	  <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome-v.4.7.css" />">
    <!-- BEGIN: Theme CSS-->
     <link rel="stylesheet" type="text/css" href="<c:url value="/resources/vendors/css/extensions/sweetalert2.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/plugins/extensions/ext-component-sweet-alerts.min.css"/>">
    
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/colors.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/components.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/themes/dark-layout.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/themes/bordered-layout.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/themes/semi-dark-layout.min.css">
   <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/forms/select/select2.min.css">
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/core/menu/menu-types/horizontal-menu.min.css">
        <link rel="stylesheet" type="text/css" href="/reirm/resources/css/plugins/forms/pickers/form-flat-pickr.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/plugins/forms/pickers/form-pickadate.min.css">
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/style.css">
    <!-- END: Custom CSS-->
<style>
.form-check {
    padding-left: 0.785rem !important;
}
.mdl-grid{
	display: flex !important;
    padding: 4px;
    justify-content: space-between;
    height: 4.5rem;
} 
.dt-table{
height: 100%;
}
.modal-content {
 width: 85% !important;
}
.modal {
    width: 100% !important;
}
.required{
	color:red;
}
.right-btns .fa{
         	position:relative;
         	top:-35px;
         	right: 32px !important;
         }
         .right-btns .fa+.fa{
         	right: 18px !important;
         }
         
.my-error-class {
 	 color:red;
}
.my-valid-class {
 	 color:green;
}
.select2-container--default .select2-selection--single .select2-selection__arrow b {
     left: -25% !important;
    margin-top: 1p% !important;
}
body {
    font-family: var(--bs-body-font-family) !important;
}
.dark-layout h1, .dark-layout h2, .dark-layout h3, .dark-layout h4, .dark-layout h5, .dark-layout h6, .dark-layout span  {
    color: #D0D2D6;
}
.select2-container--classic .select2-selection--single .select2-selection__arrow b, .select2-container--default .select2-selection--single .select2-selection__arrow b {
    background-image: url(data:image/svg+xml,%3Csvg xmlns=\'http://www.w3.org/2000/svg\' viewBox=\'0 0 24 24\' fill=\'none\' stroke=\'%23d8d6de\' stroke-width=\'2\' stroke-linecap=\'round\' stroke-linejoin=\'round\' class=\'feather feather-chevron-down\'%3E%3Cpolyline points=\'6 9 12 15 18 9\'%3E%3C/polyline%3E%3C/svg%3E);
    background-size: 18px 14px,18px 14px !important;
    background-repeat: no-repeat !important;
    height: 1rem !important;
    padding-right: 1.5rem !important;
    margin-left: 0 !important;
    margin-top: 0 !important;
    left: -8px !important;
    border-style: none !important;
}
/* td {
    border: 1px solid #000;
} */

tr td:last-child {
    width: 1%;
    white-space: nowrap;
}
.page-loader{
		    background: #332e2ec2!important;
		    position: fixed;
		    width: 100%;
		    height: 100%;
		    top: 0;
		    left: 0;
		    z-index: 1000;
		}
::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
  color: black;
  opacity: 1; /* Firefox */
}
</style>
  </head>
  <!-- END: Head-->

  <!-- BEGIN: Body-->
  <body class="horizontal-layout horizontal-menu  navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="">

    <!-- BEGIN: Header-->
	<jsp:include page="../views/layout/header.jsp"></jsp:include> 
<jsp:include page="../views/layout/userActivityCheck.jsp"></jsp:include>

    <!-- END: Header-->
    <!-- BEGIN: Main Menu-->
    <div class="horizontal-menu-wrapper">
      <div class="header-navbar navbar-expand-sm navbar navbar-horizontal floating-nav navbar-light navbar-shadow menu-border container-xxl" role="navigation" data-menu="menu-wrapper" data-menu-type="floating-nav">
        <div class="navbar-header">
          <ul class="nav navbar-nav flex-row">
            <li class="nav-item me-auto"><a class="navbar-brand" href="#"><span class="brand-logo">
                  <svg viewbox="0 0 139 95" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" height="24">
                    <defs>
                      <lineargradient id="linearGradient-1" x1="100%" y1="10.5120544%" x2="50%" y2="89.4879456%">
                        <stop stop-color="#000000" offset="0%"></stop>
                        <stop stop-color="#FFFFFF" offset="100%"></stop>
                      </lineargradient>
                      <lineargradient id="linearGradient-2" x1="64.0437835%" y1="46.3276743%" x2="37.373316%" y2="100%">
                        <stop stop-color="#EEEEEE" stop-opacity="0" offset="0%"></stop>
                        <stop stop-color="#FFFFFF" offset="100%"></stop>
                      </lineargradient>
                    </defs>
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                      <g id="Artboard" transform="translate(-400.000000, -178.000000)">
                       			         <img src="<%=request.getContextPath() %>/resources/images/logo/protect-main.jpeg" width="50" height="40" class="card-img">

                      </g>
                    </g>
                  </svg></span>
                <h2 class="brand-text mb-0"></h2></a></li>
            <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pe-0" data-bs-toggle="collapse"><i class="d-block d-xl-none text-danger toggle-icon font-medium-4" data-feather="x"></i></a></li>
          </ul>
        </div>
        <div class="shadow-bottom"></div>
        <!-- Horizontal menu content-->
 			<jsp:include page="../views/layout/menu.jsp"></jsp:include> 
      </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content ">
      <div class="content-overlay"></div> 
      <div class="header-navbar-shadow"></div>
      <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
           <div class="content-header-left col-md-8 col-12 mb-2">
            <div class="row breadcrumbs-top">
              <div class="col-12">
                <h2 class="content-header-title float-start mb-0">IRM </h2>
                <div class="breadcrumb-wrapper">
                  <ol class="breadcrumb">
                  <%--    <c:if test="${sessionScope.BASE_ROLE ne 'User' }">   <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/home">Home</a>
                    </li></c:if> --%>

                    <li class="breadcrumb-item active">IRM - Main
                    </li>
                  </ol>
                </div>
              </div>
            </div>
          </div>
          
           <div class="content-header-right col-md-4 col-12 mb-2">
            <div class="row breadcrumbs-top">
              <div class="col-12">
                <a type="button" class="btn "  data-bs-toggle="tooltip" data-bs-original-title="Click to Raise an Incident" href="<%=request.getContextPath() %>/irm-add-incident"  style="margin-top: 17px; color: white !important; background-color: orange !important;"><i class="fa fa-add" aria-hidden="true"></i> Submit Incident</a>
         <button class="btn col-md-12" data-bs-toggle="tooltip" data-bs-original-title="Download Incidents Details"   style="margin-top: 17px; width: 42%;   background-color: #14e014 !important;color: white !important;"  onclick="exportIRM();"><i class="fa fa-download" aria-hidden="true"></i> Download</button>
     
              </div>
            </div>
          </div>
          
          
        </div>
        <div class="content-body"><!-- Dashboard Analytics Start -->
        <div class="demo-inline-spacing" style=" background-color: #EEE;"> 
        <div class="form-check form-check-danger  mb-1" style=" margin-left: 40%;">
            <!-- <input class="form-check-input" type="checkbox" id="filterToggle" value="checked" 
            data-bs-toggle="tooltip" data-bs-original-title="CheckBox" onchange="filterToggle();" style= "border: 2px solid #ff0a0a !important;">
            <button type="button"  data-bs-toggle="tooltip" style="border-width: inherit;"
             title="" data-bs-original-title="Check the CheckBox to Hide/Show Search Filters!">
               <span id="filterToggleText"  class="badge badge-light-danger">Show Search Filters</span>
            </button> -->
            
           <button class="btn btn-danger me-1 waves-effect waves-float waves-light collapsed" type="button" data-bs-toggle="collapse" 
            data-bs-target="#collapseExample" aria-expanded="false" title="Search filters will be visible by clicking this button."  aria-controls="collapseExample">
              Click Here for Search Filters <i data-feather='chevron-down'></i>
            </button>
           
            </div>
            
           

             </div>
      
<section id="dashboard-analytics" >

<div class="row match-height collapse" id="collapseExample" > 
<div class="col-lg-8 col-sm-6 col-12 "  style="box-sizing:border-box; display:table;">
<div class="col-lg-12 col-sm-6 col-12"  style="box-sizing:border-box; display:table;">
	     <div class="col-lg-3 col-sm-3 col-6"  style="padding: 1rem;display:table-cell;">
	       <div class="col-md-12 mb-1">
	              <select class="select2 form-select" id="select2-sbu_filter-container"  >
	                <option value="">Select SBU</option>
	              </select>
	 	   </div>
	          <h2 class="fw-bolder mt-1"></h2> 
	    </div>
	  	<div class="col-lg-3 col-sm-3 col-6"  style="padding: 1rem;display:table-cell;">
	       <div class="col-md-12 mb-1">
	              <select class="select2 form-select" id="select2-Project_filter-container" name="status" >
	                <option value="">Select Project</option>
	              </select>
	 	   </div>
	          <h2 class="fw-bolder mt-1"></h2>
	    </div>
 </div>
 <div class="col-lg-12 col-sm-6 col-12"  style="box-sizing:border-box; display:table;">
	     <div class="col-lg-3 col-sm-3 col-6"  style="padding: 1rem;display:table-cell;">
	       <div class="col-md-12 mb-1">
	              <select class="select2 form-select" id="select2-incident_type_filter-container"  >
	                <option value="">Select Incident</option>
	              </select>
	 				          </div>
	          <h2 class="fw-bolder mt-1"></h2> 
	    </div>
	  	<div class="col-lg-3 col-sm-3 col-6"  style="padding: 1rem;display:table-cell;">
	       <div class="col-md-12 mb-1">
	              <select class="select2 form-select" id="select2-status_filter-container" name="status" >
	                <option value="">Select Status</option>
	              </select>
	 	   </div>
	          <h2 class="fw-bolder mt-1"></h2>
	    </div>
	        </div>
	  <div class="col-lg-6 col-sm-3 col-12"  style="padding: 1rem;">
       <div class="col-md-12 mb-1">
          <input
            type="text"
            name="from_and_to"
            id="from_and_to"
            class="form-control flatpickr-range"
            placeholder="From - To" style="
    background-color: white;
"
          />
      </div>
      </div>
</div>
<div class="col-lg-2 col-sm-2 col-12 filterToggleDiv"  style="box-sizing:border-box; display:table;">
    <div class="col-lg-3 col-sm-3 col-6"  style="padding: .5rem;display:table-cell;">
     <button class="btn btn-danger col-md-12" style="margin-top: 10px; width: 45%;     background-color: gainsboro"  onclick="getIRMList('searchTag');"><i class="fa fa-search" aria-hidden="true"></i></button>
         <button class="btn btn-danger col-md-12" style="margin-top: 10px; width: 45%;     background-color: gainsboro"  onclick="clearFilter();"><i class="fa fa-undo" aria-hidden="true"></i></button>
     </div>
</div>

</div> 

 
  <!-- List DataTable -->
  <div>
  	<div class="col-xl-12 col-lg-12">
      <div class="card">

        <div class="card-body">
           <div class="card-datatable table-responsive">
		       <div class="dt-buttons text-danger" style="height : 1.5em;">
		      <!-- Last 30 Days -->
		        </div>
		          <table id="datatable-irm-my" class="invoice-list-table table" style="width: 100%; font-size:90%">
		            <thead>
		              <tr>
		                <th>#</th>
		                <th>Action</th>
		                <th>Incident no</th>
		                 <th>Status </th>
		               
		                 <th>Incident </th>
		                <th>Project</th>
		                <th>Department</th>
		                <th>Level</th>
		                <th>Reviewer  </th>
		                <th>Raised by </th>
		              </tr>
		            </thead>
		          </table>
		        </div>
          <!-- Tab panes -->
        </div>
      </div>
    </div>
    <!-- Justified Tabs ends -->
  </div>
</section>
  	
  </div>
		
 			
  <div class="modal fade" id="historyIRM" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
    <div class="modal-content" style=" left: 8%;">
      <div class="modal-header bg-transparent"><span id="documentCode"> </span> <span id="createdDate"> </span> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <div class="row" id="basic-table">
  <div class="col-12">
    <div class="card">

      <div class="table-responsive">
        <table class="table"  id="historyBody">
          <thead>
            <tr>
              <th>Status</th>
              <th>Reviewer  Type</th>
              <th>Reviewer  Name</th>
              <th>Assigned Date</th>
              <th>Action Taken on</th>
              <th>Send Back Notes</th>
            </tr>
          </thead>
          <tbody>
   
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
    </div>
  </div>
</div>
 			
 					
 			
<!--   <div class="modal fade" id="InitiateIRM" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
    <div class="modal-content">
      <div class="modal-header bg-transparent"><span id="reviewerHead">Initiate Reviewer </span> <span id="createdDate"> </span> 
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
     <div class="row" id="basic-table">
  <div class="col-12">
    <div class="card">
		<span id="reviewerMsg" style="text-align: center;"> </span>
    </div>
  </div>
</div>
    </div>
  </div>
</div> -->		
<div class="modal fade" id="InitiateIRM" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-edit-user">
    <div class="modal-content">
      <div class="modal-header badge bg-danger"><span id="document_id2"></span>&nbsp;<b>- No Reviewer Assigned! Please Assign a Reviewer here</b>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body pb-5 px-sm-5 pt-50">
        <div class="text-center mb-2">
          <h4 class=""></h4>
        </div>
        <form id="addRoleMapForm" class="row gy-1 pt-75" action="<%=request.getContextPath() %>/add-role-mapping" method="post" class="form-horizontal" role="form" >
		<input type="hidden" name="document_code" id="document_id"  />
		<input type="hidden" name="email_id" id="email_2"  />
		<input type="hidden" name="status" id="statuss" value="Active" />
		<div class="col-12 col-md-12">
            <label class="form-label" for="select2-basic">Project</label><span class="required"> *</span>
           <%--  <select 
              id="select2-project_add-container"
              name="project"
              class="select2 form-select formSelect"
              aria-label="Default select example" onchange="filterRoles_add(); deptFilter(); empFilter();"
            >
              <option value="">Select Project</option>
             	<c:forEach var="obj" items="${projectsList}">
					<option value="${obj.project_code }" >[${obj.project_code }] - ${obj.project_name }</option>
				</c:forEach>
            </select>
             <span id="select2-project_add-containerError" class="error-msg" ></span> --%>
             <p class='badge badge-light-danger'><span id="projectDetails"></span></p>
             <input type="hidden" name="project" id="project"  />
          </div>
          <div class="col-12 col-md-6">
            <label class="form-label" for="select2-basic">Department</label><span class="required"> *</span><br>
       <%--      <select 
              id="select2-department_code_add-container"
              name="department_code"
              class="select2 form-select formSelect"
              aria-label="Default select example"  onchange="filterRoles_add();"
            >
              <option value="">Select Department</option>
             	<c:forEach var="obj" items="${deptList}">
					<option value="${obj.department_code }" >[${obj.department_code }] - ${obj.department_name }</option>
				</c:forEach>
            </select>
             <span id="select2-department_code_add-containerError" class="error-msg" ></span> --%>
              <p class='badge badge-light-danger'><span id="deptDetails"></span></p>
               <input type="hidden" name="department_code" id="department_code"  />
          </div>

	   <div class="col-12 col-md-6">
            <label class="form-label" for="select2-basic">Incident Type</label><span class="required"> *</span>
            <select 
              id="select2-safety_type_add-container"
              name="safety_type"
              class="select2 form-select formSelect" multiple data-placeholder="Select Incident" 
              aria-label="Default select example" onchange="filterRoles_add();"
            >
					<option value="AC" selected>Accident</option>	  
					<option value="NM" selected>Near Miss</option>	
					<option value="UA" selected>Unsafe Act</option>	
					<option value="UC" selected>Unsafe Condition</option>
                
               <!--   <option value="HA">Hazard</option> -->
              
            </select>
             <span id="select2-safety_type_add-containerError" class="error-msg" ></span>
          </div>
   		  <div class="col-12 col-md-6">
            <label class="form-label" for="select2-basic">Roles</label><span class="required"> *</span>
            <select 
              id="select2-roles_add-container"
              name="role_code"
              class="select2 form-select formSelect"
              aria-label="Default select example"
            >
              <option value="IRL1" selected>IRL1 - Approver</option>
             
            </select>
             <span id="select2-roles_add-containerError" class="error-msg" ></span>
          </div>
          
          
         <div class="col-12 col-md-6">
            <label class="form-label" for="select2-basic">Employees List</label><span class="required"> *</span>
            <select 
              id="select2-employee_code_add-container"
              name="employee_code"
              class="select2 form-select formSelect"
              aria-label="Default select example"  onchange="setEmail();"
            >
              <option value="">Select Employees</option>
             	<%-- <c:forEach var="obj" items="${empList}">
					<option email ="${obj.email_id }" value="${obj.user_id }" >[${obj.user_id }] - ${obj.user_name }</option>
				</c:forEach> --%>
            </select>
             <span id="select2-employee_code_add-containerError" class="error-msg" ></span>
          </div>
<!--           <div class="col-12 col-md-6">
            <label class="form-label" for="select2-basic">Status</label><span class="required"> *</span>
            <select 
              id="select2-status_add-container"
              name="status"
              class="select2 form-select formSelect"
              aria-label="Default select example" 
            >
             	<option value="Active" selected>Active</option>
             	<option value="Inactive" >Inactive</option>
            </select>
             <span id="select2-status_add-containerError" class="error-msg" ></span>
          </div> -->
          <div class="col-12 text-center mt-2 pt-50">
            <button type="submit" class="btn btn-danger me-1" onclick="addRoleMap();">Add</button>
            <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal" aria-label="Close">
              Discard
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
 							
</section>

           
  </div>				
 																					
   <div class="page-loader" style="display: none;">
	  <div class="preloader-wrapper big active">
	    <div class="spinner-layer spinner-blue-only">
	      <div class="circle-clipper left">
	        <div class="circle"></div>
	      </div><div class="gap-patch">
	        <div class="circle"></div>
	      </div><div class="circle-clipper right">
	        <div class="circle"></div>
	      </div>
	    </div>
	  </div>
	</div> 
 																					
 																					
<!-- Dashboard Analytics end -->

        </div>
      </div>
    </div>
    <!-- END: Content-->


    <!-- BEGIN: Customizer-->     <!--
    <div class="customizer d-none d-md-block"><a class="customizer-toggle d-flex align-items-center justify-content-center" href="#"><i class="spinner" data-feather="settings"></i></a><div class="customizer-content">
  <!-- Customizer header -->
  <!-- <div class="customizer-header px-2 pt-1 pb-0 position-relative">
    <h4 class="mb-0">Theme Customizer</h4>
    <p class="m-0">Customize & Preview in Real Time</p>

    <a class="customizer-close" href="#"><i data-feather="x"></i></a>
  </div>

  <hr />

  <!-- Styling & Text Direction -->
  <!-- <div class="customizer-styling-direction px-2">
    <p class="fw-bold">Skin</p>
    <div class="d-flex">
      <div class="form-check me-1">
        <input
          type="radio"
          id="skinlight"
          name="skinradio"
          class="form-check-input layout-name"
          checked
          data-layout=""
        />
        <label class="form-check-label" for="skinlight">Light</label>
      </div>
      <div class="form-check me-1">
        <input
          type="radio"
          id="skinbordered"
          name="skinradio"
          class="form-check-input layout-name"
          data-layout="bordered-layout"
        />
        <label class="form-check-label" for="skinbordered">Bordered</label>
      </div>
      <div class="form-check me-1">
        <input
          type="radio"
          id="skindark"
          name="skinradio"
          class="form-check-input layout-name"
          data-layout="dark-layout"
        />
        <label class="form-check-label" for="skindark">Dark</label>
      </div>
      <div class="form-check">
        <input
          type="radio"
          id="skinsemidark"
          name="skinradio"
          class="form-check-input layout-name"
          data-layout="semi-dark-layout"
        />
        <label class="form-check-label" for="skinsemidark">Semi Dark</label>
      </div>
    </div>
  </div>

  <hr />

  <!-- Menu --> <!--
  <div class="customizer-menu px-2">
    <div id="customizer-menu-collapsible" class="d-flex">
      <p class="fw-bold me-auto m-0">Menu Collapsed</p>
      <div class="form-check form-check-danger form-switch">
        <input type="checkbox" class="form-check-input" id="collapse-sidebar-switch" />
        <label class="form-check-label" for="collapse-sidebar-switch"></label>
      </div>
    </div>
  </div>
  <hr />

  --> <!-- Layout Width --> <!--
  <div class="customizer-footer px-2">
    <p class="fw-bold">Layout Width</p>
    <div class="d-flex">
      <div class="form-check me-1">
        <input type="radio" id="layout-width-full" name="layoutWidth" class="form-check-input" checked />
        <label class="form-check-label" for="layout-width-full">Full Width</label>
      </div>
      <div class="form-check me-1">
        <input type="radio" id="layout-width-boxed" name="layoutWidth" class="form-check-input" />
        <label class="form-check-label" for="layout-width-boxed">Boxed</label>
      </div>
    </div>
  </div>
  <hr />

  <!-- Navbar --> <!-- 
  <div class="customizer-navbar px-2">
    <div id="customizer-navbar-colors">
      <p class="fw-bold">Navbar Color</p>
      <ul class="list-inline unstyled-list">
        <li class="color-box bg-white border selected" data-navbar-default=""></li>
        <li class="color-box bg-danger" data-navbar-color="bg-danger"></li>
        <li class="color-box bg-secondary" data-navbar-color="bg-secondary"></li>
        <li class="color-box bg-success" data-navbar-color="bg-success"></li>
        <li class="color-box bg-danger" data-navbar-color="bg-danger"></li>
        <li class="color-box bg-info" data-navbar-color="bg-info"></li>
        <li class="color-box bg-warning" data-navbar-color="bg-warning"></li>
        <li class="color-box bg-dark" data-navbar-color="bg-dark"></li>
      </ul>
    </div>

    <p class="navbar-type-text fw-bold">Navbar Type</p>
    <div class="d-flex">
      <div class="form-check me-1">
        <input type="radio" id="nav-type-floating" name="navType" class="form-check-input" checked />
        <label class="form-check-label" for="nav-type-floating">Floating</label>
      </div>
      <div class="form-check me-1">
        <input type="radio" id="nav-type-sticky" name="navType" class="form-check-input" />
        <label class="form-check-label" for="nav-type-sticky">Sticky</label>
      </div>
      <div class="form-check me-1">
        <input type="radio" id="nav-type-static" name="navType" class="form-check-input" />
        <label class="form-check-label" for="nav-type-static">Static</label>
      </div>
      <div class="form-check">
        <input type="radio" id="nav-type-hidden" name="navType" class="form-check-input" />
        <label class="form-check-label" for="nav-type-hidden">Hidden</label>
      </div>
    </div>
  </div>
  <hr />

  --> <!-- Footer --> <!-- 
  <div class="customizer-footer px-2">
    <p class="fw-bold">Footer Type</p>
    <div class="d-flex">
      <div class="form-check me-1">
        <input type="radio" id="footer-type-sticky" name="footerType" class="form-check-input" />
        <label class="form-check-label" for="footer-type-sticky">Sticky</label>
      </div>
      <div class="form-check me-1">
        <input type="radio" id="footer-type-static" name="footerType" class="form-check-input" checked />
        <label class="form-check-label" for="footer-type-static">Static</label>
      </div>
      <div class="form-check me-1">
        <input type="radio" id="footer-type-hidden" name="footerType" class="form-check-input" />
        <label class="form-check-label" for="footer-type-hidden">Hidden</label>
      </div>
    </div>
  </div>
</div>

    </div>
    --> <!-- End: Customizer-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
      <p class="clearfix mb-0"><span class="float-md-start d-block d-md-inline-block mt-25">COPYRIGHT  &copy;  <span id="currentYear"></span> , All Rights Reserved | Powered by<a class="ms-25" href="https://resustainability.com/" target="_blank">Re Sustainability Limited</a><span class="d-none d-sm-inline-block"> .</span></span></p>
    </footer>
    <button class="btn btn-danger btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
    <!-- END: Footer-->

 
    <!-- BEGIN: Vendor JS-->
    <script src="/reirm/resources/vendors/js/vendors.min.js"></script>
    <!-- BEGIN Vendor JS-->

    <!-- BEGIN: Page Vendor JS-->
    <script src="/reirm/resources/vendors/js/ui/jquery.sticky.js"></script>
    <script src="/reirm/resources/vendors/js/forms/select/select2.full.min.js"></script>
    <script src="/reirm/resources/vendors/js/charts/apexcharts.min.js"></script>
    <script src="/reirm/resources/vendors/js/extensions/toastr.min.js"></script>
    <script src="/reirm/resources/vendors/js/extensions/moment.min.js"></script>
    <script src="/reirm/resources/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
    <script src="/reirm/resources/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
    <script src="/reirm/resources/vendors/js/tables/datatable/dataTables.bootstrap5.min.js"></script>
    <script src="/reirm/resources/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
    <script src="/reirm/resources/vendors/js/tables/datatable/responsive.bootstrap5.js"></script>
    <!-- END: Page Vendor JS-->
 <script src="/reirm/resources/js/materialize-v.1.0.min.js "  ></script>
    <script src="/reirm/resources/js/jquery-validation-1.19.1.min.js"  ></script>
    <script src="/reirm/resources/js/jquery.dataTables-v.1.10.min.js"  ></script>
     <script src="/reirm/resources/js/datetime-moment-v1.10.12.js"  ></script>
         <script src="/reirm/resources/js/dataTables.material.min.js"  ></script>
      <script src="/reirm/resources/js/moment-v2.8.4.min.js"  ></script>
    <!-- BEGIN: Theme JS-->
    <script src="/reirm/resources/js/core/app-menu.min.js"></script>
    <script src="/reirm/resources/js/core/app.min.js"></script>
    <script src="/reirm/resources/js/scripts/customizer.min.js"></script>
     <script src="/reirm/resources/js/scripts/forms/form-select2.min.js"></script>
    <!-- END: Theme JS-->
   <script src="/reirm/resources/js/scripts/pages/modal-add-new-cc.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/page-pricing.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/modal-add-new-address.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/modal-create-app.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/modal-two-factor-auth.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/modal-edit-user.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/modal-share-project.min.js"></script>
    <!-- BEGIN: Page JS-->
     <script src="/reirm/resources/js/scripts/pages/dashboard-analytics.min.js"></script>
    <script src="/reirm/resources/js/scripts/pages/app-invoice-list.min.js"></script>
    
        <script src="/reirm/resources/vendors/js/pickers/pickadate/picker.js"></script>
    <script src="/reirm/resources/vendors/js/pickers/pickadate/picker.date.js"></script>
    <script src="/reirm/resources/vendors/js/pickers/pickadate/picker.time.js"></script>
    <script src="/reirm/resources/vendors/js/pickers/pickadate/legacy.js"></script>
    <script src="/reirm/resources/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>
     <script src="/reirm/resources/js/scripts/forms/pickers/form-pickers.min.js"></script>
     <script src="/reirm/resources/js/scripts/extensions/ext-component-blockui.js"></script>
      <script src="/reirm/resources/js/scripts/pages/dashboard-ecommerce.min.js"></script>
        <script src="/reirm/resources/js/scripts/components/components-popovers.min.js"></script>
    <!-- END: Page JS-->
    
  <form action="<%=request.getContextPath()%>/export-irm" name="exportIRMForm" id="exportIRMForm" target="_blank" method="post">	
      
         <input type="hidden" name=sbu_code id="exportSBU_filter" />
        <input type="hidden" name="project_code" id="exportProject_Code_filter" />
         <input type="hidden" name=status id="exportIRM_filter" />
        <input type="hidden" name="incident_type" id="exportCompany_Code_filter" />
         <input type="hidden" name="from_and_to" id="exportFrom_filter" />
	</form>
	
	  <form action="<%=request.getContextPath()%>/update-irm-form" target="_blank" name="updateIRM" id="updateIRM" method="post">	
      
        <input type="hidden" name=document_code id="document_codeUpdate" />
        <input type="hidden" name=approver_type id="approver_typeUpdate" />
        <input type="hidden" name=status id="statusUpdate" />
        <input type="hidden" name=approver_code id="approver_codeUpdate" />
        
	</form>
	
    <script>
    $('#InitiateIRM').on('show.bs.modal', function (event) {
        $(document).ready(function() {
            $('.select2').select2({
                dropdownParent: $('#InitiateIRM')
            });
        }); 
    });
    var clickedTags = "";
      $(window).on("load",(function(){
    	  
          if (feather) {
            feather.replace({ width: 14, height: 14 });
          }
          $('.modal').modal({ dismissible: false });
          window.localStorage.setItem("clickedTags", "");
          getIRMList('');
         }));
      	document.getElementById("currentYear").innerHTML = new Date().getFullYear();
	    
    function InitiateIRM(document_code,department_code,d_name,project_code,p_name,safety_type){
    	$('#projectDetails').html('');
    	$('#deptDetails').html('');
    	$('#document_id').val($.trim(document_code));
    	$('#project').val($.trim(project_code));
    	$('#project').val($.trim(project_code));
    	$('#department_code').val($.trim(department_code));
    	$('#projectDetails').html("["+ $.trim(project_code)+"]"+" - "+ p_name);
    	$('#deptDetails').html("["+ $.trim(department_code)+"]"+" - "+ d_name);
    	
   		$('select').select2();
    	 $('#InitiateIRM').modal('show');
    		empFilter(project_code);
    	 var myParams = {document_code: document_code,project_code: project_code,safety_type: safety_type};
			$.ajax({url : "<%=request.getContextPath()%>/ajax/getRoleMappedOrNot",type:"POST",data:myParams,success : function(data){    				
					if(data != null && data != '' && data.length > 0){    					
		         		$.each(data,function(key,val){
						/* 	var msg =  "<p style='color : green; font-size: 12px;'><b>"+val.role_code+"</b></p>";
							$('#reviewerMsg').html(msg) */
							var msg =  "<p class='badge badge-light-danger'><b> No Reviewer Assigned "
								+"<a href='<%=request.getContextPath() %>/role-mapping' title='Redirect to Role Mapping Page' class='btn btn-outline-danger btn-sm waves-effect'>Click Here</a> to Assign a Reviewer!</b></p>";
								$('#reviewerMsg').html(msg)
						});
					}else{
						var msg =  "<p class='badge badge-light-danger'><b> No Reviewer Assigned "
						+"<a href='<%=request.getContextPath() %>/role-mapping' title='Redirect to Role Mapping Page' class='btn btn-outline-danger btn-sm waves-effect'>Click Here</a> to Assign a Reviewer!</b></p>";
						$('#reviewerMsg').html(msg)
					}
					  
				},error: function (jqXHR, exception) {
		         	getErrorMessage(jqXHR, exception);
		     }}); 
    	
    }
    function historyIRM(document_code,approver_type,status,approver_code){
   	  $('#historyIRM').modal('show');
   	  $('#documentCode').html("#"+document_code+" - Incident Work Flow History ")
      table = $('#historyBody').DataTable();
			table.destroy();
			$.fn.dataTable.moment('DD-MMM-YYYY');
			table = $('#historyBody').DataTable({
				"bStateSave": true,  
	     		fixedHeader: true,
	         	//Default: Page display length
					"iDisplayLength" : 10,
					"iData" : {
						"start" : 52
					},"iDisplayStart" : 0,
					"drawCallback" : function() {
					},
	            columnDefs: [],
	            // "ScrollX": true,
	            //"scrollCollapse": true,
	            "sScrollX": "100%",
	            "sScrollXInner": "100%",
	            "bScrollCollapse": true,
	            "initComplete" : function() {
					}
	        }).rows().remove().draw();
			table.state.clear();		
		 	var myParams = {document_code: document_code};
			$.ajax({url : "<%=request.getContextPath()%>/ajax/getIRMHistoryList",type:"POST",data:myParams,success : function(data){    				
					if(data != null && data != '' && data.length > 0){ 
						sNo = (data.length - 1);
		         		$.each(data,function(key,val){
							var approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         			
		         			var status = '<p class="badge rounded-pill badge-light-warning me-0" title="Reviewed">'+$.trim(val.status)+'</p>';
		         			if($.trim(val.status) == "Reviewed" && key == 0){
		         				status = '<p class="badge rounded-pill badge-light-success me-0" title="Reviewed"><i class="fas fa-dot-circle"></i></p>'; 
		         			}else if($.trim(val.status) == "Reviewed" && key != sNo){
		         				status = '<p class="badge rounded-pill badge-light-success me-0" title="Reviewed"><i class="fa fa-arrow-up " ></i></p>'; 
		         			}else if($.trim(val.status) == "In Progress"){
		         				status = '<p class="badge rounded-pill badge-light-warning me-0" title="In Progress"><i class="fa fa-spinner fa-spin"></i></p>';
		         			}else if($.trim(val.status) == "Sent Back"){
		         				status = '<p class="badge rounded-pill badge-light-danger me-0" title="Sent Back"><i class="fas fa-level-down-alt" ></i></p>';
		         			}else if($.trim(val.status) == "Send Back"){
		         				status = '<p class="badge rounded-pill badge-light-warning me-0" title="Recieved"><i class="fa fa-arrow-up " ></i></p>';
		         			}
		         			var str2 = "No Reviewer Assigned";
		         			var incident_no = "<p font-size:50%>"+$.trim(val.document_code)+"<br>&nbsp;&nbsp;&nbsp;&nbsp;( "+$.trim(val.created_date)+" )</p>";
		         			if($.trim(val.approver_code) != '' && !(val.approver_code.indexOf(str2) != -1)){
		         				approver = "["+ $.trim(val.approver_code)+"]"+" - "+ val.user_name;
		         			}else{
		         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         			}
		         			if(val.approver_code.indexOf(str2) != -1){
		         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         			}
		                   	var rowArray = [];    
		                   	key++;
		                   	var date = val.action_taken;
		                   	if(date == '' || date == null){
		                   		date = val.sb_date
		                   	}
		                   	var appvr = val.approver_type;
		                   	if(key == data.length ){
		                   		status = '<p class="badge rounded-pill badge-light-dark me-0" title="Incident Created"><i class="fa fa-arrow-up " ></i></p>';
		                   		appvr = "";
		                   	}
		                   	
		                   	rowArray.push($.trim(status));
		                	rowArray.push(appvr);
		                	rowArray.push($.trim(approver));
		                	rowArray.push($.trim(val.assigned_on));
		                	rowArray.push($.trim(date));
		                	rowArray.push($.trim(val.sb_notes));
		                   
		                    table.row.add(rowArray).draw( true );  //.order([data.length, 'desc'])
						});
					}
				},error: function (jqXHR, exception) {
		         	getErrorMessage(jqXHR, exception);
		     }});
      	}
	    function getIRM(document_code,approver_type,status,approver_code){
	    	
	    	$('#document_codeUpdate').val($.trim(document_code));
	    	$('#approver_typeUpdate').val($.trim(approver_type));
	    	$('#statusUpdate').val($.trim(status));
	    	$('#approver_codeUpdate').val($.trim(approver_code));
	    	 $("#updateIRM ").submit();
	    	/*  $('#irm_name_edit').val('');
			 $('#irm_code_edit').val('');
			 $('select[name^="incident_type"] option:selected').removeAttr("selected");
			 $('select[name^="status"] option:selected').removeAttr("selected");
		      $('#id').val($.trim(id));
		      $('#updateIRM').modal('show');
		      $('#updateIRM #irm_name_edit').val($.trim(irm_name)).focus();
		      $('#updateIRM #irm_code_edit').val($.trim(irm_code)).focus();
		      if(incident_type != null && incident_type != ''  && incident_type != "undefined"){
		    	  $('select[name^="incident_type"] option[value="'+ incident_type +'"]').attr("selected",true);
		    	  $('select[name^="status"] option[value="'+ status +'"]').attr("selected",true);
		    	  $('select').select2();
		      } */
	   }
	    
      
	    function exportIRM(){
	    	 var project_code = $("#select2-Project_filter-container").val();
	         var sbu_code = $("#select2-sbu_filter-container").val();
	         var incident_type = $("#select2-incident_type_filter-container").val();
	         var status = $("#select2-status_filter-container").val();
	         var from_date = $("#from_date").val();
		     var to_date = $("#to_date").val();
		     var from_and_to = $("#from_and_to").val();
		     
		     $("#exportSBU_filter").val(sbu_code);
	     	 $("#exportProject_Code_filter").val(project_code);
	    	 $("#exportIRM_filter").val(status);
	     	 $("#exportCompany_Code_filter").val(incident_type);
	     	 $("#exportFrom_filter").val(from_and_to);
	     	 $("#exportIRMForm ").submit();
	  	}
	    
      function clearFilter(){
    			$("#select2-Project_filter-container").val("");
	        	$("#select2-sbu_filter-container").val("");
		    	$("#select2-incident_type_filter-container").val("");
		    	$("#select2-status_filter-container").val("");
		    	$("#from_date").val("");
			    $("#to_date").val("");
			    $("#from_and_to").val("");
		    	window.location.href= "<%=request.getContextPath()%>/irm";
	    }
      
  	var admin_incidents = '';
	var i_pending = '';
	var i_completed = '';
	var i_no_reviewer = '';
      function getSBUFilterList(tag) {
    	  $(".page-loader").show();
  	    var project_code = $("#select2-Project_filter-container").val();
	        var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	        var from_and_to = $("#from_and_to").val();
	        if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
	        if ($.trim(sbu_code) == "") {
	        	$("#select2-sbu_filter-container option:not(:first)").remove();
	        	var myParams = {incident_type: incident_type, status : status, project_code : project_code, sbu_code :sbu_code, from_and_to : from_and_to
	        			,admin_incidents : admin_incidents, i_pending : i_pending,i_completed : i_completed,i_no_reviewer : i_no_reviewer};
	            $.ajax({
	                url: "<%=request.getContextPath()%>/ajax/getSBUFilterListFromIRM",
	                data: myParams, cache: false,async: true, 
	                success: function (data) {
	                    if (data.length > 0) {
	                        $.each(data, function (i, val) {
	                             $("#select2-sbu_filter-container").append('<option value="' + val.sbu_code + '">' + "[ "+$.trim(val.sbu_code) +" ]"+" - " + $.trim(val.sbu_name)  +'</option>');
	                        });
	                    }
	                },error: function (jqXHR, exception) {
	    	   			      $(".page-loader").hide();
	       	          	  getErrorMessage(jqXHR, exception);
	       	     	  }
	            });
	        }
	    }

      function getProjectFilterList(tag) {
    	  $(".page-loader").show();
  	    	var project_code = $("#select2-Project_filter-container").val();
	        var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	        var from_and_to = $("#from_and_to").val();
	        if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
	        if ($.trim(project_code) == "") {
	        	$("#select2-Project_filter-container option:not(:first)").remove();
	        	var myParams = {incident_type: incident_type, status : status, project_code : project_code, sbu_code :sbu_code, from_and_to : from_and_to
	        			,admin_incidents : admin_incidents, i_pending : i_pending,i_completed : i_completed,i_no_reviewer : i_no_reviewer};
	            $.ajax({
	                url: "<%=request.getContextPath()%>/ajax/getProjectFilterListFromIRM",
	                data: myParams, cache: false,async: true,
	                success: function (data) {
	                    if (data.length > 0) {
	                        $.each(data, function (i, val) {
	                             $("#select2-Project_filter-container").append('<option value="' + val.project_code + '">' + "[ "+$.trim(val.project_code) +" ]"+" - " + $.trim(val.project_name)  +'</option>');
	                        });
	                    }
	                },error: function (jqXHR, exception) {
	    	   			      $(".page-loader").hide();
	       	          	  getErrorMessage(jqXHR, exception);
	       	     	  }
	            });
	        }
	    }

      function getIncidentFilterList(tag) {
    	  $(".page-loader").show();
    	    var project_code = $("#select2-Project_filter-container").val();
	        var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	        var from_and_to = $("#from_and_to").val();
	        if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
	        if ($.trim(incident_type) == "") {
	        	$("#select2-incident_type_filter-container option:not(:first)").remove();
	        	var myParams = {incident_type: incident_type, status : status, project_code : project_code, sbu_code :sbu_code, from_and_to : from_and_to
	        			,admin_incidents : admin_incidents, i_pending : i_pending,i_completed : i_completed,i_no_reviewer : i_no_reviewer};
	            $.ajax({
	                url: "<%=request.getContextPath()%>/ajax/getIncidentFilterListFromIRM",
	                data: myParams, cache: false,async: true,
	                success: function (data) {
	                    if (data.length > 0) {
	                        $.each(data, function (i, val) {
	                             $("#select2-incident_type_filter-container").append('<option value="' + val.incident_code + '">' + "[ "+$.trim(val.incident_code) +" ]"+" - " + $.trim(val.incident_type)  +'</option>');
	                        });
	                    }
	                },error: function (jqXHR, exception) {
	    	   			      $(".page-loader").hide();
	       	          	  getErrorMessage(jqXHR, exception);
	       	     	  }
	            });
	        }
	    }

      function getStatusFilterList(tag) {
    	  $(".page-loader").show();
    	  
    	  var project_code = $("#select2-Project_filter-container").val();
	        var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	        var from_and_to = $("#from_and_to").val();
	        if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
    		
	        if ($.trim(status) == "") {
	        	$("#select2-status_filter-container option:not(:first)").remove();
	        	var myParams = {incident_type: incident_type, status : status, project_code : project_code, sbu_code :sbu_code, from_and_to : from_and_to
	        			,admin_incidents : admin_incidents, i_pending : i_pending,i_completed : i_completed,i_no_reviewer : i_no_reviewer};
	            $.ajax({
	                url: "<%=request.getContextPath()%>/ajax/getStatusFilterListFromIRM",
	                data: myParams, cache: false,async: true,
	                success: function (data) {
	                    if (data.length > 0) {
	                        $.each(data, function (i, val) {
	                        	var statusVal = val.status
	                        	var statusVal2 = val.status
	                        	if (statusVal == null){
	                        		statusVal = "No Reviewer Found";
	                        		statusVal2 = null;
	                        	}
	                        	
	                             $("#select2-status_filter-container").append('<option value="' + statusVal2 + '">' + $.trim(statusVal) +'</option>');
	                        });
	                    }
	                },error: function (jqXHR, exception) {
	    	   			      $(".page-loader").hide();
	       	          	  getErrorMessage(jqXHR, exception);
	       	     	  }
	            });
	        }
	    }
	var pageIndex;
     function getBTNVAL(pNo){
    	  console.log(pNo)
    	  pageIndex = pNo;
     }
    
	    function getIRMList(tag) {
	    	if(tag != "searchTag"){
	    		window.localStorage.setItem("clickedTags", tag);
	    	}
	    	clickedTags = window.localStorage.getItem("clickedTags");
	    	if(tag == '' ){
	    		tag = 'irm-my'
	    		window.localStorage.setItem("clickedTags", tag);
	    		
	    	}else if(tag == "searchTag"){
	    		tag = clickedTags;
	    	}else{
	    		clickedTags = window.localStorage.getItem("clickedTags");
	    		if(clickedTags != tag){
	    			clickedTags = tag;
	    		}
	    	}
	    	$('#counts').html(0)
	    	if('${inActive_irm}' != ''){
	    		$('#counts').html('${inActive_irm}')
	    	}
	    	$('#noCounts').html('${not_assigned}')
	    	 admin_incidents = '';
	    	 i_pending = '';
	    	 i_completed = '';
	    	 i_no_reviewer = ''
	    	if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
    		
	    	//$(".page-loader").show();
	    	getProjectFilterList(tag);
	    	getSBUFilterList(tag);
	    	getIncidentFilterList(tag);
	    	getStatusFilterList(tag);
	    	var project_code = $("#select2-Project_filter-container").val();
		    var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_and_to = $("#from_and_to").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	      
	    	$('#allIncidents').html(0)
    		$('#activeApprovers').html(0)
    		$('#inActiveApprovers').html(0)
    		$('#not_assigned').html(0)
	     	table = $('#datatable-'+tag).DataTable();
			table.destroy();
				var i = 0;
	    		$.fn.dataTable.moment('DD-MMM-YYYY');
	    		var rowLen = 0;
	    		var myParams =  "incident_type="
	    				+ incident_type + "&status="+ status+ "&project_code="+ project_code+ "&sbu_code="+ sbu_code+ "&from_and_to="+ from_and_to
	    				+ "&admin_incidents="+ admin_incidents+ "&i_pending="+ i_pending+ "&i_completed="+ i_completed+ "&i_no_reviewer="+ i_no_reviewer;

	    		/***************************************************************************************************/

	    		$('#datatable-'+tag)
	    				.DataTable(
	    						{
	    							"bProcessing" : true,
	    							"bServerSide" : true,
	    							"sort" : "position",
	    							//bStateSave variable you can use to save state on client cookies: set value "true" 
	    							"bStateSave" : false,
	    							 stateSave: true,
	    							 "fnStateSave": function (oSettings, oData) {
	    							 	localStorage.setItem('MRVCDataTables', JSON.stringify(oData));
	    							},
	    							 "fnStateLoad": function (oSettings) {
	    								return JSON.parse(localStorage.getItem('MRVCDataTables'));
	    							 },
	    							//Default: Page display length
	    							"iDisplayLength" : 10,
	    							"iData" : {
	    								"start" : 52
	    							},
	    							//We will use below variable to track page number on server side(For more information visit: http://legacy.datatables.net/usage/options#iDisplayStart)
	    							"iDisplayStart" : 0,
	    							"fnDrawCallback" : function() {
	    								//Get page numer on client. Please note: number start from 0 So
	    								//for the first page you will see 0 second page 1 third page 2...
	    								//Un-comment below alert to see page number
	    								//alert("Current page number: "+this.fnPagingInfo().iPage);
	    							},
	    							//"sDom": 'l<"toolbar">frtip',
	    							"initComplete" : function() {
	    								$('.dataTables_filter input[type="search"]')
	    										.attr('placeholder', 'Search')
	    										.css({
	    											'width' : '350px ',
	    											'display' : 'inline-block'
	    										});

	    								var input = $('.dataTables_filter input')
	    										.unbind()
	    										.bind('keyup',function(e){
	    										    if (e.which == 13){
	    										    	self.search(input.val()).draw();
	    										    }
	    										}), self = this.api(), $searchButton = $(
	    										'<i class="fa fa-search" title="Go" >')
	    								//.text('Go')
	    								.click(function() {
	    									self.search(input.val()).draw();
	    								}), $clearButton = $(
	    										'<i class="fa fa-close" title="Reset">')
	    								//.text('X')
	    								.click(function() {
	    									input.val('');
	    									$searchButton.click();
	    								})
	    								$('.dataTables_filter').append(
	    										'<div class="right-btns"></div>');
	    								$('.dataTables_filter div').append(
	    										$searchButton, $clearButton);
	    								rowLen = $('#datatable-user tbody tr:visible').length
	    								/* var input = $('.dataTables_filter input').unbind(),
	    								self = this.api(),
	    								$searchButton = $('<i class="fa fa-search">')
	    								           //.text('Go')
	    								           .click(function() {			   	                    	 
	    								              self.search(input.val()).draw();
	    								           })			   	        
	    								  $('.dataTables_filter label').append($searchButton); */
	    							}
	    							,
	    							columnDefs : [ {
	    								"targets" : '',
	    								"orderable" : false,
	    							}
	    			                ],
	    							"sScrollX" : "100%",
	    							"sScrollXInner" : "100%",
	    							"ordering":false,
	    							"bScrollCollapse" : true,
	    							"language" : {
	    								"info" : "_START_ - _END_ of _TOTAL_",
	    								paginate : {
	    									next : '<i class="fa fa-angle-right"></i>', 
	    									previous : '<i class="fa fa-angle-left"></i>'  
	    								}
	    							},
	    							
	    							"bDestroy" : true,
	    							"sAjaxSource" : "<%=request.getContextPath()%>/ajax/getIRMListLaztLoad?"+myParams,
	    		        "aoColumns": [
	    		        
	      		         	{ "mData": function(data,type,row){
	      		         		var irm_data = "'"+data.document_code+"','"+data.approver_type+"','"+data.status+"','"+data.approver_code+"'";
			         			var irm_initiate_data = "'"+data.document_code+"','"+data.department_code+"','"+data.department_name+"','"+data.project_code+"','"+data.project_name+"','"+data.incident_code+"'";
			         			
	      		         		 if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(data.status) != 'Resolved'){
		                    		 var text = ' <a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-pencil"></i></a>'
		                    	 }else if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(data.status) == 'Resolved'){
			                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
		                    	 }else{
	 	                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
	                    	     }
			                    var actions = ' <div class="col-lg-6 col-12">'
			                    	 +' <div class="btn-group" role="group" aria-label="Basic example">'+text
			                    	
			                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
			                    +' </div>';
			                    
			                    if('${sessionScope.BASE_ROLE}' == 'Admin' && tag == 'irm-no-reviewer'){
			                    	
			                    	
			                    
			                    	//filterRoles_add(data.project_code,data.department_code);
			                    	$('#document_id2').html($.trim(data.document_code));
			                    	actions = ' <div class="col-lg-6 col-12">'
				                    	 +' <div class="btn-group" role="group" aria-label="Basic example"><a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
				                    +'  <a href="javascript:void(0);" onclick="InitiateIRM('+irm_initiate_data+');" title="Re-Initiate" class="btn btn-outline-danger"><i class="fa fa-repeat"></i></a>'
				                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
				                    +' </div>';
			                    }
			                    var str2 = "No Reviewer Assigned";
								var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
			         			if($.trim(data.approver_code) != ''){
			         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
			         			}
			         			var incident_no = "<p font-size:50%>"+$.trim(data.document_code)+"<br> ( "+$.trim(data.created_date)+" )</p>";
			         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';
			         			if($.trim(data.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';}
			         			var type = '<p class="text-danger"> '+$.trim(data.approver_type)+"</p>";
			                   	var rowArray = [];    
			                   	var maxRole =  $.trim(data.maxRole)
			                   	var maxRole2 =  $.trim(data.maxRole2)
			                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
			                   	
			                   	var checkRole ="";
			                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
			                    	checkRole = 'L2'
			                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
			                    	checkRole = 'L3'
			                    }
			                    
			                    if(($.trim(data.approver_type).indexOf('L1') != -1)){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
			                    }else if($.trim(data.approver_type).indexOf('L2') != -1){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
			                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) != 'Resolved'){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
			                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) == 'Resolved'){
			                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
			                    }
			               
			                    if($.trim(data.approver_code) != ''){
			         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
			         			}else{
			         				status = approver;
			         			}
			                    if( $.trim(data.status) == 'Resolved'){
			                    	type = '<p class="text-success"> '+$.trim(data.approver_type)+"</p>";
			                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
			                    }
			                    if(data.approver_code.indexOf(str2) != -1){
			         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
			         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
			         			}
			         			$('#counts').html(data.counts)
			                	$('#noCounts').html(data.noCounts)
			                   	$('#allIncidents').html(data.all_irm)
			            		$('#activeApprovers').html(data.active_irm)
			            		$('#inActiveApprovers').html(data.inActive_irm)
			            		$('#not_assigned').html(data.not_assigned)
			            		
			            		if(tag == 'irm-completed'){
			            			$('#inActiveApprovers').html(0)
			            			$('#allIncidents').html(data.active_irm)
			            		}
			                	if(tag == 'irm-pending' && ('${sessionScope.BASE_ROLE}' == 'Admin' ||'${sessionScope.BASE_ROLE}' == 'Management' )){
			                		$('#inActiveApprovers').html(data.all_irm)
			                		//$('#profile-tab-justified').click();
			                		$('#counts').html(data.all_irm)
			                	}else if(tag == 'irm-pending'){
			                		// $('#profile-tab-justified').trigger('click');
			                		$('#inActiveApprovers').html(data.all_irm)
			                		$('#counts').html(data.all_irm)
			                	}else if(tag == 'irm-my' && !('${sessionScope.BASE_ROLE}' == 'Admin' ||'${sessionScope.BASE_ROLE}' == 'Management' )){
			                		$('#inActiveApprovers').html(data.inActive_irm)
			                		$('#counts').html(data.inActive_irm)
			                	}else if(tag == 'irm'){
			                		$('#inActiveApprovers').html(data.inActive_irm)
			                		$('#counts').html(data.inActive_irm)
			                		var all = Number(data.all_irm) 
			                		$('#allIncidents').html(all)
			                	}
	                             if($.trim(data.id) == ''){ return '-'; }else{ return data.id ; }
	      		            } },
	      		          { "mData": function(data,type,row){
	      		        	var irm_data = "'"+data.document_code+"','"+data.approver_type+"','"+data.status+"','"+data.approver_code+"'";
		         			var irm_initiate_data = "'"+data.document_code+"','"+data.department_code+"','"+data.department_name+"','"+data.project_code+"','"+data.project_name+"','"+data.incident_code+"'";
		         			 if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(data.status) != 'Resolved'){
	                    		 var text = ' <a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-pencil"></i></a>'
	                    	 }else if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(data.status) == 'Resolved'){
		                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
	                    	 }else{
 	                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
                    	     }
		                    var actions = ' <div class="col-lg-6 col-12">'
		                    	 +' <div class="btn-group" role="group" aria-label="Basic example">'+text
		                    	
		                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
		                    +' </div>';
		                    
		                    if('${sessionScope.BASE_ROLE}' == 'Admin' && tag == 'irm-no-reviewer'){
		                    	
		                    	
		                    
		                    	//filterRoles_add(data.project_code,data.department_code);
		                    	$('#document_id2').html($.trim(data.document_code));
		                    	actions = ' <div class="col-lg-6 col-12">'
			                    	 +' <div class="btn-group" role="group" aria-label="Basic example"><a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
			                    +'  <a href="javascript:void(0);" onclick="InitiateIRM('+irm_initiate_data+');" title="Re-Initiate" class="btn btn-outline-danger"><i class="fa fa-repeat"></i></a>'
			                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
			                    +' </div>';
		                    }
		                    var str2 = "No Reviewer Assigned";
							var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
		         			if($.trim(data.approver_code) != ''){
		         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
		         			}
		         			var incident_no = "<p font-size:50%>"+$.trim(data.document_code)+"<br> ( "+$.trim(data.created_date)+" )</p>";
		         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';
		         			if($.trim(data.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';}
		         			var type = '<p class="text-danger"> '+$.trim(data.approver_type)+"</p>";
		                   	var rowArray = [];    
		                   	var maxRole =  $.trim(data.maxRole)
		                   	var maxRole2 =  $.trim(data.maxRole2)
		                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
		                   	
		                   	var checkRole ="";
		                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
		                    	checkRole = 'L2'
		                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
		                    	checkRole = 'L3'
		                    }
		                    
		                    if(($.trim(data.approver_type).indexOf('L1') != -1)){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
		                    }else if($.trim(data.approver_type).indexOf('L2') != -1){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
		                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) != 'Resolved'){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
		                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) == 'Resolved'){
		                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
		                    }
		                 
		                    if($.trim(data.approver_code) != ''){
		         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
		         			}else{
		         				status = approver;
		         			}
		                    if( $.trim(data.status) == 'Resolved'){
		                    	type = '<p class="text-success"> '+$.trim(data.approver_type)+"</p>";
		                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
		                    }
		                    if(data.approver_code.indexOf(str2) != -1){
		         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         			}
			                    //var actions = '<a href="javascript:void(0);"  onclick="getIRM('+irm_data+');" class="btn btn-primary"  title="Edit"><i class="fa fa-pencil"></i></a>';    	                   	
	    		            	return actions;
	    		            } },
	    		         	{ "mData": function(data,type,row){
	    		         		  var document_code = '';
	    		         		  if ($.trim(data.document_code) != '') { document_code = $.trim(data.document_code) }    	
		                             if($.trim(data.document_code) == ''){ return '-'; }else{ return document_code; }
	    		            } },
	    		            { "mData": function(data,type,row){
	    		            	  var str2 = "No Reviewer Assigned";
									var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
				         			if($.trim(data.approver_code) != ''){
				         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
				         			}
				         			var incident_no = "<p font-size:50%>"+$.trim(data.document_code)+"<br> ( "+$.trim(data.created_date)+" )</p>";
				         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';
				         			if($.trim(data.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';}
				         			var type = '<p class="text-danger"> '+$.trim(data.approver_type)+"</p>";
				                   	var rowArray = [];    
				                   	var maxRole =  $.trim(data.maxRole)
				                   	var maxRole2 =  $.trim(data.maxRole2)
				                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
				                   	
				                   	var checkRole ="";
				                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
				                    	checkRole = 'L2'
				                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
				                    	checkRole = 'L3'
				                    }
				                    
				                    if(($.trim(data.approver_type).indexOf('L1') != -1)){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
				                    }else if($.trim(data.approver_type).indexOf('L2') != -1){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
				                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) != 'Resolved'){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
				                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) == 'Resolved'){
				                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
				                    }
				               
				                    if($.trim(data.approver_code) != ''){
				         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
				         			}else{
				         				status = approver;
				         			}
				                    if( $.trim(data.status) == 'Resolved'){
				                    	type = '<p class="text-success"> '+$.trim(data.approver_type)+"</p>";
				                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
				                    }
				                    if(data.approver_code.indexOf(str2) != -1){
				         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
				         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
				         			}
		                             if($.trim(data.status) == ''){ return '-'; }else{ return status ; }
	    		            } },
	    		            { "mData": function(data,type,row){
	    		            	 var incident_type = '';
	    		            	  if ($.trim(data.incident_type) != '') { incident_type = ' - ' + $.trim(data.incident_type) }    	
		                             if($.trim(data.incident_type) == ''){ return '-'; }else{ return data.incident_type ; }
	    		            }},
	    		         	{ "mData": function(data,type,row){
	    		         		 var project_code = '';
	    		         		  if ($.trim(data.project_code) != '') { project_code = ' - ' + $.trim(data.project_code) }    	
		                             if($.trim(data.project_code) == ''){ return '-'; }else{ return "["+ $.trim(data.sbu_code)+"]"+"/["+ $.trim(data.project_code)+"]"+" - "+ data.project_name }
	    		            } },
	    		            { "mData": function(data,type,row){
	    		            	 var department_code = '';
	    		            	 if ($.trim(data.department_code) != '') { department_code = ' - ' + $.trim(data.department_code) }    	
	                             if($.trim(data.department_code) == ''){ return '-'; }else{ return "["+ $.trim(data.department_code)+"]"+" - "+ data.department_name }
	    		            } }, 
	    		            { "mData": function(data,type,row){
	    		            	  var str2 = "No Reviewer Assigned";
									var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
				         			if($.trim(data.approver_code) != ''){
				         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
				         			}
				         			var incident_no = "<p font-size:50%>"+$.trim(data.document_code)+"<br> ( "+$.trim(data.created_date)+" )</p>";
				         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';
				         			if($.trim(data.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';}
				         			var type = '<p class="text-danger"> '+$.trim(data.approver_type)+"</p>";
				                   	var rowArray = [];    
				                   	var maxRole =  $.trim(data.maxRole)
				                   	var maxRole2 =  $.trim(data.maxRole2)
				                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
				                   	
				                   	var checkRole ="";
				                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
				                    	checkRole = 'L2'
				                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
				                    	checkRole = 'L3'
				                    }
				                    
				                    if(($.trim(data.approver_type).indexOf('L1') != -1)){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
				                    }else if($.trim(data.approver_type).indexOf('L2') != -1){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
				                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) != 'Resolved'){
				                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
				                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) == 'Resolved'){
				                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
				                    }
				               
				                    if($.trim(data.approver_code) != ''){
				         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
				         			}else{
				         				status = approver;
				         			}
				                    if( $.trim(data.status) == 'Resolved'){
				                    	type = '<p class="text-success"> '+$.trim(data.approver_type)+"</p>";
				                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
				                    }
				                    if(data.approver_code.indexOf(str2) != -1){
				         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
				         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
				         			}
	                             if($.trim(data.approver_type) == ''){ return '-'; }else{ return type ; }
   		            		} },
   		            	 	{ "mData": function(data,type,row){
   		            	 	  var str2 = "No Reviewer Assigned";
								var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
			         			if($.trim(data.approver_code) != ''){
			         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
			         			}
			         			var incident_no = "<p font-size:50%>"+$.trim(data.document_code)+"<br> ( "+$.trim(data.created_date)+" )</p>";
			         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';
			         			if($.trim(data.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(data.status)+'</span>';}
			         			var type = '<p class="text-danger"> '+$.trim(data.approver_type)+"</p>";
			                   	var rowArray = [];    
			                   	var maxRole =  $.trim(data.maxRole)
			                   	var maxRole2 =  $.trim(data.maxRole2)
			                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
			                   	
			                   	var checkRole ="";
			                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
			                    	checkRole = 'L2'
			                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
			                    	checkRole = 'L3'
			                    }
			                    
			                    if(($.trim(data.approver_type).indexOf('L1') != -1)){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
			                    }else if($.trim(data.approver_type).indexOf('L2') != -1){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
			                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) != 'Resolved'){
			                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
			                    }else if($.trim(data.approver_type).indexOf('L3') != -1 && $.trim(data.status) == 'Resolved'){
			                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
			                    }
			               
			                    if($.trim(data.approver_code) != ''){
			         				approver = "["+ $.trim(data.approver_code)+"]"+" - "+ data.approver_name;
			         			}else{
			         				status = approver;
			         			}
			                    if( $.trim(data.status) == 'Resolved'){
			                    	type = '<p class="text-success"> '+$.trim(data.approver_type)+"</p>";
			                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
			                    }
			                    if(data.approver_code.indexOf(str2) != -1){
			         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
			         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
			         			}
                             if($.trim(data.approver_code) == ''){ return '-'; }else{ return approver ; }
		            		} },
		            		 { "mData": function(data,type,row){
	                             if($.trim(data.created_by) == ''){ return '-'; }else{ return "["+ $.trim(data.created_by)+"]"+" - "+ data.user_name ; }
   		            		} }
	    		        ]
	    		    });
	    	
	    	
		  $(".page-loader").hide();  		     
	  	
	 }

      
	    function getIRMList1(tag){
	    	if(tag != "searchTag"){
	    		window.localStorage.setItem("clickedTags", tag);
	    	}
	    	clickedTags = window.localStorage.getItem("clickedTags");
	    	if(tag == '' ){
	    		tag = 'irm-my'
	    		window.localStorage.setItem("clickedTags", tag);
	    		
	    	}else if(tag == "searchTag"){
	    		tag = clickedTags;
	    	}else{
	    		clickedTags = window.localStorage.getItem("clickedTags");
	    		if(clickedTags != tag){
	    			clickedTags = tag;
	    		}
	    	}
	    	$('#counts').html(0)
	    	if('${inActive_irm}' != ''){
	    		$('#counts').html('${inActive_irm}')
	    	}
	    	$('#noCounts').html('${not_assigned}')
	    	 admin_incidents = '';
	    	 i_pending = '';
	    	 i_completed = '';
	    	 i_no_reviewer = ''
	    	if(tag== 'irm-my'){
	    		admin_incidents = '${sessionScope.USER_ID}';
	    	}else if(tag == 'irm-pending'){
	    		admin_incidents = "";
	    		i_pending = 'In Progress';
	    	}else if(tag == 'irm-completed'){
	    		admin_incidents = "";
	    		i_completed = 'Resolved' 
	    	}else if(tag == 'irm-no-reviewer'){
	    		admin_incidents = "";
	    		i_no_reviewer = 'null'
	    	}
    		
	    	$(".page-loader").show();
	    	getProjectFilterList(tag);
	    	getSBUFilterList(tag);
	    	getIncidentFilterList(tag);
	    	getStatusFilterList(tag);
	    	var project_code = $("#select2-Project_filter-container").val();
		    var sbu_code = $("#select2-sbu_filter-container").val();
	        var incident_type = $("#select2-incident_type_filter-container").val();
	        var status = $("#select2-status_filter-container").val();
	        var from_and_to = $("#from_and_to").val();
	        var from_date = $("#from_date").val();
	        var to_date = $("#to_date").val();
	      
	    	$('#allIncidents').html(0)
    		$('#activeApprovers').html(0)
    		$('#inActiveApprovers').html(0)
    		$('#not_assigned').html(0)
	     	table = $('#datatable-'+tag).DataTable();
			table.destroy();
			$.fn.dataTable.moment('DD-MMM-YYYY');
			table = $('#datatable-'+tag).DataTable({
				"bStateSave": true,  
	     		fixedHeader: true,
	         	//Default: Page display length
					"iDisplayLength" : 10,
					"iTotalRecords" :200,
					"iData" : {
						"start" : 52
					},"iDisplayStart" : 0,
					"drawCallback" : function() {
					},
	            columnDefs: [],
	            // "ScrollX": true,
	            //"scrollCollapse": true,
	            "sScrollX": "100%",
	            "sScrollXInner": "100%",
	            "bScrollCollapse": true,
	            "initComplete" : function() {
					}
	        }).rows().remove().draw();
			table.state.clear();		
		 	var myParams = {incident_type: incident_type, status : status, project_code : project_code, sbu_code :sbu_code, from_and_to : from_and_to,pageIndex : pageIndex
		 			,admin_incidents : admin_incidents, i_pending : i_pending,i_completed : i_completed,i_no_reviewer : i_no_reviewer};
			$.ajax({url : "<%=request.getContextPath()%>/ajax/getIRMList",type:"POST",data:myParams,success : function(data){    				
					if(data != null && data != '' && data.length > 0){    					
		         		$.each(data,function(key,val){
		         			console.log(data.length)
		         			var irm_data = "'"+val.document_code+"','"+val.approver_type+"','"+val.status+"','"+val.approver_code+"'";
		         			var irm_initiate_data = "'"+val.document_code+"','"+val.department_code+"','"+val.department_name+"','"+val.project_code+"','"+val.project_name+"','"+val.incident_code+"'";
		         			 if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(val.status) != 'Resolved'){
	                    		 var text = ' <a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-pencil"></i></a>'
	                    	 }else if('${sessionScope.BASE_ROLE}' != 'User' && '${sessionScope.BASE_ROLE}' != 'Management' && $.trim(val.status) == 'Resolved'){
		                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
	                    	 }else{
 	                    		var text = ' <a  href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="View"  class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
                    	     }
		                    var actions = ' <div class="col-lg-6 col-12">'
		                    	 +' <div class="btn-group" role="group" aria-label="Basic example">'+text
		                    	
		                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
		                    +' </div>';
		                    
		                    if('${sessionScope.BASE_ROLE}' == 'Admin' && tag == 'irm-no-reviewer'){
		                    	
		                    	
		                    
		                    	//filterRoles_add(val.project_code,val.department_code);
		                    	$('#document_id2').html($.trim(val.document_code));
		                    	actions = ' <div class="col-lg-6 col-12">'
			                    	 +' <div class="btn-group" role="group" aria-label="Basic example"><a href="javascript:void(0);" onclick="getIRM('+irm_data+');" title="Edit" class="btn btn-outline-danger"><i class="fa fa-eye"></i></a>'
			                    +'  <a href="javascript:void(0);" onclick="InitiateIRM('+irm_initiate_data+');" title="Re-Initiate" class="btn btn-outline-danger"><i class="fa fa-repeat"></i></a>'
			                    +'  <a href="javascript:void(0);" onclick="historyIRM('+irm_data+');" title="History" class="btn btn-outline-danger"><i class="fa fa-history"></i></a>'
			                    +' </div>';
		                    }
		                    var str2 = "No Reviewer Assigned";
							var approver =  "<p style='color : red; font-size: 12px;'><b>No Reviewer  Assigned</b></p>";
		         			if($.trim(val.approver_code) != ''){
		         				approver = "["+ $.trim(val.approver_code)+"]"+" - "+ val.approver_name;
		         			}
		         			var incident_no = "<p font-size:50%>"+$.trim(val.document_code)+"<br> ( "+$.trim(val.created_date)+" )</p>";
		         			var status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(val.status)+'</span>';
		         			if($.trim(val.status) != "In Progress"){status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">'+$.trim(val.status)+'</span>';}
		         			var type = '<p class="text-danger"> '+$.trim(val.approver_type)+"</p>";
		                   	var rowArray = [];    
		                   	var maxRole =  $.trim(val.maxRole)
		                   	var maxRole2 =  $.trim(val.maxRole2)
		                   	if(maxRole2 == ""){ maxRole2 = 'IRL3'}
		                   	
		                   	var checkRole ="";
		                    if(maxRole != '' && maxRole.indexOf('L2') != -1 ){
		                    	checkRole = 'L2'
		                    }else if(maxRole != '' && maxRole.indexOf('L3') != -1 ){
		                    	checkRole = 'L3'
		                    }
		                    
		                    if(($.trim(val.approver_type).indexOf('L1') != -1)){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">In Progress</span>';
		                    }else if($.trim(val.approver_type).indexOf('L2') != -1){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
		                    }else if($.trim(val.approver_type).indexOf('L3') != -1 && $.trim(val.status) != 'Resolved'){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
		                    }else if($.trim(val.approver_type).indexOf('L3') != -1 && $.trim(val.status) == 'Resolved'){
		                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
		                    }
		                    
		                  /*   
		                    if($.trim(maxRole2) != maxRole &&  $.trim(val.status) != 'Resolved' && !($.trim(approver_type).indexOf('L1') != -1)){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Action Taken <br> Review Inprogress</span>';
		                    }else if($.trim(maxRole2) == maxRole && $.trim(val.status) != 'Resolved'){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
		                    } *//* else if($.trim(maxRole2) != maxRole && $.trim(val.status) != 'Resolved' && !($.trim(maxRole2).indexOf('L1') == -1)){
		                    	status = '<span class="badge rounded-pill badge-light-warning me-1" style=" text-align: center;font-size: .9rem;">Review Done <br> Closure Pending</span>';
		                    } */ 
		                  
		                    if($.trim(val.approver_code) != ''){
		         				approver = "["+ $.trim(val.approver_code)+"]"+" - "+ val.approver_name;
		         			}else{
		         				status = approver;
		         			}
		                    if( $.trim(val.status) == 'Resolved'){
		                    	type = '<p class="text-success"> '+$.trim(val.approver_type)+"</p>";
		                    	status = '<span class="badge rounded-pill badge-light-success me-1" style=" text-align: center;font-size: .9rem;">Resolved</span>';
		                    }
		                    if(val.approver_code.indexOf(str2) != -1){
		         				approver =  "<p style='color : red; font-size: 12px;'  title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         				status =  "<p style='color : red; font-size: 12px;' title='No Reviewer Assigned'><b>No Reviewer Assigned</b></p>";
		         			}
		                   	key++;
		                	$('#counts').html(val.counts)
		                	$('#noCounts').html(val.noCounts)
		                   	$('#allIncidents').html(val.all_irm)
		            		$('#activeApprovers').html(val.active_irm)
		            		$('#inActiveApprovers').html(val.inActive_irm)
		            		$('#not_assigned').html(val.not_assigned)
		            		
		            		if(tag == 'irm-completed'){
		            			$('#inActiveApprovers').html(0)
		            			$('#allIncidents').html(val.active_irm)
		            		}
		                	if(tag == 'irm-pending' && ('${sessionScope.BASE_ROLE}' == 'Admin' ||'${sessionScope.BASE_ROLE}' == 'Management' )){
		                		$('#inActiveApprovers').html(val.all_irm)
		                		//$('#profile-tab-justified').click();
		                		$('#counts').html(val.all_irm)
		                	}else if(tag == 'irm-pending'){
		                		// $('#profile-tab-justified').trigger('click');
		                		$('#inActiveApprovers').html(val.all_irm)
		                		$('#counts').html(val.all_irm)
		                	}else if(tag == 'irm-my' && !('${sessionScope.BASE_ROLE}' == 'Admin' ||'${sessionScope.BASE_ROLE}' == 'Management' )){
		                		$('#inActiveApprovers').html(val.inActive_irm)
		                		$('#counts').html(val.inActive_irm)
		                	}else if(tag == 'irm'){
		                		$('#inActiveApprovers').html(val.inActive_irm)
		                		$('#counts').html(val.inActive_irm)
		                		var all = Number(val.all_irm) 
		                		$('#allIncidents').html(all)
		                	}
		                   	rowArray.push($.trim(key));
		                	rowArray.push($.trim(actions));  
		                   	rowArray.push($.trim(incident_no));
		                   	rowArray.push($.trim(status));
/* 		                	rowArray.push("["+ $.trim(val.incident_code)+"]"+" - "+ val.incident_type);
 */		                	rowArray.push($.trim(val.incident_type));
		                   	rowArray.push("["+ $.trim(val.sbu_code)+"]"+"/["+ $.trim(val.project_code)+"]"+" - "+ val.project_name);
		                	rowArray.push("["+ $.trim(val.department_code)+"]"+" - "+ val.department_name);
		                	rowArray.push($.trim(type));  
		                	rowArray.push(approver);
		                	rowArray.push("["+ $.trim(val.created_by)+"]"+" - "+ val.user_name);
		                	//rowArray.push($.trim(val.created_date));  
		                   
		                    table.row.add(rowArray).draw( true );
						});
					}
				},error: function (jqXHR, exception) {
		         	getErrorMessage(jqXHR, exception);
		     }});
			 $(".page-loader").hide();
	    } 

	    function getErrorMessage(jqXHR, exception) {
	  	    var msg = '';
	  	    if (jqXHR.incident_type === 0) {
	  	        msg = 'Not connect.\n Verify Network.';
	  	    } else if (jqXHR.incident_type == 404) {
	  	        msg = 'Requested page not found. [404]';
	  	    } else if (jqXHR.incident_type == 500) {
	  	        msg = 'Internal Server Error [500].';
	  	    } else if (exception === 'parsererror') {
	  	        msg = 'Requested JSON parse failed.';
	  	    } else if (exception === 'timeout') {
	  	        msg = 'Time out error.';
	  	    } else if (exception === 'abort') {
	  	        msg = 'Ajax request aborted.';
	  	    } else {
	  	        msg = 'Uncaught Error.\n' + jqXHR.responseText;
	  	    }
	  	    console.log(msg);
        }
	    $('#addRoleMap').on('show.bs.modal', function (event) {
	        $(document).ready(function() {
	            $('.select2').select2({
	                dropdownParent: $('#addRoleMap')
	            });
	        }); 
	    });
	    function addRoleMap(){
	    	if(validator.form()){ // validation perform
	    		 $('#InitiateIRM').modal('hide');
	        	 document.getElementById("addRoleMapForm").submit();	
	    	}
	    }
	    
	    function filterRoles_add(project,department_code){
	    	 var type = $("#select2-safety_type_add-container").val();
	        type =  type.toString();
	        if ($.trim(type) != "" && $.trim(project) != "" && $.trim(department_code) != "") {
	        	$("#select2-roles_add-container option:not(:first)").remove();
	        	var myParams = {safety_type: type,project: project,department_code: department_code };
	            $.ajax({
	                url: "<%=request.getContextPath()%>/ajax/getFilteredRolesList",
	                data: myParams, cache: false,async: true,
	                success: function (data) {
	                    if (data.length > 0) {
	                        $.each(data, function (i, val) {
		                      $("#select2-roles_add-container").append('<option  value="' + val.role_code + '">'+$.trim(val.role_code) +'</option>');
	                    	});
	                     }           
	                    },error: function (jqXHR, exception) {
	    	   			      $(".page-loader").hide();
	       	          	  getErrorMessage(jqXHR, exception);
	       	     	  }
	            });
	        }
      }
	    function empFilter(project){
	    	    if ($.trim(project) != "" ) {
		        	$("#select2-employee_code_add-container option:not(:first)").remove();
		        	var myParams = {project: project};
		            $.ajax({
		                url: "<%=request.getContextPath()%>/ajax/getEmpstList",
		                data: myParams, cache: false,async: true,
		                success: function (data) {
		                    if (data.length > 0) {
		                        $.each(data, function (i, val) {
			                      $("#select2-employee_code_add-container").append('<option email ="' + val.email_id + '"  value="' + val.user_id + '">'+'['+$.trim(val.user_id) +"] - "+$.trim(val.user_name) +'</option>');
		                    	});
		                     }           
		                    },error: function (jqXHR, exception) {
		    	   			      $(".page-loader").hide();
		       	          	  getErrorMessage(jqXHR, exception);
		       	     	  }
		            });
		        }
	      }
	    function setEmail(){
	    	  var userId = $("#select2-employee_code_add-container").val();
	    	  if(userId != ''){
	    		 var email = $("#select2-employee_code_add-container").find('option:selected').attr('email')
	    		 $('#email_2').val(email)
	    	  }
	      }
	    var validator =	$('#addRoleMapForm').validate({
		   	 errorClass: "my-error-class",
		   	 validClass: "my-valid-class",
		   	 ignore: ":hidden:not(.select2 form-select)",
		   		    rules: {
				   		     "safety_type": {
						 			required: true
						 	  },"project": {										
						 			required: true
						 	  },"role_code": {
				                 	required: true,
						 	  },"department_code": {										
						 			required: true
						 	  },"employee_code": {
				                 	required: true,
						 	  },"status": {
				                 	required: true,
						 	  }
					 	},
					    messages: {
					 		 "safety_type": {
							 	required: 'Required',
						 	  },"project": {
						 		required: 'Required'
						 	  },"role_code": {
					 			required: 'Required'
					 	  	  },"department_code": {
						 		required: 'Required'
						 	  },"employee_code": {
					 			required: 'Required'
					 	  	  },"status": {
					 			required: 'Required'
					 	  	  }
			   		},
		      		errorPlacement:function(error, element){
		      			if (element.attr("id") == "select2-safety_type_add-container" ){
			   				 document.getElementById("select2-safety_type_add-containerError").innerHTML="";
			   		 		 error.appendTo('#select2-safety_type_add-containerError');
				   			}else if(element.attr("id") == "select2-employee_code_add-container" ){
				   			   document.getElementById("select2-employee_code_add-containerError").innerHTML="";
				   		 	   error.appendTo('#select2-employee_code_add-containerError');
				   			}else if(element.attr("id") == "select2-roles_add-container" ){
				   				document.getElementById("select2-roles_add-containerError").innerHTML="";
				   			 	error.appendTo('#select2-roles_add-containerError');
				   			}else if(element.attr("id") == "select2-project_add-container" ){
				   				document.getElementById("select2-project_add-containerError").innerHTML="";
				   			 	error.appendTo('#select2-project_add-containerError');
				   			}else if(element.attr("id") == "select2-department_code_add-container" ){
				   				document.getElementById("select2-department_code_add-containerError").innerHTML="";
				   			 	error.appendTo('#select2-department_code_add-containerError');
				   			}else if(element.attr("id") == "select2-status_add-container" ){
				   				document.getElementById("select2-status_add-containerError").innerHTML="";
				   			 	error.appendTo('#select2-status_add-containerError');
				   			}else{
				   				error.insertAfter(element);
						   	        } 
				      		},invalidHandler: function (form, validator) {
				               var errors = validator.numberOfInvalids();
				               if (errors) {
				                   var position = validator.errorList[0].element;
				                   jQuery('html, body').animate({
				                       scrollTop:jQuery(validator.errorList[0].element).offset().top - 100
				                   }, 1000);
				               }
				           },submitHandler:function(form){
				   	    	//form.submit();
				   	    }
		   	}); 
	    
	    function filterToggle(){
	    	if($("#filterToggle").prop('checked') == true){
	    		$(".filterToggleDiv").css("display","block");
	    		$('#filterToggleText').removeClass('badge badge-light-danger')
	    		$('#filterToggleText').addClass('badge badge-light-dark').html("Hide Search Filters");
	    		
	    	}else{
	    		$(".filterToggleDiv").css("display","none");
	    		$('#filterToggleText').removeClass('badge badge-light-dark')
	    		$('#filterToggleText').addClass('badge badge-light-danger').html("Show Search Filters");
	    	}
	    	
	    }
    </script>
  </body>
  <!-- END: Body-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/horizontal-menu-template/dashboard-analytics.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Aug 2022 05:36:10 GMT -->
</html>