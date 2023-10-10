# Proyectos 2

En este repositorio se encuentra el código de la primera entrega del proyecto del curso de desarrollo de applicaciones en la nube

# Estructura
````
├── .evaluator              # evaluador automatico
├── .github/workflows       # Configuración del pipelina
├── colecciones-api         # Colecciones postman
├── deployment              # Archivos de configuración kubernetes 
├── offers                  # Microservicios ofertas
├── public                  # Microservicio public
├── servicio_publicaciones  # Microservicio publicaciones
├── servicio_trayectos      # Microservicio trayectos
├── users                   # Microservicio usuarios
├── config.yaml             # Archivo de configuración de la entrega
├── docker-compose.yml      # docker compose
└── README.md               # Estás aquí
````


**.evaluator:** Contiene todos los recursos de la evaliacíon automatica
**.github/workflows:** Contiene todos los recursos de la configuración del pipeline
**colecciones-api:** Contiene todos los recursos de las collecciones de postman
**deployment:** Contiene todos los recursos para hacer el despliegue de aplicación en GCP
**offers:** Contiene todos los recursos del microservicio ofertas
**microservicio_pubicaciones:** Contiene todos los recursos del microservicio publicaciones
**microservicio_trayectos:** Contiene todos los recursos del microservicio trayectos
**users:** Contiene todos los recursos del microservicio usuarios
**config-yaml:** Archivo de configuración de la entrega
**docker-compose.yml:** Archivo de configuración de la entrega
**README.md:** Archivo de documentación



## Como ejecutar localmente la aplicación 
1. Asegurarse de tener Docker y docker-compose instalado. Si actualmente no lo tiene instalado dirigirse
   a la pagina de docker para las intrucciones de instalación de su sistema operativo
2. Ubicarse sobre este directorio y ejecutar docker-compose

```
docker-compose up --build
```


## Como ejecutar localmente un servicio

1. Situarse en el servicio a utilizar (publicaciones, usuarios...)
2. Crear y activar entorno virtual env
3. Instalar dependencias
3. Subir servicio
```
cd ./carpertadelservicio/
python3 -m venv ./
source ./venv/Scripts/activate
pip install -r requirements.txt
python wsgi.py
```

## Como desplegar la aplicación en GCP

1. Repositorios privados con las imagenes de contenedor de los microservicios(offers, public, servicio_publicaciones, servicio_trayectos, users) en Container Registry.
2. gcloud SDK para acceder a los servicios del proveedor Google Cloud Platform a partir de la consola. En caso de no tenerla instalada puede consultar el siguiente manual de instalación: https://cloud.google.com/sdk/docs/install
3. Herramienta de control de Kubernetes, kubectl. En caso de no tenerla instalada puede consultar el siguiente manual de instalación:https://kubernetes.io/es/docs/tasks/tools/install-kubectl/

```
cd ./deployment/
kubectl apply -f secrets.yaml
kubectl apply -f k8s-base-layer-deployment.yaml
kubectl apply -f k8s-new-services-deployment.yaml
kubectl apply -f k8s-ingress-deployments.yaml

```

## Tecnologias utilizadas
1. Postman
2. Python
3. Docker
4. Posgres
5. Flask
6. Kubernetes
7. GCP
8. gcloud SDK
9. kubectl
10. Git
