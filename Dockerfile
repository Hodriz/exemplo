# Estágio de construção
FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Estágio de produção
FROM nginx:alpine

COPY --from=builder /app/dist/exemplo /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]