FROM node:4-slim
RUN npm install express
RUN npm install redis@3.0.2
FROM scratch
COPY --from=0 / /
