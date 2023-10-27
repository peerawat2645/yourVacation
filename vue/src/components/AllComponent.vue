<template>
    <div class="body">
      <WelcomePage />
  </div>
  </template>
  
  <script>
  
  import WelcomePage from './Welcome.vue';
  export default {
    name: 'AllComponent',
    components: {
      WelcomePage
    }
  }
  </script>
  
  <style>
  .body{
    margin-top: 0%;
  }
  </style>
  