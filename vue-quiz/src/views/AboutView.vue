<script setup>

import {ref} from "vue";

let message = ref("Hello!")
let emailField = ref()

async function fetchData() {
  const response = await fetch('/api/quiz')
  const data = await response.json()
  message.value = data.message

}
async function send() {
  const data = {
    email: emailField.value
  }
  const response = await fetch("/api/quiz", {
    method: "POST",
    headers: {"Content-Type": "application/json"},
    body: JSON.stringify(data)

  });

}
fetchData()

</script>

<template>
  <div class="about">
    <h1>{{ message }}</h1>
    <h1>Test</h1>
    <div>
      <label for="email" class="block text-sm font-medium leading-6 text-white-900">Email</label>
      <div class="mt-2">
        <input v-model="emailField" type="email" name="email" id="email" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6" placeholder="you@example.com" />
        <button @click="send">Send!</button>
      </div>
    </div>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
