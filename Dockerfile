FROM node:18.19.1-alpine3.19

RUN addgroup apprunners && adduser -S apprunner -G apprunners
USER apprunner

WORKDIR /application
RUN mkdir data

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

ENV API_URL=https://api.sveltekit.com/api
EXPOSE 8080
CMD ["npm", "run", "preview"]
