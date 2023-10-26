<template xmlns:href="http://www.w3.org/1999/xhtml">
  <div class="min-h-full">
    <Disclosure as="nav" class="bg-gray-100" v-slot="{ open }">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <a><CodeBracketIcon class="h-6 w-6" aria-hidden="true"  /></a>
            </div>
            <div class="hidden md:block">
              <div class="ml-10 flex items-baseline space-x-4">
                <a v-for="item in navigation"
                   :key="item.name"
                   :href="item.href"
                   :class="[item.button ? 'text-gray-800 hover:bg-white hover:text-gray-950 font-semibold': 'text-gray-800 hover:bg-transparent hover:text-gray-800', 'rounded-md px-3 py-2 text-sm font-medium']" :aria-current="item.current ? 'page' : undefined">{{ item.name }}</a>
              </div>
            </div>
          </div>
          <div class="hidden md:block">
            <div class="ml-4 flex items-center md:ml-6">
              <button @click="logout" type="button"  title="Logout" class="relative rounded-full bg-gray-50 p-1 text-gray-600 hover:text-gray-950 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                <PowerIcon class="h-6 w-6" aria-hidden="true" />
              </button>
            </div>
          </div>
          <div class="-mr-2 flex md:hidden">
          </div>
        </div>
      </div>
    </Disclosure>

    <header class="bg-white shadow">
      <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
        <p class="text-1xl tracking-tight text-gray-400">If you are enjoying this game please consider donating money to us:  <a href=""><CreditCardIcon class="h-6 w-6" aria-hidden="true" /></a>
        </p>

      </div>
    </header>
    <main>
      <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
      </div>
    </main>
  </div>
</template>

<script setup>
import {clearSession, session} from '@/stores/session'

import { Disclosure } from '@headlessui/vue'
import { CodeBracketIcon, CreditCardIcon, PowerIcon } from '@heroicons/vue/24/outline'
import {useRouter} from "vue-router";

const user = {
  name: session.name,
  email: session.email,
  highscore: session.highscore
  }
const navigation = [
  { name: 'Hello, ' + user.name + '!', button: false },
  { name: 'Start cleaning', href: '/quiz', button: true },
  { name: 'Current score: 1', button: false },
  { name: 'Current highscore: ' + user.highscore, button: false },
  { name: 'Top 10 players', href: '/highscoreview', button: true },
]

const router = useRouter();

const logout = () => {
  // Clear the user session using the clearSession method
  clearSession();

  // Redirect to the login or home page, as per your app's design
  router.push('/'); // Replace '/login' with the path to your login page
};

</script>