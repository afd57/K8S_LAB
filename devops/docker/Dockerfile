FROM python:3.8-slim

WORKDIR /usr/src/app

COPY req.txt ./
RUN pip install --no-cache-dir -r req.txt

COPY /rest_api .

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]
