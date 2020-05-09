package ds

// Word struct concern
type Word struct {
	ID int64
	EN string `json:"EN" validate:"required"`
	CN string `json:"CN"`
}
