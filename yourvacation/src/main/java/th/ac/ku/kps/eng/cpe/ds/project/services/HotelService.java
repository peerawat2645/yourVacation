package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.HotelRepository;

@Service
public class HotelService {
	@Autowired
	private HotelRepository hotelRepository;

	public Hotel save(Hotel hotel) {
		return hotelRepository.save(hotel);
	}

	public Hotel findById(int id) {
		return hotelRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		hotelRepository.deleteById(id);
	}
	
	public List<Hotel> findAll(){
		return (List<Hotel>) hotelRepository.findAll();
	}
	
	public List<Hotel> findByNotInReservationId(List<Integer> roomId){
		return hotelRepository.findByNotInReservationId(roomId);
	}
	
	public List<Hotel> findByGuestAndNotInReservationId(int guest,List<Integer> roomId){
		return hotelRepository.findByGuestAndNotInReservationId(guest, roomId);
	}
	
	public List<Hotel> findByAmountRoomAndNotInReservationId(int amountRoom,List<Integer> roomId){
		return hotelRepository.findByAmountRoomAndNotInReservationId(amountRoom, roomId);
	}
	
	public List<Hotel> findByPriceAndNotInReservationId(int price,List<Integer> roomId){
		return hotelRepository.findByPriceAndNotInReservationId(price, roomId);
	}
	
	public List<Hotel> findByGuestAndAmountRoomAndNotInReservationId(int guest,int amountRoom,List<Integer> roomId){
		return hotelRepository.findByGuestAndAmountRoomAndNotInReservationId(guest, amountRoom, roomId);
	}
	
	public List<Hotel> findByGuestAndPriceAndNotInReservationId(int guest,int price,List<Integer> roomId){
		return hotelRepository.findByGuestAndPriceAndNotInReservationId(guest, price, roomId);
	}
	
	public List<Hotel> findByAmountRoomAndPriceAndNotInReservationId(int amountRoom,int price,List<Integer> roomId){
		return hotelRepository.findByAmountRoomAndPriceAndNotInReservationId(amountRoom, price, roomId);
	}
	
	public List<Hotel> findByGuestAndAmountRoomAndPriceAndNotInReservationId(int guest,int amountRoom,int price,List<Integer> roomId){
		return hotelRepository.findByGuestAndAmountRoomAndPriceAndNotInReservationId(guest, amountRoom, price, roomId);
	}

}
