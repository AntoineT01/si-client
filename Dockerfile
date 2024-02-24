# Utilisez l'image officielle de Node.js avec la version LTS (Long Term Support)
FROM node:lts

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez les fichiers package.json et package-lock.json dans le répertoire de travail du conteneur
COPY package.json .
COPY package-lock.json .

# Installez les dépendances du projet en utilisant npm
RUN npm install

# Copiez le reste des fichiers du projet dans le conteneur
COPY . .

# Exposez le port sur lequel votre application s'exécutera dans le conteneur
EXPOSE 3000

# Définissez la commande pour démarrer votre application
CMD ["npm", "run", "serve"]
