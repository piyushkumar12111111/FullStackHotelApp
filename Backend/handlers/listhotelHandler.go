package handlers

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/piyushkumar/hotelsystem/models"
)

// In-memory store for demonstration
var hotels = []models.Hotel{
	{ID: "1", Name: "Hotel Sunshine", Location: "California", Rating: 5},
	{ID: "2", Name: "Grand Plaza", Location: "New York", Rating: 4},
	{ID: "3", Name: "Hyat Plaza", Location: "Australia", Rating: 3},
	{ID: "4", Name: "Grinding Plaza", Location: "Hamburg", Rating: 2},
}


var recommendHotels = []models.ReccHotel{
	
	{ID: "1", Name: "Hotel Ramuplaz", Location: "California", Distance: 5, Rating: 5},
	{ID: "2", Name: "Plaza", Location: "New York", Distance: 4, Rating: 4},
	{ID: "3", Name: "Huluk Plaza", Location: "Australia", Distance: 3, Rating: 3},
	{ID: "4", Name: "Indus Plaza", Location: "Hamburg", Distance: 2, Rating: 2},


}

var popullarHotels = []models.PopHotel{
	
	{Name: "Hotel Oceana", Location: "California", Distance: 5, Price: 5000, Rating: 5},
	{Name: "Placo", Location: "New York", Distance: 4, Price: 4000, Rating: 4},
	{Name: "Pizza Put Plaza", Location: "Australia", Distance: 3, Price: 3000, Rating: 3},
	{Name: "PakLand Plaza", Location: "Hamburg", Distance: 2, Price: 2000, Rating: 2},


}

// ListHotels sends a list of hotels as a JSON response.
func WishListHotels(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(hotels)
}

func RecommendHotels(w http.ResponseWriter, r *http.Request) {
    log.Println("RecommendHotels handler called")
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(recommendHotels)
}

func PopHotels(w http.ResponseWriter, r *http.Request) {
    log.Println("PopHotels handler called")
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(popullarHotels)
}
