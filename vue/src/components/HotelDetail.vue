<template>
  <div class="hdbody">
    <div class="hdname">
      <a :href="'/home/'+this.$route.params.userId" class="hdblack-button">Back</a>
      <div style="width: 90%; display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center; margin-top:20px">
        <p>โรงแรม {{ this.hotel.name }}</p>
      </div>
    </div>
    <div class="hdbox">
      <div class="hdpic">
        <div class="hpicture-slider">
          <div class="hslider-container">
            <div class="hslider" :style="sliderStyles">
              <img v-for="(image, index) in images" :key="index" :src="image" :class="{ active: index === currentIndex }"
                alt="Slider Image" />
            </div>
          </div>
          <div class="hpreview-container" style="overflow-x: auto; white-space: nowrap; width: 500px;">
            <div class="hpreview" v-for="(image, index) in images" :key="index">
              <img :src="image" @click="changeSlide(index)" alt="Preview Image" />
            </div>
          </div>
        </div>
        <div class="hdroomtype">
          <div class="hdroomtypedetail" v-for="item in room" :key="item.id">
            <div class="aa" v-if="item.type === 'suite'" style="width: auto; height:auto;">
            <img v-if="randomImage" :src="randomImage" alt="Random Image" /></div>
            <div class="aa" v-if="item.type === 'deluxe'" style="width: auto; height:auto;">
              <img v-if="randomImage2" :src="randomImage2" alt="Random Image" /></div>
              <div class="aa" v-if="item.type === 'studio'" style="width: auto; height:auto;">
                <img v-if="randomImage3" :src="randomImage3" alt="Random Image" /></div>
            <div class="hdroomtypedetailbox"><a>{{item.type}}</a>
              <p>{{item.price}} บาท</p><a :href="'/hotel/reservation/'+item.roomId+'/user/'+this.$route.params.userId" class="hdwhite-button">จอง</a>
            </div>
          </div>


        </div>
      </div>
      <div class="hddetail">
        <div class="hddetailbox">
          <a>สถานที่ใกล้เคียง : </a>
          <div class="hddetailcontentt" v-for="item in place" :key="item.id">
            <p>{{ item.name }} <a :href="'/place/'+item.vacationId+'/user/'+this.$route.params.userId" class="hdblack-button"
                style="align-self: flex-end; color:white; margin:0%; padding:2px 5px; font-size:15px">เพิ่มเติม</a></p>
          </div>
        </div>
        <div class="hddetailbox">
          <a>ที่อยู่ : </a>
          <div class="hddetailcontent">
            <p>{{ this.hotel.address }}</p>
          </div>
        </div>
        <!--<div class="hddetailbox">
          <a>รายละเอียด : </a>
          <div class="hddetailcontent">
            <p>{{this.hotel.description}}</p>
          </div>
        </div>-->
        <div class="hddetailbox">
          <a style="margin: 0%;">สิ่งอำนวยความสะดวก : </a>
          <div class="hddetailcontent" v-for="item in facilities" :key="item.id">
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox" :checked="item.status">
              <a style="font-size: 16px; font-weight: 600; color: black">
                {{ item.name }}
              </a>


            </label>
            <br>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import HotelService from '@/services/HotelService';
export default {
  name: 'HotelDetail',
  data() {
    return {
      images:[],
      imagess: [
      'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp',
      'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-superJumbo.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Hotel-room-renaissance-columbus-ohio.jpg/1024px-Hotel-room-renaissance-columbus-ohio.jpg',
      'https://cdn.loewshotels.com/loewshotels.com-2466770763/cms/cache/v2/5f5a6e0d12749.jpg/1920x1080/fit/80/86e685af18659ee9ecca35c465603812.jpg',
      'https://www.cvent.com/sites/default/files/image/2021-10/hotel%20room%20with%20beachfront%20view.jpg',
      'https://media.istockphoto.com/id/627892060/photo/hotel-room-suite-with-view.jpg?s=612x612&w=0&k=20&c=YBwxnGH3MkOLLpBKCvWAD8F__T-ypznRUJ_N13Zb1cU=',
      'https://rhotelgeelong.com.au/wp-content/uploads/2021/03/R-Hotel-Geelong-Hotel-Room-11.jpg',
      'https://www.hotelcontractbeds.co.uk/media/3183/hotel-room.jpg',
      'https://cqh.imgix.net/2020/09/R2Pbt3vb-1603_DELUXE-1BDRM-KITCHEN_CQ_HOUSTON_5714.jpg?auto=compress%2Cformat&fit=scale&h=1280&ixlib=php-3.3.1&q=70&w=1920&wpsize=img_1920',
      'https://scdn.aro.ie/Sites/50/imperialhotels2022/uploads/images/PanelImages/panelimagessmall19/160579861_Royal_National_Room_Standard_Single_2640x1760.jpg'
        // Add more image URLs here
      ],
      currentIndex: 0,
      hotel: [],
      place: [],
      facilities: [],
      room: [],
    };
  },
  computed: {
    sliderStyles() {
      return {
        transform: `translateX(-${this.currentIndex * 100}%)`,
      };
    },
  },
  created() {
    this.getDataHotel();
    this.near();
    this.facility();
    this.rooms();
    this.getImage();
    this.showRandomImage();
    this.showRandomImage2();
    this.showRandomImage3();
  }
  ,
  methods: {
    showRandomImage() {
      if (this.imagess.length > 0) {
        const randomIndex = Math.floor(Math.random() * this.imagess.length);
        this.randomImage = this.imagess[randomIndex];
      }
    },
    showRandomImage2() {
      if (this.imagess.length > 0) {
        const randomIndex = Math.floor(Math.random() * this.imagess.length);
        this.randomImage2 = this.imagess[randomIndex];
      }
    },
    showRandomImage3() {
      if (this.imagess.length > 0) {
        const randomIndex = Math.floor(Math.random() * this.imagess.length);
        this.randomImage3 = this.imagess[randomIndex];
      }
    },
    changeSlide(index) {
      this.currentIndex = index;
    },
    getDataHotel() {
      HotelService.getHotel(this.$route.params.id)
        .then((response) => {
          {
            this.hotel = response.data.body
            console.log(this.hotel)
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
    near() {
      HotelService.near(this.$route.params.id)
        .then((response) => {
          {
            this.place = response.data.body
            console.log(this.place)
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
    facility() {
      HotelService.facilities(this.$route.params.id)
        .then((response) => {
          {
            this.facilities = response.data.body
            console.log(this.facilities)
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
    rooms() {
      HotelService.rooms(this.$route.params.id)
        .then((response) => {
          {
            this.room = response.data.body
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
    
    getImage(){
      HotelService.getImage(this.$route.params.id)
        .then((response) => {
          {
            let path = 'data:image/png;base64,'+response.data.body
            console.log(response.data.body)
            this.images.push(path);
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
        return this.imagePath;
    }
  },
};
</script>

<style>
.hdbody {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: flex-start;
}

.hdblack-button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #000;
  color: #fff;
  text-decoration: none;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 20px;
}

.hdblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}

.hdwhite-button {
  display: inline-block;
  padding: 5px 10px;
  background-color: #ffffff;
  color: #000000;
  text-decoration: none;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin-top: -20px;
}

.hdwhite-button:hover {
  background-color: #6d6d6d;
  /* Darker shade of black on hover */
}

.hdbox {
  width: 100%;
  height: auto;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}

.hdpic {
  width: 50%;
  min-height: 80vh;
  height: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: start;
}

.hddetail {
  width: 50%;
  height: auto;
  min-height: 80vh;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: start;
  text-align: start;
}

.hddetailbox {
  width: 95%;
  height: auto;
  padding: 15px;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  background-color: rgb(255, 255, 255);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
  margin: 10px;
  flex-wrap: wrap;
}

.hddetailbox a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 18px;
  margin-bottom: 50px;
}

.hddetailcontent {
  width: auto;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  text-align: start;
}
.hddetailcontentt {
  width: auto;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}
.hdname {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.hdname p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
  margin-bottom: 50px;
}

.hpicture-slider {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.hslider-container {
  width: 60%;
  overflow: hidden;
  border-radius: 5px;
}

.hslider {
  display: flex;
  transition: transform 0.3s ease-in-out;
}

.hslider img {
  width: 100%;
  height: auto;
  background-color: antiquewhite;
  border-radius: 5px;
}

.hpreview-container {
  display: flex;
  justify-content: center;
  margin-top: 10px;
  /* Adjust the margin as needed */
}

.hpreview {
  cursor: pointer;
  margin: 0 10px;
  /* Adjust the margin as needed */
}

.hpreview img {
  width: 100px;
  /* Adjust the width of the preview images */
  height: auto;
  object-fit: cover;
  border: 2px solid transparent;
  border-radius: 5px;
}

.hpreview img.active {
  border: 2px solid #007BFF;
  /* Add a border or highlight effect for the active preview */
}

.hdroomtype {
  width: 90%;
  height: auto;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: start;
  text-align: center;
  flex-wrap: wrap;
}

.hdroomtypedetail {
  width: 200px;
  height: 180px;
  background-color: rgb(255, 255, 255);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
  margin: 10px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: end;
}

.hdroomtypedetail img {
  width: 100%;
  height: 100%;
}

.hdroomtypedetailbox {
  width: 90%;
  height: 60%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  background-color: transparent;
  margin-top: -60%;
  color: #000000;
  margin-bottom: 10px;
  background-color: #ffffff84;
  border-radius: 10px;
  padding-bottom: 5px;
}

.hdroomtypedetailbox a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 20px;
}

.hdroomtypedetailbox p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 18px;
}
.aa img{
  margin-bottom: 60px;
}
</style>