<template>
  <div class="menu-container">
    <h2>Game Menu</h2>
    <p>Latest Score: {{ session.score }}</p>
    <p>High Score: {{ session.highscore }}</p>
    <button @click="retryGame">Retry</button>
  </div>
</template>

<script>
import {session} from "../stores/session";

export default {
  computed: {
    session() {
      return session
    }
  },
  props: {
    showMenu: Boolean,
    latestScore: Number,
    highScore: Number,
  },
  methods: {
    retryGame() {
      this.$emit("retryGame"); // Emit an event to retry the game
    },
  },
};
</script>

<style scoped>
.menu-container {
  text-align: center;
  background-color: #f0f0f0;
  padding: 20px;
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