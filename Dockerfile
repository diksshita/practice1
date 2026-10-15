
FROM python:3.12.4

WORKDIR /app
<<<<<<< HEAD

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

=======
COPY .  .
CMD ["python","exp.py"]
>>>>>>> cc79fba10f915fbb5fc756a4ae10979a81424669
