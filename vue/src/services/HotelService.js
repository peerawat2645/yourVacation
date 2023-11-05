import axios from 'axios';


const baseURL = 'http://localhost:8080/api/v1';

export default {
  hotelRecommend() {
    const hotelRecommendURL = `${baseURL}/hotel/ads`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelRecommendURL,
    };

    return axios(config);
  },
  hotelInAds(id) {
    const hotelRecommendURL = `${baseURL}/hotel/ads/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelRecommendURL,
    };

    return axios(config);
  },
  createAds(id) {
    const hotelRecommendURL = `${baseURL}/hotel/ads/create/${id}`;
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelRecommendURL,
    };

    return axios(config);
  },
  vacationRecommend(id) {
    const vacayRecommendURL = `${baseURL}/vacation/random/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: vacayRecommendURL,
    };

    return axios(config);
  },
  HotelServiceAll(districtId, provinceId, subdistrictId, amountRoom, guest, priceMax, priceMin) {

    const hotelURL = `${baseURL}/hotel/find?districtId=${districtId}&provinceId=${provinceId}&subdistrictId=${subdistrictId}&amountRoom=${amountRoom}&guest=${guest}&priceMax=${priceMax}&priceMin=${priceMin}`;
    console.log(hotelURL)
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  },
  HotelServiceAllByVacationId(vacationId) {

    const hotelURL = `${baseURL}/hotel/findHotel/${vacationId}`;
    console.log(hotelURL)
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  },
  getHotel(id) {

    const hotelURL = `${baseURL}/hotel/${id}`;
    console.log(hotelURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  },
  getImagePath(id) {

    const hotelURL = `${baseURL}/editImage/${id}`;
    console.log(hotelURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: hotelURL,
    };

    return axios(config);
  },
  uploadImage(formData,id) {
    const uploadURL = `${baseURL}/hotel/uploadImage/${id}`;

    return axios.post(uploadURL, formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      }
    });
  },
  near(id) {
    const placeURL = `${baseURL}/hotel/random/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  facilities(id) {
    const placeURL = `${baseURL}/hotel/facilities/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  rooms(id) {
    const placeURL = `${baseURL}/hotel/rooms/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  roomData(id) {
    const placeURL = `${baseURL}/room/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  roomEdit(id) {
    const placeURL = `${baseURL}/room/edit/${id}`;
    console.log(placeURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  roomAdd(room, id) {
    const placeURL = `${baseURL}/room/create/${id}`;
    console.log(placeURL)
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(room),
      url: placeURL,
    };

    return axios(config);
  },
  roomUpdate(room, id) {
    const placeURL = `${baseURL}/room/update/${id}`;
    console.log(JSON.stringify(room))
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(room),
      url: placeURL,
    };

    return axios(config);
  },
  hotelAdd(hotel, subId, userId) {
    const placeURL = `${baseURL}/hotel/create/${subId}/user/${userId}`;
    console.log(JSON.stringify(hotel))
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(hotel),
      url: placeURL,
    };

    return axios(config);
  },
  hotelUpdate(hotel, subId) {

    const placeURL = `${baseURL}/hotel/update/${subId}`;
    console.log(JSON.stringify(hotel))
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data: JSON.stringify(hotel),
      url: placeURL,
    };

    return axios(config);
  },
  getDataHotel(id) {
    const placeURL = `${baseURL}/hotel/edit/user/${id}`;
    console.log(placeURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },

  getDataSubdistrict(id) {
    const placeURL = `${baseURL}/hotel/subdistrict/${id}`;
    console.log(placeURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  roomDelete(id) {
    const placeURL = `${baseURL}/room/delete/${id}`;
    console.log(placeURL)
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  getImage(id){
    const placeURL = `${baseURL}/hotel/image/${id}`;
    console.log(placeURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  checkHotel(id){
    const placeURL = `${baseURL}/hotel/checked/${id}`;
    console.log(placeURL)
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  }
};
