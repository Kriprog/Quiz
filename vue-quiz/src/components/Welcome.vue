<script setup>

import Header from "@/components/Header.vue";
</script>

<template>
  <Header />
  <div class="page">
    <div class="container">
      <h1 class="header">You're now signed in!</h1>
      <router-link to="/quiz">
        <button
            type="button"
            class="btn">
          Questions
        </button>
      </router-link>
    </div>

  </div>
</template>

<style scoped>
.page {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.container {
  overflow: hidden; /* Add overflow to the container */
  text-align: center;
}

.header {
  margin-bottom: 20px;
}

.btn {
  background-color: blue;
  color: white;
  font-weight: bold;
  padding: 10px 20px;
  border: none;
  border-radius: 25px;
  cursor: pointer;
}
</style>