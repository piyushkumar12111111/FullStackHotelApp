package models

// Hotel represents the hotel model.
type Hotel struct {
	ID    string `json:"id"`
	Name  string `json:"name"`
	Location string `json:"location"`
	Rating int    `json:"rating"`
}
