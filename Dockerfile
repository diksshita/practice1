FROM python:3.12.4

WORKDIR /app

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
