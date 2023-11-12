# Proyectos movil final

En este repositorio se encuentra el codigo de la aplicación movil ABC Jobs.

# Estructura

```
├── android                 # Codigo nativo android
├── .github/workflows       # Configuración del pipeline
├── lib                     # Archivos fuentes de la aplicación que pueden ser compilados a diferentes plataformas
├── linux                   # Archivos de la aplicación para linux
├── macos                   # Archivos de la aplicación para macos
├── web                     # Archivos de la aplicaión para web
├── windows                 # Archivos de la aplicación para windows
├── test                    # Archivos de test unitarios
├── pubspec.yaml            # Archivo de configuración de las dependencias necesarias para correr la aplicación
└── README.md               # Estás aquí
```

## Como ejecutar la aplicación

1. Tener instalado el SDK flutter versión 3.13.9
2. Ejecutar ´flutter doctor´ para revisar que la instalación se hizó de manera correcta.
3. Instalar plugin `Flutter` en Visual Studio Code
4. En el directorio raiz ejecutar `flutter gen-l10n`
5. Escoger el ambiente de ejecución movil
6. Encontrar en el directorio lib el archivo main.dart y darle run en la función main

## Como ejecutar las pruebas

1. Posicionarse en el directorio raiz y ejecutar `dart run build_runner build`
2. Posicionarse en el directorio raiz y ejecutar `flutter test --coverage`
3. Para ver el coverage, ejecutar `flutter run test_cov_console`

## Tecnologias utilizadas

1. Flutter 3.9.13
2. Git
