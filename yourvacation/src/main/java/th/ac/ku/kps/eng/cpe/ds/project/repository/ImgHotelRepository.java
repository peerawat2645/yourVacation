package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;

@Repository
public interface ImgHotelRepository extends CrudRepository<Imghotel, Integer>{

}
