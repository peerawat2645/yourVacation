package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Advertisement;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;

@Repository
public interface AdvertisementRepository  extends CrudRepository<Advertisement, Integer>{

	@Query("select a.hotel from Advertisement a where a.dateEnd >=:endDate")
	public List<Hotel> findHotelAll(@Param("endDate")Date endDate);
	
	@Query("select h from Advertisement a inner join a.hotel h where h.hotelId =:hotelId and a.dateEnd >=:endDate")
	public List<Hotel> findByHotelId(@Param("hotelId")int hotelId,@Param("endDate")Date endDate);
}
