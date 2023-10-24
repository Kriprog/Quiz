import { reactive } from 'vue';

export const session = reactive({
    sessionToken: window.sessionStorage.getItem('session'), // Retrieve session token from sessionStorage
    name: window.sessionStorage.getItem('name') || null, // Retrieve user's name from sessionStorage
    highscore: window.sessionStorage.getItem('highscore') || 0, // Retrieve highscore from sessionStorage
});

// Function to set the session data
export function setSession(sessionToken, name, highscore) {
    session.sessionToken = sessionToken;
    session.name = name;
    session.highscore = highscore;
    window.sessionStorage.setItem('session', sessionToken);
    window.sessionStorage.setItem('name', name);
    window.sessionStorage.setItem('highscore', highscore);

}

// Function to clear the session data (e.g., on logout)
export function clearSession() {
    session.sessionToken = null;
    session.name = null;
    session.highscore = 0;
    window.sessionStorage.removeItem('session');
    window.sessionStorage.removeItem('name');
    window.sessionStorage.removeItem('highscore');
}
