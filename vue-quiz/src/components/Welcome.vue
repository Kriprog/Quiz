<script setup>

import Header from "@/components/Header.vue";
</script>

<template>
  <Header />
  <div class="page">
    <div class="container">
      <h1 class="header" >Welcome to the Clean Code Quiz!</h1>
      <p class="text">Dive in, challenge yourself, and let's see how well you grasp the art of writing clean and beautiful code!</p>
      <br>
      <router-link to="/quiz">
        <button
            type="button"
            class="btn">
          Start Quiz
        </button>
      </router-link>
    </div>

  </div>
</template>

<style scoped>
.page {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.container {
  padding-top: 100px;
  overflow: hidden; /* Add overflow to the container */
  text-align: center;
  color: rgb(73, 77, 151);
}

.header {
  margin-bottom: 20px;
  font-size: xx-large;
  font-weight: bold;
}

.text {
  font-size: x-large;
}

.btn {
  background-color: rgba(73, 77, 151, 0.65);
  color: white;
  font-weight: bold;
  font-size: larger;
  padding: 10px 20px;
  border: none;
  border-radius: 25px;
  cursor: pointer;
}
</style>