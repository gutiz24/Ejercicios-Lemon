# Ingress

## Enunciado

Construir los distintos recursos de Kubernetes para generar un clúster, como el de la siguiente imagen:

```diff
+ ### PROPUESTA EJERCICIO DE DISTRIBUTED
```
1. Creación de deployment y servicio del "todo-front" en `todo-front.yaml` para ello se juntaron en un solo yaml el `deployment` y `service` de tipo ClusterIP
2. Creación de deployment y servicio del "todo-front" en `todo-api.yaml` para ello se juntaron en un solo yaml el `deployment` y `service` de tipo ClusterIP
3. Creación del objeto Ingress siguiendo la guía proporicionada de añadirlo a minikube `minikube addons enable ingress`, crear el manifiesto YAML de `ingress.yaml` y finalmente hacer un comando `minikube tunnel` para poder visualizar el resultado por el navegador, para ello debido a que hace falta un "hostname" entonces se usa la solución de `127-0-0-1.nip.io` que nos devolverá la resolución a localhost

### Para ello seguir los siguientes pasos:

### Paso 1. Crear todo-front.

Crear un `Deployment` para `todo-front`, usar el `Dockerfile` de este directorio **02-distributed/todo-front**, para generar la imagen necesaria. Notar que existe `ARG API_HOST` dentro del fichero `Dockerfile`, lo podemos omitir en este caso, sólo está ahí para poder probar el contenedor de Docker en local.

> **Nota**: Podéis usar la imagen `lemoncodersbc/lc-todo-api:v5-2024`

Al ejecutar un contenedor a partir de la imagen anterior, el puerto expuesto para http es el 80. 

Crear un `Cluster IP Service` que exponga `todo-front` dentro del clúster.

### Paso 2. Crear todo-api.

Crear un `Deployment` para `todo-api`, usar el `Dockerfile` de este directorio **02-distributed/todo-api**, para generar la imagen necesaria.

> **Nota**: Puedes usar la imagen `lemoncodersbc/lc-todo-front:v5-2024`

Al ejecutar un contenedor a partir de la imagen anaterior, el puerto por defecto es el 3000, pero se lo podemos alimentar a partir de  variables de entorono, las variables de entorno serían las siguientes

* **NODE_ENV** : El entorno en que se está ejecutando el contenedor, nos vale cualquier valor que no sea `test`
* **PORT** : El puerto por el que va a escuchar el contenedor

(_Opcional_) Crear un `ConfigMap` que exponga las variables de entorno anteriores. 

Crear un `Cluster IP Service` que exponga `todo-api` dentro del clúster.

### Paso 3. Crear un Ingress para acceder a los servicios del clúster

Crear un `Ingress` para exponer los servicios anteriormente creados. Como referencia para crear este controlardor con `minikube` tomar como referencia el siguiente ejemplo [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/)


