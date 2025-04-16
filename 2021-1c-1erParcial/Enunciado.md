# Primer Parcial 1c 2021 - Algoritmos 3 - FIUBA:

[Solución en vivo](https://www.youtube.com/watch?v=r2iB3nDfJ-s&list=PLX7BIRwCcTrnESpB1___9dPi1O3bUuGan&index=5)

Nuestro modelo del extractor de **Factorio**, que hemos estado trabajando al principio del cuatrimestre, ha sido evolucionado por otro equipo de desarrollo. Le han agregado la capacidad de extraer carbón con diferente rendimiento en base al motor y al combustible que tengan dichos extractores. Soportando diferentes tipos de motores y combustibles. ¡Ahora es nuestro turno de mejorarlo aplicando las técnicas y herramientas que hemos visto en la materia!.

Por suerte, este equipo implementó varios tests, sin embargo **el modelo aún tiene algunas falencias a nivel diseño que debemos resolver.**

**Respecto al nuevo funcionamiento, hay que tener en cuenta que:**

1. Hay tres tipos de **combustibles: Madera,  Carbón y Gasoil.**
2. Hay dos tipos de **motores**: uno de consumo **Universal** y otro **optimizado para Sólidos**.
    Según el motor que tenga el extractor y su combustible va tener un rendimiento determinado para generar una cantidad de menas. Ese rendimiento depende de las **siguientes reglas**:
    1. Motor de consumo universal alimentado con:
        - Madera: 1 unidad de madera genera 13 joules de energía.
        - Carbón : 1 unidad de carbón genera 26 joules.
        - Gasoil: 1 unidad de gasoil genera 100 joules.
    2. Motor de sólidos alimentado con:
        - Madera: 1 unidad de madera genera 26 joules de energía.
        - Carbón : 1 unidad de carbón genera 52 joules.
        - Gasoil: 1 unidad de gasoil genera 25 joules.
        - Los motores tienen un nivel de desgaste que afectan la cantidad de energía que transforma a partir del combustible.

Es decir, el motor de sólidos rinde el doble que el universal para la madera y el carbón, mientras que para el gasoil rinde un cuarto.

Todas estas reglas se pueden ver en *Motor>>#transformarEnEnergiaUnaUnidad:*


El equipo que hizo la primer iteración del modelo dejó registrada las siguientes sugerencias de mejoras:

1. Hay algo de código repetido en el modelo.
2. Hay varios ifs que se pueden reemplazar por polimorfismo.
3. También hay bastante código repetido en los tests.
4. Quizás no se está respetando la heurística de objetos completos y válidos desde su creación.

Les aconsejamos que sigan este orden al momento de encarar el parcial.

La solución a entregar debe cumplir con todas las heurísticas de diseño vistas hasta el momento.

Tu misión es llevar adelante las mejoras nombradas en los 4 puntos anteriores. Este mensaje se autodestruirá en 4hs.
¡Suerte!

### Notas

- Estas colaboraciones representan la división entera entre unidades (13 * joule) // (5 * joule), en este caso el objeto resultante es 2.
- Estas colaboraciones representan el resto de la división entera entre unidades (13 * joule) \\ (5 * joule), en este caso el objeto resultante es 3 * joule.
