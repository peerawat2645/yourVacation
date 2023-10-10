package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Advertisement;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;

@Repository
public interface AdvertisementRepository  extends CrudRepository<Advertisement, Integer>{

	@Query("select a.hotel from Advertisement a")
	public List<Hotel> findHotelAll();
}
