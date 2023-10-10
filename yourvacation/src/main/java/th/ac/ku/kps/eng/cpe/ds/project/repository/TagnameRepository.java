package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Tagname;

@Repository
public interface TagnameRepository extends CrudRepository<Tagname, Integer>{

}
