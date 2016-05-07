var clients = [];
var equipes = [];
var foncs   = [];
var exs   = [];
var comms   = [];
$(function() {
$("#about").on("click","#addEquipe", function(e){
	e.preventDefault();
	var nom = $("#nomEquipe").val();
	var prenom = $("#prenomEquipe").val();
	var gender = $("#genreEquipe:checked").val();
	if(!nom || nom.trim().length === 0) return;
	if(gender === undefined) return;
	$("#nomEquipe").val("");
	$("#prenomEquipe").val("");
	$("#genreEquipe").val("");
	var e = {
		nom     : remove_tags(nom),
		prenom  : remove_tags(prenom),
		gender : gender,
		}
	equipes.push(e);

	$("#listEquipe").html("");
	for (var i = equipes.length - 1; i >= 0; i--) {
		$("#listEquipe").append(getItem(i,equipes[i].nom,equipes[i].prenom));
	}
});

$("#about").on("click","#addExigence", function(e){
	e.preventDefault();
	var desc = $("#descExigence").val();
	var pr = $("#prioriteExigence").val();
	var id = $("#idExigence").val();
	if(!desc || desc.trim().length === 0) return;
	if(!pr || pr.trim().length === 0) return;
	$("#descExigence").val("");
	$("#prioriteExigence").val("");
	$("#idExigence").val("");
	var e = {
		id : id,
		desc     : remove_tags(desc),
		pr  : pr
		}
	exs.push(e);
	$("#listExigence").html("");
	for (var i = exs.length - 1; i >= 0; i--) {
		$("#listExigence").append(getItem(i,exs[i].desc,exs[i].pr));
	}
});

$("#about").on("click","#addFonctionnalite", function(e){
	e.preventDefault();
	var pr = $("#priorite").val();
	var desc = $("#descFonc").val();
	if(!desc || desc.trim().length === 0) return;
	if(!pr || pr.trim().length === 0) return;
	$("#descFonc").val("");
	$("#priorite").val("");
	var e = {
		desc     : remove_tags(desc),
		pr  : pr,
		exigences : exs
		}
	foncs.push(e);
	exs = [];
	$("#listFonctionnalite").html("");
	for (var i = foncs.length - 1; i >= 0; i--) {
		$("#listFonctionnalite").append(getItem(i,foncs[i].desc,foncs[i].pr));
	}
	//Reinitialiser exigence
	$('#listExigence').html('');
	$("#descExigence").val("");
	$("#prioriteExigence").val("");
	$("#idExigence").val("");
});

$("#about").on("click","#addComm", function(e){
	e.preventDefault();
	var txt = $("#comm").val();
	if(!txt || txt.trim().length === 0) return;
	$("#comm").val("");
	comms.push(remove_tags(txt));
	$("#listComm").html("");
	for (var i = comms.length - 1; i >= 0; i--) {
		$("#listComm").append(getItem(i,comms[i]),"");
	}
});


/*
*******************Remove
*/


$("#about").on("click","#listEquipe .remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(clients,index);
	$(this).parent().remove();
});

$("#about").on("click","#listExigence .remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(exs,index);
	$(this).parent().remove();
});

$("#about").on("click","#listFonctionnalite .remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(foncs,index);
	$(this).parent().remove();
});

$("#about").on("click","#listComm .remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(comms,index);
	$(this).parent().remove();
});


/**
Valider et envoyer la Stb
*/
$("body").on("click","#valideStb",function(e){
	e.preventDefault();
	
	var xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>";
	xml += "<stb>";

	//Informations Stb
	var titre = $("#titre").val();
	var version = $("#version").val();
	var date = $("#date").val();
	var description = $("#description").val();
	var entite = $("#entite").val();
	var nomClient = $("#nomClient").val();
	var prenomClient = $("#prenomClient").val();
	var adressClient = $("#adressClient").val();
	var villeClient = $("#villeClient").val();
	var codePostalClient = $("#codePostalClient").val();
	var paysClient = $("#paysClient").val();

	xml += "<titre>"+titre+"</titre><version>"+version+"</version>";
	xml += "<date>"+date+"</date><description>"+description+"</description>";
 	xml += "<client><entite>"+entite+"</entite>";
 	xml += "<contact><nom>"+nomClient+"</nom><prenom>"+prenomClient+"</prenom>";
 	xml += "<adress><adresse>"+adressClient+"</adresse><ville>"+villeClient+"</ville><codePostal>"+codePostalClient+"</codePostal><Pays>"+paysClient+"</Pays></adress></contact></client>";

	//Equipe
	for (var i = equipes.length - 1; i >= 0; i--) {
		equipes[i].gender = (equipes[i].gender === "false")?"false":"true";
		xml += "<equipe><nom gender=\""+equipes[i].gender+"\">"+equipes[i].nom+"</nom><prenom>"+equipes[i].prenom+"</prenom></equipe>";
	}

	//fonctionalité
	for (var i = foncs.length - 1; i >= 0; i--) {
		var xmlExigence = ""
		for (var j = 0;j<foncs[i].exigences.length ; j++) {
			xmlExigence +="<exigence identifiant=\""+foncs[i].exigences[j].id+"\"><description>"+foncs[i].exigences[j].desc+"</description><priorite>"+foncs[i].exigences[j].pr+"</priorite></exigence>";
		}
		xml += "<fonctionnalite><description>"+foncs[i].desc+"</description><priorite>"+foncs[i].pr+"</priorite>" + xmlExigence +"</fonctionnalite>";
	}

	//commentaire
	for (var i = comms.length - 1; i >= 0; i--) {
		xml += "<commentaire>"+comms[i]+"</commentaire>";
	}

	xml += "</stb>";

	console.log(xml);

	setLoader();

	

	var request = $.ajax({
	  url: "script",
	  method: "POST",
	  data: {data : xml}, 	
	  dataType: "html"
	});
	 
	request.done(function( msg ) {
		if(msg.trim() === "true"){
			displaySuccess("la stb a bien été validée et enregistrée !");
		}
		else
		if(msg.trim() === ""){
			displayError("stb incorecte");
		}
		else{
			displayError(msg);
		}
	  
	});
	 
	request.fail(function( jqXHR, textStatus ) {
	  displayError( "Request failed !" );
	});	

	request.always(function() {
    	removeLoader();
  	});


  	//initform();

});



});


function getItem(index,nom, prenom){
	return  "<li data-id='"+ index +"' class='list-group-item'><a href='#' class='remove' title='Supprimer'><i class='btn-right fa fa-times'></i></a>"+ nom +" "+ prenom+"</li>";
}


function deleteFrom(arr,index){
	arr.splice(index, 1);
}

function remove_tags(html)
{
       var tmp = document.createElement("DIV");
       tmp.innerHTML = html; 
       return tmp.textContent||tmp.innerText; 
}

function displayError(msg){
toastr.options = {
  "closeButton": true,
  "positionClass": "toast-bottom-full-width",
}
toastr.error(msg);

}

function displaySuccess(msg){
toastr.options = {
  "closeButton": true,
  "positionClass": "toast-bottom-full-width",
}
toastr.success(msg);

}


function setLoader(){
	$("#valideStb").prop('disabled', true);
	$(".form-horizontal").html($(".form-horizontal").html() + "<div class=\"loader\"><p>Envoi</p></div>");
}

function removeLoader(){
	$("#valideStb").prop('disabled', false);
	$(".loader").remove().show('slow');
}

function initform(){
	clients=[];equipes=[];foncs=[];exs=[];comms=[];
	("#about ul").html("<i>Aucune</i>");
	$("input,textarea").val("");
}

