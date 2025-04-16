# Primer Parcial 2c 2020 - Algoritmos 3 - FIUBA:

## Parte teórica (1.5 pts)

1. ¿Cuales son las diferencias y similitudes entre las propuestas de Naur y de Brooks en lo que refiere **puntualmente** a la **formación** de los desarrolladores de programas? (1 pt)

2. Según Dan Ingalls, ¿cual es la metáfora uniforme sobre la cual está construido Smalltalk? (0.5 pts)

## Parte práctica (8.5 pts)

**Una cadena muy importante de café** llamado "Ada's Coffee Shop" tiene un **sistema para premiar a sus más leales clientes** en base a los productos que compra y el tipo de cliente que es.
El sistema fue hecho por otra persona y ahora vos tenés que mantenerlo. Por suerte tiene varios tests, sin embargo antes de irse, el programador que lo hizo dijo que **hay un poco de código repetido y algunos if que estaría bueno sacar**.

**Respecto del negocio de Ada's Coffee Shop, hay que tener en cuenta que:**
1. Hay dos tipos de **productos**:
    - **Combo 1**: Cuesta 150 pesos y el cafe es de 250 mililitros
    - **Combo 2**: Cuesta 120 pesos y el cafe es de 100 mililitros
2. Hay tres tipos de **clientes**: Gold, Silver y Normal.
3. Una vez por mes se decide premiar a los clientes en base a la cantidad de cafe comprado de acuerdo a las siguientes dos reglas:
    - Si consumió entre 300 y 500 mililitros inclusive, el **premio (reward)** es un Combo2 con un precio que depende del tipo de cliente.

    - Si consumió más de 500 mililitros, el **premio (reward)** es un Combo1 donde también el precio depende del tipo de cliente.
    Se puede ver en las implementaciones del mensaje #createRewardFor: cómo se decide ese precio.

**Luego de analizar un poco el modelo, te das cuenta que:**
1. Hay código repetido en el test 2 y 3.
2. También hay código repetido en los últimos 6 tests
3. Hay varios ifs que se pueden reemplazar por polimorfismo.

Tu misión es llevar adelante las mejoras nombradas en los 3 puntos anteriores.
Suerte!

----

**Por favor ANTES de empezar el parcial leer las siguientes consignas fundamentales para la entrega:**


1. El parcial se debe entregar por mail dirigido a la lista de Docentes (fiuba-algoritmos-iii-doc@googlegroups.com).

2. Una vez recibido el mail, les enviaremos la confirmación de la recepción. Deben estar atentos a recibir dicha confirmación, en caso de no recibirla deben comunicarse con nosotros vía mail y vía Discord.

3. Tienen tiempo para entregarlo hasta las 19hs del Lunes 23. Los mails recibidos luego no serán tenidos en cuenta y se asumirá que no se realizó la entrega.

4. Recuerden que el parcial es individual. Las consultas las deben hacer vía mail a la lista de Docentes.

5. El subject del mail debe ser: "Nro Padrón: nnnn - Solución Primer Parcial 2c2020" ¡POR FAVOR NO SE EQUIVOQUEN EN ESTO! ES FUNDAMENTAL PARA SABER QUE RECIBIMOS SU RESOLUCIÓN

6. El cuerpo del mail debe contener **únicamente** las respuestas a las preguntas teóricas, claramente separadas, respetando la misma numeración y orden del enunciado.

7. El mail debe contener adjunto:

   a) El fileout de la solución que hicieron. Recuerden de probar que el fileout carga correctamente en una imagen sin la solución. Errores de carga pueden llevar a que no podamos corregir el parcial.
   
   b) El nombre del archivo del fileout debe ser el propuesto por Cuis, o sea, el nombre de la categoría de clases.

   c) El archivo CuisUniversity-mmmm.user.changes

8. Recordar grabar la imagen cada cierto tiempo, hacer file out de la solución cada cierto tiempo, etc. No se aceptarán explicaciones de “la máquina se colgó" o "perdí todo" como motivos de no entrega.

