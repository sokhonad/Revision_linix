# 1 Script d'instalation centOS et server postgress
```sh
docker pull centos

docker run -it centos
 
cd /etc/yum.repos.d/

sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
yum update -y
 
yum install postgresql-server postgresql-contrib

su - postgres
 
initdb -D /var/lib/pgsql/data
 
pg_ctl start
 
psql
```

# 2 Création d'un utilisateur de base de données appelé "userdb" avec les rôles spécifiés :

```sh
CREATE ROLE userdb WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'sokh';
```

# 3 Création de la base de données "mywebapp" 

```sh
CREATE DATABASE mywebapp;
```

# 3 . 1 Connexion à la base de données "mywebapp" en tant quutilisateur "userdb" :

```sh
psql -U userdb -d mywebapp
```

# 3 Création de la table "userdb" avec les colonnes spécifiées :

```sh
CREATE TABLE userdb (
    username varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    id serial PRIMARY KEY
);
```
# Requete INSERT 

```sh
INSERT INTO userdb (username, email) VALUES ('Sokhona', 'sokhona@gmail.com');
```

# Requete SELECT 

```sh
SELECT * FROM userdb;
```
# Visualisation :

![Exemple" (image)](exemple.png)


# Instalation et demmarage de tomcat

```sh
unzip apache-tomcat-9.0.88.zip -d /opt

chmod +x -R apache-tomcat-9.0.88/


sudo yum install java-1.8.0-openjdk-devel

/opt/apache-tomcat-9.0.88/bin/startup.sh
```
# Mis a jour de base d edonnées

```sh
ALTER TABLE users
ADD COLUMN date_of_birth VARCHAR(100),
ADD COLUMN city VARCHAR(50);
```
# Script de deployement et mis a jour de base de données de la version 1 de MyWebApp

```sh
/opt/apache-tomcat-9.0.88/bin/shutdown.sh

cp /opt/deployment/buil_war/MyWebAppv1.war /opt/apache-tomcat-9.0.88/webapps/

psql -U userdb -d mywebapp -f /opt/deployment/database/db.sql

/opt/apache-tomcat-9.0.88/bin/startup.sh
```

# Visualisation page 1 :

![Exemple" (image)](versionv2.png)

# Visualisation page 2 :

![Exemple" (image)](Capture.png)

# Instalation et exportation de l'application à l'exterieur du containeur

```sh
docker pull diakarou/centosv2:centosv2
docker run -it centosv2
cd /opt/deployment/
./script.sh
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ID_containeur
```
# L'application accesible via:

```sh
Adresse_genere:8080
```
# Schema Systeme:

![Exemple" (image)](systeme.png)