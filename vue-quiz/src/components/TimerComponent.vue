<template>
  <div class="timer">
    {{ timeLeft }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      timeLeft: 30, // Initialize the timer with 30 seconds
    };
  },
  methods: {
    startTimer() {
      const countdown = setInterval(() => {
        if (this.timeLeft > 0) {
          this.timeLeft -= 1;
        } else {
          clearInterval(countdown); // Stop the timer when timeLeft reaches 0
          this.$emit('timerExpired'); // Emit an event when the timer expires
        }
      }, 1000); // Update the timer every 1 second
    },
  },
  mounted() {
    this.startTimer(); // Start the timer when the component is mounted
  },
  beforeDestroy() {
    // Clean up the timer when the component is destroyed
  },
};
</script>

<style scoped>
.timer {
  font-size: 36px; /* Adjust the font size to your preference */
  font-weight: bold; /* Optional: Make the numbers stand out */
}
</style>
