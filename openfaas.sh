#!/bin/bash

git clone https://github.com/openfaas/faas && \
	  cd faas && \
	  git checkout 0.6.5 && \
	  ./deploy_stack.sh

curl -sL https://cli.openfaas.com | sudo sh
