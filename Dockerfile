FROM python:3.9-slim

LABEL maintainer="Alexander Ivanov <e97.wav@gmail.com>"

# System envoriments
ENV LANG=C.UTF-8 \
  PYTHONUNBUFFERED=1

WORKDIR /app

# Target requirements
COPY requirements.txt .

# Project's requirements
RUN pip3 install gunicorn
RUN pip3 install -r requirements.txt

# Target project
COPY . .

EXPOSE 8000

CMD ["gunicorn", "dz5_CI-CD.wsgi", "-w", "4", "-t", "600", "-b", "0.0.0.0:8000"]
