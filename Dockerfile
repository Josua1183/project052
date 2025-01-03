FROM python:3.12

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -r requirements.txt

RUN groupadd -g 10001 appgroup && useradd -u 10001 -g appgroup appuser

COPY --chown=10001:10001 . /app/

USER 10001

CMD exec python main.py