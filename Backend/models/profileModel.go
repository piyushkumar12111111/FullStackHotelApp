package models

// Profile represents a user's profile with Name, Email, and Gender.
type Profile struct {
	Name   string `json:"name"`
	Email  string `json:"email"`
	Gender string `json:"gender"`
}
