<template>
  <div>
    <button class="btn round-icon" @click="newFormVisible = !newFormVisible">
      {{ newFormVisible ? "✕" : "＋" }}
    </button>
    <div
      v-show="newFormVisible"
      class="task-card new-task"
      @keyup.enter="addFeedback(newTitle, newDescription), resetForm()"
    >
      <div>
        <input
          type="text"
          placeholder="Give a title to your feedback"
          v-model="newTitle"
        />
        <textarea
          placeholder="Add some details about your feedback"
          v-model="newDescription"
        ></textarea>
      </div>
    </div>
    <div v-if="feedbacks.length >0">
      <FeedbackCard
        v-for="(feedback, index) in feedbacks"
        :key="index"
        :title="feedback.title"
        :description="feedback.description"
        :rating="feedback.rating"
        :id="feedback.id"
        @update-star="updateStar(feedback.id, $event)"
      />
    </div>
    <p v-else-if="!newFormVisible">You don't have any tasks yet...</p>
  </div>
</template>

<script>
import FeedbackCard from "./FeedbackCard";
import { api } from '../packs/api/client';

export default{
  data() {
    return {
      feedbacks: [],
      newTitle: "",
      newDescription: "",
      newRating: 5,
      newFormVisible: false,
    }
  },
  components: {
    FeedbackCard
  },
  mounted() {
    this.loadFeedbacks();
  },
  methods: {
    loadFeedbacks() {
      return api.getFeedbacks().then((response) => {
        this.feedbacks = response.data
      });
    },
    addFeedback(title, description, rating = 5) {
      this.newFormVisible = false;
      return api.postFeedbacks(this.newTitle, this.newDescription, this.rating ).then((response) => {
        this.feedbacks.push(response.data)
        this.newTitle = ''
        this.newDescription = ''
        this.newRating = 5
      });
    },
    resetForm() {
      this.newTitle = ""
      this.newDescription = ""
    },
    updateStar(id, star) {
      return api.updateFeedbacks(id, star).then((response) => {
        this.$mount();
      });
    }
  },
}
</script>

<style lang="scss">
  @keyframes expand-vertical { from { min-height: 0; height: 0; } to { min-height: 6rem; } }
  .task-card.new-task {
    animation: expand-vertical 0.2s;
    overflow: hidden;
    background-color: white;
    border-left: solid 5px #35495e;
    &, &:hover { transform: scale(1.1); box-shadow: 2px 3px 10px rgba(black, 0.2); }
    & + .tasks-list { pointer-events: none; }
    input { font-size: 1.17rem; font-weight: bold; width: 100%; }
    textarea { width: 100%; font-size: 0.9rem; resize: none; }
  }
</style>
