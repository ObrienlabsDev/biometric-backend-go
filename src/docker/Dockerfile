FROM golang:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files (if any)
COPY go.mod ./
#COPY go.sum ./

# Download Go modules (if any)
RUN go mod download

# Copy the source code into the container
COPY main.go .

# Build the Go application
RUN go build -o main .

# Expose the port on which the application will run
EXPOSE 8080

# Run the Go application
CMD ["./main"]