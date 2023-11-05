<template>
  <div class="pdbody">
    <div class="pdname">
      <a :href="'/home/'+this.$route.params.userId" class="pdblack-button">Back</a>
      <div style="width: 90%; display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center; margin-top:20px">
        <p>อุทยานแห่งชาติ {{place.name}}</p>
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
        <a :href="'/hotel/place/'+place.vacationId+'/user/'+this.$route.params.userId" class="pdblack-button" style="align-self: flex-end;">ที่พักใกล้เคียง</a>
        <div class="pddetailbox">
          <a>ที่อยู่ : </a>
          <div class="pddetailcontent">
            <p>{{place.address}}</p>
          </div>
        </div>
        <div class="pddetailbox">
          <a>รายละเอียด : </a>
          <div class="pddetailcontent">
            <p>{{place.description}}</p>
          </div>
        </div>
        <div class="pddetailbox">
          <a>กิจกรรม : </a>
          <div class="pddetailcontent" v-for="tag in tagname" :key="tag">
            <label style="margin-left: 10px; margin-right:10px;">
              <input type="checkbox"><a style="font-size: 16px;
              font-weight: 600; color:black"> {{tag}}</a>
          </label>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import PlaceService from '@/services/PlaceService';
export default {
  name: 'PlaceDetail',
  data() {
    return {
      images: [
        'https://static.thairath.co.th/media/dFQROr7oWzulq5FZYANuEZlRY89MbBZGbB03TL7pGDPeb11CkdQJhamTfLVYfEGR0DP.jpg',
        'https://thumbs.dreamstime.com/b/beach-sea-18378306.jpg',
        'https://bk.asia-city.com/sites/default/files/doi_chiang_dao_chiang_mai._credit_hatoriz_kwansiripat._creative_commons.jpg',
        'https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2F456cc62a-db43-11ec-8de3-573a6521e09e.jpg?crop=5312%2C3541%2C0%2C0',
        'https://media.istockphoto.com/id/1131616912/photo/beautiful-swiss-mountains-in-springtime.jpg?s=612x612&w=0&k=20&c=2VQUp2NnjERnxIndrAyt1e5JJxsGPbKqHtxudM5fbm4=',
        'https://cdn.britannica.com/32/93932-050-B213E0FB/ocean-water-beach-The-Bahamas-Grand-Bahama.jpg',
        'https://www.seaeagletour.com/wp-content/uploads/revslider/BYT-TourOperator/sea-eagle-olly-5-scaled.jpg',
        'https://www.collinsdictionary.com/images/full/river_377603497_1000.jpg',
        'https://www.americanrivers.org/wp-content/uploads/2023/09/CA_Smith-River_Clinton-Steeds-1-1-1024x682.jpg'
      ],
      currentIndex: 0,
      place:[],
      tagname:[],
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
    this.getPlace();
    this.showRandomImage();
  },
  methods: {
    showRandomImage() {
      if (this.images.length > 0) {
        const randomIndex = Math.floor(Math.random() * this.images.length);
        this.randomImage = this.images[randomIndex];
      }
    },
    changeSlide(index) {
      this.currentIndex = index;
    },
    getPlace() {
            PlaceService.getPlaceById(this.$route.params.id)
                .then((response) => {
                    {
                        this.place = response.data.body[0].vacation
                        this.tagname = response.data.body[0].tagName
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
  width: 80%;
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