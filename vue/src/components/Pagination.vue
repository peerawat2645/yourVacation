<template>
    <nav>
        <ul class="pagination">
            <li class="page-link circular-buttons" :class="{ 'disabled': currentPage === 1 }">
                <a @click="goToPage(currentPage - 1)" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <li class="page-link circular-buttons" v-for="page in totalPages" :key="page" :class="{ 'active': page === currentPage }">
                <a @click="goToPage(page)">{{ page }}</a>
            </li>
            <li class="page-link circular-buttons" :class="{ 'disabled': currentPage === totalPages }">
                <a @click="goToPage(currentPage + 1)" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</template>
  
<script>
export default {
    name: 'PaginationVue',
    props: {
        currentPage: Number,
        totalPages: Number,
    },
    methods: {
        goToPage(page) {
            if (page >= 1 && page <= this.totalPages) {
                this.$emit('page-change', page);
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