SELECT
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name) AS customers,
	cus.city,
	cus.state,
	ord.order_date,
	SUM(ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name) AS sales_rep
FROM sales.orders AS ord
JOIN sales.customers AS cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items AS ite
ON ord.order_id = ite.order_id
JOIN production.products AS prod
ON ite.product_id = prod.product_id
JOIN production.categories AS cat
ON prod.category_id = cat.category_id
JOIN sales.stores AS sto
ON ord.store_id = sto.store_id
JOIN sales.staffs AS sta
ON ord.staff_id = sta.staff_id
GROUP BY
	ord.order_id,
	CONCAT(cus.first_name,' ',cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	prod.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name, ' ', sta.last_name);

SELECT * FROM sales.orders;
SELECT * FROM production.products;
SELECT * FROM sales.order_items;