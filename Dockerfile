FROM python:3.7-alpine
RUN apk update && apk add bash
RUN mkdir /opt/src
COPY ./ContainerInit/src /opt/src
CMD ["python", "/opt/src/run.py"]
