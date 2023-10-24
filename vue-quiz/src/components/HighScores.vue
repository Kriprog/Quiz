<template>
  <div>
    <h2 class="text-2xl font-bold mb-4">Top Ten High Scores</h2>
    <div class="overflow-x-auto">
      <table class="min-w-min border border-gray-200">
        <thead>
        <tr>
          <th class="px-4 py-2 border-r border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
            Name
          </th>
          <th class="px-4 py-2 border-b border-gray-200 bg-gray-50 text-left text-xs leading-4 font-medium text-gray-500 uppercase tracking-wider">
            High Score
          </th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="score in highScores" :key="score.id">
          <td class="px-4 py-2 border-r border-b border-gray-200">
            {{ score.name }}
          </td>
          <td class="px-4 py-2 border-b border-gray-200">
            {{ score.highscore }}
          </td>
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
