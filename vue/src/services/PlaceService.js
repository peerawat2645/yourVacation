import axios from 'axios';

const baseURL = 'http://localhost:8080/api/v1';

export default {
  PlaceServiceAll(districtId,provinceId,subdistrivtId,tagnameIds) {
    let hotelURL = `${baseURL}/vacation/?districtId=${districtId}&provinceId=${provinceId}&subdistrictId=${subdistrivtId}&tagnameIds=${tagnameIds}`;
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
  getPlaceById(id) {
    const placeURL = `${baseURL}/vacation/${id}`;
    console.log("post")
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  getRandom() {
    const placeURL = `${baseURL}/vacation/random`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
  getAll() {
    const placeURL = `${baseURL}/vacation/all`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: placeURL,
    };

    return axios(config);
  },
};
