# syntax=docker/dockerfile:1.7-labs
FROM python:3.11-alpine

RUN pip install --no-cache-dir "pipenv>=2023.12.1"


WORKDIR /app
# .git & README.md are unique per-repository. We ignore them on first copy to prevent cache misses
COPY --exclude=.git --exclude=README.md . /app

ENV WORKON_HOME=/venvs

RUN pipenv install

# Force environment creation
RUN pipenv run python3 -c "1+1"

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Pipfile,Pipfile.lock"
# Once the heave steps are done, we can copy all files back
COPY . /app
