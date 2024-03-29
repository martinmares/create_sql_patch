# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOGET=$(GOCMD) get
BINARY_NAME=create_sql_patch
BINARY_PATH=binary
BINARY_WINDOWS=$(BINARY_PATH)/win64/$(BINARY_NAME).exe
BINARY_LINUX=$(BINARY_PATH)/linux64/$(BINARY_NAME)
BINARY_MAC=$(BINARY_PATH)/mac64/$(BINARY_NAME)
BINARY_MAC_M1=$(BINARY_PATH)/mac64-m1/$(BINARY_NAME)

all: build

build: 
	# $(GOBUILD) -o $(BINARY_NAME) -v
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_WINDOWS) -v
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_LINUX) -v
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_MAC) -v
	CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 $(GOBUILD) -o $(BINARY_MAC_M1) -v

clean: 
	$(GOCLEAN)
		rm -f $(BINARY_WINDOWS)
		rm -f $(BINARY_LINUX)
		rm -f $(BINARY_MAC)

run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./...
	./$(BINARY_NAME)

deps:
	$(GOGET) github.com/fatih/color

# Cross compilation
build-windows:
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 $(GOBUILD) -o $(BINARY_WINDOWS) -v
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_LINUX) -v
build-mac:
	CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 $(GOBUILD) -o $(BINARY_MAC) -v
