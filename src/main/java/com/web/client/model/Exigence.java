package com.web.client.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>Java class for anonymous complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element name="description" type="{http://www.w3.org/2001/XMLSchema}string"/>
 *         &lt;element ref="{http://univ.fr/stb}priorite"/>
 *       &lt;/all>
 *       &lt;attribute name="identifiant" use="required" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlRootElement(name = "exigence")
@XmlAccessorType(XmlAccessType.NONE)
public class Exigence {

    @XmlElement(required = true)
    protected String description;
    
    @XmlElement
    protected int priorite;
    
    @XmlAttribute(name = "identifiant", required = true)
    protected String identifiant;
    
    
    public Exigence() {
		super();
	}

	public Exigence(String description, int priorite, String identifiant) {
		super();
		this.description = description;
		this.priorite = priorite;
		this.identifiant = identifiant;
	}
	
	
	
	
	
	
	/**
     * Gets the value of the description property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDescription() {
        return description;
    }

    /**
     * Sets the value of the description property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDescription(String value) {
        this.description = value;
    }

    /**
     * Gets the value of the priorite property.
     * 
     */
    public int getPriorite() {
        return priorite;
    }

    /**
     * Sets the value of the priorite property.
     * 
     */
    public void setPriorite(int value) {
        this.priorite = value;
    }

    /**
     * Gets the value of the identifiant property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
	
    public String getIdentifiant() {
        return identifiant;
    }

    /**
     * Sets the value of the identifiant property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setIdentifiant(String value) {
        this.identifiant = value;
    }

}
