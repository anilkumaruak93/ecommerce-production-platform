FROM mcr.microsoft.com/dotnet/sdk:10.0 AS builder

WORKDIR /source

COPY src/cartservice.csproj ./src/

RUN dotnet restore ./src/cartservice.csproj

COPY src ./src

RUN dotnet publish ./src/cartservice.csproj \
    --configuration Release \
    --output /app/publish \
    --no-restore \
    /p:UseAppHost=false

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime

WORKDIR /app

ENV ASPNETCORE_URLS=http://+:7070

COPY --from=builder /app/publish .

EXPOSE 7070

USER app

ENTRYPOINT ["dotnet", "cartservice.dll"]