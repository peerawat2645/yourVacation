import { createRouter, createWebHistory } from "vue-router";
import LoginPage from "../components/Login.vue";
import AllComponent from "../components/AllComponent.vue";
import AfterLogin from "../components/AllComponetAfterlogin.vue";
import RegisterPage from "../components/Register.vue";
import RegisterHotelPage from "../components/RegisterHotel.vue";
import PlaceDetail from "../components/PlaceDetail.vue";
import HotelDetail from "../components/HotelDetail.vue";
import ReservationHotel from "../components/Reservation.vue";
import HotelView from "../components/HotelView.vue";
import AddHotel from "../components/HotelAdd.vue";
import HotelEdit from "../components/HotelEdit.vue";
import RoomTypeEdit from "../components/RoomTypeEdit.vue";
import UserEdit from "../components/UserEdit.vue";
import HotelCreate from "../components/CreateHotel.vue";
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
        path: "/registerHotel",
        component: RegisterHotelPage,
    },
    {
        path: "/home",
        component: AfterLogin,
    },
    {
        path: "/place/detail",
        component: PlaceDetail,
    },
    {
        path: "/hotel/detail",
        component: HotelDetail,
    },
    {
        path: "/hotel/reservation",
        component: ReservationHotel,
    },
    {
        path: "/hotel/home",
        component: HotelView,
    },
    {
        path: "/hotel/add",
        component: AddHotel,
    },
    {
        path: "/hotel/edit",
        component: HotelEdit,
    },
    {
        path: "/hotel/roomtype/edit",
        component: RoomTypeEdit,
    },
    {
        path: "/user",
        component: UserEdit,
    },
    {
        path: "/hotel/create",
        component: HotelCreate,
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
