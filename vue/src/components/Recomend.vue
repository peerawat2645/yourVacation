<template>
  <div class="ReBody">
    <div class="ReText"><a>โรงแรมแนะนำสำหรับคุณ</a></div>
    <div class="ReContent">
      <div>
        <div class="ReContents">
          <div class="ReCard" v-for="item in displayedData" :key="item.id">
            <div class="Reimg">
              <div class="Reimg1">
                <img
                  src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/463156637.jpg?k=5d913fb55963d82c13fe5960117723b5d57007e15e813be871395bf090418f2f&o=&hp=1">
              </div>
              <div class="Reimg2">
                <img src="https://media.bom.gov.au/social/upload/images/iStock-blue-sea-resize.jpg">
              </div>
            </div>
            <div class="ReCardContent">
              <div class="ReCardContentBox">
                <p>โรงแรม {{ item.id }}</p>
              </div>
              <div class="ReCardContentBox"><a>ใกล้กับอุทยาน {{ item.name }}</a></div>
              <div class="ReCardContentBoxDetail"><a>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</a></div>
              <div class="ReCardReserve">
                <a>ราคาเริ่มต้น xxx บาท</a>
                <a href="#"><button class="ReCardReserveBtn">จองห้องพัก</button></a>
              </div>
            </div>
          </div>
        </div>
        <div class="RePaginate">
          <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
export default {
  name: 'RecomendPlace',
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
      itemsPerPage: 4,
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.sampleData.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.sampleData.slice(start, end);
    },
  },
  methods: {
    onPageChange(page) {
      this.currentPage = page;
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