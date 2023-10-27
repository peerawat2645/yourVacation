<template>
    <div class="registerb">
        <div class="registerpic_background">
            <a>Your Vacation</a>
            <div class="registerlogin">
                <a>Register</a>
                <div class="registertextbox">
                    <div style="display: flex;
        align-items: center;
        justify-content: space-between;
        flex-direction: row; width:94%;">
                        <div style="display: flex;
        align-items: start;
        justify-content: center;
        flex-direction: column; width:45%;">
                            <p>name</p>
                            <div style="width: 10px; height:10px"></div>
                            <input type="text" placeholder="name">
                        </div>
                        <div style="display: flex;
        align-items: start;
        justify-content: center;
        flex-direction: column;  width:45%">
                            <p>surname</p>
                            <div style="width: 10px; height:10px"></div>
                            <input type="text" placeholder="surname">
                        </div>
                    </div>
                    <p>email</p>
                    <input type="text" placeholder="email">
                    <p>password</p>
                    <input type="text" placeholder="password">
                    <p>phone number</p>
                    <input type="text" placeholder="phone number">
                    <p>address</p>
                    <input type="text" placeholder="address">
                </div>
                <div class="registerbottom">
                    <a href="/"><button class="registerregister_btn">
                        back
                    </button></a>
                    <a href="/home">
                        <button class="registerlogin_btn">
                            Register
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'RegisterPage',
    props: {
        msg: String
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
    height: 500px;
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
}</style>