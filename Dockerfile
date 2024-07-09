# Utiliser une image de base Java
FROM openjdk:11-jre-slim

# Copier le fichier jar de votre application dans l'image
COPY target/myapplication-0.0.1-SNAPSHOT.jar monapp.jar

# Exécuter votre application Java lors du démarrage du conteneur
ENTRYPOINT ["java","-jar","/monapp.jar"]