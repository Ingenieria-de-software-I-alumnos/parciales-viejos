# Segundo Parcial 2c 2022 - Algoritmos 3 - FIUBA

Nuevamente debemos extender nuestro modelo de ataques fantásticos, en esta oportunidad nuestro cliente quiere resolver ciertas ventajas que tiene un combatiente al momento de atacar a otro. Por ejemplo, si un combatiente está en terreno elevado tiene ventaja. Si está lleno de furia, ataca mejor. A estas ventajas el cliente las denomina bonificadores, cuando un combatiente ataca con un bonificador inflige más daño.

Se requieren los siguientes bonificadores:

- Terreno elevado: es una  bonificación por altura e inflige 1 más de daño.
- Estado de furia: es una bonificación de moral e inflige 2 más de daño.
- Inspirado: es una bonificación de moral e inflige 2 más de daño.
- Ataque de flanco: es una bonificación por posición, cuando el atacante arremete desde el costado. Este bonificador hace 2 más de daño.
- Ataque por retaguardia: es una bonificación por posición, cuando el atacante arremete desde atrás. Este bonificador hace 4 más de daño.

En un ataque pueden intervenir varios de estos bonificadores, pero no todos los bonificadores son “apilables”. Si un combatiente está inspirado y con furia sólo aplica el mejor.

Esto sucede porque cada bonificador afecta a un aspecto del ataque: posición, moral, altura, etc. Es decir, si los bonificadores afectan al mismo aspecto, solamente se aplica el mejor, en caso contrario se suman.

Ejemplo 1: si se tienen los siguientes bonificadores

- Terreno elevado (altura / +1)
- Por furia (moral / +2)
- Por inspirado (moral / +2)

El ataque produce 3 más de daño ya que solo se toma un bonificador por moral.

Ejemplo 2: si se tienen los siguientes bonificadores

- Terreno elevado (altura / +1)
- Inspirado (moral / +2)
- Ataque de flanco (posición / +2)
- Ataque por retaguardia (posición / +4)

El ataque produce 7 más de daño ya que solo se toma un bonificador por posición, en este caso el ataque por retaguardia.

## Segunda parte

Nuestro cliente nos ha comentado que necesita agregar nuevos bonificadores por lo que es indispensable que nuestro modelo sea extensible. Nos ha hablado sobre dos ejes de cambios:

- Nuevos bonificadores de los aspectos mencionados (altura, moral, posición).
- Nuevos bonificadores sobre nuevos aspectos.

Y nos ha señalado que el primero es más importante que el segundo. Pero que requiere de ambos.

Algunos ejemplos de nuevos bonificadores pueden ser:

- +1 por moral por estar bien descansado y nutrido
- +1 por velocidad
- +3 por velocidad

Importante: No hace falta modelar estos modificadores de ejemplo (obviamente si los mencionados para la primera parte :)), simplemente tener un modelo que permita fácilmente agregar un nuevo modificador.

Importante: en trabajos anteriores exploramos otro bonificador de ataque que es bonificadorDeFuerza, por ahora no hace falta integrarlo con la nueva funcionalidad pedida, ni modificar nada de esto.

## Modalidad de trabajo

Nuestra tarea es modelar lo pedido mediante TDD y siguiendo las heurísticas de diseño vistas durante toda la cursada de la materia.

En su modelo final deben pasar todos los tests. Tanto los que agregue en su recorrido en TDD como los ya existentes en el código inicial.

## Ayudas:

Pueden cargar como código inicial AlgoIII-2022-2C-2Parcial-AtaquesFantasticos-P4.Inicial.st, ahí encontrarán un código muy similar a la solución del parcial anterior. En el código inicial encontrarán una clase `BonificadoresDeAtaquesTest` y un nuevo mensaje `Combatiente >> #atacarConBonificadores:` donde podrá empezar a trabajar. Tener en cuenta que se debe preservar el funcionamiento actual en los mensajes “atacar” y “atacarA:”, es decir estos mensajes realizan ataques sin bonificadores.

También encontrarán una clase `EjemplosDeBonficadoresTest` donde tienen dos ejemplos del funcionamiento esperado por el cliente. No le va a andar al principio, y cuando terminen de implementar pueden comprobar que su solución es correcta renombrando los tests (quitando la x) e implementando los dos métodos que hacen que fallen.

Prioricen la calidad del trabajo en este orden:

1. TDD (tener tests en un orden y granularidad acorde a TDD).

2. Modelo (nombres, no repetir código, claridad, etc).

3. Resolver las restricciones de extensibilidad indicadas en la segunda parte.

4. Correctitud de tests (repetición de código, claridad, etc).

5. Nombre de los tests (nombres claros de los tests)
