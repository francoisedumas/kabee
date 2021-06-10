<template>
  <div id="app">
    <p>{{ message }}</p>
    <FeedbacksList />
  </div>
</template>

<script>
import FeedbacksList from './components/FeedbacksList.vue';
import "./stylesheets/main";

export default {
  data: function () {
    return {
      message: "Hello! Here you will find the feedbacks",
    }
  },
  components: {
    FeedbacksList
  }
}
</script>
