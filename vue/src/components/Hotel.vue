<template>
  <div class="hBody">
    <div class="hText"><a>โรงแรมแนะนำสำหรับคุณ</a></div>
    <div class="hContent">
      <div style="width: 100%;">
        <div class="hContents">
          <div class="hCard" v-for="item in displayedData" :key="item.id">
            <div class="himg">
              <div class="himg1">
                <img
                :src="'data:image/png;base64,' + getImage(item.hotel.hotelId)">
              </div>
            </div>
            <div class="hCardContent">
              <div class="hCardContentBox">
                <p>โรงแรม {{ item.hotel.name }}</p>
              </div>
              <div class="hCardContentBox"><a>ที่ตั้ง {{ item.hotel.address }}</a></div>
              <div class="hCardContentBoxDetail">
                <ul>
                  <li>เวลาเปิด {{ convertTime(item.hotel.openTime) }}</li>
                  <li>เวลาปิด {{ convertTime(item.hotel.closeTime) }}</li>
                  <li>เวลาเช็คอิน {{ convertTime(item.hotel.checkinTime) }}</li>
                </ul>
              </div>
              <div class="hCardReserve">
                <a>ราคาเริ่มต้น {{ item.minPrice }} บาท</a>
                <a :href="'/hotel/' + item.hotel.hotelId+'/user/'+this.$route.params.id"><button class="hCardReserveBtn">จองห้องพัก</button></a>
              </div>
            </div>
          </div>
        </div>
        <div class="hPaginate">
          <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
import HotelService from '@/services/HotelService';
export default {
  name: 'HotelVue',
  components: {
    PaginationVue,
  },
  props: ['message'],
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
      itemsPerPage: 5,
      imagePath:'',
      hotel: []
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.hotel.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.hotel.slice(start, end);
    },
  },
  created() {
    this.HotelAll();
  },
  methods: {
    onPageChange(page) {
      this.currentPage = page;
    },
    convertTime(time) {
      const utcDate = new Date(time); // Parse the UTC date // Add 7 hours for GMT+7

      return utcDate.toLocaleTimeString('en-US', {
        timeZone: 'Asia/Bangkok', // Use the timezone identifier for GMT+7
        hour: '2-digit',
        minute: '2-digit',
      });
    },
    HotelAll() {
      console.log(this.message.provinceId)
      HotelService.HotelServiceAll(this.message.districtId, this.message.provinceId, this.message.subdistrictId, this.message.amountRoom, this.message.guest, this.message.priceMax, this.message.priceMin)
        .then((response) => {
          {
            this.hotel = response.data.body
            console.log(this.hotel[0].hotel)
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
    getImage(id){
      HotelService.getImage(id)
        .then((response) => {
          {
            console.log(response.data.body)
            this.imagePath = response.data.body
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
}
</script>
<style>
.hBody {
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

.hText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: row;
  padding-left: 1%;
}

.hText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.hContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.hContents {
  width: 100%;
  min-height: 72vh;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.hCard {
  width: 280px;
  height: 500px;
  background-color: rgb(244, 244, 244);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  margin: 6px;
}

.himg {
  width: 90%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.himg1 {
  z-index: 90;
  width: 100%;
  height: 100%;
  overflow: hidden;
  border-radius: 10px;
}

.himg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.himg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.himg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.hCardContent {
  width: 100%;
  height: 55%;
  padding: 5px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.hCardContentBox {
  width: 100%;
  height: 20%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hCardContentBoxDetail {
  width: 100%;
  height: 40%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.hCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.hCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hCardReserve {
  margin-bottom: 10px;
  width: 95%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.hCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.hPaginate {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}
</style>