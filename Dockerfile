# Utilisez une image de base Ruby avec la version souhaitée
FROM ruby:3.1.2

# Répertoire de travail dans le conteneur
WORKDIR /app

# Mettez à jour RubyGems vers une version compatible
RUN gem update --system

# Installez Bundler 2.4.18
RUN gem install bundler:2.4.18

# Installez les dépendances Ruby avec Bundler
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Installez un moteur JavaScript (Node.js)
RUN apt-get update && apt-get install -y nodejs

# Copiez tout le reste de votre application dans le conteneur
COPY . .

# Exécutez les commandes pour créer la base de données, effectuer les migrations, et démarrer le serveur Rails
# RUN rails db:drop
# RUN rails db:create
# RUN rails db:migrate
# RUN rails db:seed

# Exposez le port 3000 si nécessaire
EXPOSE 3000

# Commande pour démarrer le serveur Rails
# CMD ["rails", "s", "0.0.0.0"]
