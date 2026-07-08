# ============================================================
# Stage 1: Build the Java application
# ============================================================
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY gradlew ./
COPY gradle ./gradle
COPY settings.gradle build.gradle ./

RUN chmod +x gradlew

RUN ./gradlew dependencies --no-daemon

COPY src ./src

RUN ./gradlew installDist --no-daemon

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM eclipse-temurin:21-jre AS runtime

WORKDIR /app

COPY --from=builder /app/build/install/hipstershop /app

EXPOSE 9555

USER 10001:10001

ENTRYPOINT ["/app/bin/AdService"]