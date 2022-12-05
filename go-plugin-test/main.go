package main

import (
	"fmt"
	"github.com/Kong/go-pdk"
	"github.com/Kong/go-pdk/server"
)

type Config struct {
	Message string
}

func New() interface{} {
	return &Config{}
}

const Version = "1.0.0"
const Priority = 1

func main() {
	server.StartServer(New, Version, Priority)
}

func (conf Config) Access(kong *pdk.PDK) {
	body := fmt.Sprintf("{\"message\": \"%s\"}", conf.Message)
	headers := make(map[string][]string)
	headers["Content-Type"] = append(headers["Content-Type"], "application/json")
	headers["X-Hello-From-Go"] = append(headers["X-Hello-From-Go"], "hello")
	kong.Response.Exit(200, body, headers)
}
