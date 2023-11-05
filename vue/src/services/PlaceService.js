import axios from 'axios';

const baseURL = 'http://localhost:8080/api/v1';

export default {
  PlaceServiceAll(districtId,provinceId,subdistrivtId,tagnameIds) {
    console.log(tagnameIds.length)
    const hotelURL = `${baseURL}/vacation/?districtId=${districtId}&provinceId=${provinceId}&subdistrictId=${subdistrivtId}&tagnameId=${tagnameIds}`;
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
};
