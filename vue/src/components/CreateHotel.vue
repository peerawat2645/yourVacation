<template>
    <div class="chbody">
      <div class="chContact">
        <a style="color: rgb(83, 176, 177);">Create Hotel</a>
        <div class="chContactName">
          <a>Name</a>
          <input type="text" class="chcustom-input" placeholder="Your Input">
        </div>
        <div class="chContactName">
          <a>Description</a>
          <input type="text" class="chcustom-input" placeholder="Your Input">
        </div>
        <div class="chContactName">
          <a>Location</a>
          <input type="text" class="chcustom-input" placeholder="Your Input">
        </div>
        <div class="chContactNameRow">
          <div class="chContactNameRowdiv3">
            <a>เวลาเปิด</a>
            <input type="text" class="chcustom-input" placeholder="Your Input">
          </div>
          <div class="chContactNameRowdiv3">
            <a>เวลาปิด</a>
            <input type="text" class="chcustom-input" placeholder="Your Input">
          </div>
          <div class="chContactNameRowdiv3">
            <a>เวลา checkin</a>
            <input type="text" class="chcustom-input" placeholder="Your Input">
          </div>
        </div>
        <div class="chUpload">
            <input type="file" ref="fileInput" @change="handleFileChange" accept="image/*">
            <button @click="uploadFile">Upload</button>
            <div v-if="imageUrl">
              <img :src="imageUrl" alt="Uploaded Image" />
            </div>
        </div>
        <div style="width: 100%; align-items:center; "><button class="chblack-button" @click="openPopup">สร้าง</button></div>
        <div class="chpopup-overlay" v-if="isPopupOpen">
          <div class="chpopup">
            <span @click="closePopup" class="chclose-button">X</span>
            <h2>ยืนยันข้อมูลโรงแรม</h2>
            <a href="/hotel/home" class="chblack-button" style="color: white; font-size:18px">Success</a>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script>
  export default {
    name: 'HotelCreate',
    props: {
      msg: String
    },
    data() {
      return {
        isPopupOpen: false,
        imageWidth: 300, // You can set these values dynamically
        imageHeight: 300,
      };
    },
    methods: {
      openPopup() {
        this.isPopupOpen = true;
      },
      closePopup() {
        this.isPopupOpen = false;
      },
    },
  }
  </script>
  <style>
  .chbody {
    width: 100%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .chcustom-input {
    border: 10px solid grey;
    /* You can add more custom styles as needed */
    height: 40px;
  }
  .chblack-button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #000;
    color: #fff;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin: 20px;
    align-self: flex-start;
  }
  
  .chblack-button:hover {
    background-color: #333;
    /* Darker shade of black on hover */
  }
  .chUpload {
    width: 80%;
    height: 15%;
    display: flex;
    align-items: start;
    justify-content: space-between;
    flex-direction: column;
  }
  .chContact {
    width: 45%;
    height: 85%;
    padding: 50px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: column;
    background-color: rgb(241, 240, 240);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 20px;
  }
  
  .chContact a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 40px;
    font-weight: 600;
    cursor: default;
    color: rgb(83, 176, 177);
  }
  
  .chContact p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  
  .chContactName {
    width: 80%;
    height: 20%;
    display: flex;
    align-items: start;
    justify-content: space-between;
    flex-direction: column;
  }
  .chContactLabel {
    width: 80%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: row;
    flex-wrap: wrap;
    padding: 20px 0px;
  }
  .chContactNameRow {
    width: 80%;
    height: 20%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: row;
  }
  .chContactNameRowdiv{
    width: 50%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: column;
  }
  .chContactNameRowdiv3{
    width: 32%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: column;
  }
  .chContactName a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .chContactName p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .chContactNameRowdiv a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .chContactNameRowdiv p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .chContactNameRowdiv3 a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .chContactNameRowdiv3 p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .chpopup-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 999; /* Adjust z-index as needed */
  }
  
  .chpopup {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    width: 400px;
    max-width: 90%;
    position: relative;
  }
  
  .chclose-button {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 20px;
  }
  </style>