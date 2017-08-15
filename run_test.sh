#!/usr/bin/env bash

rm .tests/texlive.*
set -ev

docker build . -t heroku-tex
docker run -ti heroku-tex:latest pdflatex --version

cp examples/* .tests
docker build . -t heroku-tex
docker run -ti heroku-tex:latest latexmk --version
