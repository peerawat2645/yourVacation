import { createRouter, createWebHistory } from "vue-router";
import LoginPage from "../components/Login.vue";
import AllComponent from "../components/AllComponent.vue";
import AfterLogin from "../components/AllComponetAfterlogin.vue";
import RegisterPage from "../components/Register.vue";
import RegisterHotelPage from "../components/RegisterHotel.vue";
const routeList = [
    {
        path: "/",
        component: AllComponent,
    },
    {
        path: "/login",
        component: LoginPage,
    },
    {
        path: "/register",
        component: RegisterPage,
    },
    {
        path: "/home",
        component: AfterLogin,
    },
    {
        path: "/registerHotel",
        component: RegisterHotelPage,
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes: routeList,
});



//const app = Vue.createApp({})
// Make sure to _use_ the router instance to make the
// whole app router-aware.
//app.use(router)
//app.mount('#app')
export default router;
