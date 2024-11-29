package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sync"
	"time"
)

type Response struct {
	CurrentTime     string `json:"current_time"`
	ServerStartTime string `json:"server_start_time"`
	AnswerCount     int    `json:"answer_count"`
}

var (
	startTime time.Time
	counter   int
	mu        sync.Mutex
)

func timeHandler(w http.ResponseWriter, _ *http.Request) { // w, r
	mu.Lock()
	defer mu.Unlock()

	counter++

	currentTime := time.Now().Format(time.RFC1123)

	response := Response{
		CurrentTime:     currentTime,
		ServerStartTime: startTime.Format(time.RFC1123),
		AnswerCount:     counter,
	}

	w.Header().Set("Content-Type", "application/json")
	err := json.NewEncoder(w).Encode(response)
	if err != nil {
		return
	}
	fmt.Printf("Answer %d at %s\n", counter, currentTime)
}

func main() {
	startTime = time.Now()

	http.HandleFunc("/time", timeHandler)

	port := "8081"
	println("Server is running on port", port)

	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		return
	}
}
