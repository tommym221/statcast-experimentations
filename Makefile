# Define the name of your Docker image
IMAGE_NAME := experiment-statcast

# Define the default script to run (if any)
SCRIPT := test.py

# Build the Docker image
init:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container with Jupyter Notebook
docker-jupyter:
	docker run -p 8888:8888 -v $(PWD):/app $(IMAGE_NAME)

# Run the Docker container with a Python script
docker-script:
	docker run -v $(PWD):/app $(IMAGE_NAME) python $(SCRIPT)
