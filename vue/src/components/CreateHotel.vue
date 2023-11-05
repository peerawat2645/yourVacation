<template>
  <div class="ahbody">
    <a href="/hotel/home" class="ahblack-button">Back</a>
    <div class="ahContact">
      <a style="color: rgb(83, 176, 177);">Edit Hotel</a>
      <div class="ahContactName">
        <a>Name</a>
        <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="formData.name">
      </div>
      <div class="ahContactName">
        <a>Location</a>
        <input type="text" class="ahcustom-input" placeholder="Your Input" v-model="formData.address">
      </div>
      <div class="ahContactNameRow">
        <div class="ahContactNameRowdiv3">
          <a>เวลาเปิด</a>
          <input type="time" class="ahcustom-input" placeholder="Your Input" v-model="formData.openTime">
        </div>
        <div class="ahContactNameRowdiv3">
          <a>เวลาปิด</a>
          <input type="time" class="ahcustom-input" placeholder="Your Input" v-model="formData.closeTime">
        </div>
        <div class="ahContactNameRowdiv3">
          <a>เวลา checkin</a>
          <input type="time" class="ahcustom-input" placeholder="Your Input" v-model="formData.checkinTime">
        </div>
      </div>
      <div class="HotelProvince">
        <div class="ProvinceBox">
          <a style="font-size: 16px;
            font-weight: 600; color:black;">จังหวัด</a>
          <select style="width: 100%;" @change="ProvinceChange" v-model="formData2.provinceId">
            <option v-for="(item, index) in province" :key="item.provinceId" :value="item.provinceId"
              :selected="index == 0">
              {{ item.name }}
            </option>

          </select>
        </div>
        <div class="ProvinceBox">
          <a style="font-size: 16px;
            font-weight: 600; color:black">อำเภอ</a>
          <select style="width: 100%;" @change="DistrictChange" v-model="formData2.districtId">
            <option v-for="(item, index) in district" v-bind:key="item.districtId" :value=item.districtId
              :selected="index == 0">{{ item.name }}
            </option>
          </select>
        </div>
        <div class="ProvinceBox">
          <a style="font-size: 16px;
            font-weight: 600; color:black;">ตำบล</a>
          <select style="width: 100%;" v-model="formData2.subdistrictId">
            <option v-for="(item, index) in subdistrict" v-bind:key="item.subdistrictId" :selected="index == 0"
              :value=item.subdistrictId>{{ item.name }}</option>
          </select>
        </div>
      </div>

      <div class="ahUpload">
        <input type="file" ref="fileInput" @change="handleFileChange" accept="image/*">
        <span v-if="selectedFilePath" class="file-path">{{ selectedFilePath }}</span>
        <button @click="uploadFile">Upload</button>
        <div v-if="imageUrl">
          <img :src="imageUrl" alt="Uploaded Image" />
        </div>
      </div>
      <div style="width: 100%; align-items:center; "><button class="ahblack-button" @click="openPopup">สร้าง</button>
      </div>
      <div class="ahpopup-overlay" v-if="isPopupOpen">
        <div class="ahpopup">
          <span @click="closePopup" class="ahclose-button">X</span>
          <h2>ยืนยันการสร้าง</h2>
          <button class="ahblack-button" style="color: white; font-size:18px" @click="handleCreateHotel">Success</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import SubdistrictService from '@/services/SubdistrictService';
import HotelService from '@/services/HotelService';
import router from '@/router';
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
      selectedFilePath: '',
      subdistrict: [],
      district: [],
      province: [],
      formData2: {
        subdistrictId: 1,
        districtId: 1,
        provinceId: 1,
      },
      formData: {
        name: '',
        address: '',
        openTime: '',
        status:'open',
        closeTime: '',
        checkinTime: ''
      },
    };
  },
  created() {
    this.provinceAll();
    this.districtAll();
    this.subdistrictAll();
  },
  methods: {
    openPopup() {
      this.isPopupOpen = true;
    },
    closePopup() {
      this.isPopupOpen = false;
    },
    provinceAll() {
      SubdistrictService.province()
        .then((response) => {
          {
            this.province = response.data.body
            console.log(this.province)
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
    subdistrictAll() {
      SubdistrictService.subdistrict()
        .then((response) => {
          {
            this.subdistrict = response.data.body
            console.log(this.province)
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
    districtAll() {
      SubdistrictService.district()
        .then((response) => {
          {
            this.district = response.data.body
            console.log(this.province)
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
    ProvinceChange(event) {
      const selectedValue = event.target.value;

      SubdistrictService.districtId(selectedValue)
        .then((response) => {
          {
            this.district = response.data.body

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
    DistrictChange(event) {
      const selectedValue = event.target.value;

      SubdistrictService.subdistrictId(selectedValue)
        .then((response) => {
          {
            this.subdistrict = response.data.body

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
    convertedTime(time) {
      const date = new Date(time);
      const hours = date.getUTCHours();
      const minutes = date.getUTCMinutes();
      const formattedTime = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}`;

      return formattedTime;
    },
    convertTime(time) { // Your time string
      const currentDate = new Date();
      const timeParts = time.split(' ')[0].split(':');
      const hours = parseInt(timeParts[0]);
      const minutes = parseInt(timeParts[1]);
      currentDate.setHours(hours);
      currentDate.setMinutes(minutes);
      currentDate.setSeconds(0);

      // Convert the date to ISO format
      const isoString = currentDate.toISOString();
      // Send the time as a string to your Java backend
      return isoString;
    },
    handleCreateHotel() {
      if (!this.formData.name && !this.formData.address && !this.formData.openTime && !this.formData.closeTime && !this.formData.checkinTime) {
        this.error = true;
        this.errorMessage = 'Please fill in all required fields.';
        return;
      }
      else if (!this.formData.name || !this.formData.address || !this.formData.openTime || !this.formData.closeTime || !this.formData.checkinTime) {
        if (!this.formData.name) {
          this.error = true;
          this.errorMessage = 'Name is required.';
        }
        else if (!this.formData.address) {
          this.error = true;
          this.errorMessage = 'Address is required.';
        } else if (!this.formData.openTime) {
          this.error = true;
          this.errorMessage = 'OpenTime is required.';
        }
        else if (!this.formData.closeTime) {
          this.error = true;
          this.errorMessage = 'CloseTime is required.';
        }
        else if (!this.formData.checkinTime) {
          this.error = true;
          this.errorMessage = 'CheckinTime is required.';
        }

        return;
      }
      this.error = false;
      console.log(this.formData.closeTime)
      this.formData.closeTime = this.convertTime(this.formData.closeTime);
      this.formData.openTime = this.convertTime(this.formData.openTime);
      this.formData.checkinTime = this.convertTime(this.formData.checkinTime);
      
      HotelService.hotelAdd(this.formData, this.formData2.subdistrictId)
        .then(() => {
          {
            router.push('/');
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
    getSubdistrict() {
      HotelService.getDataSubdistrict(this.formData.hotelId)
        .then((response) => {
          {
            this.formData2.subdistrictId = response.data.body.subdistrictId
            this.formData2.districtId = response.data.body.districtId
            this.formData2.provinceId = response.data.body.provinceId
            console.log(this.room)
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

input[type="file"] {
  color: transparent;
}
</style>