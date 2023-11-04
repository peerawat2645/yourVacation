<template>
  <div class="a">
    <div class="navbar rown">
      <p>YourVacation</p>
      <div class="rown navbarselect">
        <button class="navbtn"  @click="toggleUnderline(1)" :class="{ 'underlined': isUnderlined1 }"><a href="/home#home">Home</a></button>
        <button class="navbtn" @click="toggleUnderline(2)" :class="{ 'underlined': isUnderlined2 }"><a href="/home#foryou">For you</a></button>
        <button class="navbtn" @click="toggleUnderline(3)" :class="{ 'underlined': isUnderlined3 }"><a href="/home#filter">Picture Filter</a></button>
        <button class="navbtn" @click="toggleUnderline(4)" :class="{ 'underlined': isUnderlined4 }"><a href="/home#aboutus">About us</a></button>
        <button class="navbtn" @click="toggleUnderline(5)" :class="{ 'underlined': isUnderlined5 }"><a href="/user">Profile</a></button>
        <button class="nblack-button"><a href="/" style="color: white;">Sign out</a></button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'NavBar',
  props: {
    msg: String
  },
  data() {
    return {
      isUnderlined1: true,
      isUnderlined2: false,
      isUnderlined3: false,
      isUnderlined4: false,
      isUnderlined5: false,
    };
  },
  methods: {
    toggleUnderline(a) {
      if(a==1){
        this.isUnderlined1 = true;
        this.isUnderlined2 = false;
        this.isUnderlined3 = false;
        this.isUnderlined4 = false;
        this.isUnderlined5 = false;
      }
      else if(a==2){
        this.isUnderlined1 = false;
        this.isUnderlined2 = true;
        this.isUnderlined3 = false;
        this.isUnderlined4 = false;
        this.isUnderlined5 = false;
      }
      else if(a==3){
        this.isUnderlined1 = false;
        this.isUnderlined2 = false;
        this.isUnderlined3 = true;
        this.isUnderlined4 = false;
        this.isUnderlined5 = false;
      }
      else if(a==4){
        this.isUnderlined1 = false;
        this.isUnderlined2 = false;
        this.isUnderlined3 = false;
        this.isUnderlined4 = true;
        this.isUnderlined5 = false;
      }
      else if(a==5){
        this.isUnderlined1 = false;
        this.isUnderlined2 = false;
        this.isUnderlined3 = false;
        this.isUnderlined4 = false;
        this.isUnderlined5 = true;
      }
    }
  }
}
</script>
<style>
.underlined {
  text-decoration: underline;
  font-size: 30px;
  margin-top: -10px;
}
.nblack-button {
  display: inline-block;
  padding: 5px 10px;
  background-color: #000;
  color: #fff;
  text-decoration: none;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  align-self: flex-start;
}

.nblack-button:hover {
  background-color: #333;
  /* Darker shade of black on hover */
}
.rown {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: row;
}
.navbtn{
  background-color: transparent;
      border: none;
      color: inherit;
}

.a {
  z-index: 200;
  width: 100vw;
  height: 7vh;
  background-color: rgb(255, 255, 255);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  margin: 0%;
  padding: 0%;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row;
  position: fixed;
  /* Position the div absolutely within the container */
  top: 0;
  /* Align to the top edge */
  right: 0;
}

.navbar {
  width: 90%;
  height: 8vh;
}

.navbar p {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: 600;
  font-size: 30px;
  cursor: default;
}

.navbar a {
  font-size: 16px;
  cursor: default;
  font-weight: 500;
  text-decoration: none;
  color: rgb(48, 48, 48);
}

.navbarselect {
  width: 40%;
  height: auto;
  margin-top: -10px;
}</style>