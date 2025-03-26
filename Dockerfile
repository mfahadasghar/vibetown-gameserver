# Use a lightweight Ubuntu image
FROM ubuntu:latest

# Set working directory
WORKDIR /server

# Install dependencies required by Unity server builds
RUN apt update && apt install -y libglib2.0-0 libgomp1 libstdc++6 libgcc1

# Copy the Unity server build files to the container
COPY ServerBuild/ . 

# Grant execution permissions to the server binary
RUN chmod +x server.x86_64

# Expose the port that NGO uses (default: 7777)
EXPOSE 7777/udp

# Run the Unity server when the container starts
CMD ["./server.x86_64", "-batchmode", "-nographics", "-logfile", "/dev/stdout"]