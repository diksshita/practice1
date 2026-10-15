
FROM python:3.12.4

WORKDIR /app

COPY . .

CMD ["python", "exp.py"]
