package th.ac.ku.kps.eng.cpe.ds.project.api.service;

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
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.Promotion;
import th.ac.ku.kps.eng.cpe.ds.project.model.Reservation;
import th.ac.ku.kps.eng.cpe.ds.project.model.Room;
import th.ac.ku.kps.eng.cpe.ds.project.model.User;
import th.ac.ku.kps.eng.cpe.ds.project.services.PromotionService;
import th.ac.ku.kps.eng.cpe.ds.project.services.ReservationService;
import th.ac.ku.kps.eng.cpe.ds.project.services.RoomService;
import th.ac.ku.kps.eng.cpe.ds.project.services.UserService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/reserv")
public class ReservationRestController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PromotionService promotionService;
	
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
	public ResponseEntity<Response<String>> create(@Param("userId") int userId,@Param("roomId") int roomId,@Param("countRoom") int countRoom) {
		Response<String> res = new Response<>();
		try {
			Room room = roomService.findById(roomId);
			room.setAmountRoom(room.getAmountRoom()-countRoom);
			User user = userService.findById(userId);
			Promotion promotion = promotionService.findById(1);
			Reservation reservation = new Reservation(promotion,room,user);
			reservationService.save(reservation);
			res.setBody("Success");
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}
}
