package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Tagname;
import th.ac.ku.kps.eng.cpe.ds.project.repository.TagnameRepository;

@Service
public class TagnameService {
	@Autowired
	private TagnameRepository tagnameRepository;

	public Tagname save(Tagname tagname) {
		return tagnameRepository.save(tagname);
	}

	public Tagname findById(int id) {
		return tagnameRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		tagnameRepository.deleteById(id);
	}
	
	public List<Tagname> findAll(){
		return (List<Tagname>) tagnameRepository.findAll();
	}
}
