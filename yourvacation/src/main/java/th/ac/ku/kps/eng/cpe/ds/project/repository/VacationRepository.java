package th.ac.ku.kps.eng.cpe.ds.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;

@Repository
public interface VacationRepository extends CrudRepository<Vacation, Integer>{
	
	@Query("from Vacation v inner join v.subdistrict s inner join s.district d where d.districtId =:districtId")
	public List<Vacation> findByDistrictId(int districtId);
	
	@Query(value="SELECT * FROM vacation ORDER BY RAND() LIMIT 5;",nativeQuery = true)
	public List<Vacation> findByRandom();
	
	@Query("From Vacation v inner join v.subdistrict s inner join v.tags t inner join t.tagname tn where tn.tagNameId in :tagId and s.subdistrictId =:subId")
	public List<Vacation> findBySubdistrictIdAndTagId(int subId,List<Integer> tagId);
	
	@Query("From Vacation v inner join v.subdistrict s inner join s.district d inner join v.tags t inner join t.tagname tn where tn.tagNameId in :tagId and d.districtId =:disId")
	public List<Vacation> findByDistrictIdAndTagId(int disId,List<Integer> tagId);
	
	@Query("From Vacation v inner join v.subdistrict s inner join s.district d inner join d.province p inner join v.tags t inner join t.tagname tn where tn.tagNameId in :tagId and p.provinceId =:pId")
	public List<Vacation> findByProvinceIdAndTagId(int pId,List<Integer> tagId);
}
