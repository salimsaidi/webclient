<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="utf-8">
<title>Projet Web</title>
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<spring:url value="/resources/core/font-awesome/css/font-awesome.min.css" var="fontAwsomeCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${styleCss}" rel="stylesheet" />
<link href="${fontAwsomeCss}" rel="stylesheet" />
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
  <div class="navbar-header">
    <a class="navbar-brand" href="#">Résumé</a>
  </div>
  </div>
</nav>
<section class="success" id="about">
	<div class="row">
        <div class="col-lg-12 text-center">
            <h3>Nombre de STB : ${msg.nbStb}</h3>
            <hr class="star-light">
        </div>
    </div>
<!-- variable -->
<c:set var="resumesList" value="${msg.resume}" />

<div class="container">
	<div class="row">

		<c:if test="${fn:length(resumesList) lt 1}">
   			aucune stb disponible
		</c:if>
		
		<c:forEach var="r" items="${resumesList}" >
			<div class="col-md-4">
				<div class="panel panel-primary">
	  				<div class="panel-heading"><c:out value="${r.titre}"/><span class="badge">N°${r.id}</span></div>
	  				<div class="panel-body">
	    				<ul class="list-group">
						  <li class="list-group-item"><u>Version</u>: ${r.version}</li>
						  <li class="list-group-item"><u>Date</u>: ${r.date}</li>
						  <li class="list-group-item"><u>Description</u>: ${r.description}</li>
						</ul>
						<a class="btn btn-primary btn-right-r" href="stb/html/${r.id}">voir +</a>
	  				</div>
				</div>
			</div>
			

		</c:forEach>
	</div>
</div>
</section>
<footer>
   <div class="footer-below">
    <div class="container">
        <div class="row">
           <div class="col-lg-12">
              <p>&copy; Saidi Mohamed Salim &amp; Qette Omar 2016</p>
            </div>
        </div>
     </div>
</div>
 </footer>
 <spring:url value="/resources/core/js/classie.js" var="classieJs" />
<spring:url value="/resources/core/js/cbpAnimatedHeader.js" var="cbpAnimatedHeaderJs" />
<spring:url value="/resources/core/js/jquery.js" var="jqueryJs" />
<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${classieJs}"></script>
<script src="${cbpAnimatedHeaderJs}"></script>
</body>
</html>