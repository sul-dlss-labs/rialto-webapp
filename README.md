# Rialto Webapp

This is the Blacklight frontend for Rialto.


## Dependencies

1. A database (RDS)
1. A Solr index


## Build

```
docker build -t suldlss/rialto-webapp:latest .
```

## Run

```
docker run -p 3000:3000 -e SOLR_URL=http://50.16.181.132/solr/rialto-dev suldlss/rialto-webapp:latest
```

## Deploy
```
docker push suldlss/rialto-webapp:latest
```
