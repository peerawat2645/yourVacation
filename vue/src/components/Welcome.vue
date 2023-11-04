<template>
  <div class="b">
    <div class="pic_background">
      <div class="login">
        <a>Your Vacation</a>
        <p>vacation happiness that you can choose for yourself</p>
        <div class="bottom">
          <a href="/login">
            <button class="login_btn">
              Login
            </button>
          </a>
          <a href="/register"><button class="register_btn">
            Register
          </button></a>
        </div>
        <a href="/registerHotel" ><button class="small-link">For Hotel</button></a>
      </div>
      <div class="textbox">
        <div class="textanimate">
          <div class="animated-element"><a>Welcome to Your Vacation</a></div>
          <div class="animated-element"><a>Try our web application</a></div>
          <div class="animated-element"><a>For your better holiday!</a></div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'WelcomePage',
  props: {
    msg: String
  }
}
</script>
<style>
.b {
  width: 99vw;
  height: 97vh;
  background-color: rgb(255, 255, 255);
  margin: 0%;
  padding: 0%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}

.pic_background {
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
  justify-content: space-between;
  flex-direction: row;
}

.login {
  width: 450px;
  height: 380px;
  padding-left: 25px;
  padding-right: 25px;
  padding-left: 25px;
  padding-top: 0px;
  margin-left: 20px;
  border-radius: 20px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
  background-color: rgba(87, 176, 177, 0.49);
  text-align: left;
  color: white;
}

.textbox {
  width: 50%;
  display: flex;
  align-items: start;
  justify-content: center;
  flex-direction: column;
}

.login a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 60px;
  cursor: default;
}

.login p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 40px;
  cursor: default;
}

.bottom {
  width: 80%;
  height: 70px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
  margin-bottom: 30px;
}


.login_btn {
  width: 90%;
  padding-left: 10px;
  padding-right: 30px;
  padding-top: 10px;
  padding-bottom: 10px;
  height: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  background-color: white;
  border-radius: 15px;
  border-color: white;
  border-width: 3px;
  border-style: solid;
  color: black;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 40px;
  text-decoration: none;
  display: inline-block;
  text-align: center;
}

.login_btn:hover {
  background-color: rgb(76, 153, 163);
  color: rgb(255, 255, 255);
}

.register_btn {
  width: 90%;
  padding-left: 10px;
  padding-right: 30px;
  padding-top: 10px;
  padding-bottom: 10px;
  height: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  border-radius: 15px;
  border-color: white;
  background-color: transparent;
  border-width: 3px;
  /* Replace '2px' with your desired border width */
  border-style: solid;
  color: rgb(255, 255, 255);
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-size: 40px;
  text-decoration: none;
  display: inline-block;
  text-align: center;
}

.register_btn:hover {
  border-color: rgb(255, 255, 255);
  background-color: rgb(76, 153, 163);
  /* Replace '2px' with your desired border width */
  color: rgb(255, 255, 255);
}

.textanimate {
  width: 600px;
  height: 200px;
  position: relative;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 80px;
  color: white;
}

.animated-element {
  width: 100%;
  height: 180px;
  margin: 50px;
  animation: move-upp 8s ease-in-out infinite;
}

.animated-element a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(255, 255, 255);
}
.small-link {
  white-space: nowrap;
  width: 90%;
  padding-left: 10px;
  padding-right: 30px;
  padding-top: 10px;
  padding-bottom: 10px;
  height: auto;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  background-color: white;
  border-radius: 15px;
  border-color: white;
  border-width: 3px;
  border-style: solid;
  color: black;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 40px;
  text-decoration: none;
  display: inline-block;
  text-align: center;
}
.small-link:hover {
  background-color: rgb(76, 153, 163);
  color: rgb(255, 255, 255);
}

@keyframes move-upp {
  0% {
    transform: translateY(250px);
  }

  50% {
    transform: translateY(-40px);
  }

  100% {
    transform: translateY(-320px);
  }
}</style>