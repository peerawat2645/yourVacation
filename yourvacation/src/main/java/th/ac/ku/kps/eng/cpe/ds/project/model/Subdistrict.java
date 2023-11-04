package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Nov 4, 2023, 2:14:42 PM by Hibernate Tools 5.6.3.Final

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Subdistrict generated by hbm2java
 */
public class Subdistrict implements java.io.Serializable {

	private Integer subdistrictId;
	@JsonIgnore
	private District district;
	private String name;
	@JsonIgnore
	private List<Vacation> vacations = new ArrayList<Vacation>();
	@JsonIgnore
	private List<Hotel> hotels = new ArrayList<Hotel>();

	public Subdistrict() {
	}

	public Subdistrict(District district, String name) {
		this.district = district;
		this.name = name;
	}

	public Subdistrict(District district, String name, List<Vacation> vacations, List<Hotel> hotels) {
		this.district = district;
		this.name = name;
		this.vacations = vacations;
		this.hotels = hotels;
	}

	public Integer getSubdistrictId() {
		return this.subdistrictId;
	}

	public void setSubdistrictId(Integer subdistrictId) {
		this.subdistrictId = subdistrictId;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Vacation> getVacations() {
		return this.vacations;
	}

	public void setVacations(List<Vacation> vacations) {
		this.vacations = vacations;
	}

	public List<Hotel> getHotels() {
		return this.hotels;
	}

	public void setHotels(List<Hotel> hotels) {
		this.hotels = hotels;
	}

}
