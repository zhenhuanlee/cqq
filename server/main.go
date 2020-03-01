package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// WordRecord word record
type WordRecord struct {
	ID     int    `json:"id"`
	Word   string `json:"word"`
	Master bool   `json:"master"`
}

// Path1000 path
const Path1000 string = "./assets/1000.json"

func main() {
	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	e.Use(middleware.CORS())

	e.GET("/1000", muw)

	readCSV()

	e.Logger.Fatal(e.Start(":1111"))
}

func muw(c echo.Context) error {
	words := readCSV()
	return c.JSON(http.StatusOK, words)
	// c.String(http.StatusOK, res)
}

func readCSV() (res []WordRecord) {
	content, err := ioutil.ReadFile(Path1000)
	if err != nil {
		log.Fatalln("ReadAll error:", err)
	}

	// fmt.Println(string(content))

	err = json.Unmarshal(content, &res)
	if err != nil {
		fmt.Println("unmarshal error:", err)
	}

	return
}
