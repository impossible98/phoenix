package main

import (
	// import built-in packages
	"log"
	"os"

	// import third-party packages
	"github.com/dotenv-org/godotenvvault"
	"github.com/gin-gonic/gin"

	// import local packages
	"phoenix/global"
)

func main() {
	port := global.PORT
	// load .env file
	err := godotenvvault.Load()
	// control flow
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	port = os.Getenv("PORT")

	r := gin.Default()
	r.GET("/ping", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run(":" + port)
}
