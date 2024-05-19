From python:3.8

ENV ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2-binary \
    && pip install pillow

# Copy the application code
COPY . .


# Expose the port the app will run on
EXPOSE 8000

# EXPOSE 8000
