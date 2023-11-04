package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

import java.util.List;

import th.ac.ku.kps.eng.cpe.ds.project.model.Facilitiesname;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;

public class HotelFacilitiesDTO {
	private Hotel hotel;
	private List<String> facilitiesnames;
	
	public HotelFacilitiesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public HotelFacilitiesDTO(Hotel hotel, List<String> facilitiesnames) {
		super();
		this.hotel = hotel;
		this.facilitiesnames = facilitiesnames;
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
