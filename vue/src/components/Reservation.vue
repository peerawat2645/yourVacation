<template>
  <div class="hrbody">
    <a href="/home#foryou" class="hrblack-button">Back</a>
    <div class="hrBox">
      <div class="hrpic">
        <div class="hrpicture-slider">
          <div class="hrslider-container">
            <div class="hrslider" :style="sliderStyles">
              <img v-for="(image, index) in images" :key="index" :src="image" :class="{ active: index === currentIndex }"
                alt="Slider Image" />
            </div>
          </div>
          <div class="hrpreview-container" style="overflow-x: auto; white-space: nowrap; width: 500px;">
            <div class="hrpreview" v-for="(image, index) in images" :key="index">
              <img :src="image" @click="changeSlide(index)" alt="Preview Image" />
            </div>
          </div>
        </div>
      </div>
      <div class="hrContact">
        <a style="color: rgb(83, 176, 177);">Check Reservation Detail</a>
        <p>If you have any questions or would like to contact us, please contact us through the channels below.</p>
        <div class="hrContactNameRow">
          <div class="hrContactNameRowdiv">
            <a>Hotel Name</a>
            <p>{{roomHotel.name}}</p>
          </div>
          <div class="hrContactNameRowdiv">
            <a>RoomType</a>
            <p>{{roomHotel.type}}</p>
          </div>
        </div>
        <div class="hrContactNameRow">
          <div class="hrContactNameRowdiv">
            <a>จำนวนห้อง</a>
            <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="formdata.countRoom">
          </div>
          <div class="hrContactNameRowdiv">
            <a>จำนวนผู้เข้าพัก</a>
            <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="formdata.guest">
          </div>
        </div>
        <div style="width: 100%; align-items:center; "><button class="hrblack-button"
            @click="openPopup">ตรวจสอบข้อมูล</button></div>
        <div class="popup-overlay" v-if="isPopupOpen">
          <div class="popup">
            <span @click="closePopup" class="close-button">X</span>
            <h2>ตรวจสอบข้อมูลและชำระเงิน</h2>
            <div class="popupdetail">
              <div class="popupdetailimg"><img :src="imageUrl" alt="Image Description" :width="imageWidth" :height="imageHeight" /></div>
              <div class="popupdetailcontent">
                <div class="hrContactNameRow">
                  <div class="hrContactNameRowdiv">
                    <a>Hotel Name</a>
                    <p>{{roomHotel.name}}</p>
                  </div>
                  <div class="hrContactNameRowdiv">
                    <a>RoomType</a>
                    <p>{{roomHotel.type}}</p>
                  </div>
                </div>
                <div class="hrContactNameRow">
                  <div class="hrContactNameRowdiv3">
                    <a>จำนวนห้อง</a>
                    <p>{{formdata.countRoom}} ห้อง</p>
                  </div>
                  <div class="hrContactNameRowdiv3">
                    <a>จำนวนผู้เข้าพัก</a>
                    <p>{{formdata.guest}} คน</p>
                  </div>
                  <div class="hrContactNameRowdiv3">
                    <a>ราคา</a>
                    <p>{{calPrice(formdata.countRoom ,roomHotel.price)}} บาท</p>
                  </div>
                </div>
                <div class="hrContactNameRow">
                  <div class="hrContactNameRowdiv">
                    <a>Name</a>
                    <p>{{user.name}}</p>
                  </div>
                  <div class="hrContactNameRowdiv">
                    <a>Surname</a>
                    <p>{{user.lastname}}</p>
                  </div>
                </div>
                <div class="hrContactName">
                  <div class="hrContactNameRowdiv1">
                  <a>Phone</a>
                  <p>{{user.phone}}</p></div>
                </div>
                <div class="hrContactName">
                  <div class="hrContactNameRowdiv1">
                  <a>Email</a>
                  <p>{{user.email}}</p></div>
                </div>
              </div>
            </div>
            <button class="hrblack-button" style="color: white; font-size:18px" @click="createReservation">ยืนยันการจอง</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import ReservationService from '@/services/ReservationService';
import UserService from '@/services/UserService';
import router from '@/router';
export default {
  name: 'ReservationHotel',
  props: {
    msg: String
  },
  data() {
    return {
      isPopupOpen: false,
      imageUrl: 'https://f.ptcdn.info/986/049/000/on5jobi79VITjvICQT0-o.png',
      imageWidth: 250, // You can set these values dynamically
      imageHeight: 250,
      images: [
        'https://static.thairath.co.th/media/dFQROr7oWzulq5FZYANuEZlRY89MbBZGbB03TL7pGDPeb11CkdQJhamTfLVYfEGR0DP.jpg',
        'https://thumbs.dreamstime.com/b/beach-sea-18378306.jpg',
        'https://static.thairath.co.th/media/dFQROr7oWzulq5FZYANuEZlRY89MbBZGbB03TL7pGDPeb11CkdQJhamTfLVYfEGR0DP.jpg',
        'https://thumbs.dreamstime.com/b/beach-sea-18378306.jpg',
        'https://static.thairath.co.th/media/dFQROr7oWzulq5FZYANuEZlRY89MbBZGbB03TL7pGDPeb11CkdQJhamTfLVYfEGR0DP.jpg',
        'https://thumbs.dreamstime.com/b/beach-sea-18378306.jpg',
        'https://static.thairath.co.th/media/dFQROr7oWzulq5FZYANuEZlRY89MbBZGbB03TL7pGDPeb11CkdQJhamTfLVYfEGR0DP.jpg',
        'https://thumbs.dreamstime.com/b/beach-sea-18378306.jpg',
        // Add more image URLs here
      ],
      currentIndex: 0,
      roomHotel:[],
      formdata:{
        guest:'',
        countRoom:''
      },
      user:[],
    };
  },
  computed: {
    sliderStyles() {
      return {
        transform: `translateX(-${this.currentIndex * 100}%)`,
      };
    }
  },
  created() {
    this.getData();
    this.getUserData();
  },
  methods: {
    openPopup() {
      this.isPopupOpen = true;
    },
    closePopup() {
      this.isPopupOpen = false;
    },
    changeSlide(index) {
      this.currentIndex = index;
    },
    calPrice(x,y){
      return parseInt(x)*parseInt(y);
    },
    getData() {
      ReservationService.getDataHotel(this.$route.params.id)
        .then((response) => {
          {
            this.roomHotel = response.data.body
            
          }
        })
        .catch(error => {
          if (error.response) {
            if (error.response.status === 400) {
              this.error = true;
              this.errorMessage = error.response.data.body;
            }
          }
        });
    },
    getUserData() {
      UserService.getUserData(this.$route.params.userId)
        .then((response) => {
          {
            this.user = response.data.body
            
          }
        })
        .catch(error => {
          if (error.response) {
            if (error.response.status === 400) {
              this.error = true;
              this.errorMessage = error.response.data.body;
            }
          }
        });
    },
    createReservation() {
      ReservationService.createReservation(this.$route.params.id,this.$route.params.userId)
        .then(() => {
          {
            router.push('/home/'+this.$route.params.userId);
            
          }
        })
        .catch(error => {
          if (error.response) {
            if (error.response.status === 400) {
              this.error = true;
              this.errorMessage = error.response.data.body;
            }
          }
        });
    },
  },
}
</script>
<style>
.hrbody {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.hrBox {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}

.hrpic {
  width: 50%;
  height: 80vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: start;
}

.hrblack-button {
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

.hrblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}

.hrContact {
  width: 45%;
  height: auto;
  padding: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  background-color: rgb(241, 240, 240);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
}

.hrContact a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 40px;
  font-weight: 600;
  cursor: default;
  color: rgb(83, 176, 177);
}

.hrContact p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}

.hrContactName {
  width: 80%;
  height: 20%;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.hrContactNameRow {
  width: 80%;
  height: 20%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.hrContactNameRowdiv {
  width: 50%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
  border: 1px solid #7e7e7e;
  border-radius: 10px;
  padding: 5px 10px;
  margin: 5px;
}
.hrContactNameRowdiv1 {
  width: auto;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
  border: 1px solid #7e7e7e;
  border-radius: 10px;
  padding: 5px 10px;
  margin: 5px;
}
.hrContactNameRowdiv3 {
  width: 32%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
  border: 1px solid #7e7e7e;
  border-radius: 10px;
  padding: 5px 10px;
  margin: 5px;
}

.hrContactName a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hrContactName p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}

.hrContactNameRowdiv a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hrContactNameRowdiv p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}

.hrContactNameRowdiv3 a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hrContactNameRowdiv3 p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}

.popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
  /* Adjust z-index as needed */
}

.popup {
  background: #fff;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  width: 60%;
  max-width: 90%;
  position: relative;
}
.popupdetail{
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}
.popupdetailimg{
  width: 30%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}
.popupdetailcontent{
  width: 70%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}
.close-button {
  position: absolute;
  top: 10px;
  right: 10px;
  cursor: pointer;
  font-size: 20px;
}

.hrpicture-slider {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.hrslider-container {
  width: 90%;
  overflow: hidden;
  border-radius: 5px;
}

.hrslider {
  display: flex;
  transition: transform 0.3s ease-in-out;
}

.hrslider img {
  width: 100%;
  height: auto;
  background-color: antiquewhite;
  border-radius: 5px;
}

.hrpreview-container {
  display: flex;
  justify-content: center;
  margin-top: 10px;
  /* Adjust the margin as needed */
}

.hrpreview {
  cursor: pointer;
  margin: 0 10px;
  /* Adjust the margin as needed */
}

.hrpreview img {
  width: 100px;
  /* Adjust the width of the preview images */
  height: auto;
  object-fit: cover;
  border: 2px solid transparent;
  border-radius: 5px;
}

.preview img.active {
  border: 2px solid #007BFF;
  /* Add a border or highlight effect for the active preview */
}</style>