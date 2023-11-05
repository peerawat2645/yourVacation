<template>
  <div class="loginb">
    <div class="loginpic_background">
      <a>Your Vacation</a>
      <div class="loginlogin">
        <a>Login</a>
        <div class="logintextbox">
          <p>Username</p>
          <input type="text" placeholder="Username" v-model="username">
          <p>Password</p>
          <input type="password" placeholder="Password" v-model="password">
        </div>
        <div class="loginbottom">
          <a href="/"><button class="loginregister_btn">
              Back
            </button></a>
          <button class="loginlogin_btn" @click="handleLogin">
            Login
          </button>
        </div>
        <div v-if="error" class="error-message">{{ errorMessage }}</div>
        <div v-if="registrationSuccess" class="notification success">Registration Successful!</div>
      </div>
    </div>
  </div>
</template>
<script>
import apiService from '@/services/apiService';
import HotelService from '@/services/HotelService';
import router from '@/router';
export default {
  name: 'LoginPage',
  props: {
    msg: String
  },
  data() {
    return {
      username: '',
      password: '',
      error: false,
      errorMessage: '',
      registrationSuccess: false,
      userId: '',
      checked: '',
    };
  },
  mounted() {
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('registrationSuccess')) {
      this.registrationSuccess = true;
    }
    const newURL = new URL(window.location.href);
    newURL.searchParams.delete('registrationSuccess');
    window.history.replaceState({}, '', newURL.href);
    setTimeout(function () {
      var notification = document.querySelector(".notification.success");
      if (notification) {
        notification.style.opacity = 0;
        setTimeout(function () {
          notification.style.display = "none";
        }, 1000);
      }
    }, 5000);
  },
  methods: {
    handleLogin() {
      if (!this.username && !this.password) {
        this.error = true;
        this.errorMessage = 'Username and password are required.';
        return;
      }
      else if (!this.username) {
        this.error = true;
        this.errorMessage = 'Username is required.';
        return;
      }
      else if (!this.password) {
        this.error = true;
        this.errorMessage = 'Password is required.';
        return;
      }
      this.error = false;

      apiService.login(this.username, this.password)
        .then((response) => {
          this.checkHotel(response.data.body.userId, response.data.message);
        })
        .catch(error => {
          console.error('Login error:', error);
          this.error = true;
          this.errorMessage = "Username or Password isn't correct";
        });
    },
    checkHotel(id, message) {
      HotelService.checkHotel(id)
        .then((response) => {
          this.checked = response.data.body
          if (message == "user") {
            router.push('/home/' + id);
          }
          else if (message == "hotel") {
            if (response.data.body) {
              router.push('/hotel/home/' + id);
            }
            else {
              router.push('/hotel/create/user/'+id);
            }
          }
        })
        .catch(error => {
          console.error('Login error:', error);
          this.error = true;
          this.errorMessage = "Username or Password isn't correct";
        });
    }
  },
};
</script>
<style>
.loginb {
  width: 99vw;
  height: 97vh;
  background-color: rgb(255, 255, 255);
  margin: 0%;
  padding: 0%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.loginpic_background {
  width: 96vw;
  height: 90vh;
  border-radius: 20px;
  background-image: url("https://c1.wallpaperflare.com/preview/460/412/978/beach-sea-holiday-waves.jpg");
  background-size: cover;
  /* Optional, adjusts how the image is displayed */
  background-repeat: no-repeat;
  /* Optional, prevents image repetition */
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  color: rgb(255, 255, 255);
}

.loginpic_background a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 50px;
}

.loginlogin {
  margin-top: 50px;
  width: 350px;
  height: 350px;
  padding-left: 25px;
  padding-right: 25px;
  padding-left: 25px;
  padding-top: 50px;
  border-radius: 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  background-color: rgba(94, 94, 94, 0.49);
  text-align: left;
  color: rgb(255, 255, 255);
  line-height: 10px;
}

.logintextbox {
  width: 100%;
  height: 45%;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
  margin-top: 30px;
}

.loginlogin a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 50px;
  cursor: default;
}

.loginlogin p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 24px;
  cursor: default;
  height: fit-content;
  margin: 0%;
}

.loginbottom {
  width: 100%;
  height: 70px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  margin-bottom: 30px;
}

.loginbottom a {
  text-decoration: none;
}

.loginlogin_btn {
  text-decoration: none;
  width: 90%;
  padding: 20px 30px;
  height: auto;
  background-color: white;
  border-radius: 15px;
  border-color: white;
  border-width: 3px;
  border-style: solid;
  color: black;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 30px;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.loginlogin_btn:hover {
  background-color: rgb(76, 153, 163);
  color: rgb(255, 255, 255);
}

.loginregister_btn {
  width: 90%;
  padding: 20px 30px;
  height: auto;
  border-radius: 15px;
  border-color: white;
  background-color: transparent;
  border-width: 3px;
  /* Replace '2px' with your desired border width */
  border-style: solid;
  color: rgb(255, 255, 255);
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-size: 30px;
  text-decoration: none;
  display: inline-block;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.loginregister_btn:hover {
  border-color: rgb(255, 255, 255);
  background-color: rgb(76, 153, 163);
  /* Replace '2px' with your desired border width */
  color: rgb(255, 255, 255);
}

input[type="text"] {
  border: 2px solid grey;
  /* Border color and width */
  border-radius: 10px;
  /* Border radius */
  padding: 10px;
  width: 90%;
  /* Padding inside the input */
}

input[type="password"] {
  border: 2px solid grey;
  /* Border color and width */
  border-radius: 10px;
  /* Border radius */
  padding: 10px;
  width: 90%;
  /* Padding inside the input */
}

.error-message {
  background-color: rgba(255, 0, 0, 0.7);
  /* Red background with some transparency */
  color: white;
  /* White text color */
  padding: 10px;
  /* Padding around the error message */
  border-radius: 5px;
  /* Rounded corners */
  display: flex;
  flex-direction: column;
  /* Place text above the close button */
  align-items: center;
  justify-content: space-between;
  margin-top: -30px;
  /* Larger negative margin to move it closer to loginbottom */
}

.notification.success {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  background-color: green;
  /* Change the background color as needed */
  color: white;
  /* Change the text color as needed */
  padding: 10px;
  text-align: center;
  z-index: 1000;
  /* Ensure it's on top of other elements */
  opacity: 1;
  transition: opacity 1s;
  /* Set the duration of the fade (1s = 1 second) */
}
</style>