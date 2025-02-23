# Use slim version of Python for a smaller image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy only requirements first for better caching
COPY requirements.txt ./

# Install dependencies without cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the app's code
COPY . .

# Expose port 8080
EXPOSE 8080

# Use this for better logging and signal handling
CMD ["python", "app.py"]
