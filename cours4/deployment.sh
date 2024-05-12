#!/bin/bash

# Stop Tomcat
/opt/apache-tomcat-9.0.88/bin/shutdown.sh

# Déployer le WAR
cp /opt/deployment/buil_war/MyWebAppv1.war /opt/apache-tomcat-9.0.88/webapps/

# Exécuter le script SQL de mise à jour de la base de données
psql -U userdb -d mywebapp -f /opt/deployment/database/db.sql

# Redémarrer Tomcat
/opt/apache-tomcat-9.0.88/bin/startup.sh

