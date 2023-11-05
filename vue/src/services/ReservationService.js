import axios from 'axios';

const baseURL = 'http://localhost:8080/api/v1';

export default {
  getDataHotel(roomId) {
    const hotelURL = `${baseURL}/room/?id=${roomId}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  },
  createReservation(roomId,userId,countRoom){
    const hotelURL = `${baseURL}/reserv/?roomId=${roomId}&userId=${userId}&countRoom=${countRoom}`;
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  }
};
