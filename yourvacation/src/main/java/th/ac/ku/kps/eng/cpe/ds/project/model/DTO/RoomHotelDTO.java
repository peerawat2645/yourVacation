package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;

public class RoomHotelDTO {
	private String name;
	private String type;
	private int price;

	public RoomHotelDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomHotelDTO(String name, String type, int price) {
		super();
		this.name = name;
		this.type = type;
		this.price = price;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
