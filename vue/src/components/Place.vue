<template>
  <div class="pBody">
    <div class="pText"><a>สถานที่ท่องเที่ยวแนะนำสำหรับคุณ</a></div>
    <div v-if="displayedData.length===0" class="pContentnull"><a style="font-size: 20px;">ไม่มีข้อมูล</a></div>
    <div class="pContent" v-else>
      <div>
        <div class="pContents">
          <div class="pCard" v-for="item in displayedData" :key="item.vacation.name">
            <div class="pCardContent"><a>ชื่ออุทยาน {{ item.vacation.name }}</a> <a
                :href="'/place/' + item.vacation.vacationId + '/user/' + this.$route.params.id"
                style="width: auto;height:auto; cursor:default;">
                <div class="pclicked" style="padding: 10px 20px;">เพิ่มเติม</div>
              </a></div>
            <div class="pDetail">
              <div class="pimg">
                <div class="pimg1">
                  <img v-if="randomImage" :src="randomImage" alt="Random Image" />
                </div>
              </div>
              <div class="pDescription">
                <div class="pCardContentBox">
                  <ul v-for="tag in item.tagName" :key="tag">
                    <li><a>{{ tag }}</a></li>
                  </ul>
                </div>
                <div class="pCardContentBoxDetail"><a>{{ item.vacation.description }}</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="pPaginate">
        <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
import PlaceService from '@/services/PlaceService';
export default {
  name: 'PlaceVue',
  components: {
    PaginationVue,
  },
  props: ['checkedItems'],
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
      itemsPerPage: 6,
      place: [],
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
      return Math.ceil(this.checkedItems.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.checkedItems.slice(start, end);
    },
  },
  created() {
  
    this.showRandomImage();
  },
  methods: {
    showRandomImage() {
      if (this.images.length > 0) {
        const randomIndex = Math.floor(Math.random() * this.images.length);
        this.randomImage = this.images[randomIndex];
      }
    },
    onPageChange(page) {
      this.currentPage = page;
    },
    PlaceAll() {
      PlaceService.PlaceServiceAll(this.checkedItems.districtId, this.checkedItems.provinceId, this.checkedItems.subdistrictId, this.checkedItems.tagnameIds)
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
.pBody {
  width: 100%;
  height: 90vh;
  top: 0%;
  left: 0%;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.pclicked {
  z-index: 200;
  background-color: #000000;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 10px;
  font-size: 18px;
  font-weight: 600;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
}

.pText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: row;
  padding-left: 1%;
}

.pText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.pContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}
.pContentnull {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
.pContents {
  width: 100%;
  min-height: 72vh;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.pCard {
  width: 470px;
  height: 250px;
  background-color: rgb(244, 244, 244);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  margin: 5px;
}

.pimg {
  width: 50%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.pimg1 {
  z-index: 90;
  width: 250px;
  height: 180px;
  overflow: hidden;
  border-radius: 10px;
}

.pimg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.pimg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.pimg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.pCardContent {
  width: 100%;
  height: auto;
  padding: 5px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.pCardContent a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.pCardContentBox {
  width: 100%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.pCardContentBoxDetail {
  width: 100%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.pCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.pCardContentBox ul {
  line-height: 20px;
}

.pCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 15px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.pCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.pDetail {
  width: 100%;
  height: 80%;
  padding: 5px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.pDescription {
  width: 45%;
  height: 100%;
  padding: 5px;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: column;
}

.pCardReserve {
  margin-top: 20px;
  width: 95%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.pCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.pCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.pPaginate {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}</style>