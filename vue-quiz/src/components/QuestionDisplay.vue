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

</script>

<style scoped>
</style>

<template>
  <div>
    <button @click="fetchRandomQuestion">Get Random Question</button>
    <div v-if="questionDto">
      <p>Question: {{ questionDto.questionText }}</p>
      <div>
        <p>Options:</p>
        <div v-for="option in questionDto.options" :key="option">
          <button @click="submitAnswer(option)">{{ option }}</button>
        </div>
      </div>
      <p v-if="answerSubmitted">
        Your answer is: {{ selectedAnswer }}
        <span v-if="isCorrectAnswer" class="text-green-600 font-semibold"> (Correct)</span>
        <span v-else class="text-red-600 font-semibold"> (Incorrect)</span>
      </p>
      <p>Score: {{ score }}</p>
      <p>High Score: {{ highscore }}</p>
    </div>
  </div>
</template>

<style scoped>

</style>