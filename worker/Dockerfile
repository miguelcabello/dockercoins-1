FROM python
RUN pip install redis
RUN pip install requests
FROM scratch
COPY --from=0 / /
