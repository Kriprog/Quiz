import { reactive } from 'vue';

export const session = reactive({
    sessionToken: window.sessionStorage.getItem('session'), // Retrieve session token from sessionStorage
    name: window.sessionStorage.getItem('name') || null, // Retrieve user's name from sessionStorage
    highscore: window.sessionStorage.getItem('highscore') || 0, // Retrieve highscore from sessionStorage
    highscore_date: null, // Add the highscore_date field
    score: 0,
    userId: window.sessionStorage.getItem('userId'),

});

export function setSession(sessionToken, name, highscore, userId) {
    session.sessionToken = sessionToken;
    session.name = name;
    session.highscore = highscore;
    session.userId = userId;
    window.sessionStorage.setItem('session', sessionToken);
    window.sessionStorage.setItem('name', name);
    window.sessionStorage.setItem('highscore', highscore);
    window.sessionStorage.setItem('userId', userId);
    console.log("userId set in session.userId:", session.userId);
    console.log("userId set in window.sessionStorage:", window.sessionStorage.getItem('userId'));
    console.log("highscore set in window.sessionStorage:", window.sessionStorage.getItem('highscore'));
    console.log("name set in window.sessionStorage:", window.sessionStorage.getItem('name'));

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
            session.userId = null;
            window.sessionStorage.removeItem('session');
            window.sessionStorage.removeItem('name');
            window.sessionStorage.removeItem('highscore');
            window.sessionStorage.setItem('userId');
        }
    } catch (error) {
        console.error('An error occurred:', error);
    }
}
export function increaseHighScore(points) {
    // Check if the current score is higher than the high score
    if (session.score > session.highscore) {
        // Update the high score locally
        session.highscore = session.score;
        session.highscore_date = new Date(); // Capture the current date and time
        window.sessionStorage.setItem('highscore', session.highscore);
        window.sessionStorage.setItem('highscore_date', session.highscore_date); // Store it in sessionStorage

        // Send the new high score to the database (replace with your API endpoint)
        sendHighScoreToDatabase(session.highscore, session.highscore_date, session.userId)
            .then(() => {
                console.log('High score updated in the database.');
            })
            .catch((error) => {
                console.error('Failed to update high score in the database:', error);
            });
    }
}

export function updateScore(points) {
    session.score += points;
}

export function resetScore() {
    session.score = 0;
}

function sendHighScoreToDatabase(highscore, highscore_date, userId ) {
    console.log("Updating high score for user with ID: " + userId);
    // Implement the logic to send the high score to the database
    // Use a PATCH request to update the high score for the specified user
    const endpoint = `/api/users/highscore/${userId}`; // Replace with your actual API endpoint

    return fetch(endpoint, {
        method: 'PATCH',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ highscore, highscore_date }),

    }).then((response) => {
        if (!response.ok) {
            console.error('Failed to update high score in the database');
            throw new Error('Failed to update high score in the database');
        }
        console.log("High score updated successfully.");
    });
}


