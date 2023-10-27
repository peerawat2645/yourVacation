import { createRouter, createWebHistory } from "vue-router";
import LoginPage from "../components/Login.vue";
import AllComponent from "../components/AllComponent.vue";
import AfterLogin from "../components/AllComponetAfterlogin.vue";
import RegisterPage from "../components/Register.vue";
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
