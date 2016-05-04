package com.web.client.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlList;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name="stbs")
public class StbList {
	
	@XmlElement(name="stb")
	private List<Stb> stbs = new ArrayList<Stb>();
	
	public StbList(){
		
	}

	public List<Stb> getStbs() {
		return stbs;
	}

	@XmlElement(required = true,name = "stb")
	public void setStbs(ArrayList<Stb> stbs) {
		this.stbs = stbs;
	}
	
	
	public void add(Stb stb) {
		this.stbs.add(stb);
	}
	

}
