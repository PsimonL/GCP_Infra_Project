package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestTimeHandler(t *testing.T) {
	handler := http.NewServeMux()
	handler.HandleFunc("/time", timeHandler)

	req, err := http.NewRequest("GET", "/time", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("Expected 200 status code, but got instead %v", status)
	}

	var res Response
	err = json.NewDecoder(rr.Body).Decode(&res)
	if err != nil {
		t.Errorf("Error during JSOn decoding: %v", err)
	}

	if res.CurrentTime == "" {
		t.Error("Answer does not contain CurrentTime Field")
	}
	if res.ServerStartTime == "" {
		t.Error("Answer does not contain ServerStartTime Field")
	}
	if res.AnswerCount == 0 {
		t.Error("Answer does not contain AnswerCount Field")
	}
}
