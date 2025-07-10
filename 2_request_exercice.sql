-- 1. Affichez la somme totale des stocks de livres.
SELECT SUM(stock) AS total_stock
FROM book;

-- 2. Affichez pour chaque auteur le nombre de livres écrits.
SELECT a.first_name, a.last_name, COUNT(b.book_id) AS nb_books
FROM author a
JOIN book b ON a.author_id = b.author_id
GROUP BY a.author_id;

-- 3. Affichez le titre du livre, nom complet de l’auteur, et nom du thème.
SELECT b.title, CONCAT(a.first_name, ' ',a.last_name) AS full_name, t.theme_name
FROM book b
JOIN author a ON a.author_id = b.author_id
JOIN theme t ON t.theme_id = b.theme_id;

-- 4. Affichez toutes les commandes d’un client donné avec titre du livre et date de commande.
SELECT co.order_id, b.title, co.order_date
FROM customer_order co
JOIN book b ON b.book_id = co.book_id
JOIN customer c ON c.customer_id = co.customer_id
WHERE c.customer_id = 4;

-- 5. Affichez la moyenne des notes pour chaque livre ayant au moins 3 avis.
SELECT b.title, AVG(r.rating) AS average_rating
FROM review r
JOIN book b ON b.book_id = r.book_id
GROUP BY b.title
HAVING COUNT(r.review_id) >= 3;


-- 6. Affichez le nombre total de commandes passées par chaque client (email+nb commandes.
SELECT c.email, COUNT(co.order_id) AS total_order
FROM customer c
LEFT JOIN customer_order co ON co.customer_id = c.customer_id
GROUP BY c.customer_id

-- 7. Affichez les titres des livres qui n’ont jamais été commandés.
SELECT b.title, COUNT(co.order_id) AS total_order
FROM book b
LEFT JOIN customer_order co ON b.book_id = co.book_id
GROUP BY b.book_id
HAVING COUNT(co.order_id) = 0;

-- 8. Affichez le chiffre d’affaires total généré par chaque auteur (somme des prix des livres commandés).
SELECT 
  CONCAT(a.first_name, ' ', a.last_name) AS full_name,
  COALESCE(SUM(co.total_amount), 0) AS total_revenue
FROM author a
LEFT JOIN book b ON b.author_id = a.author_id
LEFT JOIN customer_order co ON co.book_id = b.book_id
GROUP BY a.author_id
ORDER BY total_revenue DESC;