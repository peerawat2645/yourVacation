<template>
  <div class="FilterBody">
    <div class="Fbox">
      <div class="FPicUploadBox">
        <a>Picture Filter</a>
        <p>Please upload a photo of your desired location.</p>
        <div class="FUpload">
          <div style="width: 100%; padding-left:35%; margin-bottom:20px"><input type="file" ref="fileInput"
              @change="handleFileChange" accept="image/*"></div>
          <button @click="random">Upload</button>
          <div v-if="imageUrl">
            <img :src="imageUrl" alt="Uploaded Image" />
          </div>
        </div>
      </div>
      <div class="FContentt">
        <div class="fText"><a>สถานที่แนะนำสำหรับคุณ</a></div>
        <div class="fContent">
          <div style="width: 100%;">
            <div class="fContents">
              <div class="fCard" v-for="(item,index) in displayedData" :key="item.id">
                <div class="fimg">
                  <div class="fimg1">
                    <img v-if="randomImage" :src="imagess[index]" alt="Random Image" />
                  </div>
                </div>
                <div class="fCardContent">
                  <div class="fCardContentBox">
                    <p>อุทยาน {{ item.name }}</p>
                  </div>
                  <div class="fCardContentBoxDetail"><a>{{ item.description }}</a></div>
                  <div class="fCardReserve">
                    <a :href="'/place/' + item.vacationId + '/user/' + this.$route.params.id"
                      style="width: auto;height:auto; cursor:default;">
                      <div class="pclicked" style="padding: 10px 20px;">เพิ่มเติม</div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="fPaginate">
              <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
import PlaceService from '@/services/PlaceService';
export default {
  name: 'FilterPic',
  components: {
    PaginationVue,
  },
  data() {
    return {
      sampleData: [
        { id: 1, name: 'Item 1' },
        { id: 2, name: 'Item 2' },
        { id: 3, name: 'Item 3' },
        { id: 4, name: 'Item 4' },
        { id: 5, name: 'Item 5' },
        { id: 6, name: 'Item 6' },
        { id: 7, name: 'Item 7' },
        { id: 8, name: 'Item 8' },
        { id: 9, name: 'Item 9' },
        { id: 10, name: 'Item 10' },
        { id: 11, name: 'Item 11' },
        { id: 12, name: 'Item 12' },
      ],
      currentPage: 1,
      itemsPerPage: 3,
      place: [],
      imagess: [],
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
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.place.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.place.slice(start, end);
    },
  },
  created() {
    this.getDataAll();
    this.showRandomImage();
  }
  ,
  methods: {
    showRandomImage() {
      console.log(0)
      let x = 20
      for (let i = 0; i < x; i++) {
        if (this.images.length > 0) {
          let randomIndex = Math.floor(Math.random() * this.images.length);
          this.randomImage = this.images[randomIndex];
          this.imagess.push(this.images[randomIndex]);
        }
      }
    },
    onPageChange(page) {
      this.currentPage = page;
    },
    getDataAll() {
      PlaceService.getAll()
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
    }
    ,
    random() {
      PlaceService.getRandom()
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
  },
}
</script>
<style>
.FilterBody {
  padding-top: 10vh;
  width: 100%;
  min-height: 90vh;
  height: auto;
  background-color: rgb(255, 255, 255);
  top: 0%;
  left: 0%;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.Fbox {
  width: 90%;
  min-height: 90%;
  height: auto;
  border-radius: 10px;
  border: 2px solid;
  border-color: #000;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.FPicUploadBox {
  margin: 15px;
  padding: 150px 30px;
  width: 30%;
  height: 95%;
  border-radius: 20px;
  background-color: #000;
  background-image: url("https://c1.wallpaperflare.com/preview/460/412/978/beach-sea-holiday-waves.jpg");
  display: flex;
  align-items: start;
  justify-content: center;
  flex-direction: column;
  color: rgb(0, 0, 0);
  text-align: start;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.FPicUploadBox a {
  font-size: 36px;
  font-weight: 600;
}

.FPicUploadBox p {
  font-size: 18px;
  font-weight: 500;
  color: rgb(0, 0, 0);
}

.FUpload {
  width: 100%;
  height: 15%;
  margin-top: 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.FContentt {
  margin: 15px;
  width: 70%;
  height: 95%;
}

.fText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: row;
  padding-left: 1%;
}

.fText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.fContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.fContents {
  width: 100%;
  min-height: 85%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.fCard {
  width: 280px;
  height: 480px;
  background-color: rgb(244, 244, 244);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  margin: 6px;
}

.fimg {
  width: 90%;
  height: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.fimg1 {
  z-index: 90;
  width: 100%;
  height: 100%;
  overflow: hidden;
  border-radius: 10px;
}

.fimg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.fimg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.fimg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.fCardContent {
  width: 100%;
  height: 55%;
  padding: 5px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.fCardContentBox {
  width: 100%;
  height: 20%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.fCardContentBoxDetail {
  width: 100%;
  height: 40%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.fCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.fCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.fCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 25px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.fCardReserve {
  width: 95%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.fCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.fCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.fPaginate {
  margin-top: 20px;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}</style>