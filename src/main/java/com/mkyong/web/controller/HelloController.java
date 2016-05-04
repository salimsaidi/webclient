package com.mkyong.web.controller;

import java.io.IOException;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.web.client.model.MyHttpRequest;


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
		//TODO : Executer la requete GET Resume....
		model.addObject("msg", ""); //TODO : ajouter l'objet
		
		
        if(type.toLowerCase().equals("xml")){
        	MyHttpRequest mhr = new MyHttpRequest();
        	 //TODO : ajouter l'objet
        	model.setViewName("resumeXml");
        }else{
        	model.setViewName("resume");
        }
        return model;
    }
	
	@RequestMapping(value= "/addstb",method = RequestMethod.POST)
    public boolean addstb(@RequestBody String request)
    {
		
		return true;
		
    }
	
	
    @RequestMapping("/resume")
    public ModelAndView resume() throws IOException, ParserConfigurationException, SAXException, JAXBException
    {
        return resumeType("html");
    }    
    
   
	
	
	

}