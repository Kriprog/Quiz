<script>
import QuestionDisplay from "@/components/QuestionDisplay.vue";
import Header from "@/components/Header.vue";

export default {

  components: {

    Header,
    QuestionDisplay,
  },
  data() {
    return {
      showGameMenu: false,
      showQuestionDisplay: true,
    };
  },
};

</script>

<template>

  <div>
    <Header />
    <QuestionDisplay @incorrect-answer-clicked="showGameMenu = true"></QuestionDisplay>
  </div>
</template>
