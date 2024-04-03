package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// AddHotel adds a new hotel to the list.
func AddHotel(w http.ResponseWriter, r *http.Request) {
	var hotel models.Hotel
	if err := json.NewDecoder(r.Body).Decode(&hotel); err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}

	hotels = append(hotels, hotel) // Add the hotel to the in-memory store

	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(hotel)
}
