# Stage 1: Build the Go application
FROM golang:1.22.5-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy Go module files and download dependencies (to cache these layers)
COPY go.mod ./
RUN go mod download

# Copy the rest of the application source code
COPY . .

# Build the Go application
RUN go build -o getBird

# Stage 2: Create a minimal final image
FROM alpine:3.18

# Set the working directory inside the container
WORKDIR /app

# Copy only the binary from the builder stage
COPY --from=builder /app/getBird .

# Expose the required port
EXPOSE 4201

# Command to run the Go application
CMD ["./getBird"]

