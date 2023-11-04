<template>
  <div class="pdbody">
    <div class="pdname">
      <a href="/home#foryou" class="pdblack-button">Back</a>
      <div style="width: 90%; display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center; margin-top:20px">
        <p>อุทยานแห่งชาติ xxxx</p>
      </div>
    </div>
    <div class="pdbox">
      <div class="pdpic">
        <div class="picture-slider">
          <div class="slider-container">
            <div class="slider" :style="sliderStyles">
              <img v-for="(image, index) in images" :key="index" :src="image" :class="{ active: index === currentIndex }"
                alt="Slider Image" />
            </div>
          </div>
          <div class="preview-container" style="overflow-x: auto; white-space: nowrap; width: 500px;">
            <div class="preview" v-for="(image, index) in images" :key="index">
              <img :src="image" @click="changeSlide(index)" alt="Preview Image" />
            </div>
          </div>
        </div>
      </div>
      <div class="pddetail">
        <a href="#" class="pdblack-button" style="align-self: flex-end;">ที่พักใกล้เคียง</a>
        <div class="pddetailbox">
          <a>ที่อยู่ : </a>
          <div class="pddetailcontent">
            <p>ndcklsnjdnjsbvbvjbvjfkfjblbfjlfvsfjvlbvljbvfj fknvlf vfjhsof kshfviohfuf jshsssssssssssssssssssssssssssssssssssssssssfhb jfvsjh</p>
          </div>
        </div>
        <div class="pddetailbox">
          <a>รายละเอียด : </a>
          <div class="pddetailcontent">
            <p>ndcklsnjdnjsbvbvjbvjfkfjblbfjlfvsfjvlbvljbvfj fknvlf vfjhsof kshfviohfuf jshsssssssssssssssssssssssssssssssssssssssssfhb jfvsjh</p>
          </div>
        </div>
        <div class="pddetailbox">
          <a>กิจกรรม : </a>
          <div class="pddetailcontent">
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox"><a style="font-size: 16px;
              font-weight: 600; color:black"> ทะเล</a>
          </label>
          <label style="margin-left: 10px; margin-right:10px;">
            <input type="checkbox"><a style="font-size: 16px;
            font-weight: 600; color:black"> ภูเขา</a>
        </label>
        <label style="margin-left: 10px; margin-right:10px;">
          <input type="checkbox"><a style="font-size: 16px;
          font-weight: 600; color:black"> กิจกรรมทางน้ำ</a>
      </label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'PlaceDetail',
  data() {
    return {
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
.pdbody {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: flex-start;
}

.pdblack-button {
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

.pdblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}

.pdbox {
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
}

.pdpic {
  width: 50%;
  height: 80vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: start;
}

.pddetail {
  width: 50%;
  height: auto;
  min-height: 80vh;
  display: flex;
  flex-direction: column;
  align-items: start;
  justify-content: start;
  text-align: start;
}

.pddetailbox {
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
.pddetailbox a{
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 18px;
  margin-bottom: 50px;
}
.pddetailcontent {
  width: 85%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
  text-align: start;
}

.pdname {
  width: 100%;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: center;
  text-align: center;
}

.pdname p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
  margin-bottom: 50px;
}

.picture-slider {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.slider-container {
  width: 90%;
  overflow: hidden;
  border-radius: 5px;
}

.slider {
  display: flex;
  transition: transform 0.3s ease-in-out;
}

.slider img {
  width: 100%;
  height: auto;
  background-color: antiquewhite;
  border-radius: 5px;
}

.preview-container {
  display: flex;
  justify-content: center;
  margin-top: 10px;
  /* Adjust the margin as needed */
}

.preview {
  cursor: pointer;
  margin: 0 10px;
  /* Adjust the margin as needed */
}

.preview img {
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