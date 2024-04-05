package models

type Booking struct {
    RoomType string  `json:"roomType"`
    Status   string  `json:"status"` // Pending, Confirmed, Completed
    Price    float64 `json:"price"`
}

// Mocked data for demonstration
var Bookings = []Booking{
    {"Single", "Confirmed", 100.0},
    {"Double", "Pending", 150.0},
    {"Suite", "Completed", 250.0},
}
