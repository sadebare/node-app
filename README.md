# sample-node-app

A small Express "Hello World" app, containerized with a multi-stage Docker build and shipped by a GitHub Actions pipeline that tests the code, builds the image, scans it with Trivy, and pushes it to Docker Hub only if no fixable CRITICAL or HIGH vulnerabilities are found.

## Run locally

```bash
npm install
npm test
npm start            # http://localhost:3000
```

## Run with Docker

```bash
docker build -t sample-node-app .
docker run -d -p 3000:3000 --name sample-app sample-node-app
```

## CI pipeline (`.github/workflows/ci.yml`)

1. **test** – install dependencies and run tests on Node 24
2. **build-scan-push** – build the image, scan it with Trivy (fails on fixable CRITICAL/HIGH), then push `latest` and the commit SHA tag to Docker Hub

Required repository secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`.
