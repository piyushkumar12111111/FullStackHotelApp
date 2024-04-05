package models

// Hotel represents the structure of our hotel resource
type PopHotels struct {
    Name     string  `json:"name"`
    Place    string  `json:"place"`
    Distance float64 `json:"distance"` // in kilometers, from a central point of interest
}
