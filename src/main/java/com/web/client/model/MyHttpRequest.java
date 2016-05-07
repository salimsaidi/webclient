package com.web.client.model;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class MyHttpRequest {
	
	public static final String URI ="http://heroku-postgres-d6dd6dc6.herokuapp.com/";
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws JAXBException
	 */
	public Stb httpGetStbObject(Integer id) throws IOException, ParserConfigurationException, SAXException, JAXBException {
		JAXBContext context = JAXBContext.newInstance(Stb.class);
		InputStream xml = this.sendGet("resume/" + id);
		Unmarshaller un = context.createUnmarshaller();
		if(xml.available()!=0){
			Stb stb = (Stb) un.unmarshal(xml);
			return stb;
		}
		return null;
		
	}
	
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws JAXBException
	 */
	public String httpGetStbXml(Integer id) throws IOException, ParserConfigurationException, SAXException, JAXBException {
		InputStream xml = this.sendGet("resume/" + id);
		StringBuilder sb=new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(xml));
		String read;
		while((read=br.readLine()) != null) {
		    sb.append(read);   
		}
		br.close();
		return sb.toString();
	}
	
	/**
	 * Retourn toute les Stb
	 * 
	 * @return
	 * @throws JAXBException
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 */
	public ResumeList httpGetResumeListObject() throws JAXBException, IOException, ParserConfigurationException, SAXException{
		JAXBContext context = JAXBContext.newInstance(ResumeList.class);
		InputStream xml = this.sendGet("resume");
		Unmarshaller un = context.createUnmarshaller();
		ResumeList resumeList = (ResumeList) un.unmarshal(xml);
		return resumeList;
	}
	
	public String httpGetResumeListXml() throws JAXBException, IOException, ParserConfigurationException, SAXException{
		InputStream xml = this.sendGet("resume");
		StringBuilder sb=new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(xml));
		String read;
		while((read=br.readLine()) != null) {
		    sb.append(read);   
		}
		br.close();
		return sb.toString();
	}
	
	
	public String httpPostStb(String xml) throws IOException{
		String response = this.sendPost("depotstb/", xml);
		return response;
	}
	
	
	
	
	
	
	
	
	
	
	/*
	 * -------------------------------------------------------------------------------------------------------------
	 * Methode POST et GET
	 * --------------------------------------------------------------------------------------------------------------
	 */
	
	
	/**
	 * 
	 * @param param
	 * @return
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws JAXBException
	 */
	private InputStream sendGet(String param) throws IOException, ParserConfigurationException, SAXException, JAXBException{
		URL url = new URL(MyHttpRequest.URI+param);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setRequestProperty("Accept", "application/xml");
		return connection.getInputStream();
	}
	
	
	private String sendPost(String param,String xml) throws IOException {
		// Create the HTTPS Client
		 HttpClient httpclient = new HttpClient();
		 // creates the post method to use.
		 PostMethod post = new PostMethod(MyHttpRequest.URI+param );
		 
		 post.setRequestEntity( new StringRequestEntity(xml, "text/xml", "ISO-8859-1") );
		 // Specify content type and encoding
		 // If content encoding is not explicitly specified
		 // ISO-8859-1 is assumed
		 post.setRequestHeader(
		         "Content-type", "text/xml; charset=ISO-8859-1");
		 // execute method and handle any error responses.
		 httpclient.executeMethod(post);
		 
		 // read the response
		 InputStream in = post.getResponseBodyAsStream();
		 
		 BufferedReader reader = new BufferedReader( new InputStreamReader( in ) );
		 String line;
		 StringBuffer buffer = new StringBuffer();
		 while( ( line = reader.readLine() ) != null ) {
		     buffer.append( line );
		     buffer.append( "\n" );
		 }
		 // clean everything
		 reader.close();
		 //Now 'buffer' contains the resonse
		
		return buffer.toString();

	}
		
	

}
