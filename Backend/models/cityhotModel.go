package models

type CityHotel struct {
    Name     string  `json:"name"`
    Distance float64 `json:"distance"` // Distance from city center in km
}

var Cities = map[string][]CityHotel{
	"Dhaka":      {{"Dhaka Delight", 1.5}, {"Capital Stay", 2.0}, {"Urban Retreat", 0.5}, {"City Lights", 1.0}, {"Skyline View", 2.2}},
    "Chittagong": {{"Chittagong Charm", 1.2}, {"Harbor Haven", 2.1}, {"Seafront Suite", 3.5}, {"Bay Breeze", 1.8}, {"Maritime Luxury", 4.0}},
    "Rajshahi":   {{"Rajshahi Respite", 0.6}, {"Vineyard Vista", 1.5}, {"Silk City Sleep", 1.1}, {"Mango Manor", 2.3}, {"Padma Place", 3.0}},
    "Dinajpur":   {{"Dinajpur Den", 1.4}, {"Ricefield Retreat", 2.6}, {"Historic Hideaway", 1.9}, {"Northern Nook", 2.8}, {"Tea Terrace", 3.1}},
    "Khulna":     {{"Khulna Comfort", 0.8}, {"Sundarban Stay", 3.2}, {"Riverfront Residence", 1.7}, {"Mangrove Hotel", 2.9}, {"Tiger Trail Inn", 4.5}},
    "Mymensingh": {{"Mymensingh Manor", 0.5}, {"Brahmaputra B&B", 1.6}, {"Garo Hills Getaway", 2.4}, {"Central Cottage", 1.2}, {"Tea Town Terrace", 3.3}},
    "Barisal":    {{"Barisal Bay Inn", 0.7}, {"Delta Delight", 1.3}, {"Floating Hotel", 2.0}, {"Southern Star", 2.5}, {"Venice of the East", 3.6}},
    "Sylhet":     {{"Sylhet Springs", 1.0}, {"Cloud-Covered Lodge", 2.2}, {"Tea Garden Guesthouse", 3.8}, {"Monsoon Magic", 1.7}, {"Hillside Hotel", 2.8}},
}
