<template>
  <div>
    <div v-if="feedbacks.length >0">
      <FeedbackCard 
        v-for="(feedback, index) in feedbacks"
        :key="index"
        :title="feedback.title"
        :description="feedback.description"
        :rating="feedback.rating"
      />
    </div>
    <div v-else>
      You don't have any feedbacks yet...
    </div>
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
      return api.getFeedbacks().then((response) => {
        this.feedbacks = response.data
      });
    }
  },
}
</script>
