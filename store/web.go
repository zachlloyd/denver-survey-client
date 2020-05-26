package store

import (
	"bytes"
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

const surveyResponseEndpoint = "https://us-central1-denver-survey.cloudfunctions.net/surveyresponse"

type webStore struct{}

func NewWebStore() Store {
	fmt.Println("New webstore")
	return webStore{}
}

func (ws webStore) WriteAnswer(response Response) {
	b := new(bytes.Buffer)
	json.NewEncoder(b).Encode(response)

	fmt.Println("Sending response with respondentId", response.RespondentId)

	resp, err := http.Post(surveyResponseEndpoint, "application/json", b)
	if err != nil {
		log.Println("Unable to save response...are you online?", err)
	}

	defer resp.Body.Close()
}
