use store;

#Colsulta para obtener productos vendidos según el tipo de documento y número
SELECT s.date_sale, p.product_name, s.units_purchased FROM sales s
INNER JOIN products p ON s.id_product = p.id_product
INNER JOIN clients c ON s.id_client = c.id_client
WHERE c.id_type = 'Cedula de ciudanania' AND c.id_client = '123456';

#Consultar proveedor(es) según el nombre del producto
SELECT s.suplier_name, p.product_name FROM products p 
INNER JOIN suppliers s ON s.id_supplier = p.id_supplier
WHERE p.product_name = 'Lonja de bocadillo';

#Consulta para ver los productos del mas vendido al menos vendido
SELECT p.product_name, SUM(s.units_purchased) units FROM sales s 
INNER JOIN products p ON s.id_product = p.id_product
GROUP BY p.id_product
ORDER BY units DESC;