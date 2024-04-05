package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// GetBookings returns the list of bookings
func GetBookings(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(models.Bookings)
}



func CreateBooking(w http.ResponseWriter, r *http.Request) {
    var newBooking models.Booking
    err := json.NewDecoder(r.Body).Decode(&newBooking)
    if err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }

    models.Bookings = append(models.Bookings, newBooking) 
    w.WriteHeader(http.StatusCreated)
    json.NewEncoder(w).Encode(newBooking)
}