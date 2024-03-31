package models

// User represents a user in the system
type User struct {
	Country    string `json:"country"`
	Email      string `json:"email"`
	Password   string `json:"password"`
}
