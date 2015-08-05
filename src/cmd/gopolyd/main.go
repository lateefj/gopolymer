package main

import (
	"fmt"
	"net/http"

	"github.com/GeertJohan/go.rice"
	log "github.com/Sirupsen/logrus"
)

func main() {
	http.Handle("/", http.FileServer(rice.MustFindBox("ui").HTTPBox()))
	http.Handle("/bower_components", http.FileServer(rice.MustFindBox("ui/bower_components").HTTPBox()))
	http.HandleFunc("/api", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		w.Write([]byte(`{"foo":"Woot data from ajax request!"}`))
	})
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", 8080), nil))
}
