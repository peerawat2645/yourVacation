<template>
    <div class="FBody">
        <div class="FSelect">
            <div class="Fbtnbox">
            <button class="Fbtn" @click="changeColor(1)" :class="{ 'Fcolor': isColorChanged1 }">Recomend</button>
            <button class="Fbtn" @click="changeColor(2)" :class="{ 'Fcolor': isColorChanged2 }">Place</button>
            <button class="Fbtn" @click="changeColor(3)" :class="{ 'Fcolor': isColorChanged3 }">Hotel</button>
        </div>
    </div>
        <RecomendPlace v-if="activeComponent === 'RecomendPlace'" />
        <PlaceVue v-if="activeComponent === 'PlaceVue'" />
        <HotelVue v-if="activeComponent === 'HotelVue'" />
    </div>
</template>
<script>
import RecomendPlace from './Recomend.vue';
import HotelVue from './Hotel.vue';
import PlaceVue from './Place.vue';
export default {
    name: 'ForYou',
    props: {
        msg: String
    },
    components: {
        RecomendPlace,
        HotelVue,
        PlaceVue
    },
    data() {
        return {
            activeComponent: 'RecomendPlace', // The default component to display
            isColorChanged1: true,
            isColorChanged2: false,
            isColorChanged3: false,
        };
    },
    methods: {
    changeColor(a) {
        if(a==1){
            this.isColorChanged1 = true;
            this.isColorChanged2 = false;
            this.isColorChanged3 = false;
            this.activeComponent = 'RecomendPlace';
        }
        else if(a==2){
            this.isColorChanged1 = false;
            this.isColorChanged2 = true;
            this.isColorChanged3 = false;
            this.activeComponent = 'PlaceVue';
        }
        else if(a==3){
            this.isColorChanged1 = false;
            this.isColorChanged2 = false;
            this.isColorChanged3 = true;
            this.activeComponent = 'HotelVue';
        }
    }
  }
}
</script>
<style>
.Fcolor{
    color: rgb(0, 0, 0);
    font-weight: 600;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
  }
.FBody {
    margin-top: -15vh;
    width: 100%;
    height: 100vh;
    background-color: transparent;
    top: 0%;
    left: 0%;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}
.FSelect{
    z-index: 100;
    width: 80%;
    height: auto;
    background-color: rgba(255, 255, 255, 0.8);
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
    border-radius: 10px;
    padding: 10px;
    display: flex;
    align-items: start;
    justify-content: center;
    flex-direction: row;
}
.Fbtnbox{
    width: fit-content;
    background-color: white;
    box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
    border: none;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
}
.Fbtn{
    padding: 10px 20px;
    background-color: transparent;
    border: none;
    border-radius: 10px;
    font-size: 18px;
}
.Fbtn:hover{
    background-color: rgb(178, 178, 178);
}
</style>