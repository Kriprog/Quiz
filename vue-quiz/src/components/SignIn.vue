<script setup>
//import WelcomeItem from './WelcomeItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
</script>

<template>
  <WelcomeItem>

    <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
      <div class="sm:mx-auto sm:w-full sm:max-w-sm">
        <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company">
        <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">Sign in to your account</h2>
      </div>

      <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
        <form class="space-y-6" action="#" method="POST">
          <div>
            <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
            <div class="mt-2">
              <input id="email" name="email" type="email" autocomplete="email" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            </div>
          </div>

          <div>
            <div class="flex items-center justify-between">
              <label for="password" class="block text-sm font-medium leading-6 text-gray-900">Password</label>
              <div class="text-sm">
                <a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500">Forgot password?</a>
              </div>
            </div>
            <div class="mt-2">
              <input id="password" name="password" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
            </div>
          </div>

          <div>
            <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign in</button>
          </div>
        </form>

        <p class="mt-10 text-center text-sm text-gray-500">
          Not a member?
          <a href="#" class="font-semibold leading-6 text-indigo-600 hover:text-indigo-500">Register here!</a>
        </p>
      </div>
    </div>
<!--    <template #icon>-->
<!--      <DocumentationIcon />-->
<!--    </template>-->
<!--    <template #heading>Documentation</template>-->

<!--    Vue’s-->
<!--    <a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>-->
<!--    provides you with all information you need to get started.-->
<!--  </WelcomeItem>-->

<!--  <WelcomeItem>-->
<!--    <template #icon>-->
<!--      <ToolingIcon />-->
<!--    </template>-->
<!--    <template #heading>Tooling</template>-->

<!--    This project is served and bundled with-->
<!--    <a href="https://vitejs.dev/guide/features.html" target="_blank" rel="noopener">Vite</a>. The-->
<!--    recommended IDE setup is-->
<!--    <a href="https://code.visualstudio.com/" target="_blank" rel="noopener">VSCode</a> +-->
<!--    <a href="https://github.com/johnsoncodehk/volar" target="_blank" rel="noopener">Volar</a>. If-->
<!--    you need to test your components and web pages, check out-->
<!--    <a href="https://www.cypress.io/" target="_blank" rel="noopener">Cypress</a> and-->
<!--    <a href="https://on.cypress.io/component" target="_blank" rel="noopener"-->
<!--      >Cypress Component Testing</a-->
<!--    >.-->

<!--    <br />-->

<!--    More instructions are available in <code>README.md</code>.-->
<!--  </WelcomeItem>-->

<!--  <WelcomeItem>-->
<!--    <template #icon>-->
<!--      <EcosystemIcon />-->
<!--    </template>-->
<!--    <template #heading>Ecosystem</template>-->

<!--    Get official tools and libraries for your project:-->
<!--    <a href="https://pinia.vuejs.org/" target="_blank" rel="noopener">Pinia</a>,-->
<!--    <a href="https://router.vuejs.org/" target="_blank" rel="noopener">Vue Router</a>,-->
<!--    <a href="https://test-utils.vuejs.org/" target="_blank" rel="noopener">Vue Test Utils</a>, and-->
<!--    <a href="https://github.com/vuejs/devtools" target="_blank" rel="noopener">Vue Dev Tools</a>. If-->
<!--    you need more resources, we suggest paying-->
<!--    <a href="https://github.com/vuejs/awesome-vue" target="_blank" rel="noopener">Awesome Vue</a>-->
<!--    a visit.-->
<!--  </WelcomeItem>-->

<!--  <WelcomeItem>-->
<!--    <template #icon>-->
<!--      <CommunityIcon />-->
<!--    </template>-->
<!--    <template #heading>Community</template>-->

<!--    Got stuck? Ask your question on-->
<!--    <a href="https://chat.vuejs.org" target="_blank" rel="noopener">Vue Land</a>, our official-->
<!--    Discord server, or-->
<!--    <a href="https://stackoverflow.com/questions/tagged/vue.js" target="_blank" rel="noopener"-->
<!--      >StackOverflow</a-->
<!--    >. You should also subscribe to-->
<!--    <a href="https://news.vuejs.org" target="_blank" rel="noopener">our mailing list</a> and follow-->
<!--    the official-->
<!--    <a href="https://twitter.com/vuejs" target="_blank" rel="noopener">@vuejs</a>-->
<!--    twitter account for latest news in the Vue world.-->
<!--  </WelcomeItem>-->

<!--  <WelcomeItem>-->
<!--    <template #icon>-->
<!--      <SupportIcon />-->
<!--    </template>-->
<!--    <template #heading>Support Vue</template>-->

<!--    As an independent project, Vue relies on community backing for its sustainability. You can help-->
<!--    us by-->
<!--    <a href="https://vuejs.org/sponsor/" target="_blank" rel="noopener">becoming a sponsor</a>.-->
</WelcomeItem>
</template>
