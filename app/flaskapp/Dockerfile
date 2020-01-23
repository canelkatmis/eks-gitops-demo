FROM python:alpine
MAINTAINER Can Elkatmis
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["python"]
CMD ["hello_world.py"]
