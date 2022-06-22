##GoodFood App

### Prerequisite

- Database name is `goodfood`

- You will need to launch application with the following argument (salt for jasypt encryption): `-Djasypt.encryptor.password=Ces!123`

- You can execute the  sql script in `/main/resources/sql/insert_goodfood.sql` to populate database

`Password for customers accounts is their first name in lowercase, e.g: john`

`Password for restaurants accounts is their country in lowercase, e.g: belgium`

- Swagger documentation can be accessed at: `http://localhost:8090/swagger-ui/index.html`
