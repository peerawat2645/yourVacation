package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

public class SubdistrictDTO {
	private int subdistrictId;
	private int districtId;
	private int provinceId;

	public SubdistrictDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SubdistrictDTO(int subdistrictId, int districtId, int provinceId) {
		super();
		this.subdistrictId = subdistrictId;
		this.districtId = districtId;
		this.provinceId = provinceId;
	}

	public int getSubdistrictId() {
		return subdistrictId;
	}

	public void setSubdistrictId(int subdistrictId) {
		this.subdistrictId = subdistrictId;
	}

	public int getDistrictId() {
		return districtId;
	}

	public void setDistrictId(int districtId) {
		this.districtId = districtId;
	}

	public int getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(int provinceId) {
		this.provinceId = provinceId;
	}
}
