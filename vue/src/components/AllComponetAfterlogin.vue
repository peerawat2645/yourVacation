<template>
    <div class="body">
        <NavBar />
        <HomeVue id="home"/>
        <ForYou id="foryou"/>
        <FilterPic id="filter"/>
        <AboutUs id="aboutus"/>
        <ContactUs id="contact"/>
    </div>
</template>
  
<script>

import NavBar from './Navbar.vue';
import HomeVue from './HomeVue.vue';
import ForYou from './ForYou.vue';
import FilterPic from './Filter.vue';
import AboutUs from './AboutUs.vue';
import ContactUs from './Contact.vue';
export default {
    name: 'AfterLogin',
    components: {
        NavBar,
        HomeVue,
        ForYou,
        FilterPic,
        AboutUs,
        ContactUs,
    }
}
</script>
  
<style>
.body {
    margin-top: 0%;
}
</style>
  