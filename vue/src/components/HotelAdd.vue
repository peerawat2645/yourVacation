<template>
    <div class="ahbody">
      <a href="/hotel/home" class="ahblack-button">Back</a>
      <div class="ahContact">
        <a style="color: rgb(83, 176, 177);">Add Room Type Detail</a>
        <div class="ahContactName">
            <a>RoomType Name</a>
            <input type="text" class="ahcustom-input" placeholder="Your Input"></div>
      <div class="ahContactNameRow">
        <div class="ahContactNameRowdiv3">
          <a>จำนวนห้อง</a>
          <input type="text" class="ahcustom-input" placeholder="Your Input"></div>
      <div class="ahContactNameRowdiv3">
        <a>จำนวนผู้เข้าพัก</a>
        <input type="text" class="ahcustom-input" placeholder="Your Input"></div>
          <div class="ahContactNameRowdiv3">
            <a>ราคา</a>
            <input type="text" class="ahcustom-input" placeholder="Your Input"></div>
    </div>
    <div class="ahContactLabel">
      <label style="margin-left: 10px; margin-right:10px;">
        <input type="checkbox"> <a style="font-size: 16px;
        font-weight: 600; color:black">เครื่องปรับอากาศ</a>
    </label>
    <label style="margin-left: 10px; margin-right:10px;">
      <input type="checkbox"> <a style="font-size: 16px;
      font-weight: 600; color:black">เครื่องทำน้ำอุ่น</a>
  </label>
  <label style="margin-left: 10px; margin-right:10px;">
    <input type="checkbox"> <a style="font-size: 16px;
    font-weight: 600; color:black">พัดลม</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">TV</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">ตู้เย็น</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">โทรศัพท์สายตรง</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">อนุญาติให้นำสัตว์เข้าพักได้</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">อนุญาติให้สูบบุหรี่ในห้องพัก</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">ที่จอดรถ</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">ลิฟต์</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">สระว่ายน้ำ</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">ฟิตเนส</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">Wifi</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">กล้องวงจรปิด</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">ร้านอาหาร</a>
</label>
<label style="margin-left: 10px; margin-right:10px;">
  <input type="checkbox"> <a style="font-size: 16px;
  font-weight: 600; color:black">รปภ</a>
</label>
    </div>
        <div class="ahUpload">
            <input type="file" ref="fileInput" @change="handleFileChange" accept="image/*">
            <button @click="uploadFile">Upload</button>
            <div v-if="imageUrl">
              <img :src="imageUrl" alt="Uploaded Image" />
            </div>
        </div>
        <div style="width: 100%; align-items:center; "><button class="ahblack-button" @click="openPopup">เพิ่ม</button></div>
        <div class="ahpopup-overlay" v-if="isPopupOpen">
          <div class="ahpopup">
            <span @click="closePopup" class="ahclose-button">X</span>
            <h2>ยืนยันการเพิ่มห้องพัก</h2>
            <a href="/hotel/home" class="ahblack-button" style="color: white; font-size:18px">Success</a>
          </div>
        </div>
      </div>
    </div>
  </template>
  <script>
  export default {
    name: 'AddHotel',
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
  .ahbody {
    width: 100%;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
  }
  .ahcustom-input {
    border: 10px solid grey;
    /* You can add more custom styles as needed */
    height: 40px;
  }
  .ahblack-button {
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
  
  .ahblack-button:hover {
    background-color: #333;
    /* Darker shade of black on hover */
  }
  .ahUpload {
    width: 80%;
    height: 15%;
    display: flex;
    align-items: start;
    justify-content: space-between;
    flex-direction: column;
  }
  .ahContact {
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
  
  .ahContact a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 40px;
    font-weight: 600;
    cursor: default;
    color: rgb(83, 176, 177);
  }
  
  .ahContact p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  
  .ahContactName {
    width: 80%;
    height: 20%;
    display: flex;
    align-items: start;
    justify-content: space-between;
    flex-direction: column;
  }
  .ahContactLabel {
    width: 80%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: row;
    flex-wrap: wrap;
    padding: 20px 0px;
  }
  .ahContactNameRow {
    width: 80%;
    height: 20%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: row;
  }
  .ahContactNameRowdiv{
    width: 50%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: column;
  }
  .ahContactNameRowdiv3{
    width: 32%;
    height: auto;
    display: flex;
    align-items: start;
    justify-content: start;
    flex-direction: column;
  }
  .ahContactName a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .ahContactName p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .ahContactNameRowdiv a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .ahContactNameRowdiv p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .ahContactNameRowdiv3 a {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 20px;
    font-weight: 600;
    cursor: default;
    color: rgb(0, 0, 0);
  }
  
  .ahContactNameRowdiv3 p {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;
    font-weight: 400;
    cursor: default;
    color: rgb(64, 64, 64);
  }
  .ahpopup-overlay {
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
  
  .ahpopup {
    background: #fff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    width: 400px;
    max-width: 90%;
    position: relative;
  }
  
  .ahclose-button {
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
    font-size: 20px;
  }
  </style>