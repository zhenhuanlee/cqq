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
	e.POST("/words/all", word.All)
	e.POST("/words/:id", word.Find)
	e.POST("/words/create", word.Create)
	e.POST("/words/update", word.Update)
}

func index(c echo.Context) error {
	return c.JSON(http.StatusOK, map[string]string{
		"hello": "world",
	})
}
