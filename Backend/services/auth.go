package services

import (
	"log"
	"math/rand"
	"time"
)

// GenerateOTP simulates OTP generation
func GenerateOTP() string {
	rand.Seed(time.Now().UnixNano())
	const digits = "0123456789"
	length := 6
	otp := make([]byte, length)
	for i := range otp {
		otp[i] = digits[rand.Intn(len(digits))]
	}
	return string(otp)
}

// SendOTP simulates sending an OTP. In a real application, integrate with an email/SMS service.
func SendOTP(email, otp string) error {
	// Placeholder: Log the OTP instead of sending it
	log.Printf("Sending OTP '%s' to email '%s'\n", otp, email)
	return nil
}
