<template>
  <div class="loginb">
    <div class="loginpic_background">
      <a>Your Vacation</a>
      <div class="loginlogin">
        <a>Login</a>
        <div class="logintextbox">
        <p>username</p>
        <input type="text" placeholder="username">
        <p>password</p>
        <input type="text" placeholder="password"></div>
        <div class="loginbottom">
          <a href="/"><button class="loginregister_btn">
            back
          </button></a>
          <a href="/home">
            <button class="loginlogin_btn">
              Login
            </button>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'LoginPage',
  props: {
    msg: String
  }
}
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
.loginpic_background a{
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
  display: inline-block;
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
  border: 2px solid grey; /* Border color and width */
  border-radius: 10px; /* Border radius */
  padding: 10px;
  width: 90%; /* Padding inside the input */
}

</style>