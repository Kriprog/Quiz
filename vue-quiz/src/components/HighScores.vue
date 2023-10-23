<template>
  <div>
    <h2 class="text-2xl font-bold mb-4">Top Ten High Scores</h2>
    <table class="table-auto">
      <thead>
      <tr>
        <th class="px-4 py-2">Name</th>
        <th class="px-4 py-2">High Score</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="score in highScores" :key="score.id">
        <td class="border px-4 py-2">{{ score.name }}</td>
        <td class="border px-4 py-2">{{ score.highscore }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>


<script setup>
import { ref, onMounted } from 'vue';

const highScores = ref([]);

onMounted(async () => {
  try {
    const response = await fetch('/api/highscores'); // Use the correct API endpoint
    const data = await response.json();
    highScores.value = data;
  } catch (error) {
    console.error('Error fetching high scores:', error);
  }
});
</script>

