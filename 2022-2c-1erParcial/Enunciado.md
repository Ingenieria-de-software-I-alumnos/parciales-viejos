# Enunciado

## Primer Parcial 2c 2022 - Algoritmos 3 - FIUBA:


Otro equipo ha continuado y extendido nuestro modelo de combates, y ahora vuelve a nosotros con el objetivo de mejorarlo aplicando las técnicas y herramientas que hemos visto en la materia. 

Nuestro modelo de combates ha sido extendido incluyendo el **efecto de diferentes armas contra diferentes armaduras.**

Se ha agregado un **nuevo tipo de armadura**: anillos (una armadura hecha con anillos entrelazados formando una malla, como una cadena, pero tipo tela, 2D). Y **nuevas armas**: martillo, palo, daga y lanza.

También la funcionalidad de que **diferentes armas hacen más, menos o el mismo daño contra cada tipo de armadura**, dependiendo del tipo de daño que inflija. Por ejemplo, las armas cortantes (hacha y espada, porque tienen filo) son mejores contra armaduras de cuero pero peores contra armaduras de metal. Y hacen el mismo daño contra armaduras de anillos. Lo mismo pasa con las armas perforantes (daga, lanza, que tienen punta, pinchan) y las contundentes (martillo, palo) que son mejores y peores contra otros tipos de armadura.

Esta funcionalidad ya está implementada en el código del cual deben partir `AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3.Inicial.st`, pero el equipo que la implementó no siguió las heurísticas de la cátedra. Su tarea es mejorar este código.


## Qué hay que hacer

A continuación les listamos desde lo más difícil a lo más fácil las tareas a realizar (elijan el orden que quieran para hacer)
    • Necesitamos mejorar los métodos de la clase Combatiente:
        ◦ dañoDeArmaEquipada
        ◦ dañoAAbsorberPorArmaduraVersusArma:
        ◦ absorcionDeDañoDeLaArmaduraVersusArma:
    • Una vez sacados los IFs y generadas la/s jerarquía/s, revisarlas, analizarlas y ver qué mejoras se le pueden hacer: reificar entidades y eliminar código repetido. **Releer el enunciado para entender el dominio**.
    • Sacar código repetido de DañoVariableTest, solo los que están categorizados como `tests a quitar código repetido`. El resto de los tests pueden quitar el código repetido pero  no serán evaluados.
    • El método AtacarTest>>hacerQue:quedeMalDebidoA: no cumple varias de nuestras heurísticas. Mejórenlo.
    • Revisar el método Combatiente>>atacarA: porque hay que mejorar el nombre del parámetro


##Entrega del examen 

1. Tienen tiempo para entregarlo hasta las 21:30hs. No serán tomadas en cuenta las entregas posteriores a ese horario. 
2. Recuerden grabar la imagen con frecuencia e ir haciendo file-outs de lo que vayan haciendo. No se aceptarán explicaciones del estilo “se me colgó la máquina” o “perdí todo” como motivos de no entrega. 
3. Entregar el fileout de la categoría “AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3”, que debe incluir toda la solución (modelo y tests). 
4. Entregar también el archivo que se llama CuisUniversity-nnnn.user.changes. 
5. **Probar que el archivo generado en el paso 1** se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon) y que todo funcione correctamente. Verifiquen que los nombres de los colaboradores sean los correctos (y no temp1). Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega. 
6. Realizar la entrega enviando mail **A LA LISTA DE DOCENTES** 
fiuba-algoritmos-iii-doc@googlegroups.com con el Asunto: "Nro Padrón: nnnn - Solución del 1er Parcial 2022 2c" 



