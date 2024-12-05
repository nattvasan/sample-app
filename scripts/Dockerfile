FROM python:3.12.1-slim
RUN apt update && apt upgrade -y
RUN apt install -y curl jq
WORKDIR /app
COPY . /app
RUN pip3.12 install --upgrade pip
RUN pip3.12 install --no-cache-dir -r requirements.txt
EXPOSE 8000
ENV FLASK_APP=app.py
ENV FLASK_RUN_PORT=8000
CMD [ "python3.12", "-m", "flask", "run", "--host=0.0.0.0" ]
