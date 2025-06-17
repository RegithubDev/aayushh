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
   
<style>

body {
    font-family: var(--bs-body-font-family) !important;
}
.dark-layout h1, .dark-layout h2, .dark-layout h3, .dark-layout h4, .dark-layout h5, .dark-layout h6, .dark-layout span  {
    color: #D0D2D6;
}

</style>
 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0,minimal-ui">
    <meta name="description" content="Safety admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 Company with unlimited possibilities.">
    <meta name="keywords" content="admin template,Company, Safety admin template, dashboard template, flat admin template, responsive admin template, web app">
    <meta name="author" content="PIXINVENT">
  <title>Done</title>
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
    <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/pickers/flatpickr/flatpickr.min.css">
    <!-- END: Vendor CSS-->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
	  <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome-v.4.7.css" />">
    <!-- BEGIN: Theme CSS-->
            <link rel="stylesheet" type="text/css" href="/reirm/resources/vendors/css/extensions/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/plugins/extensions/ext-component-toastr.min.css">
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
    <!-- END: Page CSS-->

    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="/reirm/resources/css/style.css">
    <!-- END: Custom CSS-->

  </head>
  <!-- END: Head-->

  <!-- BEGIN: Body-->
  <body class="horizontal-layout horizontal-menu  navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="">

    <!-- BEGIN: Header-->
	<jsp:include page="../views/layout/header.jsp"></jsp:include> 
<div class="app-content content ">
      <div class="content-overlay"></div>
      <div class="header-navbar-shadow"></div>
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
          <!-- Coming soon page-->
          <div class="misc-wrapper">
            <div class="misc-inner p-2 p-sm-3">
              <div class="w-100 text-center">
                <h2 class="mb-1">${module } Changes Done!</h2>
                <p class="mb-1">Go back to view the changes</p>
               
                  <div class="col-12 d-md-block d-grid ps-md-0 ps-auto">
                   <a type="button" class="btn "  data-bs-toggle="tooltip"  href="<%=request.getContextPath() %>/${redirect }"  style="margin-top: 17px; color: white !important; background-color: blue !important;"> Go Back to page</a>
                  </div>
              </div>
            </div>
          </div>
          <!-- / Coming soon page-->
        </div>
      </div>
    </div>

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

    <!-- BEGIN: Footer-->
    <footer class="footer footer-static footer-light">
      <p class="clearfix mb-0"><span class="float-md-start d-block d-md-inline-block mt-25">COPYRIGHT  &copy;  <span id="currentYear"></span> | Powered by<a class="ms-25" href="https://resustainability.com/" target="_blank">Re Sustainability Limited</a><span class="d-none d-sm-inline-block"> . All Rights Reserved.</span></span></p>
    </footer>
    <button class="btn btn-primary btn-icon scroll-top" type="button"><i data-feather="arrow-up"></i></button>
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
    <!-- END: Page JS-->
    
  <form action="<%=request.getContextPath()%>/export-role-mapping" name="exportCompanyForm" id="exportCompanyForm" target="_blank" method="post">	
      
        <input type="hidden" name="structure_type_fk" id="exportStructure_type_fk" />
        <input type="hidden" name="drawing_type_fk" id="exportDrawing_type_fk" />
	</form>
    <script>

      $(window).on("load",(function(){
          if (feather) {
            feather.replace({ width: 14, height: 14 });
          }
          $('.modal').modal({ dismissible: false });
         }));
      document.getElementById("currentYear").innerHTML = new Date().getFullYear();
      
    
    </script>
  </body>
  <!-- END: Body-->

<!-- Mirrored from pixinvent.com/demo/vuexy-html-bootstrap-admin-template/html/ltr/horizontal-menu-template/dashboard-analytics.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Aug 2022 05:36:10 GMT -->
</html>