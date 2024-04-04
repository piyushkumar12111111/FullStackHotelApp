package handlers

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/piyushkumar/hotelsystem/models"
)

func GetHotelsByCity(w http.ResponseWriter, r *http.Request) {
    vars := mux.Vars(r)
    city := vars["city"]
    
    hotels, ok := models.Cities[city]
    if !ok {
        http.Error(w, "City not found", http.StatusNotFound)
        return
    }

    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(hotels)
}
