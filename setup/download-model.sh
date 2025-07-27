#!/bin/bash
# Place in setup/download-model.sh

MODEL=${1:-mistral}
echo "Pulling model: $MODEL"
docker exec -it $(docker ps -qf "ancestor=ollama/ollama") ollama pull $MODEL
