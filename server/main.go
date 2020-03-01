package main

import (
	"encoding/csv"
	"io"
	"log"
	"net/http"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

// Path1000 path
const Path1000 string = "./csv/1000.csv"

func main() {
	e := echo.New()

	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	e.Use(middleware.CORS())

	e.GET("/1000", muw)

	readCSV()

	e.Logger.Fatal(e.Start(":1323"))
}

func muw(c echo.Context) error {
	words := readCSV()
	return c.JSON(http.StatusOK, words)
	// c.String(http.StatusOK, res)
}

func readCSV() (res []string) {
	file, err := os.Open(Path1000)
	if err != nil {
		log.Fatalln("Open file error:", err)
	}

	r := csv.NewReader(file)

	i := 0
	for {
		i++
		record, err := r.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			log.Println("Record error:", err)
			continue
		}

		res = append(res, record[0])
	}

	return
}
