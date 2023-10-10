package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.services.VacationService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/vacation")
public class VacationRestController {

	@Autowired
	private VacationService vacationService;
	
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<Response<ObjectNode>> handleValidationExceptions(MethodArgumentNotValidException ex) {
		Response<ObjectNode> res = new Response<>();
		res.setHttpStatus(HttpStatus.BAD_REQUEST);

		ObjectMapper mapper = new ObjectMapper();

		ObjectNode responObject = mapper.createObjectNode();

		ex.getBindingResult().getAllErrors().forEach((error) -> {
			String fieldname = ((FieldError) error).getField();
			String errorMessage = error.getDefaultMessage();
			responObject.put(fieldname, errorMessage);
		});
		res.setMessage(HttpStatus.BAD_REQUEST.getReasonPhrase());
		res.setBody(responObject);
		return new ResponseEntity<Response<ObjectNode>>(res, res.getHttpStatus());
	}
	
	@PostMapping("/")
	public ResponseEntity<Response<List<Vacation>>> findListVacation(@Param("tagnameIds") List<Integer> tagnameIds,@Param("subdistrictId") int subdistrictId,@Param("districtId") int districtId,@Param("provinceId") int provinceId) {
		Response<List<Vacation>> res = new Response<>();
		try {
			List<Vacation> vacations = new ArrayList<Vacation>();
			if(tagnameIds != null && subdistrictId != 0) {
				vacations = vacationService.findBySubdistrictIdAndTagId(subdistrictId, tagnameIds);
			}
			else if(tagnameIds != null && districtId != 0) {
				vacations = vacationService.findByDistrictIdAndTagId(districtId, tagnameIds);
			}
			else if(tagnameIds != null && provinceId != 0) {
				vacations = vacationService.findByProvinceIdAndTagId(provinceId, tagnameIds);
			}
			res.setBody(vacations);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		}

	}
	
	@PostMapping("/{id}")
	public ResponseEntity<Response<List<Vacation>>> findByDistrict(@PathVariable int districtId) {
		Response<List<Vacation>> res = new Response<>();
		try {
			List<Vacation> vacations = vacationService.findByDistrictId(districtId);
			res.setBody(vacations);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		}

	}
	
}
