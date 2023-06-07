FROM maven:3.9.2-eclipse-temurin-17 AS source
ENV APPLICATION_HOME=/opt/application/
WORKDIR "${APPLICATION_HOME}"
COPY pom.xml ./pom.xml
RUN mvn dependency:resolve-plugins dependency:go-offline
COPY src src
RUN mvn clean install
WORKDIR "${APPLICATION_HOME}/generated"
CMD mvn archetype:generate \
  -DarchetypeGroupId="com.muneebkhawaja" \
  -DarchetypeArtifactId="spring-boot-3-openapi-archetype" \
  -DarchetypeVersion="0.0-1-SNAPSHOT" \
  -DgroupId=${GENERATED_GROUP_ID:-"com.example"} \
  -DartifactId=${GENERATED_ARTIFACT_ID:-"api"} \
  -Dpackage=${GENERATED_PACKAGE:-"com.example.api"} \
  -Dversion=${GENERATED_VERSION:-"0.0.1-SNAPSHOT"} \
  -B