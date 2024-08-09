FROM python:3.11-slim

# Argument for MAPI_TOKEN
ARG MAPI_TOKEN

# Set MAPI_TOKEN as an environment variable inside the container
ENV MAPI_TOKEN=${MAPI_TOKEN}

WORKDIR /graphql

RUN apt-get -qq -y update \
    # Install dependencies
    && apt-get -qq -y install \
        curl \
        procps \
    # Install Mayhem CLI
    && curl -sS --fail -L https://app.mayhem.security/cli/Linux/install.sh | sh \
    && mkdir -p /usr/local/bin/ \
    && install mapi /usr/local/bin/ \
    && mapi login ${MAPI_TOKEN}

COPY . .

RUN pip install -r requirements.txt

# Use Uvicorn to serve the FastAPI apps
CMD uvicorn server:app --host 0.0.0.0 --port 5000 & \
    uvicorn gateway:app --host 0.0.0.0 --port 5001 & \
    mapi run forallsecure-demo/graphql/graphql 30 "http://localhost:5001/openapi.json" --url "http://localhost:5001/" --resource-hint "query:{ hello }"