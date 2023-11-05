package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

public class FacilitesDTO {
	private String name;
	private boolean status;

	public FacilitesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FacilitesDTO(String name, boolean status) {
		super();
		this.name = name;
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
