# Monolito en memoria

## Enunciado

Construir los distintos recursos de Kubernetes para generar un clúster, como el de la siguiente imagen:

```diff
+ ### PROPUESTA EJERCICIO DE MONOLITH-IN-MEM
```
1. Crear el fichero YAML `(deployment.yaml)` con variables de entorno agregadas
2. Crear un servicio `(service.yaml)` de tipo LoadBalancer en kubernetes para actue como loadbalancer
3. se sigue la guía de minikube para acceder a la todo-app `minikube tunnel`
4. Comprobar el funcionamiento dirigiendose al `External-IP` proporcionado por el Loadbalancer a través de un navegador. En este caso: `localhost:3000`

### Para ello seguir los siguientes pasos:

### Paso 1. Crear todo-app

Crear un `Deployment` para `todo-app`, usar el `Dockerfile` de este direetorio **todo-app**, para generar la imagen necesaria.

> Nota: Se puede usar la imagen `lemoncodersbc/lc-todo-monolith:v5-2024`

Al ejecutar un contenedor a partir de la imagen anaterior, el puerto por defecto es el 3000, pero se lo podemos alimentar a partir de  variables de entorono, las variables de entorno serían las siguientes

* **NODE_ENV** : El entorno en que se está ejecutando el contenedor, nos vale cualquier valor que no sea `test`
* **PORT** : El puerto por el que va a escuchar el contenedor.

### Paso 2. Acceder a todo-app desde fuera del clúster

Crear un `LoadBalancer service` para acceder al `Deployment` anteriormente creado desde fuera del clúster. Para poder utilizar un `LoadBalancer` con minikube seguir las instrucciones de este [artículo](https://minikube.sigs.k8s.io/docs/handbook/accessing/)
