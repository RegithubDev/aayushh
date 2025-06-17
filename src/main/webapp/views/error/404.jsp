<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
    <!--[if IE 9 ]><html class="ie9"><![endif]-->
   <html>
    <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error page</title>
    <link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/images/protect-favicon.png"/>" >
    <link rel="stylesheet" href="<c:url value="/resources/css/materialize-v.1.0.min.css" />" >
    <style>
        /* body {
            background-color: antiquewhite;
        } */
/* card positon and styling */
        .row {
            display: flex;
            height: 85vh;
        }

        .row>.col {
            margin: auto;
        }

        .card-action a {
            color: #fff !important;
            margin-right: 0 !important;
        }

        .card-content * {
            text-shadow: 0px 10px 5px #bbb;
        }

/* color change animation code */
      /*   @keyframes color-change {

            50% {
                color: red;
                transform: scale(1.2);
            }

            100% {
                color: black;
            }
        }

        h1 {
            color: #DD1F2C;
            font-size: 5rem;
            margin-top: 1.68rem;
            animation-name: color-change;
            animation-duration: 1s;
            /* animation-direction: alternate; */
            /* animation-iteration-count: infinite;
        } */
        .load {
  font-family: sans-serif;
  font-size: 55px;
  text-align: center;
  color: red;
  position: absolute;
    right: 1em;
    margin-top: -1em;
}

.load span {
  animation-duration: 2.3s;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
}

.load span:nth-child(1) {
  animation-name: first;
  position: relative;
  top: -0.25em;
}
.load span:nth-child(2) {
  animation-name: second;
  position: relative;
  top: -0.5em;
}
.load span:nth-child(3) {
  animation-name: third;
}
.cont{
color: #000;	
}
.cont h6{
	font-size: 20px;
	font-weight: 600;
}

@keyframes first {
  0% {
    opacity: 0;
  }
  60%,
  100% {
    opacity: 1;
  }
}
@keyframes second {
  0%,
  10% {
    opacity: 0;
  }
  80%,
  100% {
    opacity: 1;
  }
}
@keyframes third {
  0%,
  20% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}
.crane{
	position: absolute;
	top: 0;
	width: 16%;
}
CSS Pretty Print
 

 * {
	 box-sizing: border-box;
}
 main {
	 /* position: relative;
	 height: 95vh;
	 z-index: -10;
	 background: linear-gradient(to top, rgba(27, 29, 29, 1), rgba(255, 255, 255, .75)); */
	 position: absolute;
    height: 100%;
    z-index: -10;
    background: linear-gradient(to top, rgba(255, 255, 255, 1), rgba(101, 150, 255, .75));
    width: 100%;
    bottom: 2em;
}
 body {
	 font-size: 12px;
	 font-family: "Josefin Sans","Roboto", sans-serif;
	 background-color: rgba(37, 38, 39, 1);
}
 .crane__list, .skyscrappers__list, .tree__container {
	 position: absolute;
	 width: 100%;
	 bottom: 0;
}
 .advice {
	 display: flex;
	 height: 50vh;
	 width: 100vw;
	 flex-flow: column nowrap;
	 justify-content: center;
	 align-items: center;
}
 .advice__title {
	 font-size: 3rem;
	 text-align: center;
}
 .advice__description {
	 margin-top: 1rem;
	 font-size: 2rem;
	 text-align: center;
}
 .advice__description span:first-child {
	 margin-right: -0.7rem;
}
 .advice__description span:last-child {
	 margin-left: -0.7rem;
}
 .city-stuff {
	 display: flex;
	 position: absolute;
	 justify-content: center;
	 width: 100%;
	 height: 100%;
	 bottom: 0;
	 overflow: hidden;
	 box-shadow: inset 0 -60px 0 -30px rgba(75, 175, 172, 1);
}
 .skyscrappers__list {
	 width: 100%;
	 height: 86.6666666667px;
	 left: 0;
}
 .skyscrappers__list .skyscrapper__item {
	 position: absolute;
	 height: inherit;
	 bottom: 15%;
	 width: 43.3333333333px;
	 background: linear-gradient(115deg, rgba(75, 175, 172, 1) 73%, rgba(60, 139, 137, 1) 73%, rgba(60, 139, 137, 1) 100%);
}
 .skyscrappers__list .skyscrapper__item:after {
	 content: "";
	 position: absolute;
	 width: 80%;
	 height: 80%;
	 left: 10%;
	 bottom: 10%;
	 background: url("../images/login-background.jpg");
}
 .skyscrappers__list .skyscrapper__item:last-child:not(:only-child) {
	 background: rgba(75, 175, 172, 1);
}
 .skyscrappers__list .skyscrapper-1 {
	 width: 121.3333333333px;
	 height: 138.6666666667px;
	 right: 25%;
	 bottom: 0;
	 z-index: 10;
	 transform: rotate(180deg);
}
 @media screen and (max-width: 450px) {
	 .skyscrappers__list .skyscrapper-1 {
		 display: none;
	}
}
 .skyscrappers__list .skyscrapper-2 {
	 width: 60.6666666667px;
	 height: 69.3333333333px;
	 right: 35%;
	 bottom: 0;
	 z-index: 10;
	 transform: rotate(180deg);
	 bottom: 10%;
}
 @media screen and (max-width: 900px) {
	 .skyscrappers__list .skyscrapper-2 {
		 display: none;
	}
}
 @media screen and (max-width: 450px) {
	 .skyscrappers__list .skyscrapper-1 {
		 display: none;
	}
}
 .skyscrappers__list .skyscrapper-3 {
	 width: 40.4444444444px;
	 height: 46.2222222222px;
	 right: 45%;
	 bottom: 0;
	 z-index: 10;
	 transform: rotate(180deg);
	 height: 115.5555555556px;
}
 @media screen and (max-width: 900px) {
	 .skyscrappers__list .skyscrapper-3 {
		 display: none;
	}
}
 @media screen and (max-width: 450px) {
	 .skyscrappers__list .skyscrapper-1 {
		 display: none;
	}
}
 .skyscrappers__list .skyscrapper-4 {
	 width: 30.3333333333px;
	 height: 34.6666666667px;
	 right: 55%;
	 bottom: 0;
	 z-index: 10;
	 transform: rotate(180deg);
	 height: 86.6666666667px;
}
 .skyscrappers__list .skyscrapper-4:after {
	 width: 20%;
	 height: 60%;
	 left: 25%;
}
 @media screen and (max-width: 450px) {
	 .skyscrappers__list .skyscrapper-1 {
		 display: none;
	}
}
 .skyscrappers__list .skyscrapper-5 {
	 width: 24.2666666667px;
	 height: 27.7333333333px;
	 right: 65%;
	 bottom: 0;
	 z-index: 10;
	 transform: rotate(180deg);
	 width: 7%;
	 right: 67%;
	 height: 50%;
	 z-index: 11;
}
 .skyscrappers__list .skyscrapper-5:after {
	 height: 0;
}
 @media screen and (max-width: 450px) {
	 .skyscrappers__list .skyscrapper-1 {
		 display: none;
	}
}
 .crane-cabin, .crane-arm, .crane-picker {
	 transform-origin: 80% center;
	 animation: crane__movement 12s infinite alternate;
}
 .crane__list {
	 width: 260px;
	 height: 173.3333333333px;
	 z-index: 0;
	 perspective: 600px;
}
 .crane__list .crane__item {
	 position: absolute;
	 border: solid 1px rgba(75, 175, 172, 1);
	 border-radius: 2px;
}
 .crane__list .crane-cable {
	 width: 1px;
	 height: 1px;
	 border: none;
	 outline: 1px solid transparent;
	 background: rgba(75, 175, 172, 1);
	 z-index: 0;
}
 .crane__list .crane-cable-1 {
	 width: 60%;
	 top: 0;
	 left: 11%;
	 transform-origin: right 0;
	 animation: cable-1__movement 12s infinite alternate;
}
 .crane__list .crane-cable-2 {
	 width: 19%;
	 top: 0;
	 right: 8%;
	 transform-origin: top left;
	 animation: cable-2__movement 12s infinite alternate;
}
 .crane__list .crane-cable-3 {
	 height: 30%;
	 top: 22%;
	 left: 9%;
	 transform-origin: right center;
	 animation: cable-3__movement 12s ease-in-out infinite alternate;
}
 .crane__list .crane-cable-3:after {
	 content: "";
	 display: block;
	 position: absolute;
	 height: 0.2em;
	 width: 9000%;
	 bottom: 0;
	 left: -4500%;
	 background: rgba(144, 208, 205, 1);
	 border: 1px solid rgba(75, 175, 172, 1);
}
 .crane__list .crane-stand {
	 width: 5%;
	 height: 100%;
	 right: 25%;
	 z-index: 1;
	 background: linear-gradient(to top, rgba(75, 175, 172, 1), rgba(191, 212, 211, 1));
}
 .crane__list .crane-weight {
	 width: 8%;
	 height: 20%;
	 right: 4%;
	 top: 12%;
	 z-index: 2;
	 background: rgba(169, 209, 207, 1);
	 transform-origin: 0 center;
	 animation: crane-weight__movement 12s infinite alternate;
}
 .crane__list .crane-cabin {
	 width: 12%;
	 height: 9%;
	 right: 24%;
	 top: 20%;
	 z-index: 2;
	 background: rgba(169, 209, 207, 1);
}
 .crane__list .crane-cabin:after {
	 content: "";
	 display: block;
	 position: absolute;
	 width: 100%;
	 height: 10%;
	 top: 60%;
	 left: 0;
	 background: rgba(255, 255, 255, 1);
}
 .crane__list .crane-arm {
	 width: 100%;
	 height: 7%;
	 top: 15%;
	 border-top-left-radius: 10px;
	 z-index: 3;
	 background: rgba(169, 209, 207, 1);
}
 .crane-1 {
	 left: 20%;
	 z-index: 10;
}
 .crane-2 {
	 left: 30%;
	 z-index: 10;
	 bottom: -1rem;
	 z-index: -1;
	 transform: scale(0.75) scaleX(-1);
}
 @media screen and (max-width: 900px) {
	 .crane-2 {
		 display: none;
	}
}
 .crane-2 .crane-cable-3 {
	 animation-delay: 3s;
}
 .crane-3 {
	 left: 40%;
	 z-index: 10;
	 bottom: -0.5rem;
	 transform: scale(0.8);
}
 @media screen and (max-width: 900px) {
	 .crane-3 {
		 z-index: -1;
		 transform: scale(0.75) scaleX(-1);
	}
}
 @media screen and (max-width: 900px) {
	 .crane-3 {
		 display: none;
	}
}
 .crane-3 .crane-cable-3 {
	 animation-delay: 4.5s;
}
 .tree__container {
	 width: 100%;
	 height: 62.6666666667px;
	 left: 0;
	 margin-bottom: 4px;
}
 .tree__item {
	 display: flex;
	 flex-flow: column nowrap;
	 position: absolute;
	 justify-content: flex-end;
	 align-items: center;
	 left: 60%;
}
 .tree__trunk {
	 order: 2;
	 display: block;
	 position: absolute;
	 width: 4px;
	 height: 8px;
	 margin-top: 8px;
	 border-radius: 2px;
	 background: rgba(87, 71, 61, 1);
}
 .tree__leaves {
	 order: 1;
	 position: relative;
	 border-top: 0 solid transparent;
	 border-right: 4px solid transparent;
	 border-bottom: 32px solid rgba(75, 175, 172, 1);
	 border-left: 4px solid transparent;
}
 .tree__leaves:after {
	 content: "";
	 position: absolute;
	 height: 100%;
	 left: -4px;
	 border-top: 0;
	 border-right: 0;
	 border-bottom: 32px solid rgba(60, 139, 137, 1);
	 border-left: 4px solid transparent;
}
 .tree-1 {
	 left: 66%;
}
 @media screen and (max-width: 768px) {
	 .tree-1 {
		 display: none;
	}
}
 .tree-2 {
	 left: 67%;
}
 @media screen and (max-width: 768px) {
	 .tree-2 {
		 display: none;
	}
}
 .tree-4 {
	 left: 57%;
}
 .tree-5 {
	 left: 58%;
}
 .tree-7 {
	 left: 51%;
}
 @media screen and (max-width: 450px) {
	 .tree-7 {
		 display: none;
	}
}
 .tree-8 {
	 left: 52%;
}
 @media screen and (max-width: 450px) {
	 .tree-8 {
		 display: none;
	}
}
 @keyframes cable-1__movement {
	 0%, 20% {
		 transform: rotateY(0) rotateZ(-10deg);
	}
	 70%, 100% {
		 transform: rotateY(45deg) rotateZ(-10deg);
	}
}
 @keyframes cable-2__movement {
	 0%, 20% {
		 transform: rotateY(0) rotateZ(29deg);
	}
	 70%, 100% {
		 transform: rotateY(15deg) rotateZ(29deg);
	}
}
 @keyframes cable-3__movement {
	 0% {
		 transform: translate(0, 0);
	}
	 20% {
		 transform: translate(2500%, -18%);
	}
	 60% {
		 transform: translate(11000%, -25%);
	}
	 70% {
		 height: 30%;
		 transform: translate(9100%, -25%);
	}
	 90%, 100% {
		 height: 80%;
		 transform: translate(9100%, -15%);
	}
}
 @keyframes crane__movement {
	 0%, 20% {
		 transform: rotateY(0);
	}
	 70%, 100% {
		 transform: rotateY(45deg);
	}
}
 @keyframes crane-weight__movement {
	 0%, 20% {
		 transform: rotateY(0) translateX(0);
	}
	 70%, 100% {
		 transform: rotateY(45deg) translateX(-50%);
	}
}

.content{
	position: absolute;
	top: 0;
	width: 100%;
}
.man{
	position: absolute;
    bottom: -6.5em;
    right: 3em;
}
 
    </style>
</head>

<body>

    <!-- header  starts-->
    <nav>
        <div class="nav-wrapper blue darken-3">
            <div class="">
                <a href="<%=request.getContextPath() %>/home" class="brand-logo fs"><img src="<c:url value="/resources/images/logo/protect-main.jpeg"/>" alt="Logo"> REIS</a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="fa fa-bars"></i></a>

            </div>
        </div>
    </nav>

    <!-- header ends  -->

<!-- error card in single row  -->
   <%--  <div class="row">
        <div class="col s12 m3">
            <div class="card center-align">
                <div class="card-content">
                    <h1>404</h1>
                    <h6>Requested page not Found</h6>
                </div>
                <div class="card-action">
                    <a href="<%=request.getContextPath()%>/">Go to Home</a>
                </div>
            </div>
        </div>
    </div> --%>
    <main>
  
  <section class="city-stuff">
    <ul class="skyscrappers__list">
      <li class="skyscrapper__item skyscrapper-1"></li>
      <li class="skyscrapper__item skyscrapper-2"></li>
      <li class="skyscrapper__item skyscrapper-3"></li>
      <li class="skyscrapper__item skyscrapper-4"></li>
      <li class="skyscrapper__item skyscrapper-5"></li>
    </ul>
    <ul class="tree__container">
      <li class="tree__list">
        <ul class="tree__item tree-1">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>
        <ul class="tree__item tree-2">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>
        <ul class="tree__item tree-3">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
        <ul class="tree__item tree-4">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
        <ul class="tree__item tree-5">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
        <ul class="tree__item tree-6">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
        <ul class="tree__item tree-7">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
        <ul class="tree__item tree-8">
          <li class="tree__trunk"></li>
          <li class="tree__leaves"></li>
        </ul>  
      </li>
    </ul>
    <ul class="crane__list crane-1">
      <li class="crane__item crane-cable crane-cable-1"></li>
      <li class="crane__item crane-cable crane-cable-2"></li>
      <li class="crane__item crane-cable crane-cable-3"></li>
      <li class="crane__item crane-stand"></li>
      <li class="crane__item crane-weight"></li>
      <li class="crane__item crane-cabin"></li>
      <li class="crane__item crane-arm"></li>
    </ul>
    <ul class="crane__list crane-2">
      <li class="crane__item crane-cable crane-cable-1"></li>
      <li class="crane__item crane-cable crane-cable-2"></li>
      <li class="crane__item crane-cable crane-cable-3"></li>
      <li class="crane__item crane-stand"></li>
      <li class="crane__item crane-weight"></li>
      <li class="crane__item crane-cabin"></li>
      <li class="crane__item crane-arm"></li>
    </ul>
    <ul class="crane__list crane-3">
      <li class="crane__item crane-cable crane-cable-1"></li>
      <li class="crane__item crane-cable crane-cable-2"></li>
      <li class="crane__item crane-cable crane-cable-3"></li>
      <li class="crane__item crane-stand"></li>
      <li class="crane__item crane-weight"></li>
      <li class="crane__item crane-cabin"></li>
      <li class="crane__item crane-arm"></li>
    </ul>
  </section>
</main>
    <div class="content">
    	<div class="container">
    	<div class="row">
    		<div class="col s12 m2 left-align">
    		<img alt="image" src="/pmis/resources/images/404-crane.png" class="crane">
    		</div>
    		<div class="col s12 m6 center-align offset-m1">
    			<div class="cont">
    				<h6>The Page You Requested Has Not Found Or Doesn't Exist. Click The Below Button To Go Back To Home</h6>
    				<div class="card-action">
	                    <a href="<%=request.getContextPath()%>/" class="btn waves-effect waves-light bg-s t-c">Go to Home</a>
	                </div>
    			</div>
    		</div>
    		<div class="col s12 m2 right-align">
    		<h1 class="load"><span>?</span><span>?</span><span>?</span></h1>
    		<img alt="image" src="/pmis/resources/images/404-man.png" class="man">
    		</div>
    	</div>
    </div>
    </div>



    <!-- footer  -->
    <div class="footer-container">
        <div class="footer-copyright blue lighten-5 bottom">
            <div class="container">
               <!--  <span>Copyright 2020 @ mrvc.indianrailways.gov.in | Designed & Developed by</span> --> <img
                    src="<c:url value="/resources/images/logo/protect-main.jpeg"/>" class="footer-img" alt="footer image">
            </div>
        </div>
    </div>

    <!-- <script src="js/jQuery.min.js"></script>
    <script src="js/materialize.min.js"></script> -->

</body>

</html>
