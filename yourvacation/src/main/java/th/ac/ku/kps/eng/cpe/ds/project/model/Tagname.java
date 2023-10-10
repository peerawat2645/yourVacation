package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Oct 7, 2023, 10:27:50 PM by Hibernate Tools 5.6.3.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Tagname generated by hbm2java
 */
public class Tagname implements java.io.Serializable {

	private Integer tagNameId;
	private String name;
	private Set tags = new HashSet(0);

	public Tagname() {
	}

	public Tagname(String name) {
		this.name = name;
	}

	public Tagname(String name, Set tags) {
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

	public Set getTags() {
		return this.tags;
	}

	public void setTags(Set tags) {
		this.tags = tags;
	}

}