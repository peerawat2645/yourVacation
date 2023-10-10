package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Reservation;

@Repository
public interface ReservationRepository extends CrudRepository<Reservation, Integer>{
	
	@Query("select r.roomId from Reservation reserv inner join reserv.room r")
	public List<Integer> findAllRoomId();

}
