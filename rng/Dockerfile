FROM python
RUN pip install flask
FROM scratch
COPY --from=0 / /
ENV PATH /usr/local/bin:$PATH
ENV LANG C.UTF-8
