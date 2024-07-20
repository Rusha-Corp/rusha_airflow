FROM apache/airflow:latest-python3.12

USER root
RUN apt-get update && apt-get install -y git

RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update && apt-get install google-cloud-cli -y \
    && apt-get install google-cloud-cli-gke-gcloud-auth-plugin -y

USER airflow
RUN pip install --upgrade pip 
RUN pip install poetry
RUN pip install requests
