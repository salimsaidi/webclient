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
	
	private String uri ="http://www.w3schools.com/xml/note.xml";
	
	/**
	 * 
	 * @param id
	 * @return
	 * @throws IOException
	 * @throws ParserConfigurationException
	 * @throws SAXException
	 * @throws JAXBException
	 */
	public Stb httpGetStb(Integer id) throws IOException, ParserConfigurationException, SAXException, JAXBException {
		JAXBContext context = JAXBContext.newInstance(Stb.class);
		InputStream xml = this.sendGet("resume/" + String.valueOf(id));
		Unmarshaller un = context.createUnmarshaller();
		Stb stb = (Stb) un.unmarshal(xml);
		return stb;
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
	public StbList httpGetStbList() throws JAXBException, IOException, ParserConfigurationException, SAXException{
		JAXBContext context = JAXBContext.newInstance(StbList.class);
		InputStream xml = this.sendGet("resume");
		Unmarshaller un = context.createUnmarshaller();
		StbList listStb = (StbList) un.unmarshal(xml);
		return listStb;
	}
	
	
	public String httpPostStb(String xml) throws IOException{
		String response = this.sendPost("depot", xml);
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
		URL url = new URL(this.uri+"/"+param);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");
		connection.setRequestProperty("Accept", "application/xml");
		return connection.getInputStream();
//		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//		DocumentBuilder db = dbf.newDocumentBuilder();
//		Document doc = db.parse(xml);
//		return doc;
	}
	
	
	private String sendPost(String param,String xml) throws IOException {
		// Create the HTTPS Client
		 HttpClient httpclient = new HttpClient();
		 // creates the post method to use.
		 PostMethod post = new PostMethod( uri+"/"+param );
		 
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
		
	public void setUrl(String uri){
		this.uri = uri;
	}

}
