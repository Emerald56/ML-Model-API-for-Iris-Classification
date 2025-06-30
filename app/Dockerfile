# Use official Python image as the base
FROM python:3.10-slim

# Set working directory inside the container
WORKDIR /app

# Copy your app code to the container
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir flask scikit-learn joblib

# Expose port 5001 so we can access the app
EXPOSE 5001

# Command to run your app
CMD ["python", "app.py"]
