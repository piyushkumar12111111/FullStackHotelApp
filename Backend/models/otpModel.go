

package models

// OTPRequest represents a request to check an OTP


type OTPRequest struct {
	OTP    string `json:"otp"`
	UserOTP string `json:"user_otp"`
}