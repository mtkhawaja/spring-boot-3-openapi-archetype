# spring-boot-3-openapi-archetype

Maven Archetype for generating basic Java 17 Spring Boot 3 projects with OpenAPI support.

## Getting Started

![Java 17](https://img.shields.io/badge/java-17-orange)

### Build

```bash
#!/usr/bin/env bash
./mvnw clean install
```

### Usage

```bash
#!/usr/bin/env bash

mvn archetype:generate \
  -DarchetypeGroupId="com.muneebkhawaja" \
  -DarchetypeArtifactId="spring-boot-3-openapi-archetype" \
  -DarchetypeVersion="1.0.0" \
  -DgroupId="com.example" \
  -DartifactId="api" \
  -Dpackage="com.example.api" \
  -Dversion="0.0.1-SNAPSHOT" \
  -B

```

Alternatively, you can use docker and volume binding to generate the project:

```bash
#!/usr/bin/env bash

docker build -t mtkhawaja/spring-boot-3-openapi-archetype:latest .
docker run \
  -v ./:/opt/application/generated \
  -e GENERATED_GROUP_ID="com.example" \
  -e GENERATED_ARTIFACT_ID="api" \
  -e GENERATED_PACKAGE="com.example.api" \
  -e GENERATED_VERSION="0.0.1-SNAPSHOT" \
  mtkhawaja/spring-boot-3-openapi-archetype:latest

```

This will generate a project with the following directory structure:

```bash
#!/usr/bin/env bash

tree -a ./api
```

```plaintext
./api/
├── .gitignore
├── .mvn
│   └── wrapper
│       └── maven-wrapper.properties
├── Dockerfile
├── LICENSE
├── README.md
├── docker-compose.yaml
├── mvnw
├── mvnw.cmd
├── pom.xml
└── src
    ├── main
    │   ├── java
    │   │   └── com
    │   │       └── example
    │   │           └── api
    │   │               ├── Application.java
    │   │               └── ExampleController.java
    │   └── resources
    │       ├── application.yaml
    │       ├── logback.xml
    │       └── swagger.yaml
    └── test
        └── java
            └── com
                └── example
                    └── api
                        ├── ApplicationSmokeTest.java
                        └── ExampleControllerTest.java
```

## License

[Apache License Version 2.0](./LICENSE)