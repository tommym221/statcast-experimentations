# Use the same base image as your existing environment
FROM python:3.11.6-slim

# Set working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libxml2-dev \
    libxslt-dev \
    default-libmysqlclient-dev \
    pkg-config \
    # any other dependencies you might need
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy your application code into the container (assuming your application is in the "app" directory)
COPY . /app

# Expose port (if necessary, e.g., for Jupyter notebooks)
EXPOSE 8888

# Command to run your application (e.g., running a Jupyter notebook server)
CMD ["jupyter", "notebook", "--NotebookApp.password=''", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]