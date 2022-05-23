##GoodFood App

### Prerequisite

- Database name is `goodfood`

- You will need to launch application with the following argument (salt for jasypt encryption): `-Djasypt.encryptor.password=Ces!123`

- PostgreSQL script to add a new restaurant (password is already encrypted with Bcrypt algorithm, decrypted password is `test`): 
>INSERT INTO public.restaurant(
  id, name, email, password, street, city, zipcode, region, country, role)
  VALUES (default, 'restaurant test', 'restaurant.test@restaurant.be', '$2y$10$aBKLQsWvUbvwFucpUwI.qebt33n0KtPEvsHFtoxi5dCZ5BAZ.Scmi' , '1th main street', 'Bruxelles', '12345', 'Region test', 'BELGIQUE', 'ROLE_RESTAURANT');`

- PostgreSQL script to add a new customer (password is already encrypted with Bcrypt algorithm, decrypted password is `test`):
>INSERT INTO public.customer(
id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role)
VALUES (default, 'doe', 'john', 'john.doe@company.org', '$2y$10$aBKLQsWvUbvwFucpUwI.qebt33n0KtPEvsHFtoxi5dCZ5BAZ.Scmi', '123456789', '30th main street', 'Bruxelles', '12345', 'Region test', 'BELGIQUE', 1, '1970-01-01 08:00:00 America/Los_Angeles', '1970-01-01 08:00:00 America/Los_Angeles', 'ROLE_CUSTOMER');

## :warning: You'll have to execute Restaurant script first due to foreign key constraint in Customer table :warning:

