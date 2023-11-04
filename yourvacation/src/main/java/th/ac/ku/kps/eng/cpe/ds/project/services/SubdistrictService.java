package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Subdistrict;
import th.ac.ku.kps.eng.cpe.ds.project.repository.SubdistrictRepository;

@Service
public class SubdistrictService {
	@Autowired
	private SubdistrictRepository subdistrictRepository;

	public Subdistrict findById(int id) {
		return subdistrictRepository.findById(id).orElse(null);
	}
	
	public List<Subdistrict> findAll(){
		return (List<Subdistrict>) subdistrictRepository.findAll();
	}

	
	public List<Subdistrict> findByDistrictId(int districtId) {
        return subdistrictRepository.findByDistrictId(districtId) ;
    }
}
