package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;
import java.util.List;

import javax.crypto.Cipher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Advertisement;
import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.AdvertisementRepository;

@Service
public class AdvertisementService {
	@Autowired
	private AdvertisementRepository advertisementRepository;
	
	public static String decrypt(String encryptedText, PrivateKey privateKey) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
		return new String(decryptedBytes);
	}

	public static List<Hotel> decryptData(List<Hotel> hotels) throws Exception {

		for (Hotel hotel : hotels) {
			String privateKey = hotel.getPrivateKey();

			byte[] decodedPrivateKeyBytes = Base64.getDecoder().decode(privateKey);

			// Create a KeyFactory and reconstruct the private key
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(decodedPrivateKeyBytes);
			PrivateKey reconstructedPrivateKey = keyFactory.generatePrivate(keySpec);
			System.out.println(decrypt(hotel.getName(), reconstructedPrivateKey));
			hotel.setAddress(decrypt(hotel.getAddress(), reconstructedPrivateKey));
			hotel.setName(decrypt(hotel.getName(), reconstructedPrivateKey));
		}
		return hotels;
	}

	public Advertisement save(Advertisement advertisement) {
		return advertisementRepository.save(advertisement);
	}

	public Advertisement findById(int id) {
		return advertisementRepository.findById(id).orElse(null);
	}
	
	public void deleteById(int id) {
		advertisementRepository.deleteById(id);
	}
	
	public List<Advertisement> findAll(){
		return (List<Advertisement>) advertisementRepository.findAll();
	}
	
	public List<Hotel> findHotelAll() throws Exception{
		List<Hotel> hotels = advertisementRepository.findHotelAll();
		
		return decryptData(hotels);
	}
}
