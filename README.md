# Todos Service

Simple Node.js REST API implementing a basic Todos resource and health endpoint.

## Run locally
npm ci
npm start

curl -s localhost:3000/healthz
curl -s -X POST localhost:3000/api/v1/todos -H "content-type: application/json" -d '{"title":"first"}'
curl -s localhost:3000/api/v1/todos
