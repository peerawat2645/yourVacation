<template>
  <div class="ahbody">
    <a :href="'/hotel/home/'+this.$route.params.userId" class="ahblack-button">Back</a>
    <div class="ahContact">
      <a style="color: rgb(83, 176, 177);">Add Room Type Detail</a>
      <div class="ahContactName">
        <a>RoomType Name</a>
        <div>
          <label for="roomType">Room Type:</label>
          <input type="radio" id="roomTypeSingle" value="studio" v-model="room.type">
          <label for="roomTypeSingle">Studio</label>
          <input type="radio" id="roomTypeDouble" value="deluxe" v-model="room.type">
          <label for="roomTypeDouble">Deluxe</label>
          <input type="radio" id="roomTypeSuite" value="suite" v-model="room.type">
          <label for="roomTypeSuite">Suite</label>
        </div>
      </div>
      <div class="ahContactNameRow">
        <div class="ahContactNameRowdiv3">
          <a>จำนวนห้อง</a>
          <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="room.amountRoom">
        </div>
        <div class="ahContactNameRowdiv3">
          <a>จำนวนผู้เข้าพัก</a>
          <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="room.guest">
        </div>
        <div class="ahContactNameRowdiv3">
          <a>ราคา</a>
          <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="room.price">
        </div>
      </div>
      <div class="Hotelbox" v-if="activeComponent === 'HotelVue'">
        <div class="HotelProvince">
            <div class="ProvinceBox">
                <a style="font-size: 16px;
                font-weight: 600; color:black;">จังหวัด</a>
                <select style="width: 100%;" @change="ProvinceChange" v-model="formData.provinceId">
                    <option v-for="(item, index) in province" :key="item.provinceId" :value="item.provinceId"
                        :selected="index == 0">
                        {{ item.name }}
                    </option>

                </select>
            </div>
            <div class="ProvinceBox">
                <a style="font-size: 16px;
                font-weight: 600; color:black">อำเภอ</a>
                <select style="width: 100%;" @change="DistrictChange" v-model="formData.districtId">
                    <option v-for="(item, index) in district" v-bind:key="item.districtId" :value=item.districtId
                        :selected="index == 0">{{ item.name }}
                    </option>
                </select>
            </div>
            <div class="ProvinceBox">
                <a style="font-size: 16px;
                font-weight: 600; color:black;">ตำบล</a>
                <select style="width: 100%;" v-model="formData.subdistrictId">
                    <option v-for="(item, index) in subdistrict" v-bind:key="item.subdistrictId"
                        :selected="index == 0" :value=item.subdistrictId>{{ item.name }}</option>
                </select>
            </div>
        </div>
        <div class="HotelSelect">
            <div style=" display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: row; width:70%;">
                <div class="ProvinceBox" style="width:45%">
                    <a style="font-size: 16px;
                font-weight: 600; color:black">ราคาเริ่มต้น</a>
                    <input type="text" class="hcustom-input" placeholder="Your Input" v-model="hotelData.priceMin">
                </div>
                <a>-</a>
                <div class="ProvinceBox" style="width:45%">
                    <a style="font-size: 16px;
                font-weight: 600; color:black">ราคาสิ้นสุด</a>
                    <input type="text" class="hcustom-input" placeholder="Your Input" v-model="hotelData.priceMax">
                </div>
            </div>
            <div class="ProvinceBox">
                <a style="font-size: 16px;
            font-weight: 600; color:black">จำนวนคนเข้าพัก</a>
                <input type="text" class="hcustom-input" placeholder="Your Input" v-model="hotelData.guest">
            </div>
            <div class="ProvinceBox">
                <a style="font-size: 16px;
            font-weight: 600; color:black">จำนวนห้องนอน</a>
                <input type="text" class="hcustom-input" placeholder="Your Input" v-model="hotelData.amountRoom">
            </div>
        </div>
    </div>
      <div class="ahUpload">
        <input type="file" ref="fileInput" @change="handleFileChange" accept="image/*">
        <button @click="uploadFile">Upload</button>
        <div v-if="imageUrl">
          <img :src="imageUrl" alt="Uploaded Image" />
        </div>
      </div>
      <div style="width: 100%; align-items:center; "><button class="ahblack-button" @click="openPopup">เพิ่ม</button>
      </div>
      <div class="ahpopup-overlay" v-if="isPopupOpen">
        <div class="ahpopup">
          <span @click="closePopup" class="ahclose-button">X</span>
          <h2>ยืนยันการเพิ่มห้องพัก</h2>
          <button class="ahblack-button" style="color: white; font-size:18px" @click="handleCreateRoom">
            Success
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import HotelService from '@/services/HotelService';
import router from '@/router';
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
      room: {
        guest: '',
        type: 'studio',
        price: '',
        amountRoom: '',
      }
    };
  },
  methods: {
    openPopup() {
      this.isPopupOpen = true;
    },
    closePopup() {
      this.isPopupOpen = false;
    },
    handleCreateRoom() {
      if (!this.room.guest && !this.room.type && !this.room.price && !this.room.amountRoom) {
        this.error = true;
        this.errorMessage = 'Please fill in all required fields.';
        return;
      }
      else if (!this.room.guest || !this.room.type || !this.room.price || !this.room.amountRoom) {
        if (!this.room.guest) {
          this.error = true;
          this.errorMessage = 'Guest is required.';
        } else if (!this.room.type) {
          this.error = true;
          this.errorMessage = 'Type is required.';
        } else if (!this.room.price) {
          this.error = true;
          this.errorMessage = 'Price is required.';
        } else if (!this.room.amountRoom) {
          this.error = true;
          this.errorMessage = 'AmountRoom is required.';
        }
        return;
      }
      this.error = false;
      console.log("in")
      HotelService.roomAdd(this.room,this.$route.params.userId)
        .then(() => {
          {
            router.push('/hotel/home/'+this.$route.params.userId);
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
  }
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

.ahContactNameRowdiv {
  width: 50%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.ahContactNameRowdiv3 {
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
  z-index: 999;
  /* Adjust z-index as needed */
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