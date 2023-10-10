package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Room;
import th.ac.ku.kps.eng.cpe.ds.project.repository.RoomRepository;

@Service
public class RoomService {
	@Autowired
	private RoomRepository roomRepository;

	public Room save(Room room) {
		return roomRepository.save(room);
	}

	public Room findById(int id) {
		return roomRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		roomRepository.deleteById(id);
	}
	
	public List<Room> findAll(){
		return (List<Room>) roomRepository.findAll();
	}
}
