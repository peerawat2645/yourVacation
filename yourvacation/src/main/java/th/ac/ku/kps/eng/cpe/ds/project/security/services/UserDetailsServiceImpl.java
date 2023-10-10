package th.ac.ku.kps.eng.cpe.ds.project.security.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import th.ac.ku.kps.eng.cpe.ds.project.model.User;
import th.ac.ku.kps.eng.cpe.ds.project.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	 @Autowired
	  UserRepository userRepository;

	  @Override
	  @Transactional
	  public UserDetails loadUserByUsername(String username)  {
	    User user = userRepository.findByUsername(username);

	    return UserDetailsImpl.build(user);
	  }

}
