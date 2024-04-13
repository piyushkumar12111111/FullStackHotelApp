package models


type LiveChat struct {
  
	message string `json:"message"`
	chatProfile ChatProfile `json:"chatProfile"`

}


type ChatProfile struct {
  
	userid string `json:"userid"`
	username string `json:"username"`
}