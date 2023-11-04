package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.District;
import th.ac.ku.kps.eng.cpe.ds.project.model.Province;
import th.ac.ku.kps.eng.cpe.ds.project.model.Subdistrict;
import th.ac.ku.kps.eng.cpe.ds.project.services.DistrictService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ProvinceService;
import th.ac.ku.kps.eng.cpe.ds.project.services.SubdistrictService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1")
public class SubdistrictRestController {
	
	@Autowired
	private SubdistrictService subdistrictService;
	
	@Autowired
	private DistrictService districtService;
	
	@Autowired
	private ProvinceService provinceService;
	
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
	
	@GetMapping("/subdistrict/")
	public ResponseEntity<Response<List<Subdistrict>>> getSubdistrict() {
		Response<List<Subdistrict>> res = new Response<>();
		try {
			res.setBody(subdistrictService.findAll());
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Subdistrict>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Subdistrict>>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/district/")
	public ResponseEntity<Response<List<District>>> getDistrict() {
		Response<List<District>> res = new Response<>();
		try {
			res.setBody(districtService.findAll());
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<District>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<District>>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/province/")
	public ResponseEntity<Response<List<Province>>> getProvince() {
		Response<List<Province>> res = new Response<>();
		try {
			res.setBody(provinceService.findAll());
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Province>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Province>>>(res, res.getHttpStatus());
		}

	}
}
