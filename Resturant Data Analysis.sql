-- RESTURANT ORDER ANALYSIS --

-- 1) Combine menu_items & order_details tables.
SELECT * 
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id;

-- 2) Least & most ordered items???
SELECT item_name, COUNT(item_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name
ORDER BY num_purchases DESC;
-- Least ordered: Chicken Tacos Most ordered: Hamburger, closely followed by Edamame...

-- Follow Up -- What Categories were they in??
SELECT item_name, category, COUNT(item_id) AS num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;
-- Least ordered items tend to be Mexican food.
-- American and Asian items doing best.

-- Top 5 orders that spent the most money?
SELECT order_id, SUM(price) AS total_bill
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_bill DESC
LIMIT 5;

-- Details of highest bill
SELECT category, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
-- Highest bill ordered mostly Italian food.

-- Details of 5 highest bills
SELECT category, order_id, COUNT(item_id) AS num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON od.item_id = mi.menu_item_id
WHERE order_id 	IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
-- Highest bills ordering Italian food the most.
