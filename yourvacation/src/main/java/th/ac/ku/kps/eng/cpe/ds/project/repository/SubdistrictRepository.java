package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Subdistrict;

@Repository
public interface SubdistrictRepository extends CrudRepository<Subdistrict, Integer>{
	@Query("select s from Subdistrict as s inner join s.district as d where  d.districtId = :districtId")
    public List<Subdistrict> findByDistrictId(@Param("districtId")int districtId);
}
