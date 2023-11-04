package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

public class AdvertismentDTO {
	private String name;
	private String imgPath;
	private int subdistrictId;
	private int minprice;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getSubdistrictId() {
		return subdistrictId;
	}

	public void setSubdistrictId(int subdistrictId) {
		this.subdistrictId = subdistrictId;
	}

	public int getMinprice() {
		return minprice;
	}

	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}

}
