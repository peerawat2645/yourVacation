<template>
    <div class="registerb">
        <div class="registerpic_background">
            <a>Your Vacation</a>
            <div class="registerlogin">
                <a style="font-size: 30px">Register(For Hotel)</a>
                <div class="registertextbox">
                    <div style="display: flex;
        align-items: center;
        justify-content: space-between;
        flex-direction: row; width:94%;">
                        <div style="display: flex;
        align-items: start;
        justify-content: center;
        flex-direction: column; width:45%;">
                            <p>Name</p>
                            <div style="width: 10px; height:10px"></div>
                            <input type="text" placeholder="Name" v-model="user.name">
                        </div>
                        <div style="display: flex;
        align-items: start;
        justify-content: center;
        flex-direction: column;  width:45%">
                            <p>Surname</p>
                            <div style="width: 10px; height:10px"></div>
                            <input type="text" placeholder="Surname" v-model="user.lastname">
                        </div>
                    </div>
                    <p>Username</p>
                    <input type="text" placeholder="Username" v-model="user.username">
                    <p>Email</p>
                    <input type="text" placeholder="Email" v-model="user.email">
                    <p>Password</p>
                    <input type="password" placeholder="Password" v-model="user.password">
                    <p>Phone Number</p>
                    <input type="text" placeholder="Phone Number" v-model="user.phone">
                    <p>Address</p>
                    <input type="text" placeholder="Address" v-model="user.address">
                </div>
                <div class="registerbottom">
                    <a href="/"><button class="registerregister_btn">
                            Back
                        </button></a>
                    <button class="registerlogin_btn" @click="handleRegister">
                        Register
                    </button>
                </div>
                <div v-if="error" class="error-message">{{ errorMessage }}</div>
            </div>
        </div>
    </div>
</template>
<script>
import apiService from '@/services/apiService';
import router from '@/router';
export default {
    name: 'RegisterPage',
    props: {
        msg: String
    },
    data() {
        return {
            user: {
                name: '',
                lastname: '',
                email: '',
                username: '',
                password: '',
                phone: '',
                address: '',
            },
            error: false,
            errorMessage: '',
        };
    },
    methods: {
        handleRegister() {
            if (!this.user.name && !this.user.lastname && !this.user.email && !this.user.username && !this.user.password && !this.user.phone && !this.user.address) {
                this.error = true;
                this.errorMessage = 'Please fill in all required fields.';
                return;
            }
            else if (!this.user.name || !this.user.lastname || !this.user.email || !this.user.username || !this.user.password || !this.user.phone || !this.user.address) {
                if (!this.user.name) {
                    this.error = true;
                    this.errorMessage = 'Name is required.';
                } else if (!this.user.lastname) {
                    this.error = true;
                    this.errorMessage = 'Surname is required.';
                } else if (!this.user.email) {
                    this.error = true;
                    this.errorMessage = 'Email is required.';
                } else if (!this.user.username) {
                    this.error = true;
                    this.errorMessage = 'Username is required.';
                } else if (!this.user.password) {
                    this.error = true;
                    this.errorMessage = 'Password is required.';
                } else if (!this.user.phone) {
                    this.error = true;
                    this.errorMessage = 'Phone is required.';
                } else if (!this.user.address) {
                    this.error = true;
                    this.errorMessage = 'Address is required.';
                }
                return;
            }
            this.error = false;
            apiService.registerHotel(this.user)
                .then(() => {
                    {
                        router.push('/hotel/create');
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
    }
}
</script>

<style>
.registerb {
    width: 99vw;
    height: 97vh;
    background-color: rgb(255, 255, 255);
    margin: 0%;
    padding: 0%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.registerpic_background {
    width: 96vw;
    height: 90vh;
    border-radius: 20px;
    background-image: url("https://c1.wallpaperflare.com/preview/460/412/978/beach-sea-holiday-waves.jpg");
    background-size: cover;
    /* Optional, adjusts how the image is displayed */
    background-repeat: no-repeat;
    /* Optional, prevents image repetition */
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    color: rgb(255, 255, 255);
}

.registerpic_background a {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 600;
    font-size: 50px;
}

.registerlogin {
    margin-top: 10px;
    width: 350px;
    height: 600px;
    padding-left: 25px;
    padding-right: 25px;
    padding-left: 25px;
    padding-top: 50px;
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: column;
    background-color: rgba(94, 94, 94, 0.49);
    text-align: left;
    color: rgb(255, 255, 255);
    line-height: 10px;
}

.registertextbox {
    width: 100%;
    height: 70%;
    display: flex;
    align-items: start;
    justify-content: space-between;
    flex-direction: column;
    margin-top: 30px;
}

.registerlogin a {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 600;
    font-size: 50px;
    cursor: default;
}

.registerlogin p {
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 600;
    font-size: 24px;
    cursor: default;
    height: fit-content;
    margin: 0%;
}

.registerbottom {
    width: 100%;
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    margin-bottom: 10px;
}


.registerlogin_btn {
    width: 100%;
    padding: 20px 30px;
    height: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    background-color: white;
    border-radius: 15px;
    border-color: white;
    border-width: 3px;
    border-style: solid;
    color: black;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 600;
    font-size: 30px;
    text-decoration: none;
    display: inline-block;
    text-align: center;
    margin-left: 10px;
}

.registerlogin_btn:hover {
    background-color: rgb(76, 153, 163);
    color: rgb(255, 255, 255);
}

.registerregister_btn {
    width: 100%;
    padding: 20px 30px;
    height: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    border-radius: 15px;
    border-color: white;
    background-color: transparent;
    border-width: 3px;
    /* Replace '2px' with your desired border width */
    border-style: solid;
    color: rgb(255, 255, 255);
    font-family: Arial, Helvetica, sans-serif;
    font-weight: 400;
    font-size: 30px;
    text-decoration: none;
    display: inline-block;
    text-align: center;
}

.registerregister_btn:hover {
    border-color: rgb(255, 255, 255);
    background-color: rgb(76, 153, 163);
    /* Replace '2px' with your desired border width */
    color: rgb(255, 255, 255);
}

input[type="text"] {
    border: 2px solid grey;
    /* Border color and width */
    border-radius: 10px;
    /* Border radius */
    padding: 10px;
    width: 90%;
    /* Padding inside the input */
}

input[type="password"] {
  border: 2px solid grey;
  /* Border color and width */
  border-radius: 10px;
  /* Border radius */
  padding: 10px;
  width: 90%;
  /* Padding inside the input */
}

.error-message {
    background-color: rgba(255, 0, 0, 0.7);
    /* Red background with some transparency */
    color: white;
    /* White text color */
    padding: 10px;
    /* Padding around the error message */
    border-radius: 5px;
    /* Rounded corners */
    display: flex;
    flex-direction: column;
    /* Place text above the close button */
    align-items: center;
    justify-content: space-between;
    margin-top: -30px;
    /* Larger negative margin to move it closer to loginbottom */
}
</style>