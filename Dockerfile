# Utiliser une image de base Node.js pour builder l'application
FROM node:16 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de package et installer les dépendances
COPY package*.json ./
RUN npm install

CMD ["nginx", "-g", "daemon off;"]
des fichiers et builder l'application
COPY . .
RUN npm run build

# Utiliser une image nginx pour servir l'application
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80