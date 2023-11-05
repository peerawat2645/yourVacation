<template>
  <div class="hvBody">
    <div class="hvText"><a>ประเภทห้องของคุณ</a>
      <div><button class="hvblack-button" style="font-size: 18px; color: white; margin-right: 0%;" v-if="!status" @click="createAds">
          โฆษณา
        </button>
        <a :href="'/hotel/' + this.$route.params.id + '/edit'" class="hvblack-button"
          style="font-size: 18px; color:white; margin-right:0%;">แก้ไขข้อมูลโรงแรม</a>
        <a :href="'/hotel/' + this.$route.params.id + '/add'" class="hvblack-button"
          style="font-size: 18px; color:white">add</a>
        <a href="/" class="hvblack-button" style="font-size: 18px; color:white; margin-left:0%;" @click="signout">Logout</a>
      </div>
    </div>
    <div class="hvContent">
      <div style="width: 100%;">
        <div class="hvContents">
          <div class="hvCard" v-for="item in displayedData" :key="item.id">
            <div class="hvimg">
              <div class="hvimg1">
                <img
                  src="https://cf.bstatic.com/xdata/images/hotel/max1024x768/463156637.jpg?k=5d913fb55963d82c13fe5960117723b5d57007e15e813be871395bf090418f2f&o=&hp=1">
              </div>
            </div>
            <div class="hvCardContent">
              <div class="hvCardContentBox">
                <p>ห้องประเภท {{ item.type }}</p>
              </div>
              <div class="hvCardContentBox"><a>มีจำนวนห้อง {{ item.amountRoom }} ห้อง</a></div>
              <div class="hvCardReserve">
                <a :href="'/hotel/' + this.$route.params.id + '/roomtype/edit/' + item.roomId"><button
                    class="hvCardReserveBtn">แก้ไข</button></a>
                    <div style="width: 20px;"></div>
                    <a @click="deleteItem"><button
                      class="hvCardReserveBtn">ลบ</button></a>

              </div>
              <div v-if="showConfirmation" class="confirmation-dialog">
                <div class="confirmation-content">
                  <p>Are you sure you want to delete this item?</p>
                  <button @click="confirmDelete(item.roomId)">Yes</button>
                  <button @click="cancelDelete">No</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="hvPaginate">
          <paginationVue :current-page="currentPage" :total-pages="totalPages" @page-change="onPageChange" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import PaginationVue from './Pagination.vue';
import HotelService from '@/services/HotelService';
import hotelRecommendService from '@/services/HotelService';
import apiService from '@/services/apiService.js'
import router from '@/router';
export default {
  name: 'HotelView',
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
      status: '',
      room: [],
      showConfirmation: false,
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.room.length / this.itemsPerPage);
    },
    displayedData() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      const end = start + this.itemsPerPage;
      return this.room.slice(start, end);
    },
  },
  created() {
    this.rooms();
    this.recommend();
  }
  ,
  methods: {
    onPageChange(page) {
      this.currentPage = page;
    },
    rooms() {
      HotelService.roomData(this.$route.params.id)
        .then((response) => {
          {
            this.room = response.data.body
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
    recommend() {
      hotelRecommendService.hotelInAds(this.$route.params.id)
        .then((response) => {
          {
            this.status = response.data.body
            console.log(this.status)
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
    createAds(){
      hotelRecommendService.createAds(this.$route.params.id)
        .then((response) => {
          {
            this.status = response.data.body
            console.log(this.status)
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
    },signout(){
      apiService.signout()
                .then(() => {
                    {
                        router.push('/');
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

    deleteItem() {
      // Show the confirmation dialog
      this.showConfirmation = true;
    },
    confirmDelete(id) {
      // Perform the delete action here
      // For example, call an API or update your data
      // After deletion, hide the confirmation dialog
      this.showConfirmation = false;
      HotelService.roomDelete(id)
                .then(() => {
                    {
                        this.rooms();
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
    cancelDelete() {
      // Hide the confirmation dialog without performing the delete action
      this.showConfirmation = false;
    },
  }
}
</script>
<style>
.hvBody {
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

.hvblack-button {
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

.hvblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}

.hvText {
  margin-top: 4vh;
  width: 99%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
  padding-left: 1%;
}

.hvText a {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
  font-size: 35px;
}

.hvContent {
  width: 98%;
  padding-left: 1%;
  height: 100%;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}

.hvContents {
  width: 100%;
  height: 75vh;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  margin-bottom: 10px;
  flex-wrap: wrap;
}

.hvCard {
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

.hvimg {
  width: 90%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}

.hvimg1 {
  z-index: 90;
  width: 100%;
  height: 100%;
  overflow: hidden;
  border-radius: 10px;
}

.hvimg2 {
  z-index: 89;
  margin-left: 120px;
  margin-top: -80px;
  width: 200px;
  height: 150px;
  overflow: hidden;
  border-radius: 10px;
}

.hvimg1 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.hvimg2 img {
  width: 100%;
  /* Ensure the image doesn't exceed the width of the container */
  height: 100%;
}

.hvCardContent {
  width: 100%;
  height: 55%;
  padding: 5px;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}

.hvCardContentBox {
  width: 100%;
  height: 20%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hvCardContentBoxDetail {
  width: 100%;
  height: 40%;
  display: inline-block;
  padding: 10px;
  text-align: start;
  text-decoration: none;
  padding: 0%;
}

.hvCardContentBox a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 500;
  cursor: default;
  color: rgb(92, 185, 204);
}

.hvCardContentBoxDetail a {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(255, 255, 255);
}

.hvCardContentBox p {
  display: block;
  word-wrap: break-word;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hvCardReserve {
  margin-bottom: 10px;
  width: 95%;
  height: 40%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}

.hvCardReserve a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.hvCardReserveBtn {
  border-radius: 10px;
  background-color: black;
  color: white;
  padding: 5px 10px;
}

.hvPaginate {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
}
.confirmation-dialog {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
}

.confirmation-content {
  background: #fff;
  padding: 20px;
  border-radius: 5px;
  text-align: center;
}

</style>