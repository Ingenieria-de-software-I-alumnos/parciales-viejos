# Enunciado

# Recuperatorio 1c 2022 - Algoritmos 3 - FIUBA

 Vamos a precisar cómo las avispas se intentan reproducir. Por el momento solo nos concentraremos en las avispas que comen orugas y polillas (a las roba huevos las dejamos afuera). Al intentar reproducirse estas avispas realizan tres tareas: cazar una oruga/polilla, transportar la presa cazada y dejar la presa con el huevo. Pero la vida no es tan simple para nuestras amigas las avispas, ya que su proceso de reproducción puede verse afectado por diferentes condiciones climáticas del hábitat. Y aquí está el núcleo de la nueva funcionalidad pedida por el cliente: **queremos modelar las complicaciones que sufren las avispas al intentar reproducirse producto de las condiciones climáticas del hábitat.**

## Cómo quieren realizar la simulación

Hasta ahora los investigadores iniciaban una temporada con ciertos recursos, luego podían hacer que las avispas se reproduzcan una cantidad N de veces en cada temporada y estudiaban la evolución de la población a lo largo de varias temporadas.

Los investigadores crearan un hábitat o si ya lo tienen cambiarán la temporada. Luego podrán hacer alguna de estas cosas, las veces que quieran:
-   **Definir un tipo de clima**
-   Enviar intentarReproducirse a las avispas que ellos consideren
   
Y estas dos cosas las irán repitiendo las veces que necesiten para sus experimentos/observaciones.

## Cambios en la reproducción de las avispas.

El cliente necesita que el proceso de reproducción pueda ser entorpecido por condiciones climáticas. Esto quiere decir que una avispa va a tratar de realizar todo el proceso de reproducción si puede. Pero si no, **avanza hasta donde pueda llegar**. Y la próxima vez que intente reproducirse va a **retomar donde dejó anteriormente**. Por ejemplo, si logró cazar la presa, entonces le queda transportarla y dejarla con el nuevo huevo. 
Pasamos a detallar cómo cada condición climática afecta cada tarea de las avispas caza orugas y caza polillas (recordemos que no nos interesa cambiar el funcionamiento de la avispa roba huevos):
 
- **Clima Despejado** - No hay viento
  -  se puede cazar orugas/polillas
  -  se puede transportar la presa
  -  se puede poner huevo
    
- **Clima Ventoso** - Vientos moderados que dificultan el vuelo
  -   se puede cazar orugas/polillas
  -   **no se puede transportar la presa**
   -  se puede poner huevo
   
- **Clima Revuelto** - Vientos muy fuertes, lluvia, granizo, etc.
  -   **no se puede cazar orugas/polillas**
   -  **no se puede transportar la presa**
   -  se puede poner huevo
    
- **Inundado**
  -   se puede cazar orugas/polillas
  -   se puede transportar la presa
  -   **no se puede poner huevo**
    

## Lo que hay que hacer

Queremos entonces que extiendan el modelo para que se puedan definir en el hábitat los cuatro diferentes tipos de clima (supongan que todo lo hecho hasta ahora era bajo el clima despejado y que el clima despejado es el clima por defecto) y que cuando se envíe el mensaje “intentarReproducirse” las avispas se comporten según lo descrito anteriormente.
Pueden cargar como código inicial AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5.Inicial.st, ahí encontrarán un código muy similar a la solución del parcial anterior.
En su modelo final **deben pasar todos los tests**. Tanto los que agregue en su recorrido en TDD como los ya existentes en el código inicial. Deben trabajar en **una clase de test diferente** a las que ya tenemos en el código inicial y no hace falta quitar código repetido si existiese entre los tests del código inicial y los nuevos tests.

## Algunas consideraciones

No hace falta agregarle protocolo a la avispa.

Todo se puede testear mirando al hábitat con el protocolo que ya tenemos. Con solamente estos mensajes se puede testear si una avispa cumplio o no una tarea:

-   Preguntar al hábitat cuantas orugas/polillas tiene
-   Preguntar al hábitat cuantos huevos tiene en total o de una firma genética

Van a necesitar generar escenarios donde las avispas hayan llegado hasta cierto punto en su intento de reproducción (por ejemplo, que haya cazado la presa, que haya volado hasta las inmediaciones de su hueco pero que no haya depositado la presa y el huevo), si no se les ocurre cómo generar estos escenarios **pregunten a los conocedores del dominio**.
  
Si quiero una situación en la cual una avispa solamente se transporte puedo:
-   Poner en el hábitat un clima ventoso
-   Intentar que se reproduzca
-   Hasta acá la avispa tiene una presa pero está lejos del lugar donde quiere depositarla
-   Cambio el clima a inundado
-   Intento que se reproduzca
-   Acá la avispa va a transportar su presa pero no va a poder dejarla
  
### Prioricen la calidad del trabajo en este orden:

1.  TDD (tener tests en un orden y granularidad acorde a TDD)  
2.  Modelo (nombres, no repetir código, claridad, etc)
3.  Correctitud de tests (repetición de código, claridad, etc)
4.  Nombre de los tests (nombres claros de los tests)
    

## Entrega del examen

1. Tienen tiempo para entregarlo hasta las 22hs. No serán tomadas en cuenta las entregas posteriores a ese horario (estricto).
2. Recuerden grabar la imagen con frecuencia e ir haciendo file-outs de lo que vayan haciendo. No se aceptarán explicaciones del estilo “se me colgó la máquina” o “perdí todo” como motivos de no entrega.
3. Entregar el fileout de la categoría “AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5”, que debe incluir toda la solución (modelo y tests).
4. Entregar también el archivo que se llama CuisUniversity-nnnn.user.changes.
5. Probar que el archivo generado en el paso 1 se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon) y que todo funcione correctamente. Verifiquen que los nombres de los colaboradores sean los correctos (y no temp1). Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega.
6. Realizar la entrega enviando mail A LA LISTA DE DOCENTES fiuba-algoritmos-iii-doc@googlegroups.com  con el Asunto: "Nro Padrón: nnnn - Solución del Recuperatorio 2022 1c"
7. Al enviar la solución deben esperar a recibir una confirmación de recepción ANTES de retirarse del aula. Recién una vez recibida la confirmación, puede retirarse.

# Preludio

## Cómo usan nuestro sistema

Los investigadores inician una temporada con ciertos recursos, hacen que las avispas se reproduzcan una cantidad N de veces en cada temporada y estudian la evolución de la población a lo largo de varias temporadas. 

Para esto el uso que hacen es iniciar el hábitat como ya sabemos.
Luego hacen que las avispas intenten reproducirse (le envían a N avispas el mensaje intentar reproducirse varias veces, en distinto orden).
Luego de estos intentos de reproducción algunas avispas van a haber podido reproducirse varias veces y otras no porque se quedaron sin recursos.
En algún momento cambian de temporada y miden cuántas avispas quedaron de cada tipo, cuánto alimento quedó, etc.
En esa nueva temporada de nuevo envían mensajes de reproducirse varias veces, a varias de ellas, en cierto orden, y así hasta cierto punto.
Vuelven a cambiar de temporada y vuelven a medir los recursos y las avispas que quedaron.
Así hasta sacar alguna conclusión de la dinámica de la simulación.

## Cómo se reproduce una avispa

Las avispas tienen un proceso rico y complejo de reproducción. Pero lo modelamos de una forma muy simplificada. Para la próxima etapa (recuperatorio del Jueves) queremos tener un modelo más complejo y es importante que entendamos qué pasa en la realidad, para que la podamos reflejar.
Hasta ahora tenemos un modelo donde la avispa atrapa una presa (que la va a usar para alimentar a su cría cuando salga del huevo) y luego “deja un huevo”.
Estas dos tareas en la realidad son más complejas, pero nos vamos a centrar en agregar una tarea que sucede entre esas dos: transportar la presa.
Entonces, lo que sucede lo podemos descomponer en tres tareas:
-   Cazar - Una avispa sale a cazar, sobrevuela, encuentra su presa y la captura.   
-   Transportar - La avispa toma la presa cazada, vuela (con dificultad) hacia el hueco donde la va a depositar (dato de color: al hueco lo encuentra por olfato)    
-   Dejar huevo - Una vez que está en las inmediaciones del hueco mete la presa adentro del mismo, deposita un huevo, sale y se va   

Luego ya estará lista para volver a iniciar el ciclo.


