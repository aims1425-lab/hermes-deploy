.RECIPEPREFIX := >

.PHONY: validate help

validate:
>bash scripts/validate.sh

help:
>echo "Available targets:"
>echo "  validate  - Run repo validation checks"
