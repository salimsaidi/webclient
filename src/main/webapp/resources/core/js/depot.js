var clients = [];
var equipes = [];
var foncs   = [];
var exs   = [];
$(function() {
$("#addEquipe").click(function(e){
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


$("#addExigence").click(function(e){
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


$("#addFonctionnalite").click(function(e){
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


/*
*******************Remove
*/


$("#listEquipe").on("click",".remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(clients,index);
	$(this).parent().remove();
});

$("#listExigence").on("click",".remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(exs,index);
	$(this).parent().remove();
});

$("#listFonctionnalite").on("click",".remove",function(e){
	e.preventDefault();
	var index = $(this).data("id");
	deleteFrom(foncs,index);
	$(this).parent().remove();
});


/**
Valider et envoyer la Stb
*/
$("#valideStb").click(function(e){
	e.preventDefault();
	setLoader();
	return;
	var xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>";
	xml += "<ns2:stb xmlns:ns2=\"http://univ.fr/stb\">";

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
 	xml += "<ns2:contact><nom>"+nomClient+"</nom><prenom>"+prenomClient+"</prenom>";
 	xml += "<adress><adresse>"+adressClient+"</adresse><ville>"+villeClient+"</ville><codePostal>"+codePostalClient+"</codePostal><Pays>"+paysClient+"</Pays></adress></ns2:contact></client>";

	//Equipe
	for (var i = equipes.length - 1; i >= 0; i--) {
		var gender = (equipes[i].gender === "homme");
		xml += "<equipe><nom gender=\""+gender+"\">"+equipes[i].nom+"</nom><prenom>"+equipes[i].prenom+"</prenom></equipe>";
	}

	//fonctionalité
	for (var i = foncs.length - 1; i >= 0; i--) {
		var xmlExigence = ""
		for (var j = 0;j<foncs[i].exigences.length ; j++) {
			xmlExigence +="<exigence identifiant=\""+foncs[i].exigences[j].id+"\"><description>"+foncs[i].exigences[j].desc+"</description><ns2:priorite>"+foncs[i].exigences[j].pr+"</ns2:priorite></exigence>";
		}
		xml += "<fonctionnalite><description>"+foncs[i].desc+"</description><ns2:priorite>"+foncs[i].pr+"</ns2:priorite>" + xmlExigence +"</fonctionnalite>";
	}

	xml += "</ns2:stb>";


	//setLoader();
	console.log(xml);





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

function displayError(){
toastr.options = {
  "closeButton": true,
  "positionClass": "toast-bottom-full-width",
}
toastr.error('Are you the 6 fingered man?');

}

function displaySuccess(){
toastr.options = {
  "closeButton": true,
  "positionClass": "toast-bottom-full-width",
}
toastr.success('Are you the 6 fingered man?');

}


function setLoader(){
	$(".form-horizontal").html($(".form-horizontal").html() + "<div class=\"loader\"><p>Envoi</p></div>");
}

function removeLoader(){
	$(".loader").remove().show('slow');
}



