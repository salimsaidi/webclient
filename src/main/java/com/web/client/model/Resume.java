package com.web.client.model;

import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.datatype.XMLGregorianCalendar;

@XmlRootElement(name = "resume")
@XmlAccessorType(XmlAccessType.NONE)
public class Resume {
	
	@XmlElement(required = true)
	protected Integer id;
	@XmlElement(required = true)
	protected String titre;
	@XmlElement(required = true, defaultValue = "0.1")
	protected String version;
	@XmlElement(required = true)
	@XmlSchemaType(name = "date")
	protected Date date;
	@XmlElement(required = true)
	protected String description;
	
	
	public Resume() {
		super();
	}
	public Resume(Integer id,String titre, String version, Date date, String description) {
		super();
		this.id = id;
		this.titre = titre;
		this.version = version;
		this.date = date;
		this.description = description;
	}
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	

}
