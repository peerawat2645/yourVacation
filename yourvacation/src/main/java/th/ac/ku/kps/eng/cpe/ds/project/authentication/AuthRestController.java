package th.ac.ku.kps.eng.cpe.ds.project.authentication;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import th.ac.ku.kps.eng.cpe.ds.project.api.util.Response;
import th.ac.ku.kps.eng.cpe.ds.project.model.User;
import th.ac.ku.kps.eng.cpe.ds.project.model.DTO.UserDTO;
import th.ac.ku.kps.eng.cpe.ds.project.security.jwt.JwtUtils;
import th.ac.ku.kps.eng.cpe.ds.project.security.services.UserDetailsImpl;
import th.ac.ku.kps.eng.cpe.ds.project.services.UserService;

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/auth")
public class AuthRestController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private JwtUtils jwtUtils;

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

	@PostMapping("/login")
	public ResponseEntity<Response<User>> login(@Valid @RequestBody UserDTO userDTO, HttpSession session) {
		Response<User> res = new Response<>();
		try {
			User user = userService.findByUsername(userDTO.getUsername());

			if (user == null) {
				res.setMessage(HttpStatus.BAD_REQUEST.getReasonPhrase());
				res.setBody(null);
				return new ResponseEntity<Response<User>>(res, res.getHttpStatus());
			} else {
				Authentication authentication = authenticationManager.authenticate(
						new UsernamePasswordAuthenticationToken(userDTO.getUsername(), userDTO.getPassword()));
				
				SecurityContextHolder.getContext().setAuthentication(authentication);

				UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

				ResponseCookie jwtCookie = jwtUtils.generateJwtCookie(userDetails);

				res.setMessage(jwtCookie.toString());
				System.out.println(jwtCookie.toString());
				res.setBody(userService.findByUsername(userDTO.getUsername()));
				res.setHttpStatus(HttpStatus.OK);
				return new ResponseEntity<Response<User>>(res, res.getHttpStatus());
			}
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<User>>(res, res.getHttpStatus());
		}

	}

	@PostMapping("/register")
	public ResponseEntity<Response<String>> create(@Valid @RequestBody User user) {
		Response<String> res = new Response<>();
		try {
			if (!userService.existsByUsername(user.getUsername())) {
				res.setBody(null);
				res.setHttpStatus(HttpStatus.BAD_REQUEST);
				return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
			}
			user.setPassword(encoder.encode(user.getPassword()));
			System.out.println("check");
			userService.save(user);
			res.setBody("User registered successfully!");
			res.setHttpStatus(HttpStatus.OK);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}

	}
	@PostMapping("/signout")
	public ResponseEntity<?> logoutUser() {
		Response<String> res = new Response<>();
		try {
			ResponseCookie cookie = jwtUtils.getCleanJwtCookie();
			res.setMessage(cookie.toString());
			res.setBody("Logout success");

			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		} catch (Exception ex) {
			res.setBody(null);
			res.setHttpStatus(HttpStatus.NOT_FOUND);
			return new ResponseEntity<Response<String>>(res, res.getHttpStatus());
		}
	}
}
