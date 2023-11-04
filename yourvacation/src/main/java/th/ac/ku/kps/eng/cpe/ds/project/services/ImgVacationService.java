package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imgvacation;
import th.ac.ku.kps.eng.cpe.ds.project.repository.ImgVacationRepository;

@Service
public class ImgVacationService {
	@Autowired
	private ImgVacationRepository imgVacationRepository;
	
	public Imgvacation findById(int id) {
		return imgVacationRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		imgVacationRepository.deleteById(id);
	}
	
	public List<Imgvacation> findAll() {
		return (List<Imgvacation>) imgVacationRepository.findAll();
	}
	
	public Imgvacation save(Imgvacation imgvacation) {
		return imgVacationRepository.save(imgvacation);
	}
}
