package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.ImgHotelRepository;

@Service
public class ImgHotelService {
	@Autowired
	private ImgHotelRepository imgHotelRepository;
	
	public Imghotel findById(int id) {
		return imgHotelRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		imgHotelRepository.deleteById(id);
	}
	
	public List<Imghotel> findAll() {
		return (List<Imghotel>) imgHotelRepository.findAll();
	}
	
	public Imghotel save(Imghotel imghotel) {
		return imgHotelRepository.save(imghotel);
	}
}
