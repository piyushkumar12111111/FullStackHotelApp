package handlers

import (
	"encoding/json"
	"net/http"
	
	"github.com/piyushkumar/hotelsystem/email"
)

// ForgotPasswordRequest struct to read the email from the request
type ForgotPasswordRequest struct {
	Email string `json:"email"`
}

// ForgotPassword handler function
func ForgotPassword(w http.ResponseWriter, r *http.Request) {
	var req ForgotPasswordRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Here, you would typically generate a password reset token and store it with the user's record in your database.
	// For this example, we'll skip those steps and simulate sending an email.

	if email.SendResetPasswordEmail(req.Email) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("Password reset email sent."))
	} else {
		http.Error(w, "Failed to send password reset email", http.StatusInternalServerError)
	}
}
