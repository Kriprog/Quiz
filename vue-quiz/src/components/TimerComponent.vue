<template>
  <div class="timerComponent">
    {{ timeLeft }}
  </div>
</template>

<script>
export default {
  data() {
    return {
      timeLeft: 30, // Initialize the timer with 30 seconds
      countdown: null, // Declare countdown as an instance variable
    };
  },
  methods: {
    startTimer() {
      if (this.countdown === null) { // Check if the timer is not already running
        this.countdown = setInterval(() => {
          if (this.timeLeft > 0) {
            this.timeLeft -= 1;
          } else {
            clearInterval(this.countdown); // Stop the timer when timeLeft reaches 0
            this.$emit('timerExpired'); // Emit an event when the timer expires
          }
        }, 1000); // Update the timer every 1 second
      }
    },
    stopTimer() {
      clearInterval(this.countdown); // Stop the timer using the instance variable
      this.countdown = null; // Reset the countdown variable
    },
    resetTimer() {
      this.timeLeft = 30; // Reset the timer to 30 seconds
    },
  },
  mounted() {
    this.startTimer(); // Start the timer when the component is mounted
  },
  beforeDestroy() {
    clearInterval(this.countdown); // Clean up the timer when the component is destroyed
  },
};
</script>


<style scoped>
.timerComponent {
  font-size: 36px; /* Adjust the font size to your preference */
  font-weight: bold; /* Optional: Make the numbers stand out */
}
</style>
