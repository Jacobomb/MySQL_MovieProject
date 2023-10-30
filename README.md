# MySQL MovieProject

Este trabajo ha sido elaborado para cumplir las necesidades del cliente Ficticio S.L.

Ficticio S.L., cliente de aquí en adelante, es dueño de una academia de idiomas y está interesado en ampliar su negocio y comprar el local que linda con su academia. Este local operaba como videoclub y su dueño P. Almodovar nos ha facilitado varias tablas con información de su negocio para facilitar la venta. 

La idea del cliente, autodenominado cinéfilo, es aprovechar parte del videoclub para añadir un aula más a su academia y además, ayudar a sus alumnos a mejorar y agilizar su aprendizaje alquilándoles películas en inglés.

A continuación se incluye una descripción del proceso llevado a cabo por nuestro equipo para facilitarle al cliente insights sobre la potencial adquisición.

## Limpieza tablas y conversión a BBDD

En primer lugar, mediante aplicación de funciones y métodos de Python se ha limpiado cada una de las tablas proporcionadas por P. Almodovar. Las tablas proporcionadas por este son las siguientes, junto con sus respectivas columnas:

* ``actor.csv`` - actor_id, first_name, last_name, last_update
* ``category.csv`` - category_id, name, last_update
* ``film.csv`` - film_id, title, description, release_year,	language_id, original_language_id, rental_duration,	rental_rate, length, replacement_cost, rating, special_features, last_update
* ``inventory.csv`` - inventory_id,	film_id, store_id, last_update
* ``language.csv`` - language_id, name, last_update
* ``old_HDD`` - first_name, last_name, title, release_year, category_id
* ``rental_csv`` - rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update

Para este apartado se ha empleado un notebook separado para cada tabla y se pueden encontrar en la carpeta **notebooks**.

