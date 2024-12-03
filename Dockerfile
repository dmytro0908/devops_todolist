ARG PYTHON_BASE_VERSION=3.10

# Build stage
FROM python:${PYTHON_BASE_VERSION} AS build
WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt --target /app/deps

# Run stage
FROM python:${PYTHON_BASE_VERSION} AS runtime
ENV PYTHONUNBUFFERED=1
WORKDIR /app

COPY --from=build /app/deps /app/deps

ENV PYTHONPATH=/app/deps
COPY . .
RUN python manage.py migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
