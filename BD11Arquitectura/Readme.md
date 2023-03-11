# Arquitectura Data
## Práctica realizada con draw.io

---

**Práctica de Arquitectura Data del Bootcamp Big Data & Machine Learning de KeepCoding utilizando la herramienta drawio para el diagrama**

---

El directorio  contiene  tres archivos:
* En el archivo PracticaArquitecturaBigData.docx   Contiene la respuestas a la practica.
* El archivo Diagrama Arquitectura Data.drawio  Contiene el diagrama en el formato de drawio
* El archivo Diagrama Arquitectura Data.drawio.html  Contiene el diagrama en el formato html para un mejor visionado


## Enunciados ##
Big Data Architecture
Big Data Machine Learning Bootcamp

**1. Selección del dataset**

El dataset recomendado es éste, scrapeado de Airbnb. Vuestra primera misión será familiarizarnos con lo que ahí se recoge.

**2. Big Data Architecture**

Una vez cubiertas las bases de arquitectura big data y NoSQL la idea es preparar a los alumnos para que puedan ejecutar tareas de staging de datos para su tratado tomando en cuenta las herramientas que van a tener tanto en la nube como en local, potenciando la aplicación de técnicas en la nube preferiblemente.

Se va a valorar que los alumnos sepan gestionar clusters de hadoop y que entiendan para qué funciona cada componente de la arquitectura más allá de las herramientas base. 

En general la idea es analizar el dataset escogido y cubrir las siguientes necesidades:
Hacer staging de los datos para poder tratarlos
Proponer un enriquecimiento de los datos con scrapping y también hacer staging de los mismos
Conocer las técnicas y metodologías correctas para decidir cuándo utilizar SQL, NoSQL, search o cualquier otro motor de bases de datos o nada.
Mantener productos Big Data y/o NoSQL en la nube pública *opcional*

**2. Detalles de Práctica en Arquitectura**
Enunciado
Diseñar, especificar y desplegar (opcional) un data lake para el procesamiento de datos provenientes de fuentes de datos no estructurados extraídos mediante técnicas de scraping/crawling de sitios de dominio público.

Chuleta: https://docs.google.com/document/d/13wlZrr2I-kdnbECI0cxDhNTKJfP8UqOf5h6PYm2eLfk/edit

__Parte 1__
Un documento describiendo los procesos de diseño del DAaaS (https://colab.research.google.com/drive/1eC-oD_E_D-S1Y94nvtkSqJtMsUmc7w-y)
https://docs.new 
github/gitlab readme.txt o readme.md
docx
Utilizar una herramienta de diagramado como Google Draw o DIA para diseñar y especificar el flujo de datos y herramientas utilizadas
https://docs.google.com/drawings
http://dia-installer.de/ 
https://app.diagrams.net/ 
https://miro.com/login
Una servilleta en un bar

**Parte 2** [opcional]
Crear un scraper en Google Collaboratory a partir de un API o de un crawler con scrapy, que descargue los datos a un archivo de formato estructurado
Scrapy Basico: https://colab.research.google.com/drive/14GtdbO7v6Ed72kmLJwHK9SWSWYwhgoCV 
Links de dataset: Airbnb

**Parte 3** [opcional]
Utilizar un proveedor de Cloud para montar un cluster de al menos 3 contenedores configurados correctamente o hacerlo en el cluster local

**Parte 4** [opcional]
Subir los archivos extraídos durante la parte 2 al cluster de Hadoop e insertarlos en el HDFS.
Indicar pasos necesarios para realizar esto, dependiendo de la opción elegida en el Sprint 3
Realizar la tarea de procesamiento de datos sobre los datos extraídos utilizando WordCount.
Parte 5 [opcional]
Utilizar HIVE/Elastic/Kafka/Mongo para insertar los datos extraídos durante el Sprint 2 y realizar operaciones con los mismos.
Indicar los pasos y las decisiones de diseño respecto a cómo organizar los datos.

##Entregable
Para “entregar” esta práctica basta con crear un repositorio en gitlab, bitbucket o github con un README.md explicando el diseño general del data lake, las intenciones y tecnologías consideradas. 

En dicho repositorio deberíais incluir un diagrama hecho preferiblemente con Google Draw o DIA.

En dicho README deberíais incluir además una guía de ejecución de los pasos, cómo copiar los ficheros, procesarlos, etc.

El último día de clases veremos una pequeña demo de cómo hacer todo esto.




Marcos Salafranca Arnau                    Marzo de 2023