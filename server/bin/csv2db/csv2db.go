package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"os"

	"github.com/labstack/gommon/log"
	"github.com/zhenhuanlee/cqq/config"
)

const (
	csvPath string = "./assets/1000.csv"
	outPath string = "./assets/1000.json"
)

func main() {
	db := config.DB()

	file, err := os.Open(csvPath)
	if err != nil {
		log.Panic("open file error:", err)
	}
	defer file.Close()

	r := csv.NewReader(file)

	for {
		record, err := r.Read()

		if err != nil {
			log.Warn(err)
			if err == io.EOF {
				break
			}
			continue
		}

		fmt.Println(record)
		var x interface{}
		res, err := db.Query(x, "INSERT INTO words (en) VALUES (?)", record[0])
		if err != nil {
			log.Error(err)
		}
		fmt.Println(res)
	}
}
