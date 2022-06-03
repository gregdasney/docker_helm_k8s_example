# should not use latest to avoid unknown/unwanted updates
FROM node:latest 

WORKDIR /
EXPOSE 8080
COPY . .
WORKDIR /app
RUN npm install
CMD  ["node", "main.js"]