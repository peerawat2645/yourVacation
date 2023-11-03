package th.ac.ku.kps.eng.cpe.ds.project.model;
// Generated Oct 7, 2023, 10:27:50 PM by Hibernate Tools 5.6.3.Final

import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * User generated by hbm2java
 */
public class User implements java.io.Serializable {

	private Integer userId;
	private String name;
	private String lastname;
	private String email;
	private String username;
	private String password;
	private String phone;
	private int money;
	private String address;
	@JsonIgnore
	private Set reservations = new HashSet(0);
	@JsonIgnore
	private Set<Role> roles = new HashSet(0);

	public User() {
	}

	public User(String name, String lastname, String email, String username, String password, String phone, int money,
			String address) {
		this.name = name;
		this.lastname = lastname;
		this.email = email;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.money = money;
		this.address = address;
	}

	public User(String name, String lastname, String email, String username, String password, String phone, int money,
			String address, Set reservations, Set roles) {
		this.name = name;
		this.lastname = lastname;
		this.email = email;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.money = money;
		this.address = address;
		this.reservations = reservations;
		this.roles = roles;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getMoney() {
		return this.money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Set getReservations() {
		return this.reservations;
	}

	public void setReservations(Set reservations) {
		this.reservations = reservations;
	}

	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

}
