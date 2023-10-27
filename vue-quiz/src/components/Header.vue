<template>
  <div class="flex flex-col items-center justify-center">
    <p class="bg-opacity-0 text-xs tracking-tight text-gray-400">If you are enjoying this game please consider donating money to us!</p>
    <header class="w-full max-w-5xl shadow-lg mb-1.5 mt-0.5">
      <div class="mx-auto max-w-5xl">
        <Disclosure as="nav" class="bg-white" v-slot="{ open }">
          <div class="mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex h-16 items-center justify-between">
              <div class="flex items-center">
                <div class="flex-shrink-0">
                  <a><CodeBracketIcon class="h-6 w-6" aria-hidden="true" /></a>
                </div>
                <div class="hidden md:block">
                  <div class="ml-10 flex items-baseline space-x-4">
                    <a
                        v-for="item in navigation"
                        :key="item.name"
                        :href="item.href"
                        :class="[item.button ? 'text-gray-800 hover:bg-white hover:text-gray-950 font-semibold' : 'text-gray-800 hover:bg-transparent hover:text-gray-800', 'rounded-md px-3 py-2 text-sm font-medium']"
                        :aria-current="item.current ? 'page' : undefined"
                    >
                      {{ item.name }}
                    </a>
                  </div>
                </div>
              </div>
              <div class="hidden md:block">
                <div class="ml-4 flex items-center md:ml-6">
                  <button @click="logout" type="button" title="Logout" class="relative rounded-full bg-gray-50 p-1 text-gray-600 hover:text-gray-950 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                    <PowerIcon class="h-6 w-6" aria-hidden="true" />
                  </button>
                </div>
              </div>
              <div class="-mr-2 flex md:hidden">
              </div>
            </div>
          </div>
        </Disclosure>
      </div>
    </header>
  </div>
</template>

<script setup>
import { clearSession, session } from '@/stores/session'
import { Disclosure } from '@headlessui/vue'
import { CodeBracketIcon, CreditCardIcon, PowerIcon } from '@heroicons/vue/24/outline'
import { useRouter } from "vue-router"

const user = {
  name: session.name,
  email: session.email,
  highscore: session.highscore,
  score: session.score
}

const router = useRouter()

const logout = () => {
  // Clear the user session using the clearSession method
  clearSession()

  // Redirect to the login or home page, as per your app's design
  router.push('/'); // Replace '/login' with the path to your login page
}

import { computed } from 'vue'

const navigation = computed(() => {
  return [
    { name: 'Hello, ' + user.name + '!', button: false },
    { name: 'Start quiz', href: '/quiz', button: true },
    { name: 'Current score: ' + session.score, button: false },
    { name: 'Current highscore: ' + session.highscore, button: false },
    { name: 'Top 10 players', href: '/highscoreview', button: true }
  ]
})
</script>
