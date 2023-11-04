package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;
import th.ac.ku.kps.eng.cpe.ds.project.model.Tagname;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.AdvertismentDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.HotelDTO;
import th.ac.ku.kps.eng.cpe.ds.project.services.AdvertisementService;
import th.ac.ku.kps.eng.cpe.ds.project.services.HotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ImgHotelService;
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
	public ResponseEntity<Response<Hotel>> edit(@PathVariable("id") int hotelId) {
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

	@GetMapping("/vacation/{id}")
	public ResponseEntity<Response<HotelDTO>> index(@PathVariable("vacationId") int vacationId) {
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

	@PostMapping("/find")
	public ResponseEntity<Response<List<Hotel>>> findListHotel(@Param("subdistrictId") int subdistrictId,
			@Param("districtId") int districtId, @Param("provinceId") int provinceId,
			@Param("priceMin") @RequestParam(required = false, defaultValue = "") int priceMin,
			@Param("priceMax") @RequestParam(required = false, defaultValue = "") int priceMax,
			@Param("guest") @RequestParam(required = false, defaultValue = "") int guest,
			@Param("amountRoom") @RequestParam(required = false, defaultValue = "") int amountRoom) {
		Response<List<Hotel>> res = new Response<>();
		try {
			List<Hotel> hotels = new ArrayList<Hotel>();
			List<Integer> roomIds = reservationService.findAllRoomId();
			if (priceMin <= 0) {
				priceMin = -1;
			}

			if (priceMax <= 0) {
				priceMin = 9999999;
			}

			if (guest == 0 && amountRoom == 0) {
				hotels = hotelService.findByPriceAndNotInReservationIdAndSubdistrictId(priceMin, priceMax, roomIds,
						subdistrictId);
			} else if (guest != 0 && amountRoom == 0) {
				hotels = hotelService.findByGuestAndPriceAndNotInReservationIdAndSubdistrictId(guest, priceMin,
						priceMax, roomIds, subdistrictId);
			} else if (guest != 0 && amountRoom != 0) {
				hotels = hotelService.findByGuestAndAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(guest,
						amountRoom, priceMin, priceMax, roomIds, subdistrictId);
			}

			res.setBody(hotels);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
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

	@GetMapping("/")
	public ResponseEntity<Response<List<Hotel>>> findAll() {
		Response<List<Hotel>> res = new Response<>();
		try {
			res.setBody(hotelService.findAll());
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
		}

	}

	public static int findMinimum(List<Room> rooms) {
		if (rooms.isEmpty()) {
			throw new IllegalArgumentException("List is empty");
		}

		int min = rooms.get(0).getPrice(); // Assume the first element is the minimum

		for (Room r : rooms) {
			int number = r.getPrice();
			if (number < min) {
				min = number; // Update minimum if a smaller number is found
			}
		}

		return min;
	}

	@GetMapping("/ads")
	public ResponseEntity<Response<List<AdvertismentDTO>>> ads() {
		Response<List<AdvertismentDTO>> res = new Response<>();
		try {
			List<Hotel> hotels = advertisementService.findHotelAll();
			List<AdvertismentDTO> hotelads = new ArrayList<AdvertismentDTO>();
			for (Hotel h : hotels) {
				AdvertismentDTO adsDTO = new AdvertismentDTO();
				adsDTO.setName(h.getName());
				List<Imghotel> imghotels = h.getImghotels();
				if (!imghotels.isEmpty()) {
					adsDTO.setImgPath(imghotels.get(0).getFilePath());
				}
				adsDTO.setSubdistrictId(h.getSubdistrict().getSubdistrictId());
				adsDTO.setMinprice(findMinimum(h.getRooms()));
				hotelads.add(adsDTO);
			}
			res.setBody(hotelads);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<AdvertismentDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<AdvertismentDTO>>>(res, res.getHttpStatus());
		}

	}

}
