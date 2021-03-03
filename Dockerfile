FROM python:3.9

COPY pyproject.toml poetry.lock ./
RUN pip install poetry==1.1.4 && \
    poetry config virtualenvs.create false && \ 
    poetry install --no-ansi

RUN mkdir /code
WORKDIR /code
COPY . /code/

ENV PYTHONPATH=".:$PYTHONPATH"
