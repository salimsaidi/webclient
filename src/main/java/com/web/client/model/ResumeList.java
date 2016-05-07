package com.web.client.model;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
@XmlRootElement(name="resumes")
public class ResumeList {


		
		@XmlElement(name="resume")
		private List<Resume> resumes = new ArrayList<Resume>();
		
		private int nbStb;
		

		public ResumeList() {
			super();
		}

		public List<Resume> getResume() {
			return resumes;
		}

		@XmlElement(required = true,name = "resume")
		public void setResume(ArrayList<Resume> resume) {
			this.resumes = resumes;
		}
		
		
		public void add(Resume resume) {
			this.resumes.add(resume);
		}

		public int getNbStb() {
			return nbStb;
		}

		public void setNbStb(int nbStb) {
			this.nbStb = nbStb;
		}
		
		

}
