package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

import java.util.List;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;

public class HotelFacilitiesDTO {
	private Hotel hotel;
	private List<String> facilitiesnames;
	private int minPrice;

	public HotelFacilitiesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HotelFacilitiesDTO(Hotel hotel, List<String> facilitiesnames, int minPrice) {
		super();
		this.hotel = hotel;
		this.facilitiesnames = facilitiesnames;
		this.minPrice = minPrice;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	public List<String> getFacilitiesnames() {
		return facilitiesnames;
	}

	public void setFacilitiesnames(List<String> facilitiesnames) {
		this.facilitiesnames = facilitiesnames;
	}

}
