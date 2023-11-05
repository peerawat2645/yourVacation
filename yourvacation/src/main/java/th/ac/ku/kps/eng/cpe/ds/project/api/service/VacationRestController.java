package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.District;
import th.ac.ku.kps.eng.cpe.ds.project.model.Imgvacation;
import th.ac.ku.kps.eng.cpe.ds.project.model.Tag;
import th.ac.ku.kps.eng.cpe.ds.project.model.Tagname;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.VacationDTO;
import th.ac.ku.kps.eng.cpe.ds.project.services.ImgVacationService;
import th.ac.ku.kps.eng.cpe.ds.project.services.SubdistrictService;
import th.ac.ku.kps.eng.cpe.ds.project.services.TagnameService;
import th.ac.ku.kps.eng.cpe.ds.project.services.VacationService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/vacation")
public class VacationRestController {

	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private TagnameService tagnameService;
	
	@Autowired
	private SubdistrictService subdistrictService;
	
	@Autowired
	private ImgVacationService imgVacationService;
	
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
	public ResponseEntity<Response<List<VacationDTO>>> findListVacation(@Param("tagnameIds")@RequestParam(required = false, defaultValue = "") List<Integer> tagnameIds,@Param("subdistrictId") int subdistrictId,@Param("districtId") int districtId,@Param("provinceId") int provinceId) {
		Response<List<VacationDTO>> res = new Response<>();
		try {
			List<VacationDTO> vacationDTO = new ArrayList<VacationDTO>();
			List<Vacation> vacations = new ArrayList<Vacation>();
			System.out.println(tagnameIds.size());
			if(tagnameIds.isEmpty()) {
				List<Tagname> tagnameList = tagnameService.findAll();
				for(Tagname t:tagnameList) {
					tagnameIds.add(t.getTagNameId());
				}
			}
			System.out.println(tagnameIds.size());
			if(subdistrictId != 0) {
				vacations = vacationService.findBySubdistrictIdAndTagId(subdistrictId, tagnameIds);
			}
			else if(districtId != 0) {
				vacations = vacationService.findByDistrictIdAndTagId(districtId, tagnameIds);
			}
			else if(provinceId != 0) {
				vacations = vacationService.findByProvinceIdAndTagId(provinceId, tagnameIds);
			}
			
			System.out.println(vacations.size());
			for(Vacation v:vacations) {
				VacationDTO dto = new VacationDTO();
				dto.setVacation(v);
				List<String> tagNames = new ArrayList<String>();
				List<Tag> tags = v.getTags();
				for(Tag t:tags) {
					tagNames.add(t.getTagname().getName());
				}
				dto.setTagName(tagNames);
				vacationDTO.add(dto);
			}
			res.setBody(vacationDTO);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<VacationDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<VacationDTO>>>(res, res.getHttpStatus());
		}

	}
	
	@PostMapping("/{id}")
	public ResponseEntity<Response<List<VacationDTO>>> findByDistrict(@PathVariable("id") int districtId) {
		Response<List<VacationDTO>> res = new Response<>();
		try {
			List<VacationDTO> vacationDTO = new ArrayList<VacationDTO>();
			List<Vacation> vacations = vacationService.findByDistrictId(districtId);
			for(Vacation v:vacations) {
				VacationDTO dto = new VacationDTO();
				dto.setVacation(v);
				List<String> tagNames = new ArrayList<String>();
				List<Tag> tags = v.getTags();
				for(Tag t:tags) {
					tagNames.add(t.getTagname().getName());
				}
				dto.setTagName(tagNames);
				vacationDTO.add(dto);
			}
			res.setBody(vacationDTO);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<VacationDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<VacationDTO>>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/random/{id}")
	public ResponseEntity<Response<Vacation>> findByDistrictRandom(@PathVariable("id") int subdistrictId) {
		Response<Vacation> res = new Response<>();
		try {
			District district = subdistrictService.findById(subdistrictId).getDistrict();
			List<Vacation> vacations = vacationService.findByDistrictId(district.getDistrictId());
			System.out.println(vacations.size());
			Random rand = new Random();
		    Vacation vacation = vacations.get(rand.nextInt(vacations.size()));
			res.setBody(vacation);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Vacation>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Vacation>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/random")
	public ResponseEntity<Response<List<Vacation>>> random() {
		Response<List<Vacation>> res = new Response<>();
		try {
			List<Vacation> vacations = vacationService.findByRandom();
			res.setBody(vacations);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/all")
	public ResponseEntity<Response<List<Vacation>>> getAll() {
		Response<List<Vacation>> res = new Response<>();
		try {
			List<Vacation> vacations = vacationService.findAll();
			res.setBody(vacations);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		}

	}
	
	@PostMapping("/uploadImage")
    public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file,@Param("vacationId") int id) {
        try {
            String uploadDir = "C:/yourvacation";

            File folder = new File(uploadDir + File.separator + "Vacation" + File.separator);
            if (!folder.exists()) {
                folder.mkdirs();
            }

            UUID uuid = UUID.randomUUID();

            String filename = uuid.toString();

            String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);

            filename = filename + "." + type;

            String path = uploadDir + File.separator + "Vacation" + File.separator + filename;

            OutputStream outputStream = new FileOutputStream(path);
            outputStream.write(file.getBytes());
            outputStream.close();

            Vacation vacation = vacationService.findById(id);

            Imgvacation imgvacation= new Imgvacation();

            imgvacation.setVacation(vacation);
            imgvacation.setFilePath(filename);

            imgVacationService.save(imgvacation);

            return ResponseEntity.ok("Image uploaded and encrypted successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading image");
        }
    }
	
}
