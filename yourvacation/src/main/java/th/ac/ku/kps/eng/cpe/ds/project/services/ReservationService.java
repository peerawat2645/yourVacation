package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Reservation;
import th.ac.ku.kps.eng.cpe.ds.project.repository.ReservationRepository;

@Service
public class ReservationService {
	@Autowired
	private ReservationRepository reservationRepository;

	public Reservation save(Reservation reservation) {
		return reservationRepository.save(reservation);
	}

	public Reservation findById(int id) {
		return reservationRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		reservationRepository.deleteById(id);
	}
	
	public List<Reservation> findAll(){
		return (List<Reservation>) reservationRepository.findAll();
	}
	
	public List<Integer> findAllRoomId(){
		return reservationRepository.findAllRoomId();
	}
}
