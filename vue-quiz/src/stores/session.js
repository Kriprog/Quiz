import { reactive } from 'vue';

export const session = reactive({
    sessionToken: window.sessionStorage.getItem('session'), // Retrieve session token from sessionStorage
    name: window.sessionStorage.getItem('name') || null, // Retrieve user's name from sessionStorage
    highscore: window.sessionStorage.getItem('highscore') || 0, // Retrieve highscore from sessionStorage
});

export function setSession(sessionToken, name, highscore) {
    session.sessionToken = sessionToken;
    session.name = name;
    session.highscore = highscore;
    window.sessionStorage.setItem('session', sessionToken);
    window.sessionStorage.setItem('name', name);
    window.sessionStorage.setItem('highscore', highscore);

}

export async function clearSession() {
    try {
        // Send a request to your back-end to invalidate the session
        const response = await fetch('/api/logout', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json', // Set the content type to JSON if you're sending JSON data
                'X-Session-Token': session.sessionToken // Include the session token in the header
            },
            // Optionally, if you need to send data in the request body:
            body: JSON.stringify({
                // Add any data you need to send in the body here
            })
        });

        if (response.ok) {
            // Clear session data on the front-end
            session.sessionToken = null;
            session.name = null;
            session.highscore = 0;
            window.sessionStorage.removeItem('session');
            window.sessionStorage.removeItem('name');
            window.sessionStorage.removeItem('highscore');
        }
    } catch (error) {
        console.error('An error occurred:', error);
    }
}



