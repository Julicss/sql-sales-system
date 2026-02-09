-- Total gastado por cada cliente
SELECT 
  c.nombre,
  SUM(dp.cantidad * p.precio) AS total_gastado
FROM clientes c
JOIN pedidos pe ON c.id = pe.id_cliente
JOIN detalle_pedidos dp ON pe.id = dp.id_pedido
JOIN productos p ON dp.id_producto = p.id
GROUP BY c.nombre;

-- Productos más vendidos
SELECT 
  p.nombre,
  SUM(dp.cantidad) AS total_vendido
FROM productos p
JOIN detalle_pedidos dp ON p.id = dp.id_producto
GROUP BY p.nombre
ORDER BY total_vendido DESC;

-- Cantidad de pedidos por cliente
SELECT 
  c.nombre,
  COUNT(pe.id) AS cantidad_pedidos
FROM clientes c
LEFT JOIN pedidos pe ON c.id = pe.id_cliente
GROUP BY c.nombre;
