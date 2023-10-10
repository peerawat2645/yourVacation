package th.ac.ku.kps.eng.cpe.ds.project.api.service;

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

@CrossOrigin("http://localhost:8081/")
@RestController
@RequestMapping("/api/v1/customers")
public class TestRestController {

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

	@GetMapping("/all")
	public String allAccess() {
		return "Public Content.";
	}


//	public static void main(String[] args) throws Exception {
//		int key = 1;
//		FileInputStream fis = new FileInputStream("D:\\Test.jpg");
//
//		byte data[] = new byte[fis.available()];
//
//		fis.read(data);
//		int i = 0;
//
//		for (byte b : data) {
//			data[i] = (byte) (b ^ key);
//			i++;
//		}
//		FileOutputStream fos = new FileOutputStream("D:\\Test.jpg");
//		fos.write(data);
//
//		fos.close();
//		fis.close();
//		fis = new FileInputStream("D:\\Test.jpg");
//
//
//		fis.read(data);
//		i = 0;
//
//		for (byte b : data) {
//			data[i] = (byte) (b ^ key);
//			i++;
//		}
//
//		 fos = new FileOutputStream("D:\\Test.jpg");
//		fos.write(data);
//		fos.close();
//		fis.close();
//	}

}
