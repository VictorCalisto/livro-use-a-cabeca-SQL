FROM python:3.13.0a1-bookworm

# Atualizar os pacotes e instalar as dependências
RUN apt-get update -y
RUN apt-get install -y curl gpg libpq-dev gcc libc6-dev libffi-dev
RUN pip install --upgrade pip
RUN apt-get install sqlite3

# Instala as dependências
RUN pip install faker

WORKDIR /python

CMD ["sh", "-c", "sleep infinity"]


