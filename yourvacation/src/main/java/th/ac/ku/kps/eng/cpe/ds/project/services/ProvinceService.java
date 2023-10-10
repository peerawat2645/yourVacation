package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Province;
import th.ac.ku.kps.eng.cpe.ds.project.repository.ProvinceRepository;

@Service
public class ProvinceService {
	@Autowired
	private ProvinceRepository provinceRepository;

	public Province findById(int id) {
		return provinceRepository.findById(id).orElse(null);
	}

	public List<Province> findAll(){
		return (List<Province>) provinceRepository.findAll();
	}
}
