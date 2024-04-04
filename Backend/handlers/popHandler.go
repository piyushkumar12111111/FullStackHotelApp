package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// GetPopularHotels handles the request for retrieving popular hotels
func GetPopularHotels(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    popularHotels := []models.PopHotels{
        {"Hotel California", "Los Angeles", 5.0},
        {"The Great Northern", "Twin Peaks", 15.0},
        {"The Overlook Hotel", "Colorado Rockies", 20.0},
    }
    json.NewEncoder(w).Encode(popularHotels)
}
