<template>
    <nav>
        <ul class="pagination">
            <li class="page-link circular-buttons" :class="{ 'disabled': currentPages === 1 }">
                <a @click="goToPage(currentPages - 1)" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-link circular-buttons" v-for="pages in totalPagess" :key="pages" :class="{ 'active': pages === currentPages }">
                <a @click="goToPage(pages)">{{ pages }}</a>
            </li>
            <li class="page-link circular-buttons" :class="{ 'disabled': currentPages === totalPagess }">
                <a @click="goToPage(currentPages + 1)" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</template>
  
<script>
export default {
    name: 'PlacePaginationVue',
    props: {
        currentPagess: Number,
        totalPagesss: Number,
    },
    methods: {
        goToPage(pages) {
            if (pages >= 1 && pages <= this.totalPagess) {
                this.$emit('page-change', pages);
            }
        },
    },
};
</script>
<style>
.circular-buttons {
    border-radius: 100%;
    width: 38px;
    height: 38px;
    margin-left: 2px;
    margin-right: 2px;
}
</style>