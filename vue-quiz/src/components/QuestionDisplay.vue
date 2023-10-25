<script setup>
import {ref} from 'vue';

const questionDto = ref(null);
const selectedAnswer = ref(null);
const answerSubmitted = ref(false);
const isCorrectAnswer = ref(false);

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
    isCorrectAnswer.value = result.isCorrect;
  } catch (error) {
    console.error(error);
  }
};

</script>

<style scoped>
</style>

<template>
  <div>
    <button @click="fetchRandomQuestion">Get Random Question</button>
    <div v-if="questionDto">
      <p>Question: {{ questionDto.questionText }}</p>
      <form @submit.prevent="checkAnswer">
        <p>Options:</p>
        <div v-for="option in questionDto.options" :key="option">
          <label>
            <input type="radio" v-model="selectedAnswer" :value="option" />
            {{ option }}
          </label>
        </div>
        <button type="submit">Submit Answer</button>
      </form>
      <p v-if="answerSubmitted">
        Your answer is: {{ selectedAnswer }}
        <span v-if="isCorrectAnswer"> (Correct)</span>
        <span v-else> (Incorrect)</span>
      </p>
    </div>
  </div>
</template>

<style scoped>

</style>