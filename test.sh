#!/bin/bash
docker build -t virkkala/tfvc .
docker run -it --rm -v "$(pwd):/app" virkkala/tfvc testi.js