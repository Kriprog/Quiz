<script setup>
import {ref} from 'vue';
import { toRef } from 'vue';
import { session, updateScore, increaseHighScore, resetScore } from '@/stores/session'; // Adjust the path to match the actual location of your session.js file
const questionDto = ref(null);
const selectedAnswer = ref(null);
const answerSubmitted = ref(false);
const isCorrectAnswer = ref(false);

const score = toRef(session, 'score');
const highscore = toRef(session, 'highscore');

const fetchRandomQuestion = async () => {
  try {
    const response = await fetch('/api/quiz'); // Replace with your API endpoint
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
  selectedAnswer.value = selectedOption;
  checkAnswer(selectedOption)
      .then((isCorrect) => {
        if (isCorrect) {
          updateScore(1); // Update the score using the session function
          increaseHighScore(1); // Update the highscore using the session function
        } else {
          resetScore(); // Reset the score using the session function
        }
        fetchRandomQuestion(); // Fetch the next question
      })
      .catch((error) => {
        console.error('Error:', error);
      });
};

import { onMounted } from 'vue';

onMounted(() => {
  // Automatically call fetchRandomQuestion when the page is loaded
  fetchRandomQuestion();
});

</script>


<style scoped>
</style>
<template>
  <div class="flex flex-col items-center justify-center">
    <div v-if="questionDto"
         class="w-full max-w-5xl p-4 bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg"
    >
      <p class="text-gray-800 font-bold text-2xl">{{ questionDto.questionText }}</p>
      <div class="mt-4">
        <div class="grid grid-cols-2 gap-4">
          <button
              v-for="option in questionDto.options"
              :key="option"
              @click="submitAnswer(option)"
              class="responsive-square-button text-white text-1xl font-medium py-2 px-4 rounded bg-violet-500 hover:bg-violet-600 focus:outline-none"
          >
            {{ option }}
          </button>
        </div>
      </div>
      <p v-if="answerSubmitted" class="text-lg pt-5">
        Your answer is: {{ selectedAnswer }}
        <span v-if="isCorrectAnswer" class="text-gray-800 font-bold"> (Correct)</span>
        <span v-else class="text-gray-800 font-bold"> (Incorrect)</span>
      </p>
    </div>
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
</style>
