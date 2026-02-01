/* ===============================
   ANALYSE LOGISTIQUE & VENTES
   =============================== */

-- 1. Stock total par produit
SELECT 
    p.product_id,
    p.product_name,
    SUM(i.quantity) AS total_stock
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_stock DESC;


-- 2. Produits avec stock faible (alerte)
SELECT 
    p.product_name,
    SUM(i.quantity) AS stock_restants
FROM inventory i
JOIN products p ON i.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(i.quantity) < 20
ORDER BY stock_restants ASC;


-- 3. Quantité vendue par produit
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_vendu
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_vendu DESC;


-- 4. Ventes par client
SELECT 
    c.customer_name,
    COUNT(o.order_id) AS nombre_commandes,
    SUM(oi.quantity) AS quantite_totale
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY quantite_totale DESC;


-- 5. Mouvements de stock par type
SELECT 
    movement_type,
    COUNT(*) AS nb_operations,
    SUM(quantity) AS quantite_totale
FROM stock_movements
GROUP BY movement_type;
