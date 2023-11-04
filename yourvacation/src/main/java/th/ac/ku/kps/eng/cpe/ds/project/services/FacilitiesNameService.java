package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Facilitiesname;
import th.ac.ku.kps.eng.cpe.ds.project.repository.FacilitiesNameRepository;

@Service
public class FacilitiesNameService {
	@Autowired
	private FacilitiesNameRepository facilitiesNameRepository;
	
	public Facilitiesname findById(int id) {
		return facilitiesNameRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		facilitiesNameRepository.deleteById(id);
	}
	
	public List<Facilitiesname> findAll() {
		return (List<Facilitiesname>) facilitiesNameRepository.findAll();
	}
	
	public Facilitiesname save(Facilitiesname facilitiesname) {
		return facilitiesNameRepository.save(facilitiesname);
	}
}
