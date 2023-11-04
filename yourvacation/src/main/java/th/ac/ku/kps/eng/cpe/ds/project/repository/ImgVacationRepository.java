package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imgvacation;

@Repository
public interface ImgVacationRepository extends CrudRepository<Imgvacation, Integer>{

}
