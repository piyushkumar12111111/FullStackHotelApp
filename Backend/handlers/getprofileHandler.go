package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// For simplicity, we're using a package-level variable. In a real application, this could be a database.
var userProfile = models.Profile{}

// GetProfile sends the user's profile as a JSON response.
func GetProfile(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(userProfile)
}
