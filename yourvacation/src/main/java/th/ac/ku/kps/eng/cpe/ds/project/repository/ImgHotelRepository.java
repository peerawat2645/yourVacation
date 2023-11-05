package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;

@Repository
public interface ImgHotelRepository extends CrudRepository<Imghotel, Integer>{
	@Query("from Imghotel img inner join img.hotel h where h.hotelId = :hotelId")
	public Imghotel findByHotelId(@Param("hotelId")int hotelId);
}
