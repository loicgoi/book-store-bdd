-- 1. Afficher prénom et nom de tous les auteurs
-- On utilise SELECT pour choisir les colonnes à afficher.
-- FROM indique la table d'où proviennent les données.
SELECT first_name, last_name
FROM author;

-- 2. Afficher auteurs nés entre 1950 et 1980
-- Avec WHERE, on filtre les résultats selon une condition.
-- On borne avec BETWEEN et AND pour inclure les années 1950 et 1980.
SELECT first_name, last_name
FROM author
WHERE birth_year BETWEEN 1950 AND 1980;

-- 3. Afficher 3 clients les plus récents (par date d’inscription)
-- On utilise ORDER BY pour trier, ici on veut les résultats par date d'inscription.
-- LIMIT 3 permet de ne garder que les 3 premiers résultats.
-- On utilise DESC pour trier par ordre décroissant, donc les plus récents en premier
SELECT email, join_date
FROM customer
ORDER BY join_date DESC
LIMIT 3;

-- 4. Liste commandes avec id et montant total renommé "Montant"
-- On utilise AS pour renommer une colonne dans le résultat.
-- Ici, on renomme total_amount en "Montant" pour une meilleure lisibilité.
SELECT order_id, total_amount 
AS "Montant"
FROM customer_order;

-- 5. Livres avec stock < 20
SELECT title, stock
FROM book
WHERE stock < 20;

-- 6. Avis avec note >= 4, afficher note et commentaire
SELECT rating, comment
FROM review
WHERE rating >= 4;

-- 7. Titres des livres avec année de publication, tri décroissant par année
-- le mot-clé DESC permet de trier par ordre décroissant.
-- Si on voulait l'inverse, on utiliserait ASC.
SELECT title, publication_year
FROM book
ORDER BY publication_year DESC;

-- 8. Commandes au mois de mars 2024
-- On utilise le format 'YYYY-MM-DD' pour les dates.
SELECT order_id, order_date
FROM customer_order
WHERE order_date BETWEEN '2024-03-01' AND '2024-03-31';


-- 9. Livres dont le titre contient "secret"
-- symbole % avant ou après le mot pour indiquer qu'il peut y avoir d'autres caractères.
-- Sans ça, le 'secret' serait recherché exactement.
SELECT title
FROM book
WHERE title LIKE '%secret%';

