package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Nov 4, 2023, 2:14:42 PM by Hibernate Tools 5.6.3.Final

/**
 * Imgvacation generated by hbm2java
 */
public class Imgvacation implements java.io.Serializable {

	private Integer imgvacationId;
	private Vacation vacation;
	private String filePath;

	public Imgvacation() {
	}

	public Imgvacation(Vacation vacation, String filePath) {
		this.vacation = vacation;
		this.filePath = filePath;
	}

	public Integer getImgvacationId() {
		return this.imgvacationId;
	}

	public void setImgvacationId(Integer imgvacationId) {
		this.imgvacationId = imgvacationId;
	}

	public Vacation getVacation() {
		return this.vacation;
	}

	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}
