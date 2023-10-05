#!/bin/bash

# Obtenez le PID du processus Rails
rails_pid=$(ps aux | grep rails | grep -v grep | awk '{print $2}')


  # Tuez le processus Rails proprement (envoie SIGINT)
rm -f /app/tmp/pids/server.pid


# Attendre quelques secondes pour permettre à Rails de se terminer proprement (ou pour l'exécution du message ci-dessus)
sleep 5

# Exécutez les commandes pour gérer la base de données et démarrer Rails
# Si la base de donnée est deja existante ne pas la recréer
if [ -f /app/db/development.sqlite3 ]; then
  rails s -b 0.0.0.0 -p 3000 -e development
  echo "Database already exist"
else
  rails db:drop
  rails db:create
  rails db:migrate
  rails db:seed
  rails s -b 0.0.0.0 -p 3000 -e development
  echo "Database created"

fi
