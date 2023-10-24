<template>
  <div class="min-h-full">
    <Disclosure as="nav" class="bg-gray-800" v-slot="{ open }">
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <UserIcon class="h-6 w-6" aria-hidden="true" />
            </div>
            <div class="hidden md:block">
              <div class="ml-10 flex items-baseline space-x-4">
                <a v-for="item in navigation" :key="item.name" :href="item.href" :class="[item.current ? 'bg-gray-900 text-white' : 'text-gray-300 hover:bg-gray-700 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium']" :aria-current="item.current ? 'page' : undefined">{{ item.name }}</a>
              </div>
            </div>
          </div>
          <div class="hidden md:block">
            <div class="ml-4 flex items-center md:ml-6">
              <button @click="logout" type="button" class="relative rounded-full bg-gray-800 p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
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
        <h1 class="text-3xl font-bold tracking-tight text-gray-900">Dashboard</h1>
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
import { Bars3Icon, UserIcon, XMarkIcon, PowerIcon } from '@heroicons/vue/24/outline'
import {useRouter} from "vue-router";

const user = {
  name: session.name,
  email: session.email,
  highscore: session.highscore
  }
const navigation = [
  { name: 'Hello, ' + user.name, href: '#', current: true },
  { name: 'Current highscore: ' + user.highscore, href: '#', current: false },
  { name: 'Current score: 1', href: '#', current: false },
  { name: 'Highscoretable', href: '/highscores', current: false },
]

const router = useRouter();

const logout = () => {
  // Clear the user session using the clearSession method
  clearSession();

  // Redirect to the login or home page, as per your app's design
  router.push('/'); // Replace '/login' with the path to your login page
};

</script>