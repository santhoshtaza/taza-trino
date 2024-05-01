FROM trinodb/trino:444
COPY ./iceberg.properties /etc/trino/catalog/iceberg.properties
COPY ./node.properties /etc/node.properties
EXPOSE 8080
