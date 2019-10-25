FROM mcr.microsoft.com/dotnet/core/aspnet:2.1-stretch-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:2.1-stretch AS build
WORKDIR /src
COPY ["Blog.csproj", ""]
RUN dotnet restore "./Blog.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Blog.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Blog.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Blog.dll"]