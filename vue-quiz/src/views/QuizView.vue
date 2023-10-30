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
      showQuestionDisplay: true, // or whatever your initial state is
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
