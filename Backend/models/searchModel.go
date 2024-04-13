package models


type SearchModel struct  {
  
	Bedrooms int `json:"bedrooms"`
	Bathrooms int `json:"bathrooms"`
	payment paymentModel `json:"payment"`
	service serviceModel `json:"service"`
	city string `json:"city"`

}

//! store dummy data 
var SearchHotel = []SearchModel{

	SearchModel{ Bedrooms: 2, Bathrooms: 2, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Delhi"},
	SearchModel{ Bedrooms: 3, Bathrooms: 3, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Mumbai"},
	SearchModel{ Bedrooms: 4, Bathrooms: 4, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Bangalore"},
	SearchModel{ Bedrooms: 5, Bathrooms: 5, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Chennai"},
	SearchModel{ Bedrooms: 6, Bathrooms: 6, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Kolkata"},
	SearchModel{ Bedrooms: 7, Bathrooms: 7, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Hyderabad"},
	SearchModel{ Bedrooms: 8, Bathrooms: 8, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Pune"},
	SearchModel{ Bedrooms: 9, Bathrooms: 9, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Jaipur"},
	SearchModel{ Bedrooms: 10, Bathrooms: 10, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Ahmedabad"},
	SearchModel{ Bedrooms: 11, Bathrooms: 11, payment: paymentModel{payathotel: true, payonline: true, advancepayment: true}, service: serviceModel{petsallowed: true, resturant: true, swimmingpool: true, carparking: true, fitnesscentre: true}, city: "Lucknow"},
}


type serviceModel struct {
  
	petsallowed bool `json:"petsallowed"`
	resturant bool `json:"resturant"`
	swimmingpool bool `json:"swimmingpool"`
	carparking bool `json:"carparking"`
	fitnesscentre bool `json:"fitnesscentre"`


}


type paymentModel struct {
 
	payathotel bool `json:"payathotel"`
	payonline bool `json:"payonline"`
	advancepayment bool `json:"advancepayment"`

}


