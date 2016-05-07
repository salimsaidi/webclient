<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
		<a class="navbar-brand" href="#">Projet Web</a>
	</div>
  </div>
</nav>

 
<section class="success" id="about">
        
   <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>STB</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                     <h3>Résumé des Stb</h3>
                      <p>Affiche sous forme résumée, la liste des STB enregistrées.Pour chaque STB, le résumé présente les informations d'en-tête,</p>
                      <a href="resume/xml" class="btn btn-lg btn-outline">
                        <i class="fa fa-code"></i> En XML
                    </a>
                    <a href="resume" class="btn btn-lg btn-outline">
                        <i class="fa fa-html5"></i>En HTML
                    </a>
                </div>
                <div class="col-md-4">
                    <h3>Affihcer une STB complète</h3>
                    <p>Affiche le contenu complet de la STB dont l'identifiant : 
                    <input type="text" name="id" id="id" maxlength="3" value="0" /></p>
                    <a href="#" class="btn btn-lg btn-outline btnstb-xml">
                        <i class="fa fa-code"></i> En XML
                    </a>
                    <a href="#" class="btn btn-lg btn-outline btnstb-html">
                        <i class="fa fa-html5"></i>En HTML
                    </a>
                </div>
                <div class="col-md-4">
                   <h3>Ajouter une nouvelle STB</h3>
                    <p>Dépose une nouvelle STB. Une vérification syntaxique du contenu est effectuée, afin de n'autoriser que des dépôts corrects (validation XSD par le service).</p>
                    <a href="depot" class="btn btn-lg btn-outline">
                        <i class="fa fa-plus"></i> Ajouter
                    </a>
                    
                </div>
                
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
 
<spring:url value="/resources/core/js/jquery.js" var="jqueryJs" />
<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/resources/core/js/jqBootstrapValidation.js" var="bootvalJs" />
<spring:url value="/resources/core/js/hello.js" var="helloJs" />
 
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${bootvalJs}"></script>
<script src="${helloJs}"></script>
</body>
</html>