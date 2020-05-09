package router

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/zhenhuanlee/cqq/config"
	"github.com/zhenhuanlee/cqq/router/word"
)

var e = config.ECHO

func init() {
	e.GET("/", index)
	e.GET("/words", word.All)
	e.POST("/words", word.Create)
	e.PUT("/words", word.Update)
}

func index(c echo.Context) error {
	return c.JSON(http.StatusOK, map[string]string{
		"hello": "world",
	})
}
