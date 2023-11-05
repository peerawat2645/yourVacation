package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Room;

@Repository
public interface RoomRepository extends CrudRepository<Room, Integer>{
	@Query("from Room r inner join r.hotel h where h.hotelId =:hotelId and r.type =:type")
	public Room findByHotelIdAndType(@Param("hotelId") int hotelId,@Param("type") String type);
}
