package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Facilities;
import th.ac.ku.kps.eng.cpe.ds.project.repository.FacilitiesRepository;

@Service
public class FacilitiesService {
	@Autowired
	private FacilitiesRepository facilitiesRepository;
	
	public Facilities findById(int id) {
		return facilitiesRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		facilitiesRepository.deleteById(id);
	}
	
	public List<Facilities> findAll() {
		return (List<Facilities>) facilitiesRepository.findAll();
	}
	
	public Facilities save(Facilities facilities) {
		return facilitiesRepository.save(facilities);
	}
}
