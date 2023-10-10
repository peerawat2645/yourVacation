package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Advertisement;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.AdvertisementRepository;

@Service
public class AdvertisementService {
	@Autowired
	private AdvertisementRepository advertisementRepository;

	public Advertisement save(Advertisement advertisement) {
		return advertisementRepository.save(advertisement);
	}

	public Advertisement findById(int id) {
		return advertisementRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		advertisementRepository.deleteById(id);
	}
	
	public List<Advertisement> findAll(){
		return (List<Advertisement>) advertisementRepository.findAll();
	}
	
	public List<Hotel> findHotelAll(){
		return advertisementRepository.findHotelAll();
	}
}
