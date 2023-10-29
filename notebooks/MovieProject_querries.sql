-- Movies Project - Querries

-- Presentación al cliente de las películas de la base de datos en idioma inglés
SELECT 
    f.film_id FilmID,
    f.title Title,
    f.description Sinopsis,
    f.length Movie_Duration,
    rating Rating,
    l.name Language
FROM
    film f
        INNER JOIN
    language l ON f.language_id = l.language_id
WHERE
    l.name = 'English';
    
