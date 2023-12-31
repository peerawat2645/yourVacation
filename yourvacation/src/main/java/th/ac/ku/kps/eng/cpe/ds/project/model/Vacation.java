package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Nov 4, 2023, 2:14:42 PM by Hibernate Tools 5.6.3.Final

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Vacation generated by hbm2java
 */
public class Vacation implements java.io.Serializable {

	private Integer vacationId;
	@JsonIgnore
	private Subdistrict subdistrict;
	private String name;
	private String description;
	private String address;
	private String tagName;
	@JsonIgnore
	private List<Tag> tags = new ArrayList<Tag>();
	@JsonIgnore
	private List<Imgvacation> imgvacations = new ArrayList<Imgvacation>();

	public Vacation() {
	}

	public Vacation(Subdistrict subdistrict, String name, String description, String address, String tagName) {
		this.subdistrict = subdistrict;
		this.name = name;
		this.description = description;
		this.address = address;
		this.tagName = tagName;
	}

	public Vacation(Subdistrict subdistrict, String name, String description, String address, String tagName, List<Tag> tags,
			List<Imgvacation> imgvacations) {
		this.subdistrict = subdistrict;
		this.name = name;
		this.description = description;
		this.address = address;
		this.tagName = tagName;
		this.tags = tags;
		this.imgvacations = imgvacations;
	}

	public Integer getVacationId() {
		return this.vacationId;
	}

	public void setVacationId(Integer vacationId) {
		this.vacationId = vacationId;
	}

	public Subdistrict getSubdistrict() {
		return this.subdistrict;
	}

	public void setSubdistrict(Subdistrict subdistrict) {
		this.subdistrict = subdistrict;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTagName() {
		return this.tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public List<Tag> getTags() {
		return this.tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Imgvacation> getImgvacations() {
		return this.imgvacations;
	}

	public void setImgvacations(List<Imgvacation> imgvacations) {
		this.imgvacations = imgvacations;
	}

}
