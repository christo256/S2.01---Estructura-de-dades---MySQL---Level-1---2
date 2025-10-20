SELECT 
    SUM(od.quantity) AS total_drinks_sold
FROM 
    order_details od
JOIN 
    products p ON od.product_id = p.id
JOIN 
    categories c ON p.category_id = c.id
JOIN 
    orders o ON od.order_id = o.id
JOIN 
    customers cu ON o.customer_id = cu.id
JOIN 
    locations l ON cu.location_id = l.id
WHERE 
    c.name = 'Begudes'
    AND l.name = 'Barcelona';
    
    
    SELECT 
    e.first_name,
    e.last_name,
    COUNT(d.order_id) AS total_orders_delivered
    FROM employees e
    LEFT JOIN deliveries d on e.id = d.rider_id
    LEFT JOIN orders o ON d.order_id = o.id
    WHERE e.dni = '87654321B'
    AND o.order_type = 'delivery'
    GROUP BY e.id, e.first_name, e.last_name
