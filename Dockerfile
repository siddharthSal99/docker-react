# the 'as' keyword specifies the name of the stage - can be referenced later
# FROM node:alpine as builder
# WORKDIR '/app'
# COPY package.json .
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx
# COPY --from=builder /app/build /usr/share/nginx/html

# When doing AWS stuff use the below:
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html 
# <- directories are found in dockerhub docs
# doesnt need a specific startup command - taken care of by base image