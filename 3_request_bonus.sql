-- Bonus SQL

-- 1. Trouver les 3 auteurs dont les livres ont généré le plus de chiffre d’affaires total.
SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS full_name,
    SUM(co.total_amount) AS total_revenue
FROM author a
LEFT JOIN book b ON b.author_id = a.author_id
LEFT JOIN customer_order co ON co.book_id = b.book_id
GROUP BY a.author_id
ORDER BY total_revenue DESC
LIMIT 3;

-- 2. Calculer le total des ventes par thème de livre, classé du plus au moins vendu (en montant).
SELECT 
    t.theme_name, 
    SUM(co.total_amount) AS total_revenue
FROM theme t
LEFT JOIN book b ON t.theme_id = b.theme_id
LEFT JOIN customer_order co ON b.book_id = co.book_id
GROUP BY t.theme_name
ORDER BY total_revenue DESC;

-- 3. Afficher pour chaque mois de l’année 2024 le nombre de commandes passées et le chiffre d’affaires total.


-- 4. Pour chaque auteur, calculer la moyenne des notes des livres écrits, y compris les auteurs dont livres n’ont pas encore d’avis (afficher NULL dans ce cas).


-- 5. Afficher les commandes les plus récentes pour chaque client (1 commande max par client).
