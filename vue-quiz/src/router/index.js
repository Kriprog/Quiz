import { createRouter, createWebHistory } from 'vue-router'
import SignInViewView from '../views/SignInView.vue'
import RegisterView from '../views/RegisterView.vue'
import QuestionsPage from '../components/QuestionsPage.vue';
import StartQuestionsPage from "@/components/StartQuestionsPage.vue";
import QuizView from '../views/QuizView.vue';


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/start-questions',
      name: 'StartQuestionsPage',
      component: StartQuestionsPage,
    },
    {
      path: '/questions',  // Define a custom route path
      name: 'QuestionsPage',
      component: QuestionsPage,
    },
    {
      path: '/',
      name: 'signin',
      component: SignInViewView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView
    },
    {
      path: '/about',
      name: 'about',
      // route level code-splitting
      // this generates a separate chunk (About.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/quiz',
      name: 'quiz',
      component: QuizView
    },
  ]
})

export default router
