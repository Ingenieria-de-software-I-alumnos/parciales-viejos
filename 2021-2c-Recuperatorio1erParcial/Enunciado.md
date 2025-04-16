# Enunciado

## Introduccion

Mientras trabajábamos en nuestra versión de un juego de rol de computadora otro equipo empezó a programar el núcleo de un juego tipo SimCity, un simulador de ciudades. Ahora que estamos libres, nos convocan para revisar ese trabajo hecho y mejorarlo.

FiubaCity por ahora implementa algo bien básico: una ciudad en la cual puedo poner diferentes zonas que consumen electricidad y agua y servicios que proveen electricidad y agua.

## Zonas

Las Zones (zonas) son los espacios donde la población de nuestra ciudad podrá edificar. Existen 3 tipos de zonas: Residential, Commercial e Industrial (aunque nos cuentan que se definirán más en el futuro) Al crear una zona se le especifica cuánto espacio ocupa medido en cells (celdas). El espacio sirve para calcular el consumo de servicios de la siguiente manera:

Residential
    

-   Water: 9wp/cell
    
-   Power: 5ep/cell
    

Commercial
    

-   Water: 2wp/cell
    
-   Power: 8ep/cell
    

Industrial
    

-   Water: 10wp/cell
    
-   Power: 10ep/cell
    

Nota: wp: Water points, ep: Energy points

## Servicios

Existen 2 tipos de servicios: Power (energía) y Water (agua).

Para abastecer de energía tenemos Solar Plants que brindan 500ep cada una.

Para el caso del agua, tenemos Water Towers que brindan 200wp.

## Restricciones

Antes de poder construir estas zones en la ciudad, la misma debe contar con servicios.

Otra restricción es que no se pueden meter zonas comerciales si no hay al menos una zona residencial ya presente en la ciudad.

## Trabajo a realizar

En orden de importancia:

1. Hay algo de código repetido en el modelo.

2. Hay varios ifs que se pueden reemplazar por polimorfismo.

3. También hay bastante código repetido en los tests.

4. Mejorar el diseño en todo lo que considere necesario (objetos completos y correctos

desde su creación, no romper encapsulamiento, sacar mensajes no usados, borrar

variables no usadas, categorizar mensajes, etc.)

La solución a entregar debe cumplir con todas las heurísticas de diseño vistas hasta el momento.