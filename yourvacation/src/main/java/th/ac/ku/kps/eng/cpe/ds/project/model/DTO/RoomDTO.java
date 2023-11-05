package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

public class RoomDTO {
	private String type;
	private int roomId;
	private int price;
	private int amountRoom;
	private String imgPath;

	public RoomDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomDTO(String type, int roomId, int price, int amountRoom, String imgPath) {
		super();
		this.type = type;
		this.setRoomId(roomId);
		this.price = price;
		this.amountRoom = amountRoom;
		this.imgPath = imgPath;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public int getAmountRoom() {
		return amountRoom;
	}

	public void setAmountRoom(int amountRoom) {
		this.amountRoom = amountRoom;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

}
