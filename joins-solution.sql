-- ANSWER FOR QUESTION 1
SELECT * FROM "customers" 
JOIN "addresses" ON "customers"."id"="addresses"."customer_id";

-- ANSWER FOR QUESTION 2
SELECT * FROM "orders" 
JOIN "line_items" ON "orders"."id"="line_items"."order_id"
JOIN "products" ON "products"."id"="line_items"."product_id";

-- ANSWER FOR QUESTION 3
SELECT "warehouse" FROM "products"
JOIN "warehouse_product" ON "products"."id"="warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "products"."description"='cheetos';

-- ANSWER FOR QUESTION 4
SELECT "warehouse" FROM "products"
JOIN "warehouse_product" ON "products"."id"="warehouse_product"."product_id"
JOIN "warehouse" ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "products"."description"='diet pepsi';

-- ANSWER FOR QUESTION 5
SELECT "first_name", "last_name", "line_items"."quantity" FROM "customers" 
JOIN "addresses" ON "customers"."id"="addresses"."customer_id"
JOIN "orders" ON "addresses"."id"="orders"."address_id"
JOIN "line_items" ON "orders"."id"="line_items"."order_id";

-- ANSWER FOR QUESTION 6
SELECT COUNT(*) FROM "customers";

-- ANSWER FOR QUESTION 7
SELECT COUNT(*) FROM "products";

-- ANSWER FOR QUESTION 8
SELECT SUM("warehouse_product"."on_hand") FROM "products"
JOIN "warehouse_product" ON "products"."id"="warehouse_product"."product_id"
WHERE "products"."description"='diet pepsi';

-- ANSWER FOR QUESTION 9
SELECT "orders"."id" ,SUM("products"."unit_price") FROM "products"
JOIN "line_items" ON "line_items"."product_id"="products"."id"
JOIN "orders" ON "line_items"."order_id"="orders"."id"
GROUP BY "orders"."id";

-- ANSWER FOR QUESTION 10 AND 11
SELECT "customers"."first_name", COALESCE(SUM("products"."unit_price"), 0) AS TOTAL FROM "customers" 
FULL JOIN "addresses" ON "customers"."id"="addresses"."customer_id"
FULL JOIN "orders" ON "addresses"."id"="orders"."address_id"
FULL JOIN "line_items" ON "orders"."id"="line_items"."order_id"
FULL JOIN "products" ON "products"."id"="line_items"."product_id"
GROUP BY "customers"."first_name";
