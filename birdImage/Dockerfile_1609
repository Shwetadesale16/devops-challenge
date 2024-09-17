# Use an official Golang image 
FROM golang:1.22.5-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download the dependencies
COPY . .
RUN go mod download


# Build the Go application
RUN go build -o getBirdImage

# Expose port 4200
EXPOSE 4200

# Command to run the Go application
CMD ["./getBirdImage"]

