# build stage
FROM node:alpine as build-stage
RUN apk --no-cache add g++ gcc libgcc libstdc++ linux-headers make python
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

# production stage
FROM nginx:alpine as production-stage
RUN mkdir /app
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
