<script setup>
import { ref } from 'vue';

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

    questionDto.value.options.push(questionDto.value.correctAnswer);

    questionDto.value.options = shuffleArray(questionDto.value.options);
  } catch (error) {
    console.error(error);
  }
};

const checkAnswer = () => {
  answerSubmitted.value = true;
  isCorrectAnswer.value = selectedAnswer.value === questionDto.value.correctAnswer;
};

function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [array[i], array[j]] = [array[j], array[i]];
  }
  return array;
}
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