package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// GetPlaces displays all the places
func GetPlaces(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    places := []models.Place{
        {"Paris", 3000.0, 4.5, 200.0},
        {"Bali", 12000.0, 4.8, 150.0},
        {"Tokyo", 8000.0, 4.6, 300.0},
    }
    json.NewEncoder(w).Encode(places)
}
