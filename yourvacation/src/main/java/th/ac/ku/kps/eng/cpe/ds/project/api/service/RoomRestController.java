package th.ac.ku.kps.eng.cpe.ds.project.api.service;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;
import th.ac.ku.kps.eng.cpe.ds.project.model.Userhotel;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.RoomDTO;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.RoomHotelDTO;
import th.ac.ku.kps.eng.cpe.ds.project.services.HotelService;
import th.ac.ku.kps.eng.cpe.ds.project.services.RoomService;
import th.ac.ku.kps.eng.cpe.ds.project.services.UserHotelService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/room")
public class RoomRestController {

	@Autowired
	private HotelService hotelService;

	@Autowired
	private RoomService roomService;

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

	@GetMapping("/{id}")
	public ResponseEntity<Response<List<RoomDTO>>> rooms(@PathVariable("id") int id) {
		Response<List<RoomDTO>> res = new Response<>();
		try {

			Userhotel userhotel = userHotelService.findByUserId(id);

			List<RoomDTO> dtos = new ArrayList<RoomDTO>();
			List<Room> rooms = hotelService.findRoomById(userhotel.getHotel().getHotelId());

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

	@GetMapping("/edit/{id}")
	public ResponseEntity<Response<Room>> roomData(@PathVariable("id") int id) {
		Response<Room> res = new Response<>();
		try {
			Room room = roomService.findById(id);

			res.setBody(room);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		}

	}

	@PostMapping("/update/{id}")
	public ResponseEntity<Response<Room>> roomData(@Valid @RequestBody Room room, @PathVariable("id") int id) {
		Response<Room> res = new Response<>();
		try {
			Userhotel userhotel = userHotelService.findByUserId(id);

			Hotel hotel = userhotel.getHotel();

			room.setHotel(hotel);

			room = roomService.save(room);

			res.setBody(null);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		}

	}

	@PostMapping("/create/{id}")
	public ResponseEntity<Response<Room>> create(@Valid @RequestBody Room room, @PathVariable("id") int id) {
		Response<Room> res = new Response<>();
		try {
			Userhotel userhotel = userHotelService.findByUserId(id);

			Hotel hotel = userhotel.getHotel();

			room.setHotel(hotel);

			room = roomService.save(room);

			res.setBody(room);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<Room>>(res, res.getHttpStatus());
		}

	}
	
	@PostMapping("/delete/{id}")
	public ResponseEntity<Response<String>> delete(@PathVariable("id") int id) {
		Response<String> res = new Response<>();
		try {
			
			roomService.deleteById(id);
			res.setBody("deleted");
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}
	
	@GetMapping("/")
	public ResponseEntity<Response<RoomHotelDTO>> getRoom(@Param("id")int id) {
		Response<RoomHotelDTO> res = new Response<>();
		try {
			Room room = roomService.findById(id);
			RoomHotelDTO dto = new RoomHotelDTO();
			Hotel hotel = hotelService.findById(room.getHotel().getHotelId());
			dto.setName(hotel.getName());
			dto.setType(room.getType());
			dto.setPrice(room.getPrice());
			res.setBody(dto);
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<RoomHotelDTO>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setMessage(ex.getMessage());
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<RoomHotelDTO>>(res, res.getHttpStatus());
		}

	}
}
