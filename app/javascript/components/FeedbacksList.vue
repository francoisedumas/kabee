<template>
  <div>
    <FeedbackCard 
      v-for="(feedback, index) in feedbacks"
      :key="index"
      :title="feedback.title"
      :description="feedback.description"
      :rating="feedback.rating"
    />
  </div>
</template>

<script>
import FeedbackCard from "./FeedbackCard";
import { api } from '../packs/api/client';

export default{
  data() {
    return {
      feedbacks: [],
    }
  },
  components: {
    FeedbackCard
  },
  mounted() {
    this.loadFeedback();
  },
  methods: {
    loadFeedback() {
      return api.feedbacks().then((response) => {
        this.feedbacks = response.data
      });
    }
  },
}
</script>
