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

	log.Println("Server starting on port 9080...")

	//!
	// Start the server

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
