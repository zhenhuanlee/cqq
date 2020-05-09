package config

import (
	"github.com/go-playground/validator/v10"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

type CustomValidator struct {
	validator *validator.Validate
}

func (cv *CustomValidator) Validate(i interface{}) error {
	return cv.validator.Struct(i)
}

// ECHO echo instance
var ECHO = echo.New()

// Midware middle ware
func init() {
	ECHO.Use(middleware.Logger())
	ECHO.Use(middleware.Recover())
	ECHO.Use(middleware.CORS())
	ECHO.Validator = &CustomValidator{validator: validator.New()}
}
