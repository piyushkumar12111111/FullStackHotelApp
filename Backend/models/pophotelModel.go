package models

// Hotel represents the hotel model.
type PopHotel struct {
	Name     string `json:"name"`
	Location string `json:"location"`
	Distance int    `json:"distance"`
	Price    int    `json:"price"`
	Rating   int    `json:"rating"`
}
