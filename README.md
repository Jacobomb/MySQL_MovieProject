# MySQL MovieProject

![Imagen blockbuster](./images/blockb.jpg)

Este trabajo ha sido elaborado para cumplir las necesidades del cliente Ficticio S.L.

Ficticio S.L., *cliente* de aquí en adelante, es dueño de una academia de idiomas y está interesado en ampliar su negocio y comprar el local que linda con su academia. Este local operaba como videoclub y su dueño P. Almodovar nos ha facilitado varias tablas con información de su negocio para facilitar la venta. 

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

A continuación se muestra una descripción del proceso llevado a cabo en la limpieza de las tablas. Varias se asemejan a la de `actor.csv` y se incluye también una descripición particular para `film.csv` y `rental.csv`

#### `ACTOR.CSV`
La limpieza de esta tabla consistió en comprobar si todos los datos de la columna ``last_update`` eran iguales, y tras confirmarlo proceder a borrarla.

Después, tras comprobar que había todo valores únicos en la columna ``actor_id`` se procedió a comprobar si había algún duplicado en la dupla `first_name` y `last_name`. Aquí se dio con una actriz que aparecía dos veces por lo que se procedió a borrarlos.

Finalmente se guarda el csv limpio con un nombre que lo distinga del fichero original y se traslada también a SQL.

#### `FILM.CSV`
La limpieza de esta tabla cosistió en primer lugar en eliminar la columna de ``last_update`` por ser todos los valores iguales y no aportar nada de información. Se hizo lo mismo con la columna `release_year` ya que todas las películas de la base de datos estaban estrenadas en el año 2006.

A continuación se borró la columna `original-language-id` por contener todo valores nulos.

Después se pasó a trabajar la columna de `special_features`. Esta columna informaba de cuantas y qué tipo de extras se incluían en cada película. Al aplicar el método `unique()` se pudo ver que había un total de hasta 4 extras en cada película y en la tabla original constaba de una lista de cada "extra" separado por comas. Decidimos separar esta información en 4 columnas distintas donde se informaba con un 0 o un 1 de si dicha película contaba con la pertinente característica. 

Finalmente se pasa el database limpio a un csv y se manda también a la base de datos en SQL.

#### `RENTAL.CSV`
Una vez más, en el caso del fichero rental.csv se prescinde de la columna `last_update` por ser una columna llena de valores constantes.

Después, tras comprobar de que tipo es cada columna se decicidió cambiar las columnas `rental_date` y `return_date` a *datetime* y además, para facilitar los querries de la segunda parte del proyecto se decide almacenar en 4 columnas diferentes el año, mes, día y hora tanto de `rental_date` como de `return_date`. Esto quiere decir que se crean 8 columnas nuevas en esta tabla. 

Finalmente, e igual que con el resto de tablas, se pasa el dataframe limpio a un fichero csv y se manda a la base de datos en SQL.

## SQL - QUERRIES
Una vez se ha almacenado toda la información importante en sus respectivas tablas dentro de una única base de datos, se procede a explorar la información vía querries de SQL.

El lector puede encontrar en el fichero de tipo SQL en la carpeta **notebooks** titulada `MovieProject_querries`.

Algunas de las preguntas formuladas por el cliente son las siguientes:

1. "Ya que en mi academia enseñamos únicamente inglés, me interesa comprar las películas que estén en dicho idioma."

2.  "En mi academia tenemos cursos de inglés para adultos por la mañana y para niños y jovenes por la tarde a modo de extraescolares. Como los jóvenes ya usan exclusicamente Netflix y plataformas de streaming online, no quiero películas para niños."

3.  "La mejor manera de aprender inglés es, además de escuchar a nativos hablando el idioma, leer a la vez para interiorizar la pronunciación y significado de determinadas palabras. Para ello, me interesa que las películas que tenga entre mi oferta, saber cuales incluyen comentarios."

4.  "El vendedor del videoclub tiene, además del establecimiento al lado de mi academia, otra tienda en el centro de la ciudad. Me gustaría saber cuantas copias hay en total de cada película entre ambas tiendas."

5.  "Yo sé que el antiguo dueño del videoclub abría su tienda 24/7, sin embargo a mi me interesa mantener mi horario de apertura de 6-18h. Me gustaria saber a qué hora y que tipos de películas vendía él según la hora del día con el objetivo de saber si necesito algún empleado más o si con mis profesores bastaría."

6.  "Me interesa saber cuantos clientes tenía P. Almodovar y cuantas películas solían alquilar, con la idea de ganar más clientes en mi academia y además saber si el negocio del alquiler es rentable. ¿Me podeis decir cuántos clientes tenía y si eran recurrentes?"

Se anima al lector a entrar en el fichero de tipo SQL para comprobar la sintaxis de las querries.
