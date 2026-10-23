.PHONY: book test sanitize bench
book:
	python3 scripts/run_checks.py --course-only
test:
	python3 scripts/run_checks.py
sanitize:
	python3 scripts/run_checks.py --sanitize
bench:
	bash run_benchmarks.sh after
