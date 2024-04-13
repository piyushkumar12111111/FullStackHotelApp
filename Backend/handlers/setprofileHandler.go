package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// SetProfile updates the user's profile.
func SetProfile(w http.ResponseWriter, r *http.Request) {
	var profile models.Profile
	if err := json.NewDecoder(r.Body).Decode(&profile); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	// Update the global userProfile variable with the new data
	userProfile = profile

	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(profile)
}
