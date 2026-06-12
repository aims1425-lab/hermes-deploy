.RECIPEPREFIX := >

.PHONY: validate test help

validate:
>bash scripts/validate.sh

test:
>bash tests/smoke.sh

help:
>echo "Available targets:"
>echo "  validate  - Run repo validation checks"
>echo "  test      - Run local smoke tests"
