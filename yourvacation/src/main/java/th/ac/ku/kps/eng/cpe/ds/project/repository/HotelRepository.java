package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Integer>{
	
	@Query("from Hotel h inner join h.rooms r where r.roomId not in (:roomId)")
	public List<Hotel> findByNotInReservationId(List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.guest >=:guest and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndNotInReservationId(int guest,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.amountRoom >=:amountRoom and r.roomId not in :roomId")
	public List<Hotel> findByAmountRoomAndNotInReservationId(int amountRoom,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where (r.price >=:price and r.price <=:price) and r.roomId not in :roomId")
	public List<Hotel> findByPriceAndNotInReservationId(int price,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.guest >=:guest and r.amountRoom >=:amountRoom and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndAmountRoomAndNotInReservationId(int guest,int amountRoom,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.guest >=:guest and (r.price >=:price and r.price <=:price) and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndPriceAndNotInReservationId(int guest,int price,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.amountRoom >=:amountRoom and (r.price >=:price and r.price <=:price) and r.roomId not in :roomId")
	public List<Hotel> findByAmountRoomAndPriceAndNotInReservationId(int amountRoom,int price,List<Integer> roomId);
	
	@Query("from Hotel h inner join h.rooms r where r.guest >=:guest and r.amountRoom >=:amountRoom and (r.price >=:price and r.price <=:price) and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndAmountRoomAndPriceAndNotInReservationId(int guest,int amountRoom,int price,List<Integer> roomId);
}
