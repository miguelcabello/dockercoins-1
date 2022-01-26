FROM python
RUN pip install flask
FROM scratch
COPY --from=0 / /
