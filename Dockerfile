# Stage 1: Build the Go application
FROM golang:1.18-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code to the container
COPY . .

# Build the Go binary
RUN go build -o main .

# Stage 2: Create a lightweight image to run the Go app
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the binary from the builder stage
COPY --from=builder /app/main .

# Run the binary
CMD ["./main"]