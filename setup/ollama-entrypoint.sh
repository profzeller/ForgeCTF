#!/bin/sh

# Use environment variables for models, defaulting if unset
LLM_MODEL=${OLLAMA_MODEL_PREF:-mistral}
EMBED_MODEL=${EMBEDDING_MODEL_PREF:-nomic-embed-text:latest}

echo "Starting Ollama in background..."
ollama serve &

# Wait for the Ollama server to be ready
echo "Waiting for Ollama server to be ready..."
until ollama list >/dev/null 2>&1; do
  sleep 1
done

echo "Ollama is ready."

# Pull the LLM model if not present
if ! ollama list | grep -q "$LLM_MODEL"; then
  echo "Pulling LLM model: $LLM_MODEL"
  ollama pull "$LLM_MODEL"
else
  echo "LLM model $LLM_MODEL already exists."
fi

# Pull the embedding model if not present
if ! ollama list | grep -q "$EMBED_MODEL"; then
  echo "Pulling embedding model: $EMBED_MODEL"
  ollama pull "$EMBED_MODEL"
else
  echo "Embedding model $EMBED_MODEL already exists."
fi

# Prevent the container from exiting
tail -f /dev/null