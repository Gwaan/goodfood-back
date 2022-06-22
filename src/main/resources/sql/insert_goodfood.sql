TRUNCATE allergen RESTART IDENTITY CASCADE;
TRUNCATE article RESTART IDENTITY CASCADE;
TRUNCATE customer RESTART IDENTITY CASCADE;
TRUNCATE customer_order RESTART IDENTITY CASCADE;
TRUNCATE ingredient RESTART IDENTITY CASCADE;
TRUNCATE ingredient_allergen RESTART IDENTITY CASCADE;
TRUNCATE order_product RESTART IDENTITY CASCADE;
TRUNCATE product RESTART IDENTITY CASCADE;
TRUNCATE product_ingredient RESTART IDENTITY CASCADE;
TRUNCATE promo_code RESTART IDENTITY CASCADE;
TRUNCATE restaurant RESTART IDENTITY CASCADE;
TRUNCATE restaurant_product RESTART IDENTITY CASCADE;
TRUNCATE supplier RESTART IDENTITY CASCADE;
TRUNCATE supplier_article RESTART IDENTITY CASCADE;
TRUNCATE vat RESTART IDENTITY CASCADE;

INSERT INTO public.allergen(
id, name)
VALUES (default, 'Nuts');
INSERT INTO public.allergen(
id, name)
VALUES (default, 'Milk');
INSERT INTO public.allergen(
id, name)
VALUES (default, 'Gluten');

INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Peanut', true, true, true, 'Peanuts', 2.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price,path_picture)
VALUES (default, 'Chicken', true, true, false, 'Chicken', 10.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Pork sausage', true, false, false, 'Pork sausage', 8.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Bread', true, true, true, 'Bread', 3.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Mustard', true, true, true, 'Mustard', 1.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Ground beef', true, true, false, 'Ground beef', 10.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Cheese', true, true, true, 'Cheese', 4.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Potatoes', true, true, true, 'Potatoes', 2.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Bacon', true, false, false, 'Pork bacon', 6.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Coffee', true, true, true, 'Coffee', 3.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Onion', true, true, true, 'Onion', 3.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Eggs', true, true, true, 'Eggs', 2.00, null);
INSERT INTO public.ingredient(
id, name, is_in_stock, is_pork_free, is_vegan_friendly, description, price, path_picture)
VALUES (default, 'Milk', true, true, true, 'Milk', 2.00, null);

INSERT INTO public.ingredient_allergen(
id, ingredient_id, allergen_id)
VALUES (default, 1, 1);
INSERT INTO public.ingredient_allergen(
id, ingredient_id, allergen_id)
VALUES (default, 4, 3);
INSERT INTO public.ingredient_allergen(
id, ingredient_id, allergen_id)
VALUES (default, 7, 2);
INSERT INTO public.ingredient_allergen(
id, ingredient_id, allergen_id)
VALUES (default, 13, 2);

INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Chicken with peanuts', 15.50, null, 'Chicken with peanuts dish', true, 'DISH');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Hot dog', 16.00, null, 'Hot dog', true, 'DISH');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Hamburger', 20.00, null, 'Hamburger', true, 'DISH');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'French fries', 5.00, null, 'French fries', true, 'SNACK');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Onion rings', 5.00, null, 'Onion rings', true, 'SNACK');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Tiramisu', 10.00, null, 'Tiramisu', true, 'DESSERT');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Pancakes', 10.00, null, 'Pancakes', true, 'DESSERT');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Lemonade', 4.00, null, 'Lemon lemonade', true, 'DRINK');
INSERT INTO public.product(
id, name, price, path_picture, description, is_on_sale, category)
VALUES (default, 'Plain water', 3.00, null, 'Plain water', true, 'DRINK');

INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 1, 1);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 1, 2);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 2, 3);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 2, 4);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 2, 5);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 3, 5);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 3, 6);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 3, 7);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 3, 9);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 4, 8);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 5, 11);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 6, 7);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 6, 10);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 6, 12);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 7, 12);
INSERT INTO public.product_ingredient(
id, product_id, ingredient_id)
VALUES (default, 7, 13);

INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Peanut', 'Peanuts', 1.50, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Chicken', 'Chicken', 8.00, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Pork sausage', 'Pork sausage', 6.00, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Bread', 'Bread', 2.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Mustard', 'Mustard', 0.50, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Ground beef', 'Ground beef', 7.50, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Cheese', 'Cheese', 3.00, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Potatoes', 'Potatoes', 1.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Bacon', 'Pork bacon', 5.00, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Coffee', 'Coffee', 1.00, null, true);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Onion', 'Onion', 2.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Eggs', 'Eggs', 1.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Milk', 'Milk', 0.50, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Orange', 'Orange', 2.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Raspberries', 'Raspberries', 3.00, null, false);
INSERT INTO public.article(
id, name, description, price_ht, path_picture, is_packaged)
VALUES (default, 'Lamb', 'Lamb', 7.00, null, true);

INSERT INTO public.supplier(
id, name, email, phone, street, city, zipcode, region, country)
VALUES (default, 'French supplier', 'french@supplier.fr', '0556000000', '1 rue Sainte Catherine', 'BORDEAUX', '33000', 'Nouvelle Aquitaine', 'FRANCE');
INSERT INTO public.supplier(
id, name, email, phone, street, city, zipcode, region, country)
VALUES (default, 'Belgium supplier', 'belgium@supplier.be', '0837334179', '1 rue de l''Abbaye', 'BRUXELLES', '1000', 'Région Bruxelloise', 'BELGIUM');
INSERT INTO public.supplier(
id, name, email, phone, street, city, zipcode, region, country)
VALUES (default, 'Luxembourg supplier', 'luxembourg@supplier.lu', '367601', '1 rue des Glacis', 'LUXEMBOURG', 'L-2090', 'Luxembourg', 'LUXEMBOURG');

INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 1);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 2);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 3);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 4);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 5);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 6);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 7);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 8);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 9);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 10);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 11);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 12);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 13);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 14);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 15);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 1, 16);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 1);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 2);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 3);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 4);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 5);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 6);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 7);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 8);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 9);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 10);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 11);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 12);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 13);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 14);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 15);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 2, 16);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 1);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 2);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 3);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 4);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 5);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 6);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 7);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 8);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 9);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 10);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 11);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 12);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 13);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 14);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 15);
INSERT INTO public.supplier_article(
id, supplier_id, article_id)
VALUES (default, 3, 16);

INSERT INTO public.promo_code(
id, code_key, percentage_on_order, is_active, created_at, end_at)
VALUES (default, 'DISCOUNT10', 10.00, true, '2022-06-16 16:00:18.674 UTC', '2022-08-16 16:00:18.674 UTC');

INSERT INTO public.restaurant(
id, name, email, password, street, city, zipcode, region, country, role, supplier_id)
VALUES (default, 'Goodfood france restaurant', 'france.restaurant@goodfood.fr', '$2y$10$92RSbi/rNojHK/N04Ef/aONmumt7/p7XqWRi/b6jIA.wWPor4Rqoa', '2 rue Sainte Catherine', 'BORDEAUX', '33000', 'Nouvelle Aquitaine', 'FRANCE', 'ROLE_RESTAURANT', 1);
INSERT INTO public.restaurant(
id, name, email, password, street, city, zipcode, region, country, role, supplier_id)
VALUES (default, 'Goodfood belgium restaurant', 'belgium.restaurant@goodfood.be', '$2y$10$MSTskPDHqN9jeP4DZnhFnu3WNc8YfiZPJjOOGi3IrtHbejgpaB7om', '2 rue de l''Abbaye', 'BRUXELLES', '1000', 'Région Bruxelloise', 'BELGIUM', 'ROLE_RESTAURANT', 2);
INSERT INTO public.restaurant(
id, name, email, password, street, city, zipcode, region, country, role, supplier_id)
VALUES (default, 'Goodfood luxembourg restaurant', 'luxembourg.restaurant@goodfood.lu', '$2y$10$QnMvgLbOhbkm.SEm4guhjuPHXhrLrXnYMpR4XfsHrnqMeKbrdjx7y', '2 rue des Glacis', 'LUXEMBOURG', 'L-2090', 'Luxembourg', 'LUXEMBOURG', 'ROLE_RESTAURANT', 3);

INSERT INTO public.customer(
id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role)
VALUES (default, 'Doe', 'John', 'john.doe@mail.fr', '$2y$10$LaqrLZtNdWEyURYe2DjeO.oWKOqtk8obveiRMep8GvnxmRgSBUBJ2', '0556000001', '3 rue Sainte Catherine', 'BORDEAUX', '33000', 'Nouvelle Aquitaine', 'FRANCE', 1, '2022-06-16 16:00:18.674 UTC', null, 'ROLE_CUSTOMER');
INSERT INTO public.customer(
id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role)
VALUES (default, 'Jones', 'Alice', 'alice.jones@mail.be', '$2y$10$djbjSgiO9elQrFKfBGQ8T.9AAF1OuvO1kFs9PNqFdth7Hjqbti0yK', '0837334180', '3 rue de l''Abbaye', 'BRUXELLES', '1000', 'Région Bruxelloise', 'BELGIUM', 2, '2022-06-16 16:00:18.674 UTC', null, 'ROLE_CUSTOMER');
INSERT INTO public.customer(
id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role)
VALUES (default, 'Smith', 'Luke', 'luke.smith@mail.lu', '$2y$10$C5mND0daMG/3rworywKHz.Qa4oExtAZt.Pyj1XQEM3tyJJHrbPZYi', '367602', '3 rue des Glacis', 'LUXEMBOURG', 'L-2090', 'Luxembourg', 'LUXEMBOURG', 3, '2022-06-16 16:00:18.674 UTC', null, 'ROLE_CUSTOMER');
INSERT INTO public.customer(
id, lastname, firstname, email, password, phone, street, city, zipcode, region, country, restaurant_favorite_id, created_at, updated_at, role)
VALUES (default, 'Johnson', 'Alicia', 'alicia.johnson@mail.fr', '$2y$10$wH3SjIZcdZxxL73Yfw.aEejlcfEOLX.fSt9V8NeFmgw0QEqLxeD7C', '0556000002', '4 rue Sainte Catherine', 'BORDEAUX', '33000', 'Nouvelle Aquitaine', 'FRANCE', null, '2022-06-16 16:00:18.674 UTC', null, 'ROLE_CUSTOMER');

INSERT INTO public.customer_order(
id, total_ttc, is_payed, created_at, updated_at, payed_at, customer_id, restaurant_id, promo_code_id, status)
VALUES (default, 29.00, true, '2022-06-16 16:00:18.674 UTC', null, '2022-06-16 16:00:18.674 UTC', 1, 1, 1, 'FINISHED');
INSERT INTO public.customer_order(
id, total_ttc, is_payed, created_at, updated_at, payed_at, customer_id, restaurant_id, promo_code_id, status)
VALUES (default, 28.50, true, '2022-06-16 16:00:18.674 UTC', null, '2022-06-16 16:00:18.674 UTC', 2, 2, null, 'FINISHED');
INSERT INTO public.customer_order(
id, total_ttc, is_payed, created_at, updated_at, payed_at, customer_id, restaurant_id, promo_code_id, status)
VALUES (default, 31, true, '2022-06-16 16:00:18.674 UTC', null, '2022-06-16 16:00:18.674 UTC', 3, 3, null, 'PENDING');

INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 1, 3);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 1, 4);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 1, 8);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 2, 1);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 2, 7);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 2, 9);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 3, 2);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 3, 5);
INSERT INTO public.order_product(
id, order_id, product_id)
VALUES (default, 3, 6);

INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 1);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 2);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 3);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 4);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 5);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 6);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 7);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 8);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 1, 9);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 1);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 2);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 3);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 4);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 5);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 6);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 7);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 8);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 2, 9);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 1);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 2);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 3);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 4);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 5);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 6);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 7);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 8);
INSERT INTO public.restaurant_product(
id, restaurant_id, product_id)
VALUES (default, 3, 9);

INSERT INTO public.vat(
id, percentage)
VALUES (default, 5.50);
INSERT INTO public.vat(
id, percentage)
VALUES (default, 10.00);
