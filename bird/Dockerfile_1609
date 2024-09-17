# Use an official Golang image
FROM golang:1.22.5-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download the dependencies
COPY . .
RUN go mod download


# Build the Go application
RUN go build -o getBird

# Expose port 4201
EXPOSE 4201

# Command to run the Go application
CMD ["./getBird"]
