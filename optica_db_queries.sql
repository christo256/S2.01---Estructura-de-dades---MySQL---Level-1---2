SELECT c.name AS Cliente,
       COUNT(s.sale_id) AS Total_ventas
FROM sales s
JOIN clients c ON s.client_id = c.client_id
WHERE c.name = 'Laura Pérez'
  AND s.sale_date BETWEEN '2025-10-01' AND '2025-10-31'
GROUP BY c.name;

SELECT e.name AS Empleado,
       g.brand AS Marca,
       g.frame_type AS Tipo_montura,
       g.price AS Precio
FROM sales s
JOIN employees e ON s.employee_id = e.employee_id
JOIN glasses g ON s.glass_id = g.glass_id
WHERE e.name = 'Jordi Serra'
  AND YEAR(s.sale_date) = 2025;

SELECT DISTINCT p.name AS Proveedor,
       p.city AS Ciudad,
       p.phone AS Teléfono
FROM supplier p
JOIN glasses g ON p.supplier_id = g.supplier_id
JOIN sales s ON g.glass_id = s.glass_id;


