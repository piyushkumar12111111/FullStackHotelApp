package handlers

import (
    "github.com/piyushkumar/hotelsystem/websocket"
    "net/http"
)

type ChatHandler struct {
    hub *websocket.Hub
}

func NewChatHandler() *ChatHandler {
    hub := websocket.NewHub()
    go hub.Run()
    return &ChatHandler{hub: hub}
}

func (c *ChatHandler) HandleConnections(w http.ResponseWriter, r *http.Request) {
    websocket.ServeWs(c.hub, w, r)
}

func (c *ChatHandler) HandleMessages() {
    // Here you would handle incoming messages. This example doesn't implement it.
}
