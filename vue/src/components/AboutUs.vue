<template>
  <div class="AboutBody">
    <div class="ABox">
      <div class="AAbout">
        <a>About Us</a>
        <p>Our web application will not waste your time as you need to find attractions and accommodations at the same time. We will save you from having to search for information on multiple websites and put it together for your trip. You can find all the information you need from us in one place.</p>
        <div class="AThankyou"><a>Thank you for trusting us.</a></div>
      </div>
      <div class="AContact">
        <a style="color: rgb(83, 176, 177);">Contact Us</a>
        <p style="margin: 0%;">If you have any questions or would like to contact us, please contact us through the channels below.</p>
        <p style="margin: 0%;">or</p>
        <p style="margin: 0%;">contact advertising</p>
        <div class="AContactName">
          <a>Email</a>
          <p>DataSecurityCPEGroup3@gmail.com</p>
        </div>
        <div class="AContactName">
          <a>Phone</a>
          <p>(+66) 99-1234568</p>
        </div>
        <div class="AContactName">
          <a>Location</a>
          <p>หมู่ที่ 1 ถนนมาลัยแมน ตำบลทุ่งกระพังโหม อำเภอกำแพงแสน จังหวัดนครปฐม 73140.</p>
        </div>
      </div>
    </div>
  </div>
    </template>
    <script>
    export default {
      name: 'AboutUs',
      props: {
        msg: String
      }
    }
    </script>
    <style>
    .AboutBody{
      margin-top: 10vh;
      width: 100%;
    height: 90vh;
    background-color: rgb(255, 255, 255);
    top: 0%;
    left: 0%;
    position: relative;
    display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
    }
    .ABox{
      width: 95%;
      padding: 20px;
      height: 95%;
      display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
    }
    .AAbout{
      padding: 50px 0px;
      width: 50%;
      height: 98%;
      text-align: start;
      display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
    }
    .AAbout a{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 40px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
    }
    .AAbout p{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 24px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
    }
    .AThankyou{
      width: 60%;
      margin-left: 20%;
      margin-right: 20%;
      display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  border-radius: 10px;
  background-color: rgb(83, 176, 177);
  padding: 10px;
    }
    .AThankyou a{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
    }
    .AContact{
      width: 45%;
      height: 98%;
      padding: 50px;
      display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  background-color: rgb(241, 240, 240);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
    }
    .AContact a{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 40px;
  font-weight: 600;
  cursor: default;
  color: rgb(83, 176, 177);
    }
    .AContact p{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
    }
    .AContactName{
      width: 80%;
      height: 20%;
      display: flex;
      align-items: start;
      justify-content: space-between;
      flex-direction: column;
      text-align: start;
    }
    .AContactName a{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 24px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
    }
    .AContactName p{
      font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
    }
    </style>