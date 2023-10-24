import { createRouter, createWebHistory } from 'vue-router';
import SignInView from '../views/SignInView.vue';
import RegisterView from '../views/RegisterView.vue';
import QuestionsPage from '../components/QuestionsPage.vue';
import StartQuestionsPage from "@/components/StartQuestionsPage.vue";
import QuizView from '../views/QuizView.vue';
import HighScores from "../components/HighScores.vue"; // Import the HighScores component
import HighScoreView from "../views/HighScoreView.vue"; // Import the HighScoreView component

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/start-questions',
      name: 'StartQuestionsPage',
      component: StartQuestionsPage,
    },
    {
      path: '/questions',
      name: 'QuestionsPage',
      component: QuestionsPage,
    },
    {
      path: '/',
      name: 'signin',
      component: SignInView
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/quiz',
      name: 'quiz',
      component: QuizView
    },
    {
      path: '/highscores', // Add the HighScores route
      name: 'HighScores',
      component: HighScores,
    },
    {
      path: '/highscoreview', // Add the HighScoreView route
      name: 'HighScoreView',
      component: HighScoreView,
    },
  ]
});

export default router;
