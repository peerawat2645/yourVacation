package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.AdvertismentDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.HotelDTO;
import th.ac.ku.kps.eng.cpe.ds.project.services.AdvertisementService;
import th.ac.ku.kps.eng.cpe.ds.project.services.HotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ReservationService;
import th.ac.ku.kps.eng.cpe.ds.project.services.SubdistrictService;
import th.ac.ku.kps.eng.cpe.ds.project.services.VacationService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/hotel")
public class HotelRestController {
	
	@Autowired
	private HotelService hotelService;
	
	@Autowired
	private VacationService vacationService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private AdvertisementService advertisementService;
	
	@Autowired
	private SubdistrictService subdistrictService;
	
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
	
	@PostMapping("/create")
	public ResponseEntity<Response<Hotel>> create(@Valid @RequestBody Hotel hotel) {
		Response<Hotel> res = new Response<>();
		try {
			hotel.setSubdistrict(subdistrictService.findById(1));
			Hotel h = hotelService.save(hotel);
			res.setBody(h);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/edit/{id}")
	public ResponseEntity<Response<Hotel>> create(@PathVariable("id") int hotelId) {
		Response<Hotel> res = new Response<>();
		try {
			Hotel h = hotelService.findById(hotelId);
			res.setBody(h);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		}

	}
	
	@PostMapping("/delete/{id}")
	public ResponseEntity<Response<String>> delete(@PathVariable("id") int hotelId) {
		Response<String> res = new Response<>();
		try {
			hotelService.deleteById(hotelId);
			res.setBody("deleted hotel sucessfully");
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/")
	public ResponseEntity<Response<HotelDTO>> index(@Param("vacationId") int vacationId) {
		Response<HotelDTO> res = new Response<>();
		try {
			Vacation vacations = vacationService.findById(vacationId);
			List<Integer> roomIds = reservationService.findAllRoomId();
			List<Hotel> hotels = hotelService.findByNotInReservationId(roomIds);
			HotelDTO hotelDTO = new HotelDTO();
			hotelDTO.setHotels(hotels);
			hotelDTO.setVacation(vacations);
			res.setBody(hotelDTO);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<HotelDTO>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<HotelDTO>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/{id}")
	public ResponseEntity<Response<Hotel>> room(@PathVariable("id") int hotelId) {
		Response<Hotel> res = new Response<>();
		try {
			Hotel hotel = hotelService.findById(hotelId);
			res.setBody(hotel);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/test")
	public ResponseEntity<Response<Hotel>> roomaaa(Authentication authentication) {
		Response<Hotel> res = new Response<>();
		try {
			System.out.println(authentication.getUsername());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		}

	}
	

	@GetMapping("/ads")
	public ResponseEntity<Response<List<AdvertismentDTO>>> ads() {
		Response<List<AdvertismentDTO>> res = new Response<>();
		try {
			List<Hotel> hotels = advertisementService.findHotelAll();
			List<AdvertismentDTO> hotelads = new ArrayList<AdvertismentDTO>();
			for(Hotel h: hotels) {
				AdvertismentDTO adsDTO = new AdvertismentDTO();
				adsDTO.setName(h.getName());
				List<Imghotel> imghotels = h.getImghotels();
				adsDTO.setImgPath(imghotels.get(0).getFilePath());
			}
			res.setBody(hotelads);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<AdvertismentDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<AdvertismentDTO>>>(res, res.getHttpStatus());
		}

	}
	
	
}
