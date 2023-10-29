-- Movies Project - Querries
/*
Introducción del proyecto
El cliente, dueño de una academia de idiomas y autodefinido cinéfilo, está interesado en quedarse con el videoclub con el que linda su actual negocio.
Le interesa para poder añadir un aula más y par ampliar su negocio al alquiler de películas para sus clientes, ya que defiende
firmemente la idea de ver películas en inglés para mejorar el nivel de sus alumnos. El dueño del videoclub, que cuenta con dos
establecimientos, nos ha proporcionado varias tablas con información de su negocio para facilitar la venta.
*/
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
    
    /* El cliente nos informa que la academia de inglés tiene una mayoría de jubilados por la mañana
    y clases extraescolares por la tarde a niños. Sin embargo, como estos últimos ya solo usan Netflix y 
    plataformas online, no le interesa tener películas de niños. Decide retirar las pelíclas con rating
    G: General Audiences y quedarse con PG (Parental Guide), PG-13 (Parents Strongly Cautioned), R (Restricted)
    y NC-17 (Adults Only).
    
    Mostramos que películas entran dentro de este filtro:
    */
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
    l.name = 'English' AND Rating = 'PG-13'
        OR Rating = 'R'
        OR Rating = 'NC-17'
;

-- Quedan 628 películas catalogadas para mayores de 13 años y adultos, todas en inglés

/* Dado que es útil para los alumnos leer comentarios de las películas para poder interiorizar mejor
el inglés y así aprender mejor el idioma, se quiere que incluir la columna que nos dice si la película 
incluye comentarios o no.
*/
SELECT 
    f.film_id FilmID,
    f.title Title,
    f.description Sinopsis,
    f.length Movie_Duration,
    rating Rating,
    f.commentaries_feature Commentaries,
    l.name Language
FROM
    film f
        INNER JOIN
    language l ON f.language_id = l.language_id
WHERE
    l.name = 'English'
        AND Rating = 'PG-13'
        OR Rating = 'R'
        OR Rating = 'NC-17';
        
/*
Nuestro cliente quiere saber cuantas películas tiene en total contando el inventario en los dos centros de alquiler.
*/
SELECT 
    f.film_id FilmID, f.title Title, COUNT(i.film_id) Qty
FROM
    film f
        INNER JOIN
    language l ON f.language_id = l.language_id
        INNER JOIN
    inventory i ON f.film_id = i.film_id
WHERE
    l.name = 'English' AND Rating = 'PG-13'
        OR Rating = 'R'
        OR Rating = 'NC-17'
GROUP BY f.film_id , f.title;

/*
Se da cuenta de que el dueño de la tienda no tiene las 623 películas en inventario, solo un total de 223. De las que 
cumplen sus requísistos de edad e idioma estas son 121 películas con varias copias de cada una.
*/

-- Estudio horario de los alquileres
/*
Al cliente le interesa saber que horquillas horarias son las que suelen emplear los viejos clientes del videoclub
para saber si debe emplear a una persona o si los mismos profesores de la academia podrían hacer esta labor.

Vamos a definir 4 rangos horarios y contar cuantos alquileres se hacen en dichos rangos. Parece que la tienda de alquiler
tenía unos horarios de 24/7 por lo que vamos a separar la jornada en 4, cuando realmente la academia de idiomas solo abre
de 6-18h.

0-6h
6-12h
12-18h
18-24h
*/

-- 00-6h
SELECT 
    COUNT(r.rental_id) Qty, f.rating Rating
FROM
    rental r
        INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
        INNER JOIN
    film f ON i.film_id = f.film_id
WHERE
    r.rental_time > 0 AND r.rental_time < 6
        AND f.rating != 'G'
GROUP BY f.rating;

-- 6-12h
SELECT 
    COUNT(r.rental_id) Qty, f.rating Rating
FROM
    rental r
        INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
        INNER JOIN
    film f ON i.film_id = f.film_id
WHERE
    r.rental_time > 6 AND r.rental_time <= 12
        AND f.rating != 'G'
GROUP BY f.rating;

-- 12-18h
SELECT 
    COUNT(r.rental_id) Qty, f.rating Rating
FROM
    rental r
        INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
        INNER JOIN
    film f ON i.film_id = f.film_id
WHERE
    r.rental_time > 12 AND r.rental_time <= 18
        AND f.rating != 'G'
GROUP BY f.rating;

-- 18-24h
SELECT 
    COUNT(r.rental_id) Qty, f.rating Rating
FROM
    rental r
        INNER JOIN
    inventory i ON r.inventory_id = i.inventory_id
        INNER JOIN
    film f ON i.film_id = f.film_id
WHERE
    r.rental_time > 18 AND r.rental_time <= 24
        AND f.rating != 'G'
GROUP BY f.rating;


    
