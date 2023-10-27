<template>
    <div class="HomeBody">
      <div class="homepic_background">
        <div class="hometextbox">
          <div class="hometextanimate">
            <div class="homeanimated-element"><a>Welcome to Your Vacation</a></div>
            <div class="homeanimated-element"><a>Try our web application</a></div>
            <div class="homeanimated-element"><a>For your better holiday!</a></div>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script>
  export default {
    name: 'HomePage',
    props: {
      msg: String
    }
  }
  </script>
  <style>
  .HomeBody{
    width: 100%;
    height: 70vh;
    background-color: rgb(255, 255, 255);
    top: 0%;
    left: 0%;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
  }
  .homepic_background{
    margin-top: 5vh;
    width: 96vw;
    height: 55vh;
    border-radius: 20px;
    background-image: url("https://c1.wallpaperflare.com/preview/460/412/978/beach-sea-holiday-waves.jpg");
    background-size: cover;
    /* Optional, adjusts how the image is displayed */
    background-repeat: no-repeat;
    /* Optional, prevents image repetition */
    display: flex;
    align-items: start;
    justify-content: center;
    flex-direction: row;
  }
  .hometextbox {
    margin-top: 8vh;
    width: 80%;
    display: flex;
    align-items: center;
    justify-content: start;
    flex-direction: column;
  }
  .hometextanimate {
    width: 100%;
    height: 100px;
    position: relative;
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    font-size: 80px;
    color: white;
  }
  
  .homeanimated-element {
    width: 100%;
    height: 180px;
    margin: 50px;
    animation: move-up 8s ease-in-out infinite;
  }
  
  .homeanimated-element a {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 600;
    cursor: default;
    color: rgb(255, 255, 255);
  }
  
  @keyframes move-up {
    0% {
      transform: translateY(200px);
    }
  
    50% {
      transform: translateY(-10px);
    }
  
    100% {
      transform: translateY(-200px);
    }
  }
  </style>