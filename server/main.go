package main

import (
	"log"

	"github.com/zhenhuanlee/cqq/config"
	_ "github.com/zhenhuanlee/cqq/router"
)

func main() {
	log.Println(config.ECHO.Start(":1111"))
}
