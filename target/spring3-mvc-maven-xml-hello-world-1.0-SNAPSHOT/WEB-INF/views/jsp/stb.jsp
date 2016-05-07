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
<style type="text/css">
.list-group-item{
	font-size: 1.1em;
}
</style>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
  <div class="navbar-header">
    <a class="navbar-brand" href="#">Détail STB</a>
  </div>
  </div>
</nav>
<section class="success" id="about">
<c:choose>
	<c:when test="${empty msg}">
	    <h4 style="text-align: center;">stb n'existe pas</h4>
	</c:when>
<c:otherwise>
<div class="row">
        <div class="col-lg-12 text-center">
            <h3>${msg.titre}</h3>
            <hr class="star-light">
        </div>
    </div>
<!-- variable -->
<c:set var="equipeList" value="${msg.equipe}" />
<c:set var="fonctionnaliteList" value="${msg.fonctionnalite}" />
<c:set var="commentList" value="${msg.commentaire}" />

<div class="container">
	<div class="row">

		<div class="panel panel-primary">
	  				<div class="panel-heading">Informations STB</div>
	  				<div class="panel-body">
	    				<ul class="list-group">
						  <li class="list-group-item"><span class="h">Titre</span>: ${msg.titre}</li>
						  <li class="list-group-item"><span class="h">Version</span>: ${msg.version}</li>
						  <li class="list-group-item"><span class="h">Date</span>: ${msg.date}</li>
						  <li class="list-group-item"><span class="h">Description</span>: ${msg.description}</li>
						  <li class="list-group-item"><span class="h">Client</span>: ${msg.client.entite}<br/>
						  	<span class="h">Contact :</span>
						  	<ul class="list-group">
						  		<c:set var="contact" value="${msg.client.contact}" />
						  		<li class="list-group-item"><u>Nom</u>: ${contact.nom}</li>
							  	<li class="list-group-item"><u>Prénom</u>: ${contact.prenom}</li>
							  	<li class="list-group-item"><u>Adresse</u>: ${contact.adress.adresse} ${contact.adress.ville} ${contact.adress.codePostal}, ${contact.adress.ville} </li>
						  	</ul>
						  </li>
						</ul>
	  				</div>
		</div>

		<div class="panel panel-primary">
	  				<div class="panel-heading">equipe</div>
	  				<div class="panel-body">
		  				<c:forEach var="e" items="${equipeList}" >
		  					<ul class="list-group">
		  						<li class="list-group-item"><span class="h">Nom</span>: ${e.nom.value}</li>
		  						<li class="list-group-item"><span class="h">Prénom</span>: ${e.prenom}</li>
		  					</ul>
		  				</c:forEach>
	  				</div>
		</div>


		<div class="panel panel-primary">
	  				<div class="panel-heading">fonctionalité</div>
	  				<div class="panel-body">
		  				<c:forEach var="f" items="${fonctionnaliteList}" >
		  					<ul class="list-group">
		  						<li class="list-group-item"><span class="h">priorité</span>: ${f.priorite}</li>
		  						<li class="list-group-item"><span class="h">Description</span>: ${f.description}</li>
		  						<li class="list-group-item"><span class="h">exigences</span>: 
		  							<c:forEach var="e" items="${f.exigence}" >
		  							<ul class="list-group">
								  		<li class="list-group-item"><u>Identifiant</u>: ${e.identifiant}</li>
									  	<li class="list-group-item"><u>priorite</u>: ${e.priorite}</li>
									  	<li class="list-group-item"><u>Description</u>: ${e.description}</li>
								  	</ul>
								  	</c:forEach>

		  						</li>
		  					</ul>
		  				</c:forEach>
	  				</div>

		</div>
		<div class="panel panel-primary">
	  				<div class="panel-heading">Commentaire</div>
	  				<div class="panel-body">
		  				<c:forEach var="c" items="${commentList}" >
		  					<ul class="list-group">
		  						<li class="list-group-item"> ${c}</li>
		  					</ul>
		  				</c:forEach>
	  				</div>
		</div>
		
		
	</div>

</div>
</c:otherwise>
</c:choose>
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