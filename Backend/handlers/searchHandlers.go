package handlers

// import (
// 	"encoding/json"
// 	"net/http"

// 	"github.com/gorilla/mux"
// 	"github.com/piyushkumar/hotelsystem/models"
	
// )

// func findHotelHandler(w http.ResponseWriter, r *http.Request) {
     
	

// 	vars := mux.Vars(r)

// 	city := vars["city"]
// 	bedroom := vars["bedroom"]
// 	bathroom := vars["bathroom"]
// 	services := vars["services"]
// 	payment := vars["payment"]

// 	for _, hotel := range models.SearchHotel {
// 		if hotel. == city && hotel.Bedrooms == bedroom && hotel.Bathrooms == bathroom && hotel.Service == services && hotel.Payment == payment {
// 			json.NewEncoder(w).Encode(hotel)
// 			return
// 		}
// 	}
// }

// SearchHotels handler function
