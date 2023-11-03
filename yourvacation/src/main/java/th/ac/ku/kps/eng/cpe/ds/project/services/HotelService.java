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

	public static String decrypt(String encryptedText, PrivateKey privateKey) throws Exception {
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
		return new String(decryptedBytes);
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

	public List<Hotel> findByGuestAndNotInReservationId(int guest, List<Integer> roomId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndNotInReservationId(guest, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByAmountRoomAndNotInReservationId(int amountRoom, List<Integer> roomId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByAmountRoomAndNotInReservationId(amountRoom, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByPriceAndNotInReservationId(int price, List<Integer> roomId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByPriceAndNotInReservationId(price, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndAmountRoomAndNotInReservationId(int guest, int amountRoom, List<Integer> roomId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndAmountRoomAndNotInReservationId(guest, amountRoom, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndPriceAndNotInReservationId(int guest, int price, List<Integer> roomId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndPriceAndNotInReservationId(guest, price, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByAmountRoomAndPriceAndNotInReservationId(int amountRoom, int price, List<Integer> roomId)
			throws Exception {
		List<Hotel> hotels = hotelRepository.findByAmountRoomAndPriceAndNotInReservationId(amountRoom, price, roomId);
		return decryptData(hotels);
	}

	public List<Hotel> findByGuestAndAmountRoomAndPriceAndNotInReservationId(int guest, int amountRoom, int price,
			List<Integer> roomId) throws Exception {
		List<Hotel> hotels = hotelRepository.findByGuestAndAmountRoomAndPriceAndNotInReservationId(guest, amountRoom,
				price, roomId);
		return decryptData(hotels);
	}

}
