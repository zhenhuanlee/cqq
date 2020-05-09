package config

import (
	"log"

	"github.com/joho/godotenv"
)

func init() {
	log.Println("init configs")
	err := godotenv.Load()

	if err != nil {
		log.Println(err)
	}
}
