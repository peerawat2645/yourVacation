package th.ac.ku.kps.eng.cpe.ds.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Userhotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.UserhotelRepository;

@Service
public class UserHotelService {
	@Autowired
	private UserhotelRepository userhotelRepository;
	
	
	public Userhotel findByUserId(int id) {
		return userhotelRepository.findByUserId(id);
	}
}
