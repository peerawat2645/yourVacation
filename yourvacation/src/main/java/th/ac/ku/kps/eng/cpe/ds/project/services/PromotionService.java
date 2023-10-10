package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Promotion;
import th.ac.ku.kps.eng.cpe.ds.project.repository.PromotionRepository;

@Service
public class PromotionService {
	@Autowired
	private PromotionRepository promotionRepository;

	public Promotion save(Promotion promotion) {
		return promotionRepository.save(promotion);
	}

	public Promotion findById(int id) {
		return promotionRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		promotionRepository.deleteById(id);
	}
	
	public List<Promotion> findAll(){
		return (List<Promotion>) promotionRepository.findAll();
	}
}
