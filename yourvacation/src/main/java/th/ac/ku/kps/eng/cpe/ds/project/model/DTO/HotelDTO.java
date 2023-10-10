package th.ac.ku.kps.eng.cpe.ds.project.model.DTO;

import java.util.List;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;

public class HotelDTO {
	private Vacation vacation;
	private List<Hotel> hotels;

	public Vacation getVacation() {
		return vacation;
	}

	public void setVacation(Vacation vacation) {
		this.vacation = vacation;
	}

	public List<Hotel> getHotels() {
		return hotels;
	}

	public void setHotels(List<Hotel> hotels) {
		this.hotels = hotels;
	}
}
