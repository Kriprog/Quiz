<script setup>

import { ref, onMounted } from 'vue';

const randomQuestion = ref({
  question_text: '',
  options: [],  // Initialize options as an empty array
  correct_answer: '',
});

const error = ref(null);
const selectedOption = ref(null);
const answerStatus = ref(null);
const answered = ref(false);

const checkAnswer = () => {
  const selectedOptionValue = selectedOption.value;
  const correctAnswerValue = randomQuestion.value.correct_answer;

  if (selectedOptionValue === correctAnswerValue) {
    answerStatus.value = 'correct';
  } else {
    answerStatus.value = 'incorrect';
  }
  answered.value = true;
};

onMounted(() => {
  fetch('/api/quiz')
      .then(response => {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(data => {
        randomQuestion.value.question_text = data.question_text;
        randomQuestion.value.options = [
          data.option1,
          data.option2,
          data.option3,
          data.correct_answer,
        ];
        randomQuestion.value.correct_answer = data.correct_answer
      })
      .catch(err => {
        error.value = err;
      });
});
</script>

<template>
  <div>
    <h2>Random Question</h2>
    <p v-if="error">Error: {{ error.message }}</p>
    <p v-else-if="randomQuestion">{{ randomQuestion.question_text }}</p>
    <ul v-if="randomQuestion">
      <li v-for="option in randomQuestion.options">
        <label>
          <input
              type="radio"
              :value="option"
              v-model="selectedOption"
          />
          {{ option }}
        </label>
      </li>
    </ul>
    <button @click="checkAnswer">Submit</button>
    <p v-if="answerStatus === 'correct'">You selected the correct answer!</p>
    <p v-if="answerStatus === 'incorrect'">You selected the incorrect answer.</p>
  </div>
</template>

<style scoped>

</style>