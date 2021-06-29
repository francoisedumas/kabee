<template>
  <div class="task-card">
    <div>
      <h3>{{ title }}</h3>
      <p>{{ description }}</p>
      <Rating
        :grade= rating
        :maxStars="5"
        :hasCounter="true"
        @submit-star="submitStar"
      />
    </div>
  </div>
</template>

<script>
import Rating from './Rating.vue'

export default {
  props: {
    title: String,
    description: String,
    rating: Number,
  },
  components: {
    Rating
  },
  methods: {
    submitStar(star) {
      this.$emit('update-star', star);
      // console.log(star);
    }
  },
};
</script>
