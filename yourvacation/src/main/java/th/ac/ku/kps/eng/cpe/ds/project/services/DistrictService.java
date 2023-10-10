package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.District;
import th.ac.ku.kps.eng.cpe.ds.project.repository.DistrictRepository;

@Service
public class DistrictService {
	@Autowired
	private DistrictRepository districtRepository;

	public District findById(int id) {
		return districtRepository.findById(id).orElse(null);
	}
	
	public List<District> findAll(){
		return (List<District>) districtRepository.findAll();
	}

}
