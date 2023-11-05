package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.ImgHotelRepository;

@Service
public class ImgHotelService {
	
	private static String uploadDir = "C:/yourvacation";
	
	@Autowired
	private ImgHotelRepository imgHotelRepository;
	
	public Imghotel findById(int id) {
		return imgHotelRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		File f = new File(uploadDir + File.separator+"Hotel"+File.separator + imgHotelRepository.findById(id).get().getFilePath());
		if (f.exists())
			f.delete();
		
		
		imgHotelRepository.deleteById(id);
	}
	
	public List<Imghotel> findAll() {
		return (List<Imghotel>) imgHotelRepository.findAll();
	}
	
	public Imghotel save(Imghotel imghotel) {
		return imgHotelRepository.save(imghotel);
	}
	
	public Imghotel findByHotelId(int hotelId) {
		return imgHotelRepository.findByHotelId(hotelId);
	}
}
