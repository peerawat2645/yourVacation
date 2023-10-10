package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.repository.VacationRepository;

@Service
public class VacationService {
	@Autowired
	private VacationRepository vacationRepository;

	public Vacation save(Vacation vacation) {
		return vacationRepository.save(vacation);
	}

	public Vacation findById(int id) {
		return vacationRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		vacationRepository.deleteById(id);
	}
	
	public List<Vacation> findAll(){
		return (List<Vacation>) vacationRepository.findAll();
	}
	
	public List<Vacation> findByDistrictId(int districtId){
		return vacationRepository.findByDistrictId(districtId);
	}
	
	public List<Vacation> findBySubdistrictIdAndTagId(int subId,List<Integer> tagId){
		return vacationRepository.findBySubdistrictIdAndTagId(subId, tagId);
	}
	
	public List<Vacation> findByDistrictIdAndTagId(int disId,List<Integer> tagId){
		return vacationRepository.findByDistrictIdAndTagId(disId, tagId);
	}
	
	public List<Vacation> findByProvinceIdAndTagId(int pId,List<Integer> tagId){
		return findByProvinceIdAndTagId(pId, tagId);
	}
}
