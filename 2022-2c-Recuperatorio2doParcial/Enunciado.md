# Enunciado

Nuestro cliente quiere seguir explorando el dominio de los ataques fantásticos. Llegó el momento de las condiciones que afectan la defensa de un combatiente. Por ejemplo si un combatiente está “a la defensiva” reduce en 1 el daño que le hace un atacante. Un combatiente puede estar bajo una única condición, la cual puede ser singular o múltiple.

## Condiciones singulares

Un combatiente puede estar bajo las siguientes condiciones:

-   Neutral: no incrementa ni decrementa el daño que recibe.
    
-   Cansado: incrementa un 25% (daño // 4) el daño que recibe.
    
-   Creativo: decrementa un 25% (-daño // 4) el daño que recibe.
    
-   Vacilante: incrementa en 1 el daño que recibe.
    
-   A la defensiva: decrementa en 1 el daño que recibe.
    
-   Vulnerable: incrementa 1 el daño que recibe por cada ataque que recibe estando en esta condición
    
-   Sangrando: incrementa 1 el daño que recibe por cada ataque que realiza estando en esta condición

Por defecto el combatiente está “Neutral”. Los números saben responder al mensaje `//` que nos da la división entera. Por ejemplo 4 // 3 responde 1

## Modo de uso

Queremos que el Combatiente soporte un mensaje para indicarle la condición defensiva en la que queremos que se encuentre. Este mensaje y su nombre lo tienen que inventar ustedes.

## Condición múltiple

Un combatiente puede estar bajo más de una condición, cuando es este el caso las variaciones del daño recibido se suman. Por ejemplo:

  

Si está “Cansado” y “A la defensiva” al recibir un ataque de lanza, que hace 8 de daño, la variación es de (8 // 4) - 1, es decir el daño será de 9 (8 + 2 - 1),

  

La condición múltiple tiene las siguientes restricciones:

-   No puede estar Neutro y en cualquier otra condición
    
-   Una condición múltiple no puede estar conformada con otra condición múltiple.
    

## Aclaraciones

-   No hace falta modificar el bonificadorDeAgilidad del combatiente.
    
-   El código inicial no es del 2do parcial. No existen bonificadores.
    
-   Extensibilidad: Deberíamos poder extender el modelo creando una clase para una nueva condición
    

## Ayudas

Con el objetivo de simplificar esta iteración la condición de un combatiente se la configuran desde afuera, no la decide él. El nombre del mensaje lo tienen que inventar ustedes.

  

Pueden cargar como código inicial AlgoIII-2022-2C-1Recu-AtaquesFantasticos-P5.Inicial.st, ahí encontrarán un código muy similar a la solución del primer parcial. En el código inicial encontrarán una clase `DefensaSujetaACondicionesTest`.

  

Prioricen la calidad del trabajo en este orden:

1.  TDD (tener tests en un orden y granularidad acorde a TDD).
    
2.  Modelo (nombres, no repetir código, claridad, etc).
    
3.  Resolver las restricciones de extensibilidad mencionadas en Aclaraciones
    
4.  Correctitud de tests (repetición de código, claridad, etc).
    
5.  Nombre de los tests (nombres claros de los tests)