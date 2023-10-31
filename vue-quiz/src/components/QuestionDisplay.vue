<script setup>
import {ref, defineEmits} from 'vue';
import {updateScore, increaseHighScore, resetScore, session} from '@/stores/session';
import GameMenu from './GameMenu.vue';

const questionDto = ref(null);
const selectedAnswer = ref(null);
const answerSubmitted = ref(false);
const isCorrectAnswer = ref(false);
const showCorrectMessage = ref(false);
const showQuestionDisplay = ref(true);
const shouldUpdateQuestion = ref(true);
const emits = defineEmits();
const isWaiting = ref(false);
let finalScore = session.score;
let highestSessionScore = finalScore;

const fetchRandomQuestion = async () => {
  try {
    const response = await fetch('/api/quiz');
    if (!response.ok) {
      throw Error('Network response was not ok');
    }
    const data = await response.json();
    questionDto.value = data;
  } catch (error) {
    console.error(error);
  }
};

const checkAnswer = async () => {
  try {
    const response = await fetch('/api/check-answer', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        id: questionDto.value.id,
        selectedAnswer: selectedAnswer.value,
      }),
    });

    if (!response.ok) {
      throw Error('Network response was not ok');
    }

    const result = await response.json();

    answerSubmitted.value = true;
    isCorrectAnswer.value = result.correct;
    return result.correct;

  } catch (error) {
    console.error(error);
    return false;
  }
};

const submitAnswer = (selectedOption) => {
  if (isWaiting.value) {
    return;
  }
  isWaiting.value = true;
  selectedAnswer.value = selectedOption;
  checkAnswer(selectedOption)
      .then((isCorrect) => {
        if (isCorrect) {
          updateScore(1);
          increaseHighScore(1);

          if (session.score > highestSessionScore) {
            highestSessionScore = session.score;
          }
          showCorrectMessage.value = true;
          shouldUpdateQuestion.value = false;
          console.log('Answer is correct.');
          setTimeout(() => {
            showCorrectMessage.value = false;
            shouldUpdateQuestion.value = true;
            isWaiting.value = false;
            console.log('Question will update.');
            fetchRandomQuestion();
          }, 1000);
        } else {
          emits('incorrect-answer-clicked');
          showQuestionDisplay.value = false;
          resetScore();
          isWaiting.value = false;
        }
      })
      .catch((error) => {
        console.error('Error:', error);
      });
};


import {onMounted} from 'vue';
import {TrophyIcon} from "@heroicons/vue/24/outline";

onMounted(() => {
  fetchRandomQuestion();
});


</script>
<style scoped>
</style>
<template>
  <div class="flex flex-col items-center justify-center">
    <div v-if="showQuestionDisplay && questionDto"
         class="w-full max-w-5xl p-4 bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg">
      <p class="text-gray-800 font-bold text-2xl"> {{ questionDto.questionText }} </p>
      <div class="mt-4">
        <div class="grid grid-cols-1 gap-4">
          <div class="relative">
            <div class="absolute top-0 left-0 w-full h-full flex items-center justify-center" v-if="showCorrectMessage">
              <div class="responsive-container">
                <p class="text-lg text-gray-700 font-bold bigger-text">Correct answer!</p>
              </div>
            </div>
            <div class="grid grid-cols-2 gap-4">
              <button
                  v-for="option in questionDto.options"
                  :key="option"
                  @click="submitAnswer(option)"
                  class="responsive-square-button text-white text-1xl font-medium py-2 px-2 rounded bg-violet-500 hover:bg-violet-600 focus:outline-none"
              >
                {{ option }}
              </button>
            </div>
          </div>
        </div>
        <div
            class="relative flex items-center bg-gray-100 text-gray-700 hover:text-gray-950 hover-bg-gray-50 transition duration-200"
            style="padding: 15px; width: fit-content; border-radius: 10px; margin-top: 10px;"
        ><span class="font-semibold">Your current score: {{ session.score }} </span>
        </div>
      </div>
    </div>
    <template v-else>
      <GameMenu :latestScore="parseInt(session.score)" :highScore="parseInt(session.highscore)"
                :highestSessionScore="parseInt(highestSessionScore)"/>
    </template>
  </div>
</template>

<style scoped>
.responsive-square-button {
  width: 100%; /* Use 100% for responsive width */
  padding-top: 15%; /* Set padding-top to create a square */
  padding-bottom: 15%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.responsive-container {
  position: absolute;
  background-color: white;
  border-radius: 10px; /* Increase border radius for a more rounded look */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.4); /* Adjust shadow properties */
  display: flex;
  align-items: center;
  justify-content: center;
  top: 50%; /* Adjust to move it more to the bottom */
  left: 50%; /* Adjust to move it more to the right */
  transform: translate(-50%, -50%);
  width: 60%; /* Adjust the width */
  height: 40%; /* Adjust the height */
}

.bigger-text {
  font-size: 2.5rem; /* Adjust the font size as needed */
}
</style>
