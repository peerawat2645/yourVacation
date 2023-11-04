package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.District;

@Repository
public interface DistrictRepository extends CrudRepository<District, Integer>{
	@Query("select d from District as d inner join d.province as p where  p.provinceId = :provinceId")
    public List<District> findByProvinceId(@Param("provinceId")int provinceId);
}
