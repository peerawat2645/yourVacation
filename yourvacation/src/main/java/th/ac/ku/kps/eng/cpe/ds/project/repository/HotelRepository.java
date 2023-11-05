package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;

@Repository
public interface HotelRepository extends CrudRepository<Hotel, Integer>{
	
	@Query("from Hotel h inner join h.rooms r where r.roomId not in (:roomId)")
	public List<Hotel> findByNotInReservationId(@Param("roomId")List<Integer> roomId);
	
	@Query("select r from Hotel h inner join h.rooms r where h.hotelId =:hotelId")
	public List<Room> findRoomByhotelId(@Param("hotelId")int hotelId);
	
	@Query("select h from Hotel h inner join h.subdistrict s inner join s.district d where d.districtId =:districtId")
	public List<Hotel> findByDistrictId(@Param("districtId")int districtId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.guest <=:guest and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndNotInReservationIdAndSubdistrictId(@Param("guest")int guest,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.amountRoom >=:amountRoom and r.roomId not in :roomId")
	public List<Hotel> findByAmountRoomAndNotInReservationIdAndSubdistrictId(@Param("amountRoom")int amountRoom,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and ( r.price >:priceMin and r.price<=:priceMax) and r.roomId not in :roomId")
	public List<Hotel> findByPriceAndNotInReservationIdAndSubdistrictId(@Param("priceMin")int priceMin,@Param("priceMax")int priceMax,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.guest <=:guest and r.amountRoom >=:amountRoom and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndAmountRoomAndNotInReservationIdAndSubdistrictId(@Param("guest")int guest,@Param("amountRoom")int amountRoom,List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.guest <=:guest and ( r.price >:priceMin and r.price<=:priceMax) and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndPriceAndNotInReservationIdAndSubdistrictId(@Param("guest")int guest,@Param("priceMin")int priceMin,@Param("priceMax")int priceMax,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.amountRoom >=:amountRoom and ( r.price >:priceMin and r.price<=:priceMax) and r.roomId not in :roomId")
	public List<Hotel> findByAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(@Param("amountRoom")int amountRoom,@Param("priceMin")int priceMin,@Param("priceMax")int priceMax,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
	
	@Query("from Hotel h inner join h.rooms r inner join h.subdistrict s where s.subdistrictId =:subdistrictId and r.guest <=:guest and r.amountRoom >=:amountRoom and ( r.price >:priceMin and r.price<=:priceMax) and r.roomId not in :roomId")
	public List<Hotel> findByGuestAndAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(@Param("guest")int guest,@Param("amountRoom")int amountRoom,@Param("priceMin")int priceMin,@Param("priceMax")int priceMax,@Param("roomId")List<Integer> roomId,@Param("subdistrictId")int subdistrictId);
}
