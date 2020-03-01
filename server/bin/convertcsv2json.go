package main

import (
	"encoding/csv"
	"encoding/json"
	"io"
	"log"
	"os"
)

const (
	csvPath string = "./assets/1000.csv"
	outPath string = "./assets/1000.json"
)

func main() {
	_json := []map[string]interface{}{}

	file, err := os.Open(csvPath)
	if err != nil {
		log.Panicln("open file error:", err)
	}
	defer file.Close()

	r := csv.NewReader(file)

	i := 0
	for {
		record, err := r.Read()
		i++

		if err == io.EOF {
			break
		}

		if err != nil {
			log.Println("read error:", err)
			continue
		}

		_tmp := map[string]interface{}{
			"id":     i - 1,
			"word":   record[0],
			"master": false,
		}
		_json = append(_json, _tmp)
	}

	outfile, err := os.OpenFile(outPath, os.O_WRONLY, os.ModeAppend)
	if err != nil {
		log.Panicln("out file error:", err)
	}
	defer outfile.Close()

	_jsonStr, err := json.Marshal(_json)
	if err != nil {
		log.Panicln("json marshal error:", err)
	}

	res, err := outfile.Write(_jsonStr)
	if err != nil {
		log.Panicf("write json error:", err)
	}
	log.Println(res)
}
