<template>
  <div class="hBody">
    <a :href="'/home/'+this.$route.params.userId" class="pdblack-button">Back</a>
    <div class="hText"><a>โรงแรมแนะนำสำหรับคุณ</a><a style="font-size: 10px;">{{ message }}</a></div>
    <div class="hContent">
      <div style="width: 100%;">
        <div class="hContents">
          <div class="hCard" v-for="item in hotel" :key="item.id">
            <div class="himg">
              <div class="himg1">
                <img
                  src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/463156637.jpg?k=5d913fb55963d82c13fe5960117723b5d57007e15e813be871395bf090418f2f&o=&hp=1">
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
                <a :href="'/hotel/' + item.hotel.hotelId"><button class="hCardReserveBtn">จองห้องพัก</button></a>
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
  name: 'HotelInPlace',
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
      itemsPerPage: 5,
      hotel:[],
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.hotel.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.sampleData.slice(start, end);
    }
  },
  created() {
    this.HotelAll();
  },
  methods: {
    onPageChange(page) {
      this.currentPage = page;
    }, convertTime(time) {
      const utcDate = new Date(time); // Parse the UTC date // Add 7 hours for GMT+7

      return utcDate.toLocaleTimeString('en-US', {
        timeZone: 'Asia/Bangkok', // Use the timezone identifier for GMT+7
        hour: '2-digit',
        minute: '2-digit',
      });
    },
    HotelAll() {
      HotelService.HotelServiceAllByVacationId(this.$route.params.id)
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
  },
}
</script>
<style>
.hpBody {
  width: 100%;
  height: 100vh;
  top: 0%;
  left: 0%;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.hpText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: start;
  flex-direction: row;
  padding-left: 1%;
}

.hpText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.hpContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.hpContents {
  width: 100%;
  height: 72vh;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.hpCard {
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

.hpimg {
  width: 90%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.hpimg1 {
  z-index: 90;
  width: 100%;
  height: 100%;
  overflow: hidden;
  border-radius: 10px;
}

.hpimg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.hpimg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.hpimg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.hpCardContent {
  width: 100%;
  height: 55%;
  padding: 5px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.hpCardContentBox {
  width: 100%;
  height: 20%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hpCardContentBoxDetail {
  width: 100%;
  height: 40%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hpCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.hpCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.hpCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hpCardReserve {
  margin-bottom: 10px;
  width: 95%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
}

.hpCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hpCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.hpPaginate {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}</style>