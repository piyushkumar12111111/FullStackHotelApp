package handlers

import (
	"encoding/json"
	"net/http"
)

// UserCredentials for demonstration. In a real application, use a database.
type UserCredentials struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

// SignIn handler function
func SignIn(w http.ResponseWriter, r *http.Request) {
	var creds UserCredentials
	// Decode the request body into creds
	if err := json.NewDecoder(r.Body).Decode(&creds); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// In a real application, you would validate the credentials against a database.
	// Here, we're using a hardcoded check for demonstration purposes.
	if creds.Email == "user@example.com" && creds.Password == "password123" {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Sign-in successful"))
	} else {
		http.Error(w, "Invalid credentials", http.StatusUnauthorized)
	}
}
