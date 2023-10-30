<script>
import QuestionDisplay from "@/components/QuestionDisplay.vue";
import GameMenu from "@/components/GameMenu.vue";
import Header from "@/components/Header.vue";

export default {

  components: {
    Header,
    QuestionDisplay,
    GameMenu,
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
    <GameMenu v-if="showGameMenu === true" @retryGame="showGameMenu = false"></GameMenu>  </div>
</template>
