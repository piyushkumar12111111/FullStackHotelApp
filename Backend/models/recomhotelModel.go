package models

// Hotel represents the hotel model.
type ReccHotel struct {
	ID    string `json:"id"`
	Name  string `json:"name"`
	Location string `json:"location"`
	Distance int `json:"distance"`
	Rating int    `json:"rating"`
}
