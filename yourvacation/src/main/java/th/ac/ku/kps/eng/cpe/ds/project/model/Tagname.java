package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Nov 4, 2023, 2:14:42 PM by Hibernate Tools 5.6.3.Final

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * Tagname generated by hbm2java
 */
public class Tagname implements java.io.Serializable {

	private Integer tagNameId;
	private String name;
	@JsonIgnore
	private List<Tag> tags = new ArrayList<Tag>();

	public Tagname() {
	}

	public Tagname(String name) {
		this.name = name;
	}

	public Tagname(String name, List<Tag> tags) {
		this.name = name;
		this.tags = tags;
	}

	public Integer getTagNameId() {
		return this.tagNameId;
	}

	public void setTagNameId(Integer tagNameId) {
		this.tagNameId = tagNameId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Tag> getTags() {
		return this.tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

}
