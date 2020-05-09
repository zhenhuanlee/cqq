package config

import (
	"fmt"
	"os"

	"github.com/go-pg/pg"
)

var db *pg.DB

// DB connection
func DB() *pg.DB {
	if db == nil {
		fmt.Println("set up database ...")
		db = pg.Connect(&pg.Options{
			// Addr:     "localhost:5432",
			// User:     "jude",
			// Database: "cqq",
			Addr:     os.Getenv("DBADDR"),
			User:     os.Getenv("DBUSER"),
			Database: os.Getenv("DATABASE"),
			Password: os.Getenv("DBPWD"),
		})
	}

	return db
}
