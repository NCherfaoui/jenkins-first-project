FROM openjdk:11-jre-slim

# Créez un répertoire pour l'application
WORKDIR /app

# Copiez le fichier JAR de votre application
COPY target/*.jar app.jar

# Commande pour exécuter l'application
ENTRYPOINT ["java", "-jar", "app.jar"]
