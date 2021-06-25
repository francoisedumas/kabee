<template>
  <div class="task-card">
    <div>
      <h3>{{ title }}</h3>
      <p>{{ description }}</p>
      <Rating
        :grade="3"
        :maxStars="5"
        :hasCounter="true"
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
};
</script>
