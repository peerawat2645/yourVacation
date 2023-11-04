import axios from 'axios';

const baseURL = 'http://localhost:8080/api/v1';

export default {
  subdistrict() {
    const subdistrictURL = `${baseURL}/subdistrict/`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: subdistrictURL,
    };

    return axios(config);
  },
  district() {
    const subdistrictURL = `${baseURL}/district/`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: subdistrictURL,
    };

    return axios(config);
  },
  province() {
    const subdistrictURL = `${baseURL}/province/`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: subdistrictURL,
    };

    return axios(config);
  },

  districtId(id) {
    const districtURL = `${baseURL}/district/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: districtURL,
    };

    return axios(config);
  },

  subdistrictId(id) {
    const districtURL = `${baseURL}/subdistrict/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: districtURL,
    };

    return axios(config);
  }


};
