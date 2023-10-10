package th.ac.ku.kps.eng.cpe.ds.project.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import th.ac.ku.kps.eng.cpe.ds.project.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>{

	@Query("select u from User u where u.username = :username")
	public User findByUsername(@Param("username")String username);
}
