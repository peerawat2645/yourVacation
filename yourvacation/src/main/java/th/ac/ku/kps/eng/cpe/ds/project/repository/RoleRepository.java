package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.Role;

@Repository
public interface RoleRepository extends CrudRepository<Role, Integer>{
	
	@Query("from Role r inner join r.user u where u.userId =:userId")
	public Role findByUserId(@Param("userId") int userId);
}
