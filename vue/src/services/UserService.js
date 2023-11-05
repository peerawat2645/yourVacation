import axios from 'axios';

const baseURL = 'http://localhost:8080/api/v1';


export default {
  getUserData(id) {
    console.log(id)
    const url = `${baseURL}/user/${id}`;
    const config = {
      method: 'get',
      headers: {
        'Content-Type': 'application/json',
      },
      url: url,
    };

    return axios(config);
  },
  saveData(user) {
    console.log(JSON.stringify(user))
    const url = `${baseURL}/user/`;
    const config = {
      method: 'post',
      headers: {
        'Content-Type': 'application/json',
      },
      data:JSON.stringify(user),
      url: url,
    };

    return axios(config);
  }


};
