# 1st stage named builder
FROM node:alpine as builderstage
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build


# 2nd stage
FROM nginx
COPY --from=builderstage /app/build /usr/share/nginx/html
#CMD ["nginx"]