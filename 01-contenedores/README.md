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



## Ejercicio 2

Ahora que ya tienes la aplicación del ejercicio 1 dockerizada, utiliza Docker Compose para lanzar todas las piezas a través de este. Debes plasmar todo lo necesario para que esta funcione como se espera: la red que utilizan, el volumen que necesita MongoDB, las variables de entorno, el puerto que expone la web y la API. Además debes indicar qué comandos utilizarías para levantar el entorno, pararlo y eliminarlo.
