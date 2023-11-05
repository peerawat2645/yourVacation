<template>
  <div class="uebody">
    <a :href="'/home/'+this.$route.params.id" class="ueblack-button">Back</a>
    <div class="ueContact">
      <a style="color: rgb(83, 176, 177);">Edit User</a>
      <div class="ueContactNameRow">
        <div class="ueContactNameRowdiv">
          <a>Name</a>
          <input type="text" class="uecustom-input" placeholder="Your Input" v-model="user.name">
        </div>
        <div class="ueContactNameRowdiv">
          <a>Surname</a>
          <input type="text" class="uecustom-input" placeholder="Your Input" v-model="user.lastname">
        </div>
      </div>
      <div class="ueContactName">
        <a>Email</a>
        <input type="text" class="uecustom-input" placeholder="Your Input" v-model="user.email"> 
      </div>
      <div class="ueContactName">
        <a>Phone</a>
        <input type="text" class="uecustom-input" placeholder="Your Input" v-model="user.phone">
      </div>
      <div class="ueContactName">
        <a>Location</a>
        <input type="text" class="uecustom-input" placeholder="Your Input" v-model="user.address">
      </div>
      <div style="width: 100%; align-items:center; "><button class="ueblack-button" @click="openPopup">แก้ไข</button></div>
      <div class="uepopup-overlay" v-if="isPopupOpen">
        <div class="uepopup">
          <span @click="closePopup" class="ueclose-button">X</span>
          <h2>ยืนยันการแก้ไข</h2>
          <button  @click="saveUser" class="ueblack-button" style="color: white; font-size:18px">Success</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import UserService from '@/services/UserService'
import router from '@/router';
export default {
  name: 'UserEdit',
  props: {
    msg: String
  },
  data() {
    return {
      isPopupOpen: false,
      imageWidth: 300, // You can set these values dynamically
      imageHeight: 300,
      user:[],
    };
  },
  created(){
    this.getUserData();
  }
  ,
  methods: {
    openPopup() {
      this.isPopupOpen = true;
    },
    closePopup() {
      this.isPopupOpen = false;

    },
    saveUser() {
      UserService.saveData(this.user).then((response) => {
                    {
                      router.push('/home/'+response.data.body.userId);
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
    getUserData(){
      console.log(this.$route.params.id)
      UserService.getUserData(this.$route.params.id)
                .then((response) => {
                    {
                      this.user = response.data.body
                      console.log(this.user)
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
  },
}
</script>
<style>
.uebody {
  width: 100%;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
}
.uecustom-input {
  border: 10px solid grey;
  /* You can add more custom styles as needed */
  height: 40px;
}
.ueblack-button {
  display: inline-block;
  padding: 10px 20px;
  background-color: #000;
  color: #fff;
  text-decoration: none;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 20px;
  align-self: flex-start;
}

.ueblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}
.ueUpload {
  width: 80%;
  height: 15%;
  display: flex;
  align-items: start;
  justify-content: space-between;
  flex-direction: column;
}
.ueContact {
  width: 45%;
  height: 85%;
  padding: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;
  background-color: rgb(241, 240, 240);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  border-radius: 20px;
}

.ueContact a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 40px;
  font-weight: 600;
  cursor: default;
  color: rgb(83, 176, 177);
}

.ueContact p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}

.ueContactName {
  width: 80%;
  height: 20%;
  display: flex;
  align-items: start;
  justify-content: center;
  flex-direction: column;
}
.ueContactLabel {
  width: 80%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: row;
  flex-wrap: wrap;
  padding: 20px 0px;
}
.ueContactNameRow {
  width: 80%;
  height: 20%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}
.ueContactNameRowdiv{
  width: 50%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}
.ueContactNameRowdiv3{
  width: 32%;
  height: auto;
  display: flex;
  align-items: start;
  justify-content: start;
  flex-direction: column;
}
.ueContactName a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.ueContactName p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}
.ueContactNameRowdiv a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.ueContactNameRowdiv p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}
.ueContactNameRowdiv3 a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 20px;
  font-weight: 600;
  cursor: default;
  color: rgb(0, 0, 0);
}

.ueContactNameRowdiv3 p {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 18px;
  font-weight: 400;
  cursor: default;
  color: rgb(64, 64, 64);
}
.uepopup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999; /* Adjust z-index as needed */
}

.uepopup {
  background: #fff;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
  width: 400px;
  max-width: 90%;
  position: relative;
}

.ueclose-button {
  position: absolute;
  top: 10px;
  right: 10px;
  cursor: pointer;
  font-size: 20px;
}
</style>