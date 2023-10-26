import { createRouter, createWebHistory } from 'vue-router';
import SignInView from '../views/SignInView.vue';
import RegisterView from '../views/RegisterView.vue';
import WelcomePage from "@/components/Welcome.vue";
import QuizView from '../views/QuizView.vue';
import HighScores from "../components/HighScores.vue";
import HighScoreView from "../views/HighScoreView.vue";
import { session } from '@/stores/session';


const requireAuth = (to, from, next) => {
  if (session.sessionToken) {
    // User is authenticated, allow access to the route
    next();
  } else {
    // User is not authenticated, redirect to the sign-in page
    next({ name: 'signin' });
  }
};

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/welcome',
      name: 'WelcomePage',
      component: WelcomePage,
      beforeEnter: requireAuth,
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
      path: '/quiz',
      name: 'quiz',
      component: QuizView,
      beforeEnter: requireAuth,
    },
    {
      path: '/highscores', // Add the HighScores route
      name: 'HighScores',
      component: HighScores,
      beforeEnter: requireAuth,
    },
    {
      path: '/highscoreview', // Add the HighScoreView route
      name: 'HighScoreView',
      component: HighScoreView,
      beforeEnter: requireAuth,
    },
  ]
});

export default router;
