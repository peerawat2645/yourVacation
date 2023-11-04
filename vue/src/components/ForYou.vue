<template>
    <div class="FBody">
        <div class="FSelect">
            <div class="Fbtnbox">
                <button @click="changeColor(1)"
                    :class="{ 'Fcolor': isColorChanged1, 'clicked': isClicked1, 'not-clicked': !isClicked1 }">Recomend</button>
                <button @click="changeColor(2)"
                    :class="{ 'Fcolor': isColorChanged2, 'clicked': isClicked2, 'not-clicked': !isClicked2 }">Place</button>
                <button @click="changeColor(3)"
                    :class="{ 'Fcolor': isColorChanged3, 'clicked': isClicked3, 'not-clicked': !isClicked3 }">Hotel</button>
            </div>
            <div v-if="activeComponent === 'PlaceVue'" class="Placebox">
                <div class="PlaceProvince">
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black;">จังหวัด</a>
                        <select style="width: 100%;" @change="ProvinceChange">
                            <option value="">Select Province</option>
                            <option v-for="item in province" v-bind:key="item.provinceId" :value=item.provinceId>{{item.name}}</option>
                        </select>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black">อำเภอ</a>
                        <select style="width: 100%;" @change="DistrictChange">
                            <option value="">Select District</option>
                            <option v-for="item in district" v-bind:key="item.id" :value=item.districtId>{{item.name}}</option>
                        </select>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black;">ตำบล</a>
                        <select style="width: 100%;">
                            <option value="">Select subdistrict</option>
                            <option v-for="item in subdistrict" v-bind:key="item.id">{{item.name}}</option>
                        </select>
                    </div>
                </div>
                <div class="PlaceSelect">
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"> <a style="font-size: 16px;
                        font-weight: 600; color:black">ทะเล</a>
                    </label>
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"> <a style="font-size: 16px;
                        font-weight: 600; color:black">ภูเขา</a>
                    </label>
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"><a style="font-size: 16px;
                        font-weight: 600; color:black"> แม่น้ำ</a>
                    </label>
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"> <a style="font-size: 16px;
                        font-weight: 600; color:black">กิจกรรมทางน้ำ</a>
                    </label>
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"> <a style="font-size: 16px;
                        font-weight: 600; color:black">กิจกรรมทางบก</a>
                    </label>
                    <label style="margin-left: 10px; margin-right:10px;">
                        <input type="checkbox"> <a style="font-size: 16px;
                        font-weight: 600; color:black">กางเต้นท์</a>
                    </label>
                    <div class="clicked" style="padding: 10px 50px;" >ค้นหา</div>
                </div>
            </div>
            <div class="Hotelbox" v-if="activeComponent === 'HotelVue'">
                <div class="HotelProvince">
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black">จังหวัด</a>
                        <select style="width: 100%;">
                            <option value="">Select Province</option>
                        </select>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black">อำเภอ</a>
                        <select style="width: 100%;">
                            <option value="">Select Province</option>
                        </select>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                        font-weight: 600; color:black">ตำบล</a>
                        <select style="width: 100%;">
                            <option value="">Select Province</option>
                        </select>
                    </div>
                </div>
                <div class="HotelSelect">
                    <div style=" display: flex;
                        align-items: center;
                        justify-content: center;
                        flex-direction: row; width:70%;">
                        <div class="ProvinceBox" style="width:45%">
                            <a style="font-size: 16px;
                        font-weight: 600; color:black">ราคาเริ่มต้น</a>
                            <select style="width: 100%;">
                                <option value="">Select Province</option>
                            </select>
                        </div>
                        <a>-</a>
                        <div class="ProvinceBox" style="width:45%">
                            <a style="font-size: 16px;
                        font-weight: 600; color:black">ราคาสิ้นสุด</a>
                            <select style="width: 100%;">
                                <option value="">Select Province</option>
                            </select>
                        </div>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                    font-weight: 600; color:black">จำนวนคนเข้าพัก</a>
                        <select style="width: 100%;">
                            <option value="">Select Province</option>
                        </select>
                    </div>
                    <div class="ProvinceBox">
                        <a style="font-size: 16px;
                    font-weight: 600; color:black">จำนวนห้องนอน</a>
                        <select style="width: 100%;">
                            <option value="">Select Province</option>
                        </select>
                    </div>
                    <div class="clicked" style="padding: 10px 50px;">ค้นหา</div>
                </div>
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
import SubdistrictService from '@/services/SubdistrictService';

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
            isClicked1: true,
            isClicked2: false,
            isClicked3: false,
            subdistrict:[],
            district:[],
            province:[]
        };
    },
    created() {
        this.provinceAll();
    },
    methods: {
        changeColor(a) {
            if (a == 1) {
                this.isColorChanged1 = true;
                this.isColorChanged2 = false;
                this.isColorChanged3 = false;
                this.activeComponent = 'RecomendPlace';
                this.isClicked1 = true;
                this.isClicked2 = false;
                this.isClicked3 = false;
            }
            else if (a == 2) {
                this.isColorChanged1 = false;
                this.isColorChanged2 = true;
                this.isColorChanged3 = false;
                this.activeComponent = 'PlaceVue';
                this.isClicked1 = false;
                this.isClicked2 = true;
                this.isClicked3 = false;
            }
            else if (a == 3) {
                this.isColorChanged1 = false;
                this.isColorChanged2 = false;
                this.isColorChanged3 = true;
                this.activeComponent = 'HotelVue';
                this.isClicked1 = false;
                this.isClicked2 = false;
                this.isClicked3 = true;
            }
        },
        provinceAll(){
            SubdistrictService.province()
                .then((response) => {
                    {
                        this.province = response.data.body
                        console.log(this.province)
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
        ProvinceChange(event){
            const selectedValue = event.target.value;

            SubdistrictService.districtId(selectedValue)
                .then((response) => {
                    {
                        this.district = response.data.body
                        
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
        DistrictChange(event){
            const selectedValue = event.target.value;

            SubdistrictService.subdistrictId(selectedValue)
                .then((response) => {
                    {
                        this.subdistrict = response.data.body
                        
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
        }
    }
}
</script>

<style>
.clicked {
    z-index: 200;
    background-color: #000000;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    font-size: 18px;
    font-weight: 600;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
}

.clicked:hover {
    background-color: rgb(178, 178, 178);
}

.not-clicked {
    z-index: 190;
    border-radius: 10px;
    background-color: #ffffff;
    color: #000;
    padding: 10px 20px;
    border: none;
    font-size: 18px;
    font-weight: 600;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.5);
}

.not-clicked:hover {
    background-color: rgb(178, 178, 178);
}

.FBody {
    margin-top: -15vh;
    width: 100%;
    min-height: 100vh;
    height: auto;
    background-color: transparent;
    top: 0%;
    left: 0%;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.FSelect {
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
    flex-direction: column;
}

.Fbtnbox {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
}

.Fbtn:hover {
    background-color: rgb(178, 178, 178);
}

.Placebox {
    width: 95%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding-top: 5px;
}

.PlaceProvince {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    padding: 8px;
}

.PlaceSelect {
    width: 90%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: row;
    padding: 8px;
}

.ProvinceBox {
    width: 25%;
    margin: 5px;
    padding: 5px 10px;
    background-color: #fff;
    border: none;
    border-radius: 10px;
    border: 1px solid;
    border-color: #000;
    display: flex;
    align-items: start;
    justify-content: center;
    flex-direction: column;
    line-height: 40px;
}
.Hotelbox {
    width: 95%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    padding-top: 5px;
}

.HotelProvince {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: row;
    padding: 8px;
}

.HotelSelect {
    width: 90%;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: row;
    padding: 8px;
}

.HotelBox {
    width: 25%;
    margin: 5px;
    padding: 5px 10px;
    background-color: #fff;
    border: none;
    border-radius: 10px;
    border: 1px solid;
    border-color: #000;
    display: flex;
    align-items: start;
    justify-content: center;
    flex-direction: column;
    line-height: 40px;
}
</style>