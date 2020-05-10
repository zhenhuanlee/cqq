package model

import (
	"github.com/zhenhuanlee/cqq/ds"
	"github.com/zhenhuanlee/cqq/ds/params"
)

// Word model struct
type Word struct {
	ds.Word
}

// Words list
func Words(page int) ([]Word, error) {
	var words []Word
	err := db.Model(&words).Order("en ASC").Limit(pageSize).Offset(page * pageSize).Select()
	if err != nil {
		return nil, err
	}
	return words, nil
}

// Create word
func Create(w *params.Word) error {
	word := Word{w.Word}

	return db.Insert(&word)
}

// Update word
func Update(w *params.Word) error {
	word := Word{w.Word}

	return db.Update(&word)
}
