<template>
  <div class="hdbody">
    <div class="hdname">
      <a href="/home#foryou" class="hdblack-button">Back</a>
      <div style="width: 90%; display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center; margin-top:20px">
        <p>โรงแรม xxxx</p>
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
          <div class="hdroomtypedetail" >
            <img :src="images[0]" />
            <div class="hdroomtypedetailbox"><a>Superir room</a><p>3000 บาท</p><a href="/hotel/reservation" class="hdwhite-button">จอง</a></div>
          </div>
          <div class="hdroomtypedetail" >
            <img :src="images[0]" />
            <div class="hdroomtypedetailbox"><a>Superir room</a><p>3000 บาท</p><a href="/hotel/reservation" class="hdwhite-button">จอง</a></div>
          </div>
          <div class="hdroomtypedetail" >
            <img :src="images[0]" />
            <div class="hdroomtypedetailbox"><a>Superir room</a><p>3000 บาท</p><a href="/hotel/reservation" class="hdwhite-button">จอง</a></div>
          </div>
          
      </div></div>
      <div class="hddetail">
        <div class="hddetailbox">
          <a>สถานที่ใกล้เคียง : </a>
          <div class="hddetailcontent">
            <p>ฟฟฟฟฟ <a href="/place/detail" class="hdblack-button"
                style="align-self: flex-end; color:white; margin:0%; padding:2px 5px; font-size:15px">เพิ่มเติม</a></p>
            <p>ฟฟฟฟฟ <a href="/place/detail" class="hdblack-button"
                style="align-self: flex-end; color:white; margin:0%; padding:2px 5px; font-size:15px">เพิ่มเติม</a></p>
            <p>ฟฟฟฟฟ <a href="/place/detail" class="hdblack-button"
                style="align-self: flex-end; color:white; margin:0%; padding:2px 5px; font-size:15px">เพิ่มเติม</a></p>
          </div>
        </div>
        <div class="hddetailbox">
          <a>ที่อยู่ : </a>
          <div class="hddetailcontent">
            <p>ndcklsnjdnjsbvbvjbvjfkfjblbfjlfvsfjvlbvljbvfj fknvlf vfjhsof kshfviohfuf
              jshsssssssssssssssssssssssssssssssssssssssssfhb jfvsjh</p>
          </div>
        </div>
        <div class="hddetailbox">
          <a>รายละเอียด : </a>
          <div class="hddetailcontent">
            <p>ndcklsnjdnjsbvbvjbvjfkfjblbfjlfvsfjvlbvljbvfj fknvlf vfjhsof kshfviohfuf
              jshsssssssssssssssssssssssssssssssssssssssssfhb jfvsjh</p>
          </div>
        </div>
        <div class="hddetailbox">
          <a>สิ่งอำนวยความสะดวก : </a>
          <div class="hddetailcontent" style="width: 70%;">
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox"><a style="font-size: 16px;
              font-weight: 600; color:black"> TV</a>
            </label>
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox"><a style="font-size: 16px;
            font-weight: 600; color:black"> ตู้เย็น</a>
            </label>
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox"><a style="font-size: 16px;
          font-weight: 600; color:black"> อาหารเช้า</a>
            </label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'HotelDetail',
  data() {
    return {
      images: [
        'https://media-cdn.tripadvisor.com/media/photo-s/16/1a/ea/54/hotel-presidente-4s.jpg',
        'https://assets-global.website-files.com/5c6d6c45eaa55f57c6367749/65045f093c166fdddb4a94a5_x-65045f0266217.webp',
        'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
        'https://img.freepik.com/free-photo/luxury-classic-modern-bedroom-suite-hotel_105762-1787.jpg?size=626&ext=jpg&ga=GA1.1.1412446893.1698883200&semt=ais',
        'https://img.freepik.com/free-photo/modern-luxury-bedroom-suite-bathroom_105762-1791.jpg',

        // Add more image URLs here
      ],
      currentIndex: 0,
    };
  },
  computed: {
    sliderStyles() {
      return {
        transform: `translateX(-${this.currentIndex * 100}%)`,
      };
    },
  },
  methods: {
    changeSlide(index) {
      this.currentIndex = index;
    },
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
  justify-content: space-between;
  flex-direction: row;
  background-color: rgb(255, 255, 255);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
  margin: 10px;
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
  width: 75%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
  text-align: start;
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
.hdroomtypedetail img{
  width: 100%;
  height: 100%;
}
.hdroomtypedetailbox{
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
.hdroomtypedetailbox a{
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 20px;
}
.hdroomtypedetailbox p{
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 18px;
}
</style>