<template>
  <div class="menu-container w-full max-w-5xl p-4 bg-white bg-opacity-70 rounded-br-2xl rounded-bl-2xl shadow-lg">
    <p class="text-gray-800 font-bold text-2xl">Game over!</p>
    <p>Final Score: {{ highestSessionScore }}</p>
    <p>High Score: {{ session.highscore }}</p>
    <button @click="restartGame">Try again!</button>
  </div>
</template>

<script>
import {session} from "@/stores/session";

export default {
  computed: {
    session() {
      return session
    }
  },
  props: {
    highestSessionScore: Number,
    showMenu: Boolean,
    latestScore: Number,
    highScore: Number,
  },
  methods: {
    restartGame() {
      window.location.reload();
    }
  }
};
</script>

<style scoped>
.menu-container {
  text-align: center;
  padding: 100px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}
button {
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #0056b3;
}
</style>