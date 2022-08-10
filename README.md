# GoodFood App

![Java version](https://img.shields.io/badge/Java-11-red)
![Maven version](https://img.shields.io/badge/Maven-3.6.3-blue)
![Spring version](https://img.shields.io/badge/Spring-5.3.18-brightgreen)
![Spring security version](https://img.shields.io/badge/Spring%20security-5.6.2-lightgrey)
![PgSQL version](https://img.shields.io/badge/PostgreSQL-14.4-blue)

### Prerequisite

- Database name is `goodfood`

- You will need to launch application with the following argument (salt for jasypt encryption): `-Djasypt.encryptor.password=Ces!123`

- You can execute the  sql script in `/main/resources/sql/insert_goodfood.sql` to populate database

`Password for customers accounts is their first name in lowercase, e.g: john`

`Password for restaurants accounts is their country in lowercase, e.g: belgium`

- Swagger documentation can be accessed at: `http://localhost:8090/swagger-ui/index.html`
