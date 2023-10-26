<template>
  <div>
    <h2 class="text-2xl font-bold mb-4">Top 10 Players</h2>
    <div class="overflow-x-auto">
      <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
        <thead class="bg-gray-100 text-gray-800">
        <tr>
          <th class="px-4 py-2 text-left">Name</th>
          <th class="px-4 py-2 text-left">High Score</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="score in highScores" :key="score.id" class="bg-white">
          <td class="px-4 py-2 border border-gray-200">{{ score.name }}</td>
          <td class="px-4 py-2 border border-gray-200">{{ score.highscore }}</td>
        </tr>
        </tbody>
      </table>
    </div>
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
