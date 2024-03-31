package email

import "log"

// SendResetPasswordEmail simulates sending a reset password email to the given address.
// In a real application, use an email package or service API to send actual emails.
func SendResetPasswordEmail(emailAddress string) bool {
	// Simulate email sending
	log.Printf("Sending password reset email to %s\n", emailAddress)
	return true
}
