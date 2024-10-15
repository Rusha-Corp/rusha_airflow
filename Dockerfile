FROM apache/airflow:latest-python3.12

USER root
RUN apt-get update && apt-get install -y git

USER airflow
RUN pip install --upgrade pip 
RUN pip install poetry
RUN pip install requests