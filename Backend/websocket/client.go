package websocket

import (
	"log"
	"net/http"

	"github.com/gorilla/websocket"
)

type Client struct {
    Hub  *Hub
    Conn *websocket.Conn
    Send chan []byte
}

// NewClient creates a new client
func NewClient(hub *Hub, conn *websocket.Conn) *Client {
    return &Client{Hub: hub, Conn: conn, Send: make(chan []byte, 256)}
}

// writePump pumps messages from the hub to the websocket connection.
func (c *Client) writePump() {
    defer func() {
        c.Conn.Close()
    }()
    for {
        select {
        case message, ok := <-c.Send:
            if !ok {
                // The hub closed the channel.
                c.Conn.WriteMessage(websocket.CloseMessage, []byte{})
                return
            }

            if err := c.Conn.WriteMessage(websocket.TextMessage, message); err != nil {
                return
            }
        }
    }
}

// readPump pumps messages from the websocket connection to the hub.
func (c *Client) readPump() {
    defer func() {
        c.Hub.Unregister <- c
        c.Conn.Close()
    }()
    for {
        _, message, err := c.Conn.ReadMessage()
        if err != nil {
            if websocket.IsUnexpectedCloseError(err, websocket.CloseGoingAway, websocket.CloseAbnormalClosure) {
                // log the error
            }
            break
        }
        c.Hub.Broadcast <- message
    }
}

// ServeWs handles websocket requests from the peer.
func ServeWs(hub *Hub, w http.ResponseWriter, r *http.Request) {
    conn, err := upgrader.Upgrade(w, r, nil) // Use the upgrader to upgrade the connection to a WebSocket.
    if err != nil {
        log.Printf("error upgrading HTTP to WebSocket: %v", err)
        return
    }
    client := NewClient(hub, conn)
    hub.Register <- client

    // Start the read and write pumps.
    go client.writePump()
    go client.readPump()
}


var upgrader = websocket.Upgrader{
    ReadBufferSize:  1024,
    WriteBufferSize: 1024,
   
    CheckOrigin: func(r *http.Request) bool { return true },
}
