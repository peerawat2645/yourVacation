package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Nov 5, 2023, 3:52:08 AM by Hibernate Tools 5.6.3.Final

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Facilitiesname generated by hbm2java
 */
public class Facilitiesname implements java.io.Serializable {

	private Integer facilitiesNameId;
	private String name;
	private List<Facilities> facilitieses = new ArrayList<Facilities>();

	public Facilitiesname() {
	}

	public Facilitiesname(String name) {
		this.name = name;
	}

	public Facilitiesname(String name, List<Facilities> facilitieses) {
		this.name = name;
		this.facilitieses = facilitieses;
	}

	public Integer getFacilitiesNameId() {
		return this.facilitiesNameId;
	}

	public void setFacilitiesNameId(Integer facilitiesNameId) {
		this.facilitiesNameId = facilitiesNameId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Facilities> getFacilitieses() {
		return this.facilitieses;
	}

	public void setFacilitieses(List<Facilities> facilitieses) {
		this.facilitieses = facilitieses;
	}

}