FROM python AS builder

COPY requirements requirements
RUN python -m venv /.venv
ENV PATH="/.venv/bin:$PATH"
RUN pip install -r requirements/backend.in

FROM python
COPY --from=builder /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
COPY build build
COPY spaceship spaceship