# recipe-app-api
Recipe API Project

# To build the docker container
docker build .
docker-compose build

# To run the flake8 linting
docker-compose run --rm app sh -c "flake8"

# To run the Django Test Suite
docker-compose run --rm app sh -c "python manage.py test"

# To start a new project named "app" inside app directory
docker-compose run --rm app sh -c "django-admin startproject app ."

# To run the project
docker-compose up