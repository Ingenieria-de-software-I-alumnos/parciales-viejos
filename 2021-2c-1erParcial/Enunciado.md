## Enunciado

# Primer Parcial 2c 2021 - Algoritmos 3 - FIUBA:

Otro equipo de desarrollo ha continuado y extendido nuestro modelo de diálogos entre personajes, y ahora vuelve a nuestras manos con el objetivo de mejorarlo aplicando las técnicas y herramientas que hemos visto en la materia.

El modelo inicial es bastante similar a lo que construimos en los episodios anteriores, donde los Personajes Jugadores (PJs) pueden interactuar con varios personajes no jugadores (PNJs) y estos últimos mantienen un hilo de conversación con cada PJ.

Cuando un PNJ termina su hilo de conversación con un personaje realiza una acción, según si el PNJ es conversador o influyente:

-   Un PNJ conversador al finalizar su conversación con un personaje, si el PJ es:
    

-   Desconocido: pasa a ser conocido por ese PNJ segun la opinion publica
    
-   Prometedor: infla el ego del PNJ con el cual está conversando
    

-   Un PNJ influyente al finalizar su conversación con un personaje, si el PJ es:
    

-   Desconocido: cambia la opinión del pueblo a prometedor si dicho personaje es conocido por una cantidad suficiente de otros personajes que sigan la opinión del pueblo
    
-   Prometedor: aumenta la confianza de la opinión pública sobre ese PJ
    

Diferentes PNJs influyentes pueden requerir diferente nivel de conocimiento de un personaje para alterar su calificación (cantidadDePNJsQueDebenConocerAPJ). Por ejemplo Carolina la curandera requiere que dos seguidores de la opinión del pueblo conozcan al PJ para modificar su calificación, pero Ignacio el intendente alcanza con uno solo.

Les recordamos en orden de importancia:

1. Hay algo de código repetido en el modelo.

2. Hay varios ifs que se pueden reemplazar por polimorfismo.

3. También hay bastante código repetido en los tests.

4. Quizás no se está respetando la heurística de objetos completos y válidos desde su creación.

Les aconsejamos emprolijar el código o resolver problemas antes de ciertos refactors, aunque esto a veces implique resolver cosas de menor importancia antes.

La solución a entregar debe cumplir con todas las heurísticas de diseño vistas hasta el momento.

Tu misión es llevar adelante las mejoras nombradas en los 4 puntos anteriores. ¡Buena suerte!