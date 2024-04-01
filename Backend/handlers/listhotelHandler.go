package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// In-memory store for demonstration
var hotels = []models.Hotel{
	{ID: "1", Name: "Hotel Sunshine", Location: "California", Rating: 5},
	{ID: "2", Name: "Grand Plaza", Location: "New York", Rating: 4},
}

// ListHotels sends a list of hotels as a JSON response.
func ListHotels(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(hotels)
}
