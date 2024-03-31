package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
	"github.com/piyushkumar/hotelsystem/services"
)

// SignUp handles the user sign-up process
func SignUp(w http.ResponseWriter, r *http.Request) {
	var user models.User
	if err := json.NewDecoder(r.Body).Decode(&user); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Generate OTP
	otp := services.GenerateOTP()

	// Log the OTP instead of sending it, for demonstration purposes
	log.Printf("Generated OTP '%s' for email '%s'\n", otp, user.Email)

	// Respond with the OTP for demonstration purposes
	response := map[string]string{
		"message": "OTP generated successfully",
		"otp":     otp,
	}

	w.WriteHeader(http.StatusOK)
	if err := json.NewEncoder(w).Encode(response); err != nil {
		http.Error(w, "Failed to encode response", http.StatusInternalServerError)
	}
}


//! otp checking handler

// CheckOTP handles the OTP verification process
func CheckOTP(w http.ResponseWriter, r *http.Request) {

	var otpRequest models.OTPRequest
	if err := json.NewDecoder(r.Body).Decode(&otpRequest); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Check if the OTP is valid
	if otpRequest.OTP == otpRequest.UserOTP {
		response := map[string]string{
			"message": "OTP verified successfully",
		}
		w.WriteHeader(http.StatusOK)
		if err := json.NewEncoder(w).Encode(response); err != nil {
			http.Error(w, "Failed to encode response", http.StatusInternalServerError)
		}
	} else {
		http.Error(w, "Invalid OTP", http.StatusUnauthorized)
	}
}