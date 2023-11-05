<template>
  <div class="ReBody">
    <div class="ReText"><a>โรงแรมแนะนำสำหรับคุณ</a></div>
    <div v-if="recommend === null" class="ReContentnull"><a style="font-size: 20px;">ไม่มีข้อมูล</a></div>
    <div class="ReContent" v-else>
      <div>
        <div class="ReContents">
          <div class="ReCard" v-for="item in recommend" v-bind:key="item.name">
            <div class="Reimg">
              <div class="Reimg1">
                <img
                :src="'data:image/png;base64,'+item.imgPath">
              </div>
              <div class="Reimg2">
                <img src="https://media.bom.gov.au/social/upload/images/iStock-blue-sea-resize.jpg">
              </div>
            </div>
            <div class="ReCardContent">
              <div class="ReCardContentBox">
                <p>โรงแรม {{ item.name }}</p>
              </div>
              <div class="ReCardContentBox"><a>ใกล้กับ {{placerecomend.name}} </a></div>
              <div class="ReCardContentBoxDetail"><a>{{placerecomend.description}}</a></div>
              <div class="ReCardReserve">
                <a>ราคาเริ่มต้น {{ item.minprice }} บาท</a>
                <a :href="'/hotel/'+item.hotelId+'/user/'+this.$route.params.id"><button class="ReCardReserveBtn">จองห้องพัก</button></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="RePaginate">
        <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
import hotelRecommendService from '@/services/HotelService';
export default {
  name: 'RecomendPlace',
  components: {
    PaginationVue,
  },
  data() {
    return {
      recommend: [],
      currentPage: 1,
      itemsPerPage: 4,
      subdistrict: 0,
      placerecomend:[],
      imagePath:''
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.recommend.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.recommend.slice(start, end);
    },
  },
  created() {
    this.recommendAll();
  },
  methods: {
    onPageChange(page) {
      this.currentPage = page;
    },
    recommendAll() {
      hotelRecommendService.hotelRecommend()
        .then((response) => {
          {
            this.recommend = response.data.body
            this.subdistrict = this.recommend[0].subdistrictId
            console.log(response.data.body)
            hotelRecommendService.vacationRecommend(this.subdistrict)
              .then((response) => {
                {
                  this.placerecomend = response.data.body
                  
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
.ReBody {
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

.ReText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: row;
  padding-left: 1%;
}

.ReText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.ReContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.ReContentnull {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.ReContents {
  width: 100%;
  height: 72vh;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.ReCard {
  width: 720px;
  height: auto;

  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
  margin: 5px;
}

.Reimg {
  width: 50%;
  height: 250px;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.Reimg1 {
  z-index: 90;
  width: 250px;
  height: 180px;
  overflow: hidden;
  border-radius: 10px;
}

.Reimg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.Reimg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.Reimg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.ReCardContent {
  width: 52%;
  height: 100%;
  padding: 5px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.ReCardContentBox {
  width: 100%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.ReCardContentBoxDetail {
  width: 100%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.ReCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.ReCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.ReCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.ReCardReserve {
  margin-top: 20px;
  width: 95%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}

.ReCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.ReCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.RePaginate {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}</style>