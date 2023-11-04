package th.ac.ku.kps.eng.cpe.ds.project.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Role;
import th.ac.ku.kps.eng.cpe.ds.project.repository.RoleRepository;

@Service
public class RoleService {
	@Autowired
	private RoleRepository roleRepository;

	public Role save(Role role) {
		return roleRepository.save(role);
	}

	public Role findById(int id) {
		return roleRepository.findById(id).orElse(null);
	}
	
	public Role findByUserId(int id) {
		return roleRepository.findByUserId(id);
	}
	
	public void deleteById(int id) {
		roleRepository.deleteById(id);
	}
}
