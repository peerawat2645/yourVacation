<template>
    <div class="body">
        <NavBar :message=$route.params.id />
        <HomeVue id="home"/>
        <ForYou id="foryou"/>
        <FilterPic id="filter"/>
        <AboutUs id="aboutus"/>
    </div>
</template>
  
<script>

import NavBar from './Navbar.vue';
import HomeVue from './HomeVue.vue';
import ForYou from './ForYou.vue';
import FilterPic from './Filter.vue';
import AboutUs from './AboutUs.vue';
export default {
    name: 'AfterLogin',
    components: {
        NavBar,
        HomeVue,
        ForYou,
        FilterPic,
        AboutUs,
    },
    data() {
    return {
      userId: '',
    };
  },
}
</script>
  
<style>
.body {
    margin-top: 0%;
}
</style>
  