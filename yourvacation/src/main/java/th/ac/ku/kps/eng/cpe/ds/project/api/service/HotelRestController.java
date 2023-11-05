package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;
import java.util.stream.Collectors;

import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Advertisement;
import th.ac.ku.kps.eng.cpe.ds.project.model.District;
import th.ac.ku.kps.eng.cpe.ds.project.model.Facilities;
import th.ac.ku.kps.eng.cpe.ds.project.model.Facilitiesname;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Imghotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;
import th.ac.ku.kps.eng.cpe.ds.project.model.Subdistrict;
import th.ac.ku.kps.eng.cpe.ds.project.model.Vacation;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.AdvertismentDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.FacilitesDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.HotelDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.HotelFacilitiesDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.RoomDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.SubdistrictDTO;
import th.ac.ku.kps.eng.cpe.ds.project.services.AdvertisementService;
import th.ac.ku.kps.eng.cpe.ds.project.services.FacilitiesNameService;
import th.ac.ku.kps.eng.cpe.ds.project.services.HotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ImgHotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ReservationService;
import th.ac.ku.kps.eng.cpe.ds.project.services.SubdistrictService;
import th.ac.ku.kps.eng.cpe.ds.project.services.UserHotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.VacationService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/hotel")
public class HotelRestController {
	
	private static String uploadDir = "C:/yourvacation";

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

	@Autowired
	private ImgHotelService imgHotelService;

	@Autowired
	private FacilitiesNameService facilitiesNameService;

	@Autowired
	private UserHotelService userHotelService;

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

	@PostMapping("/create/{id}")
	public ResponseEntity<Response<Hotel>> create(@Valid @RequestBody Hotel hotel, @PathVariable("id") int id) {
		Response<Hotel> res = new Response<>();
		try {
			Subdistrict subdistrict = subdistrictService.findById(id);
			hotel.setSubdistrict(subdistrict);
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

	@PostMapping("/update/{id}")
	public ResponseEntity<Response<Hotel>> update(@Valid @RequestBody Hotel hotel, @PathVariable("id") int id) {
		Response<Hotel> res = new Response<>();
		try {
			Subdistrict subdistrict = subdistrictService.findById(id);
			hotel.setSubdistrict(subdistrict);
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
	
	@GetMapping("/image/{id}")
	public ResponseEntity<Response<String>> getImage(@PathVariable("id") int hotelId) {
		Response<String> res = new Response<>();
		try {
			Imghotel imghotel = imgHotelService.findByHotelId(hotelId);
			String path = uploadDir + File.separator + "Hotel" + File.separator + imghotel.getFilePath();
			res.setBody(ImageBase64Helper.toImageBase64(path));
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/editImage/{id}")
	public ResponseEntity<Response<String>> editImage(@PathVariable("id") int hotelId) {
		Response<String> res = new Response<>();
		try {
			Imghotel imghotel = imgHotelService.findByHotelId(hotelId);
			//String path = uploadDir+ File.separator + "Hotel" + File.separator + imghotel.getFilePath();
			res.setBody(imghotel.getFilePath());
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/edit/user/{id}")
	public ResponseEntity<Response<Hotel>> editHotel(@PathVariable("id") int userId) {
		Response<Hotel> res = new Response<>();
		try {
			Hotel h = userHotelService.findByUserId(userId).getHotel();
			h = hotelService.findById(h.getHotelId());
			Hotel hotel = new Hotel();
			hotel.setAddress(h.getAddress());
			hotel.setCheckinTime(h.getCheckinTime());
			hotel.setCloseTime(h.getCloseTime());
			hotel.setHotelId(h.getHotelId());
			hotel.setName(h.getName());
			hotel.setOpenTime(h.getOpenTime());
			hotel.setStatus(h.getStatus());
			res.setBody(hotel);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Hotel>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			System.err.println(ex.getMessage());
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
	public ResponseEntity<Response<List<HotelFacilitiesDTO>>> findListHotel(@Param("subdistrictId") int subdistrictId,
			@Param("districtId") int districtId, @Param("provinceId") int provinceId,
			@Param("priceMin") @RequestParam(required = false, defaultValue = "") int priceMin,
			@Param("priceMax") @RequestParam(required = false, defaultValue = "") int priceMax,
			@Param("guest") @RequestParam(required = false, defaultValue = "") int guest,
			@Param("amountRoom") @RequestParam(required = false, defaultValue = "") int amountRoom) {
		Response<List<HotelFacilitiesDTO>> res = new Response<>();
		try {
			List<HotelFacilitiesDTO> dtos = new ArrayList<HotelFacilitiesDTO>();
			List<Hotel> hotels = new ArrayList<Hotel>();
			List<Integer> roomIds = reservationService.findAllRoomId();
			if (priceMin <= 0) {
				priceMin = 0;
			}

			if (priceMax <= 0) {
				priceMax = 9999999;
			}

			if (guest <= 0) {
				guest = 9999;
			}

			if (amountRoom <= 0) {
				amountRoom = 9999;
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

			for (Hotel h : hotels) {
				HotelFacilitiesDTO dto = new HotelFacilitiesDTO();
				dto.setHotel(h);
				List<Facilities> facilities = h.getFacilitieses();
				List<String> name = new ArrayList<String>();
				for (Facilities f : facilities) {
					name.add(f.getFacilitiesname().getName());
				}
				List<Room> rooms = h.getRooms();
				int min = rooms.get(0).getPrice(); // Initialize min with the first element

				for (int i = 1; i < rooms.size(); i++) {
					int current = rooms.get(i).getPrice();
					if (current < min) {
						min = current;
					}
				}
				dto.setMinPrice(min);
				dtos.add(dto);
			}

			res.setBody(dtos);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<HotelFacilitiesDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<HotelFacilitiesDTO>>>(res, res.getHttpStatus());
		}

	}

	@PostMapping("/findHotel/{id}")
	public ResponseEntity<Response<List<HotelFacilitiesDTO>>> findListHotelAll(@PathVariable("id") int vacationId) {
		Response<List<HotelFacilitiesDTO>> res = new Response<>();
		try {
			Vacation vacation = vacationService.findById(vacationId);

			District district = subdistrictService.findById(vacation.getSubdistrict().getSubdistrictId()).getDistrict();

			List<Hotel> hotels = hotelService.findByDistrictId(district.getDistrictId());

			List<HotelFacilitiesDTO> dtos = new ArrayList<HotelFacilitiesDTO>();

			for (Hotel h : hotels) {
				HotelFacilitiesDTO dto = new HotelFacilitiesDTO();
				dto.setHotel(h);
				List<Facilities> facilities = h.getFacilitieses();
				List<String> name = new ArrayList<String>();
				for (Facilities f : facilities) {
					name.add(f.getFacilitiesname().getName());
				}
				List<Room> rooms = h.getRooms();
				if (rooms.size() > 0) {
					int min = rooms.get(0).getPrice(); // Initialize min with the first element

					for (int i = 1; i < rooms.size(); i++) {
						int current = rooms.get(i).getPrice();
						if (current < min) {
							min = current;
						}
					}
					dto.setMinPrice(min);
				}
				dtos.add(dto);
			}
			res.setBody(dtos);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<HotelFacilitiesDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<HotelFacilitiesDTO>>>(res, res.getHttpStatus());
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
					String path = uploadDir + File.separator + "Hotel" + File.separator + imghotels.get(0).getFilePath();
					
					adsDTO.setImgPath(ImageBase64Helper.toImageBase64(path));
				}
				adsDTO.setSubdistrictId(h.getSubdistrict().getSubdistrictId());
				adsDTO.setMinprice(findMinimum(h.getRooms()));
				adsDTO.setHotelId(h.getHotelId());
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

	@PostMapping("/ads/create/{id}")
	public ResponseEntity<Response<Boolean>> createAdsHotel(@PathVariable("id") int id) {
		Response<Boolean> res = new Response<>();
		try {
			Hotel h = userHotelService.findByUserId(id).getHotel();
			Date date = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date()); // Set the calendar to the current date
			calendar.add(Calendar.DAY_OF_MONTH, 7); // Add 7 days

			Date endDate = calendar.getTime();
			Advertisement advertisement = new Advertisement(h, date, endDate);
			advertisementService.save(advertisement);
			res.setBody(true);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Boolean>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Boolean>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/ads/{id}")
	public ResponseEntity<Response<Boolean>> adsHotel(@PathVariable("id") int id) {
		Response<Boolean> res = new Response<>();
		try {
			Hotel h = userHotelService.findByUserId(id).getHotel();
			List<Hotel> hotels = advertisementService.findByHotelId(h.getHotelId());
			System.out.println(hotels.size());
			boolean checked = false;
			if (hotels.size() > 0) {
				checked = true;
			}
			System.out.println(checked);
			res.setBody(checked);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Boolean>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Boolean>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/random")
	public ResponseEntity<Response<List<Hotel>>> random() {
		Response<List<Hotel>> res = new Response<>();
		try {

			List<Hotel> hotels = hotelService.findAll();
			List<Hotel> randomObjects = new ArrayList<Hotel>();
			Random random = new Random();
			int count = random.nextInt(10) + 1;
			// Make a copy of the original list to avoid modifying it
			List<Hotel> copy = new ArrayList<Hotel>(hotels);

			for (int i = 0; i < count; i++) {
				if (copy.isEmpty()) {
					break; // Stop if the copy list is empty
				}
				int randomIndex = random.nextInt(copy.size());
				randomObjects.add(copy.remove(randomIndex));
			}
			res.setBody(randomObjects);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Hotel>>>(res, res.getHttpStatus());
		}

	}

	@PostMapping("/uploadImage/{id}")
	public ResponseEntity<String> handleFileUpload(@RequestParam("file") MultipartFile file, @PathVariable("id") int id) {
		try {
			
			Imghotel img = imgHotelService.findByHotelId(id);
			
			if(img !=null) {
				imgHotelService.deleteById(img.getImghotelId());
			}

			File folder = new File(uploadDir + File.separator + "Hotel" + File.separator);
			if (!folder.exists()) {
				folder.mkdirs();
			}

			UUID uuid = UUID.randomUUID();

			String filename = uuid.toString();

			String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1);

			filename = filename + "." + type;

			String path = uploadDir + File.separator + "Hotel" + File.separator + filename;

			OutputStream outputStream = new FileOutputStream(path);
			outputStream.write(file.getBytes());
			outputStream.close();

			Hotel hotel = hotelService.findById(id);
			
			hotel = hotelService.save(hotel);

			Imghotel imghotel = new Imghotel();

			imghotel.setHotel(hotel);
			imghotel.setFilePath(filename);

			imgHotelService.save(imghotel);

			return ResponseEntity.ok("Image uploaded and encrypted successfully");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading image");
		}
	}

	@GetMapping("/random/{id}")
	public ResponseEntity<Response<List<Vacation>>> findByDistrictRandom(@PathVariable("id") int hotelId) {
		Response<List<Vacation>> res = new Response<>();
		try {
			Hotel hotel = hotelService.findById(hotelId);
			District district = subdistrictService.findById(hotel.getSubdistrict().getSubdistrictId()).getDistrict();
			List<Vacation> vacations = vacationService.findByDistrictId(district.getDistrictId());

			List<Vacation> randomVacations = new ArrayList<>();

			for (int i = 0; i < 3; i++) {
				Vacation randomVacation = vacations.get(i);
				randomVacations.add(randomVacation);
			}
			res.setBody(randomVacations);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<Vacation>>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/facilities/{id}")
	public ResponseEntity<Response<List<FacilitesDTO>>> gettAllHaveFacilities(@PathVariable("id") int hotelId) {
		Response<List<FacilitesDTO>> res = new Response<>();
		try {

			List<Facilitiesname> facilitiesnames = facilitiesNameService.findAll();

			List<String> nameList = facilitiesnames.stream().map(Facilitiesname::getName).collect(Collectors.toList());

			Hotel hotel = hotelService.findById(hotelId);
			List<String> names = hotel.getFacilitieses().stream()
					.map(facility -> facility.getFacilitiesname().getName()).collect(Collectors.toList());

			List<FacilitesDTO> nameLists = new ArrayList<FacilitesDTO>();

			for (String name : nameList) {
				FacilitesDTO dto = new FacilitesDTO();
				dto.setName(name);
				boolean hasCommonStrings = false;
				for (String n : names) {
					if (n.equals(name)) {
						hasCommonStrings = true;
						break; // No need to continue checking once a common string is found
					}
				}
				dto.setStatus(hasCommonStrings);
				nameLists.add(dto);
			}

			res.setBody(nameLists);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<FacilitesDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<FacilitesDTO>>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/rooms/{id}")
	public ResponseEntity<Response<List<RoomDTO>>> rooms(@PathVariable("id") int id) {
		Response<List<RoomDTO>> res = new Response<>();
		try {

			List<RoomDTO> dtos = new ArrayList<RoomDTO>();
			List<Room> rooms = hotelService.findRoomById(id);

			for (Room r : rooms) {
				boolean checked = true;
				for (RoomDTO dto : dtos) {
					if (dto.getType().equals(r.getType())) {
						checked = false;
					}
				}

				if (checked) {
					RoomDTO dto = new RoomDTO();
					dto.setType(r.getType());
					dto.setPrice(r.getPrice());
					dto.setRoomId(r.getRoomId());
					dto.setAmountRoom(r.getAmountRoom());
					dtos.add(dto);
				}
			}

			res.setBody(dtos);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<List<RoomDTO>>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<List<RoomDTO>>>(res, res.getHttpStatus());
		}

	}

	@GetMapping("/subdistrict/{id}")
	public ResponseEntity<Response<SubdistrictDTO>> getDataSubdistrict(@PathVariable("id") int id) {
		Response<SubdistrictDTO> res = new Response<>();
		try {
			Hotel hotel = hotelService.findById(id);
			Subdistrict subdistrict = hotel.getSubdistrict();
			SubdistrictDTO dto = new SubdistrictDTO();
			dto.setSubdistrictId(subdistrict.getSubdistrictId());
			dto.setDistrictId(subdistrict.getDistrict().getDistrictId());
			dto.setProvinceId(subdistrict.getDistrict().getProvince().getProvinceId());
			res.setBody(dto);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<SubdistrictDTO>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<SubdistrictDTO>>(res, res.getHttpStatus());
		}

	}

}
