<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
<title>Depot Stb</title>
 
<meta charset="UTF-8">
<spring:url value="/resources/core/css/style.css" var="styleCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<spring:url value="/resources/core/font-awesome/css/font-awesome.min.css" var="fontAwsomeCss" />
<spring:url value="/resources/core/css/toastr.css" var="toastrCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${styleCss}" rel="stylesheet" />
<link href="${fontAwsomeCss}" rel="stylesheet" />
<link href="${fontAwsomeCss}" rel="stylesheet" />
<link href="${toastrCss}" rel="stylesheet" />
</head>
 <body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
  <div class="navbar-header">
    <a class="navbar-brand" href="#">Ajout STB</a>
  </div>
  </div>
</nav>

 
<section class="success" id="about">
        
   <div class="container">
     <div class="row">     

     <!--=================================================
        Informations STB 
        ===================================================-->
        <form class="form-horizontal">
          <div class="panel panel-primary">
          <div class="panel-heading">Informations STB</div>
            <!-- Titre -->
            <div class="panel-body">
          <div class="form-group">
            <label for="titre" class="col-sm-2 control-label">Titre</label>
            <div class="col-sm-4">
              <input type="text" class="form-control" id="titre" placeholder="Titre">
            </div>
          </div>
          <!-- Version -->
          <div class="form-group">
            <label for="version" class="col-sm-2 control-label">Version</label>
            <div class="col-sm-2">
              <input type="number" class="form-control" id="version" placeholder="Version">
            </div>
          </div>
          <!-- Date -->
          <div class="form-group">
            <label for="datet" class="col-sm-2 control-label">Date</label>
            <div class="col-sm-3">
              <input type="date" class="form-control" id="date" placeholder="Date">
            </div>
          </div>
          <!-- Description -->
          <div class="form-group">
            <label for="descriptionStb" class="col-sm-2 control-label">Description</label>
            <div class="col-sm-3">
              <textarea class="form-control" id="description" placeholder="descriptionStb"></textarea>
            </div>
          </div>
        </div>
      </div>  


      <!--=================================================
        Client
        ===================================================-->
      <div class="panel panel-primary">
          <div class="panel-heading">Client</div>
            <!-- Titre -->
            <div class="panel-body">
              <div class="form-group">
                <label for="entite" class="col-sm-2 control-label">Nom de l'entité</label>
                <div class="col-sm-4">
                  <input type="text" class="form-control" id="entite">
                </div>
              </div>
              <div class="form-group">
                    <label for="nomClient" class="col-sm-2 control-label">Nom</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="nomClient">
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="prenomClient" class="col-sm-2 control-label">Prénom</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="prenomClient">
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="adressClient" class="col-sm-2 control-label">Adresse</label>
                    <div class="col-sm-8">
                      <input type="text" class="form-control" id="adressClient">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="villeClient" class="col-sm-2 control-label">Ville</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="villeClient">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="codePostalClient" class="col-sm-2 control-label">Code Postal</label>
                    <div class="col-sm-3">
                      <input type="number" class="form-control" id="codePostalClient">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="paysClient" class="col-sm-2 control-label">Pays</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control" id="paysClient">
                    </div>
                  </div> 
                </div>
          
          </div>  
    


      <!--=================================================
        Equipe
        ===================================================-->
      <div class="panel panel-primary">
          <div class="panel-heading">Equipe</div>
            <!-- Titre -->
            <div class="panel-body">
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="nomEquipe" class="col-sm-2 control-label">Nom</label>
                    <div class="col-sm-7">
                      <input type="text" class="form-control" id="nomEquipe">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="prenomEquipe" class="col-sm-2 control-label">Prénom</label>
                    <div class="col-sm-7">
                      <input type="text" class="form-control" id="prenomEquipe">
                    </div>
                  </div>
                   <div class="form-group">
                    <label for="genreEquipe" class="col-sm-2 control-label">Genre</label>
                    <div class="col-sm-7">
                      <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="genreEquipe" value="true">Homme
                      </label>
                      <label class="radio-inline">
                        <input type="radio" name="inlineRadioOptions" id="genreEquipe" value="false">Femme
                      </label>
                  </div>
                  </div>
                  <button class="btn btn-outline center-block" id="addEquipe">Ajouter</button>
                </div>
                <div class="col-md-4">
                  <h5>Liste membres</h5>
                  <ul class="list-group" id="listEquipe">
                    <i>Aucune</i> 
                  </ul>
                </div>
            </div>
      </div>




      <!--=================================================
        Fonctionnalité
        ===================================================-->
      <div class="panel panel-primary">
          <div class="panel-heading">Fonctionnalité</div>
            <!-- Titre -->
            <div class="panel-body">
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="priorite" class="col-sm-2 control-label">Priorité</label>
                    <div class="col-sm-3">
                      <input type="number" class="form-control" id="priorite">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="descFonc" class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-7">
                      <textarea class="form-control" id="descFonc"></textarea> 
                    </div>
                  </div>
                  <!--///////////////////\\\\\\\\\\\\\\\\\\\-->
                  <div class="panel panel-success">
                <div class="panel-heading">Exigences</div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-md-8">
                        <div class="form-group">
                          <label for="idExigence" class="col-sm-3 control-label">identifiant</label>
                          <div class="col-sm-5">
                            <input type="text" class="form-control" id="idExigence">
                          </div>
                        </div>
                        <div class="form-group">
                          <label for="descExigence" class="col-sm-3 control-label">Description</label>
                          <div class="col-sm-7">
                            <textarea class="form-control" id="descExigence"></textarea>
                          </div>
                        </div>
                         <div class="form-group">
                          <label for="prioriteExigence" class="col-sm-3 control-label">Priorité</label>
                          <div class="col-sm-3">
                            <input type="number" class="form-control" id="prioriteExigence">
                          </div>
                        </div>
                        
                        <button class="btn btn-outline center-block" id="addExigence">Ajouter exigence</button>
                      </div>
                      <div class="col-md-4">
                        <h5>Liste des exigences</h5>
                        <ul class="list-group" id="listExigence">
                          <i>Aucune</i>
                        </ul>
                        </div>

                    </div>
                    
                </div>
          
          </div>  
                  <button class="btn btn-outline center-block" id="addFonctionnalite">Ajouter</button>
                </div>
                <div class="col-md-4">
                  <h5>Liste des fonctionnalités</h5>
                  <ul class="list-group" id="listFonctionnalite">
                          <i>Aucune</i>
                  </ul>
                </div>
            </div>
      </div>


      <!--=================================================
        commentaires
        ===================================================-->
      <div class="panel panel-primary">
          <div class="panel-heading">commentaire</div>
            <!-- Titre -->
            <div class="panel-body">
                <div class="col-md-8">
                  <div class="form-group">
                    <label for="comm" class="col-sm-2 control-label">texte</label>
                    <div class="col-sm-7">
                      <input type="text" class="form-control" id="comm">
                    </div>
                  </div>
                  <button class="btn btn-outline center-block" id="addComm">Ajouter</button>
                </div>
                <div class="col-md-4">
                  <h5>Liste commentaires</h5>
                  <ul class="list-group" id="listComm">
                    <i>Aucun</i> 
                  </ul>
                </div>
            </div>
      </div>





      <button id="valideStb" class="btn btn-primary center-block">Valider et envoyer</button>
      
    </form> 
 
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
<spring:url value="/resources/core/js/classie.js" var="classieJs" />
<spring:url value="/resources/core/js/cbpAnimatedHeader.js" var="cbpAnimatedHeaderJs" />
<spring:url value="/resources/core/js/depot.js" var="depotJs" />
<spring:url value="/resources/core/js/toastr.min.js" var="toastrJs" />
 
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="${bootvalJs}"></script>
<script src="${classieJs}"></script>
<script src="${cbpAnimatedHeaderJs}"></script>
<script src="${depotJs}"></script>
<script src="${toastrJs}"></script>

</body>
</html>