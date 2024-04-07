package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/piyushkumar/hotelsystem/handlers"
)

// Define the CORS middleware
func corsMiddleware(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		// Set headers
		w.Header().Set("Access-Control-Allow-Origin", "*")
		w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
		w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")

		// If it's a preflight request, we can stop here
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}

		// Otherwise, pass control to the next handler
		next.ServeHTTP(w, r)
	})
}

func main() {
	r := mux.NewRouter()

	// Apply the CORS middleware to the router
	//	r.Use(corsMiddleware)

	//! Register the user handler
	r.HandleFunc("/signup", handlers.SignUp).Methods("POST")

	r.HandleFunc("/signin", handlers.SignIn).Methods("POST")

	//! Register the OTP checking handler
	r.HandleFunc("/checkotp", handlers.CheckOTP).Methods("POST")

	//! Forgot password route
	r.HandleFunc("/forgot-password", handlers.ForgotPassword).Methods("POST")

	log.Println("Server starting on port 9080...")

	//! hotel apis

	r.HandleFunc("/hotels", handlers.WishListHotels).Methods("GET")
	r.HandleFunc("/rechotels", handlers.RecommendHotels).Methods("GET")
	r.HandleFunc("/pophotels", handlers.PopHotels).Methods("GET")

	r.HandleFunc("/hotel", handlers.AddHotel).Methods("POST")
	r.HandleFunc("/hotel/{id}", handlers.DeleteHotel).Methods("DELETE")

	// Start the server

	//! trip routes

	r.HandleFunc("/places", handlers.GetPlaces).Methods("GET")
	r.HandleFunc("/popularhotels", handlers.GetPopularHotels).Methods("GET")

	//! hotel by city
	r.HandleFunc("/city/{city}", handlers.GetHotelsByCity).Methods("GET")

	//! profile routes

	r.HandleFunc("/profile", handlers.GetProfile).Methods("GET")
	r.HandleFunc("/profile", handlers.SetProfile).Methods("POST")
	
	//! search hotels by name
	r.HandleFunc("/search", handlers.SearchHotels).Methods("GET")

	

	

	//! booking apis

	r.HandleFunc("/bookings", handlers.GetBookings).Methods("GET")
	r.HandleFunc("/booking", handlers.CreateBooking).Methods("POST")

	//! live chat api
	r.HandleFunc("/chat", handlers.NewChatHandler().HandleConnections).Methods("GET") 

	log.Fatal(http.ListenAndServe(":9080", r))
	//log.Fatal(http.ListenAndServe(":8080", r))
}

// package main

// import (
// 	"log"
// 	"net/http"

// 	"github.com/gorilla/mux"
// 	"github.com/piyushkumar/hotelsystem/handlers" // Make sure this path is correct
// )

// func corsMiddleware(next http.Handler) http.Handler {
// 	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
// 		w.Header().Set("Access-Control-Allow-Origin", "*")
// 		w.Header().Set("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE")
// 		w.Header().Set("Access-Control-Allow-Headers", "Accept, Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization")
// 		if r.Method == "OPTIONS" {
// 			w.WriteHeader(http.StatusOK)
// 			return
// 		}
// 		next.ServeHTTP(w, r)
// 	})
// }

// func main() {
// 	r := mux.NewRouter()
// 	r.Use(corsMiddleware)

// 	r.HandleFunc("/signup", handlers.SignUp).Methods("POST")
// 	r.HandleFunc("/checkotp", handlers.CheckOTP).Methods("POST") // Make sure the handler name matches

// 	log.Println("Server starting on port 8080...")
// 	log.Fatal(http.ListenAndServe(":8080", r))
// }
