
# Enunciado

## Introduccion

Luego de nuestro exitoso trabajo en el juego de rol y los diálogos con NPCs quieren que trabajemos ahora en otro juego: un simulador de ciudades tipo SimCity.

En FiubaCity queremos implementar un primer núcleo: una ciudad en la cual podemos agregar servicios de electricidad y agua y podemos agregar diferentes tipos de zonas (Residencial, Comercial e Industrial) donde cada zona consumirá estos servicios a una tasa determinada.

## Servicios

Nota: wp: Water points, ep: Energy points

Antes de poder construir estas zonas en la ciudad, la misma debe contar con servicios.

Existen 2 tipos de servicios: Electricidad y Agua.

Para abastecer de electricidad tenemos plantas solares que brindan 500 ep cada una.

Para el caso del agua, tenemos torres de agua que brindan 200 wp cada una.

## Zonas

Las zonas son los espacios donde la población de nuestra ciudad podrá edificar. Existen 3 tipos de zonas: Residencial, Comercial e Industrial (aunque nos cuentan que se definirán más en el futuro) Cada zona tiene un nivel de consumo diferente:

Residential
    

-   Water: 9wp
    
-   Power: 5ep
    

Commercial
    

-   Water: 2wp
    
-   Power: 8ep
    

Industrial
    

-   Water: 10wp
    
-   Power: 10ep
    

### Restricciones

Una zona no puede ser agregada si no hay suficiente agua y electricidad para satisfacer sus necesidades.

Las zonas comerciales sólo pueden ser agregadas si hay al menos una zona residencial ya presente.

## Ayuda

En el código inicial que les mandamos van a tener una clase de test que instala las unidades de energía que vamos a usar.

## Trabajo a realizar

Implementar la funcionalidad descrita cumpliendo:

1.  TDD (tener tests en un orden y granularidad acorde a TDD)
    
2.  Modelo (nombres, no repetir código, claridad, etc)
    
3.  Correctitud de tests (repetición de código, claridad, etc)
    
4.  Nombre de los tests (nombres claros de los tests)
    

Deben cargar el código inicial AlgoIII-2021-2C-RecuDel2doParcial.st, ahí encontrarán una primera clase de test que carga las unidades de medida de electricidad y agua y define un pequeño test para comprobar que están instaladas y que las pueden usar. Siéntanse libres de usar esa clase u otra (o renombrarla) para sus tests.