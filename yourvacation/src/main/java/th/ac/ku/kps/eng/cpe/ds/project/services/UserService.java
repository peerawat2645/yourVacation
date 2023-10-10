package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.User;
import th.ac.ku.kps.eng.cpe.ds.project.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public User save(User user) {
		return userRepository.save(user);
	}

	public User findById(int id) {
		return userRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		userRepository.deleteById(id);
	}

	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	
	public List<User> findAll(){
		return (List<User>) userRepository.findAll();
	}

	public Boolean existsByUsername(String username) {
		User user = findByUsername(username);
		System.out.println(user);
		if(user != null) {
			return false;
		}
		System.out.println("null");
		return true;
	}

}
