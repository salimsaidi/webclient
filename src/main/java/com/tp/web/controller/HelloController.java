package com.tp.web.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.StringReader;
import java.text.ParseException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.HttpServletBean;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.web.client.model.MyHttpRequest;
import com.web.client.model.ResumeList;
import com.web.client.model.Stb;
import com.web.client.model.StbList;


@Controller
public class HelloController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Spring 3 MVC Hello World");
		return "hello";

	}

	@RequestMapping(value = "/hello/{name:.+}", method = RequestMethod.GET)
	public ModelAndView hello(@PathVariable("name") String name) {

		ModelAndView model = new ModelAndView();
		model.setViewName("hello");
		model.addObject("msg", name);

		return model;

	}
	
	@RequestMapping(value= "/resume/{type}",method = RequestMethod.GET)
    public ModelAndView resumeType(@PathVariable("type") String type) throws IOException, ParserConfigurationException, SAXException, JAXBException
    {
		ModelAndView model = new ModelAndView();
		MyHttpRequest mhr = new MyHttpRequest();		
		
        if(type.toLowerCase().equals("xml")){
        	String listXml = mhr.httpGetResumeListXml();
			model.addObject("msg", listXml); 

        	model.setViewName("resumeXml");
        }else{
        	ResumeList listObj = mhr.httpGetResumeListObject();
			model.addObject("msg", listObj); 
        	model.setViewName("resume");
        }
        return model;
    }
	
	@RequestMapping("/depot")
    public ModelAndView depot()
    {
		ModelAndView model = new ModelAndView();
		model.setViewName("depot");
		return model;
    }
	
	
    @RequestMapping("/resume")
    public ModelAndView resume() throws IOException, ParserConfigurationException, SAXException, JAXBException
    {
        return resumeType("html");
    } 
    
    
    @RequestMapping(value= "/stb/{type}/{id}",method = RequestMethod.GET)
    public ModelAndView stbType(@PathVariable("type") String type,@PathVariable("id") Integer id ) throws IOException, ParserConfigurationException, SAXException, JAXBException
    {
		ModelAndView model = new ModelAndView();
		MyHttpRequest mhr = new MyHttpRequest();		
		
        if(type.toLowerCase().equals("xml")){
        	String stbXml = mhr.httpGetStbXml(id);
        	
			model.addObject("msg", stbXml); 
        	model.setViewName("resumeXml");
        }else{
        	Stb stbObj = mhr.httpGetStbObject(id);
			model.addObject("msg", stbObj); 
        	model.setViewName("stb");
        }
        return model;
    }
    
    
    
    
    @RequestMapping(value= "/script",method = RequestMethod.POST)
    public ModelAndView script(@RequestParam("data")  String request) throws IOException, JAXBException, org.json.simple.parser.ParseException, JSONException
    {
		
		
		
		//JAXBContext jaxbContext = JAXBContext.newInstance(Stb.class);
    	//Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
    	//String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?><ns2:stb xmlns:ns2=\"http://univ.fr/stb\"><titre>dsfsdfsdfsdsdfsd</titre><version>version 1</version><date>2016-05-04+02:00</date><description>desdeded</description><client><entite>test</entite><ns2:contact><nom>qette</nom><prenom>omar</prenom><adress><adresse>c207 madrillet</adresse><ville>Rouen</ville><Pays>France</Pays></adress></ns2:contact></client><equipe><nom gender=\"true\">Salim</nom><prenom>Saidi</prenom></equipe><fonctionnalite><description>hiuhiuh iuhiuh</description><exigence identifiant=\"omar\"><description>trrrr</description><ns2:priorite>5</ns2:priorite></exigence></fonctionnalite></ns2:stb>";
    	//StringReader reader = new StringReader(request);
    	//Stb stb = (Stb) unmarshaller.unmarshal(reader);
    	//RestTemplate resteTemplate = new RestTemplate();
		//resteTemplate .postForEntity(MyHttpRequest.URI+"depot", stb,Stb.class);7
    	MyHttpRequest myHttpRequest = new MyHttpRequest();
    	String s = myHttpRequest.httpPostStb(request);
		ModelAndView model = new ModelAndView();
		model.addObject("msg", s); 
		model.setViewName("script");
		return model;
		
		
    }
    
    public static void main(String[] args) throws IOException{
    	
    }
    
    
    
    
   
	
	
	

}