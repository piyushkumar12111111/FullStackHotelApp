package handlers

import (
	"net/http"
	"github.com/gorilla/mux"
)

// DeleteHotel removes a hotel from the list based on its ID.
func DeleteHotel(w http.ResponseWriter, r *http.Request) {
	id := mux.Vars(r)["id"]

	for index, hotel := range hotels {
		if hotel.ID == id {
			// Remove the hotel from the slice
			hotels = append(hotels[:index], hotels[index+1:]...)
			w.WriteHeader(http.StatusNoContent)
			return
		}
	}

	http.Error(w, "Hotel not found", http.StatusNotFound)
}
