<template>
  <div id="app">
    <p>{{ message }}</p>
    <ul class="mt-4">
      <li class="py-4" v-for="feedback in feedbacks" :key="feedback.id" :feedback="feedback">
        <p>{{ feedback.title }}</p>
      </li>
    </ul>
    <FeedbacksList />
  </div>
</template>

<script>
import FeedbacksList from './components/FeedbacksList.vue';
import { api } from './packs/api/client';
import "./stylesheets/main";

export default {
  data: function () {
    return {
      message: "Hello! Here you will find the feedbacks",
      feedbacks: []
    }
  },
  components: {
    FeedbacksList
  },
  mounted() {
    this.loadFeedback();
  },
  methods: {
    loadFeedback() {
      return api.feedbacks().then((response) => {
        this.feedbacks = response.data;
      });
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
