# Laboratorio Contenedores Docker

## Ejercicio 1

Dockeriza la aplicación dentro de [lemoncode-challenge](./), la cual está compuesta de 3 partes:

- Un front-end con Node.js
- Un backend en .NET (`dotnet-stack`) o en Node.js (`node-stack`) que utiliza un MongoDB para almacenar la información.
- El MongoDB donde se almacena la información en una base de datos.

Nota: como has podido comprobar, el directorio `lemoncode-challenge` tiene dos carpetas: `dotnet-stack` y `node-stack`. En ambos casos el frontend es el mismo, sólo cambia el backend. Usa el stack que prefieras.

### Requisitos del ejercicio

1. Los tres componentes deben estar en una red llamada `lemoncode-challenge`.
2. El backend debe comunicarse con el mongodb a través de esta URL `mongodb://some-mongo:27017`.
3. El front-end debe comunicarse con la api a través de `http://topics-api:5000/api/topics`.
4. El front-end debe estar mapeado con el host para ser accesible a través del puerto 8080.
5. El MongoDB debe almacenar la información que va generando en un volumen, mapeado a la ruta `/data/db`.
6. Este debe de tener una base de datos llamada `TopicstoreDb` con una colección llamada `Topics`. La colección `Topics` debe tener esta estructura:

```json
{
  "_id": { "$oid" : "5fa2ca6abe7a379ec4234883" },
  "topicName" : "Contenedores"
}
```

¡Añade varios registros!

```diff
+ ### PROPUESTA EJER 1
```
2. Dockerización del Backend y del Frontend. (dockerfile)
3. Crear un contenedor de mongo con un volumen (db_mongo) `docker run --name some-mongo -v db_mongo:/data/db -p 27017:27017 -d mongo:8.0.3`
4. Añadir registros en el mongo con el cliente mongo

## Ejercicio 2

Ahora que ya tienes la aplicación del ejercicio 1 dockerizada, utiliza Docker Compose para lanzar todas las piezas a través de este. Debes plasmar todo lo necesario para que esta funcione como se espera: la red que utilizan, el volumen que necesita MongoDB, las variables de entorno, el puerto que expone la web y la API. Además debes indicar qué comandos utilizarías para levantar el entorno, pararlo y eliminarlo.

```diff
+ ### PROPUESTA EJER 2
```
1. Crear el docker compose con todos los requerimientos.
2. El volumen es externo donde anteriormente se crearon registron en mongo
3. El enviroment en el repo es `env.template` para seguir las buenas prácticas. Cambiar nombre a `.env` para desarrollo local

4. Comando levantar entorno docker compose: `docker compose up -d --build`
5. Comando parar docker compose: `docker compose stop` 
6. Comando eliminar docker compose: `docker compose down`