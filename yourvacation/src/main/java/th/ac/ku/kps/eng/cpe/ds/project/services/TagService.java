package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Tag;
import th.ac.ku.kps.eng.cpe.ds.project.repository.TagRepository;

@Service
public class TagService {
	@Autowired
	private TagRepository tagRepository;

	public Tag save(Tag tag) {
		return tagRepository.save(tag);
	}

	public Tag findById(int id) {
		return tagRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		tagRepository.deleteById(id);
	}
	
	public List<Tag> findAll(){
		return (List<Tag>) tagRepository.findAll();
	}
}
