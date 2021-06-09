<template>
  <div>
    <FeedbackCard 
      v-for="(feedback, index) in feedbacks"
      :key="index"
      :title="feedback.title"
      :description="feedback.description"
      :done="feedback.done"
    />
  </div>
</template>

<script>
import FeedbackCard from "./FeedbackCard";

export default{
  components: {
    FeedbackCard
  },
  data() {
    return {
      feedbacks: [
        {
          title: "Create a card component",
          description:
            "Create a new TaskCard.vue file in the components folder, then import it in TasksList",
          done: true,
        },
        {
          title: "Make the card component dynamic",
          description:
            "Learn about using the data option and passing data to child components using props",
          done: true,
        },
        {
          title: "Bind the attributes to the data",
          description:
            "Use the v-bind directive to bind the title and description to our data",
          done: false,
        },
      ],
    };
  },
}
</script>
