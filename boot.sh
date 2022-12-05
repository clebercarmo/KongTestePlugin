cd go-plugin-test
GOOS=linux GOARCH=amd64 go build .
cd ..
docker build -t kong-test .
docker run -p 8000:8000 kong-test