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
  <div class="max-w-lg mx-auto p-4 bg-white shadow-md rounded-lg">
    <button @click="fetchRandomQuestion" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded mb-4">
      Get Random Question
    </button>
    <div v-if="questionDto" class="p-4 bg-gray-100 rounded-lg">
      <p class="text-xl font-semibold mb-4">Question: {{ questionDto.questionText }}</p>
      <form @submit.prevent="checkAnswer">
        <p class="mb-2">Options:</p>
        <div class="grid grid-cols-2 gap-4 mb-4">
          <button type="button" v-for="option in questionDto.options" :key="option" @click="selectedAnswer = option"
                  :class="{
              'bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded': selectedAnswer !== option,
              'bg-green-500 hover:bg-green-600 text-white font-semibold py-2 px-4 rounded': selectedAnswer === option && isCorrectAnswer,
              'bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded': selectedAnswer === option && !isCorrectAnswer
            }"
          >
            {{ option }}
          </button>
        </div>
        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded">
          Submit Answer
        </button>
      </form>
      <p v-if="answerSubmitted" class="mt-4">
        Your answer is: {{ selectedAnswer }}
        <span v-if="isCorrectAnswer" class="text-green-600 font-semibold"> (Correct)</span>
        <span v-else class="text-red-600 font-semibold"> (Incorrect)</span>
      </p>
    </div>
  </div>
</template>



<style scoped>

</style>