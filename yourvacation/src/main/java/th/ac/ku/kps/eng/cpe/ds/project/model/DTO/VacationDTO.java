package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

import java.util.List;

import th.ac.ku.kps.eng.cpe.ds.project.model.Tag;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;

public class VacationDTO {
	private Vacation vacation;
	private List<String> tagName;
	
	
	public VacationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public VacationDTO(Vacation vacation, List<String> tagName) {
		super();
		this.vacation = vacation;
		this.tagName = tagName;
	}


	public Vacation getVacation() {
		return vacation;
	}


	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}


	public List<String> getTagName() {
		return tagName;
	}


	public void setTagName(List<String> tagName) {
		this.tagName = tagName;
	}

	

	

}
