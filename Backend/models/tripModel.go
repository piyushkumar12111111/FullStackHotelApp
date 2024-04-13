package models

// Place represents the structure of our resource
type Place struct {
    Name     string  `json:"name"`
    Distance float64 `json:"distance"` // in kilometers
    Rating   float64 `json:"rating"`   // 1 to 5
    Charges  float64 `json:"charges"`  // in USD
}
