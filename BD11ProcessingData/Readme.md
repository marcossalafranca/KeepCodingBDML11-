# Big Data Processing
## Práctica realizada con PySpark

---

**Práctica de Big Data Processing del Bootcamp Big Data & Machine Learning de KeepCoding utilizando la herramienta PySpark en un notebook de jupyter**

---

El directorio  contiene  dos archivos y una carpeta:
* En el archivo Ejercicios.jpynb   Contiene la respuestas a la practica en un notebook de Jupyter.
* El archivo Keep Coding - SparkProject.pdf  Contiene las preguntas de la practica.
* La carpeta Datasets  Contiene los datasets que se utilizaron en la practica.

## Medium ##
Conclusiones a la practica de processing data

En este código en Python utilizando PySpark, se realiza un análisis de datos del World Happiness Report para determinar el país más feliz en el 2021.
Primero se importan las librerías necesarias y se inicializa la sesión de Spark. Luego se leen los dos archivos CSV, uno correspondiente al World Happiness Report del 2021 y otro para datos anteriores.
Para determinar el país más feliz del 2021, se ordena el DataFrame por puntuaje de felicidad de manera descendente y se selecciona el primer país (el más feliz) y su puntuaje de felicidad. Se crea un DataFrame con los datos para mostrarlos utilizando el método show.
Finalmente, se imprime el resultado obtenido, indicando el nombre del país y su puntuaje de felicidad.
El país más feliz del 2021, según la data, es Finland con un puntuaje de 7.842.
En este código en Python utilizando PySpark, se realiza un análisis de datos del World Happiness Report para determinar el país más feliz del 2021 por continente.
Primero se agrupa el DataFrame por continente, se agrega la máxima puntuación de felicidad y el primer país correspondiente a esa puntuación. Luego se renombran las columnas de los resultados obtenidos.

Posteriormente, se ordenan los datos de la máxima puntuación de manera descendente y se seleccionan las columnas de continente, país y máxima puntuación.
Finalmente, se muestra la tabla de los países más felices del 2021 por continente utilizando el método show.

Los países más felices del 2021 por continente son:
Western Europe: Finland
 North America and ANZ: New Zealand
 Middle East and North Africa: Israel
 Latin America and Caribbean: Costa Rica
 Central and Eastern Europe: Czech Republic
 East Asia: Taiwan Province of China
 Southeast Asia: Singapore
 Commonwealth of Independent States: Uzbekistan
 Sub-Saharan Africa: Mauritius
 South Asia: Nepal

En la tercera pregunta, es necesario ordenar los datos por año y por el valor del indicador "Life Ladder" en orden descendente. Esto nos permitirá identificar el país que tuvo el valor más alto en cada año.
Luego, se puede agrupar por año y seleccionar el nombre del país que tuvo el valor más alto en "Life Ladder". Esto nos permitirá identificar el país que ocupó el primer lugar en cada año.

A continuación, se cuenta cuántas veces cada país ha ocupado el primer lugar en todos los años y se ordena de manera descendente. Finalmente, se muestra el resultado el país es Denmark con un total de 7 en el numero 1 en todos los años.

En la cuarta pregunta, se seleccionan las columnas de interés y se filtra el dataframe original para el año 2020 y se cambia el tipo de la columna "Log GDP per capita" a float. Luego, se encuentra el valor máximo de la columna "Log GDP per capita" y se filtra el dataframe original para obtener las filas que tienen ese valor máximo. A continuación, se cuenta el número de países cuyo valor de "Life Ladder" es mayor que el del país con el mayor "Log GDP per capita". Se crea una nueva columna "Rank" en el dataframe df_max_log_gdp con la función "lit" y se añade el valor de "count_higher_ladder". Finalmente, se muestra el resultado con el nombre del país Irlanda y su posición en el ranking de felicidad, se encuentra en el numero 13.
Para responder a la quinta pregunta, necesitamos calcular el promedio del GDP per cápita del año 2020 y 2021 a nivel mundial y luego calcular el porcentaje de variación entre ambos años. Si este porcentaje es positivo, el GDP promedio aumentó, mientras que si es negativo, disminuyó.

Primero, calculamos el promedio del GDP per cápita del año 2020 a nivel mundial utilizando la función "mean" en la columna correspondiente del DataFrame. Luego, hacemos lo mismo para el año 2021, pero en el DataFrame correspondiente a ese año. Después, calculamos la variación porcentual entre ambos años utilizando la fórmula:

(variación entre 2021 y 2020 / GDP promedio de 2020) x 100

Si el resultado es positivo, podemos decir que el GDP promedio aumentó. En cambio, si es negativo, disminuyó.
En resumen, la variación a nivel mundial del GDP promedio del 2020 respecto al 2021 es de -3.27%. Dado que el resultado es negativo, podemos concluir que disminuyó.
La tarea para responder a la ultima pregunta es encontrando el país con la mayor expectativa de vida ("Healthy life expectancy at birth") en cada año, y luego contar cuántas veces cada país ha tenido la mejor esperanza de vida en el conjunto de los años analizados. El país que más veces ha tenido la mejor esperanza de vida se identificó como Singapur, y se encontró que en el 2019 Singapur tenía una esperanza de vida de 77.1 años.

Para calcular la mayor expectativa de vida en cada año, se agrupan los datos por año y usando la función "max" para obtener el valor máximo de la columna "Healthy life expectancy at birth". El resultado se guarda en un nuevo dataframe llamado "max_life".
A continuación, se une el dataframe original "df" con "max_life" para obtener la fila correspondiente al país con la mayor expectativa de vida en cada año. Se filtra el resultado para incluir solo las filas donde "Healthy life expectancy at birth" es igual a "max_exp_life", lo que nos da el país con la mayor expectativa de vida para cada año. Se seleccionan las columnas "year", "Country name" y "Healthy life expectancy at birth" del resultado y se guarda en el dataframe "max_life".
Después, se cuenta cuántas veces aparece cada país en el dataframe "max_life" y se ordena por la columna "count" en orden descendente. Se seleccionan las columnas "Country name" y "count" de la fila con el mayor número de apariciones y se guarda en la variable "most_country".

Se muestra el dataframe "max_life" ordenado por año y se imprime el país que más veces ha tenido la mejor esperanza de vida y durante cuántos años lo ha tenido.
Finalmente, se filtra el dataframe "df" para obtener el valor de "Healthy life expectancy at birth" para el país con la mayor esperanza de vida en el año 2019 (que se guardó previamente en "most_country"). Se seleccionan las columnas "year", "Country name" y "Healthy life expectancy at birth" del resultado y se guarda en el dataframe "max2019". Luego se muestra el resultado y se imprime la esperanza de vida del país en 2019.

A lo largo de las 6 preguntas que se han planteado en este ejercicio, se han obtenido varias conclusiones e insights importantes que pueden ayudar a comprender mejor cómo utilizar PySpark para realizar análisis de datos en grandes conjuntos de datos.
Por ejemplo, una de las conclusiones principales es que Spark es una herramienta poderosa para manejar grandes conjuntos de datos y realizar análisis a gran escala. Permite procesar datos de manera distribuida en un clúster de máquinas y utilizar lenguajes de programación como Python o Scala para realizar cálculos complejos.

Otro insight importante es que la limpieza y el preprocesamiento de los datos son fundamentales antes de realizar cualquier análisis. En el proceso de limpieza, se pueden descubrir y corregir errores, valores faltantes o inconsistentes, lo que puede afectar significativamente la calidad de los resultados. Por ejemplo, en la quinta pregunta, se decidió eliminar los datos nulos para evitar crear conflictos. Otra opción habría sido reemplazar ese valor nulo por el promedio.

Además, durante el análisis, es esencial tener en cuenta el contexto de los datos y comprender los diferentes métodos estadísticos. Es importante ser crítico con los resultados y validarlos con otras fuentes de datos o métodos.

En cuanto a los aprendizajes, se puede destacar la importancia de comprender y manejar el lenguaje SQL para interactuar con bases de datos y realizar consultas de manera efectiva. También se aprendió a utilizar varias funciones de PySpark para realizar tareas como filtrado, selección, agregación y unión de datos.
La utilización de PySpark para analizar grandes conjuntos de datos es una habilidad valiosa en el campo del análisis de datos. A través de la realización de las 6 preguntas planteadas en este ejercicio, se han obtenido conclusiones y aprendizajes importantes que pueden ayudar a mejorar las habilidades de análisis de datos y a comprender mejor el potencial de PySpark en el procesamiento de grandes conjuntos de datos.

Es importante tener en cuenta que PySpark está construido sobre la plataforma Hadoop, que es un framework de código abierto para el procesamiento distribuido de grandes conjuntos de datos en clústeres de servidores. Hadoop incluye una variedad de herramientas, como el sistema de archivos distribuido HDFS y el marco de procesamiento de datos MapReduce.

Además de Hadoop, PySpark también funciona bien con Apache Hive, que es un sistema de almacenamiento de datos distribuido construido sobre Hadoop que permite consultas SQL de alto nivel. Hive se utiliza para procesar grandes conjuntos de datos en clústeres de servidores y es ideal para el análisis ad hoc de datos y la exploración de datos. Una de las ventajas de Hive es que puede manejar múltiples tipos de datos y formatos de archivos, como CSV, JSON y Parquet.

Trabajar con PySpark significa trabajar con una variedad de herramientas en el ecosistema Hadoop, y la integración con sistemas como Hive permite una mayor flexibilidad y capacidades de análisis. Es importante tener en cuenta la arquitectura subyacente al trabajar con PySpark para aprovechar al máximo su potencial y obtener los mejores resultados de procesamiento de datos distribuidos.

Si hubiéramos utilizado Scala en lugar de Python, podríamos haber aprendido más sobre la sintaxis y características únicas de Scala, como su sistema de tipos estático y su enfoque en la programación funcional. También podríamos haber explorado diferentes bibliotecas de Scala para el análisis de datos, como Apache Flink o Apache Beam.

Por otro lado, si hubiéramos utilizado Databricks en lugar de ejecutar PySpark localmente, habríamos tenido acceso a una plataforma en la nube para el procesamiento y análisis de datos distribuidos. Databricks proporciona una interfaz fácil de usar para ejecutar PySpark y Scala en un entorno de clúster gestionado, lo que podría haber facilitado la configuración y el mantenimiento del clúster. También podríamos haber utilizado las características adicionales de Databricks, como el notebook colaborativo y la visualización de datos integrada, para colaborar y comunicar mejor nuestros hallazgos a otros miembros del equipo si la practica hubiese sido colaborativa.

En resumen, la elección del lenguaje de programación y la plataforma de procesamiento de datos depende del caso de uso específico y de las preferencias y habilidades del equipo. Sin embargo, es importante tener en cuenta que las herramientas como Scala y Databricks también pueden ser opciones valiosas para el análisis de datos y pueden proporcionar diferentes beneficios y aprendizajes en comparación con PySpark y la ejecución local.

Marcos Salafranca Arnau                    Marzo de 2023