
# Python and Linux versions
# Alpine is a lightweight Linux version ideal for running docker containers
FROM python:3.9-alpine3.13
# Whoever is maintaining this project
LABEL maintainer="arasucar"

# Recommended for seeing logs immediately
ENV PYTHONUNBUFFERED 1

# Copy required files
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
# Where the commands will be running from
WORKDIR /app
# To access that port in the container
EXPOSE 8000

# Will be overridden by the variable in docker-compose if any
# In default it will not be running in development mode
ARG DEV=false
# Install dependancies as a new user
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ];  \
      then /py/bin/pip install -r /tmp/requirements.dev.txt ;  \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# Setting python PATH
ENV PATH="/py/bin:$PATH"

USER django-user