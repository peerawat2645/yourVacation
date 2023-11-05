package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Userhotel;

@Repository
public interface UserhotelRepository extends CrudRepository<Userhotel, Integer>{
	@Query("from Userhotel uh inner join uh.user u where u.userId = :userId")
	public Userhotel findByUserId(@Param("userId")int userId);
}
