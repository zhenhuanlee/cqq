package word

import (
	"net/http"
	"strconv"

	"github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
	"github.com/zhenhuanlee/cqq/ds/model"
	"github.com/zhenhuanlee/cqq/ds/params"
)

// All words
func All(c echo.Context) error {
	page, err := strconv.Atoi(c.QueryParam("page"))
	if err != nil {
		log.Warn("router All error:", err)
		page = 0
	}

	json, err := model.Words(page)
	if err != nil {
		return err
	}
	return c.JSON(http.StatusOK, json)
}

// Create a new word
func Create(c echo.Context) (err error) {
	word := new(params.Word)
	if err = c.Bind(word); err != nil {
		return
	}
	if err = c.Validate(word); err != nil {
		return
	}

	if err = model.Create(word); err != nil {
		// log.Error("*[word] Create: ", err)
		return
	}

	return c.JSON(http.StatusOK, map[string]int{"code": 0})
}

// Update a word
func Update(c echo.Context) (err error) {
	word := new(params.Word)
	if err = c.Bind(word); err != nil {
		return
	}
	if err = c.Validate(word); err != nil {
		return
	}

	if err = model.Update(word); err != nil {
		return
	}

	return c.JSON(http.StatusOK, map[string]int{"code": 0})
}

// OK success
func OK(c echo.Context) error {
	return c.JSON(http.StatusOK, map[string]int{"code": 0})
}
