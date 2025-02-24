.PHONY: build run stop

build:
	docker build -t ocaml-dev .

run:
	docker run -it -p 8000:8000 -v .:/work -w /work ocaml-dev
