# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN python -m venv /opt/venv && . /opt/venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the application on port 8000
EXPOSE 8000

# Command to start the application using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app.py"]
