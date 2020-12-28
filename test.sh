#!/bin/bash
docker build -t virkkala/tfvc .
docker run --rm virkkala/tfvc tf workspaces