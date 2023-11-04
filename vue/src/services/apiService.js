import axios from 'axios';

const baseURL = 'http://localhost:8080/api/auth';

export default {
  login(username, password) {
    const loginURL = `${baseURL}/login`;
    const data = { username, password };
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data,
      url: loginURL,
    };

    return axios(config);
  },

  register(user) {
    const registerURL = `${baseURL}/register`;
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(user),
      url: registerURL,
    };

    return axios(config);
  },
  registerHotel(user) {
    const registerHotelURL = `${baseURL}/register/hotel`;
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(user),
      url: registerHotelURL,
    };

    return axios(config);
  },

};
