package th.ac.ku.kps.eng.cpe.ds.project.services;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Cipher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import th.ac.ku.kps.eng.cpe.ds.project.model.Hotel;
import th.ac.ku.kps.eng.cpe.ds.project.repository.HotelRepository;

@Service
public class HotelService {
	@Autowired
	private HotelRepository hotelRepository;

	public static KeyPair generateKeyPair() throws NoSuchAlgorithmException {
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(2048); // You can change the key size as needed
		return keyPairGenerator.generateKeyPair();
	}

	public static String encrypt(String data, PublicKey publicKey) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] encryptedBytes = cipher.doFinal(data.getBytes());
		return Base64.getEncoder().encodeToString(encryptedBytes);
	}

	

	public static Hotel encryptData(Hotel hotel) throws Exception {
		KeyPair keypair = generateKeyPair();
		PublicKey publicKey = keypair.getPublic();
		hotel.setAddress(encrypt(hotel.getAddress(), publicKey));
		hotel.setName(encrypt(hotel.getName(), publicKey));

		PrivateKey privateKey = keypair.getPrivate();

		// Convert private key to byte array
		byte[] privateKeyBytes = privateKey.getEncoded();

		// Encode the private key bytes as a Base64 string (for storage or transmission)
		String encodedPrivateKey = Base64.getEncoder().encodeToString(privateKeyBytes);
		hotel.setPrivateKey(encodedPrivateKey);
		return hotel;
	}
	
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

	public Hotel save(Hotel hotel) throws Exception {
		hotel = encryptData(hotel);
		return hotelRepository.save(hotel);
	}

	public Hotel findById(int id) throws Exception {
		List<Hotel> hotels = new ArrayList<Hotel>();
		hotels.add(hotelRepository.findById(id).orElse(null));

		return decryptData(hotels).get(0);
	}

	public void deleteById(int id) {
		hotelRepository.deleteById(id);
	}

	public List<Hotel> findAll() {
		return (List<Hotel>) hotelRepository.findAll();
	}

	public List<Hotel> findByNotInReservationId(List<Integer> roomId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByNotInReservationId(roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndNotInReservationIdAndSubdistrictId(int guest, List<Integer> roomId,int subdistrictId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndNotInReservationIdAndSubdistrictId(guest, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByAmountRoomAndNotInReservationIdAndSubdistrictId(int amountRoom, List<Integer> roomId,int subdistrictId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByAmountRoomAndNotInReservationIdAndSubdistrictId(amountRoom, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByPriceAndNotInReservationIdAndSubdistrictId(int priceMin,int priceMax, List<Integer> roomId,int subdistrictId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByPriceAndNotInReservationIdAndSubdistrictId(priceMin, priceMax, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndAmountRoomAndNotInReservationIdAndSubdistrictId(int guest, int amountRoom, List<Integer> roomId,int subdistrictId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndAmountRoomAndNotInReservationIdAndSubdistrictId(guest, amountRoom, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndPriceAndNotInReservationIdAndSubdistrictId(int guest, int priceMin,int priceMax, List<Integer> roomId,int subdistrictId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndPriceAndNotInReservationIdAndSubdistrictId(guest,priceMin, priceMax, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByAmountRoomAndPriceAndNotInReservationIdAndSubdistrictIdAndSubdistrictId(int amountRoom, int priceMin,int priceMax, List<Integer> roomId,int subdistrictId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(amountRoom, priceMin, priceMax, roomId, subdistrictId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(int guest, int amountRoom, int priceMin,int priceMax,
			List<Integer> roomId,int subdistrictId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndAmountRoomAndPriceAndNotInReservationIdAndSubdistrictId(guest, amountRoom,
				priceMin, priceMax, roomId, subdistrictId);
		return decryptData(hotels);
	}

}
