# Enunciado

[Solución en vivo](https://www.youtube.com/watch?v=WIMJ5fUHBD8&list=PLX7BIRwCcTrnESpB1___9dPi1O3bUuGan&index=2)

Nuestro trabajo en Factorio ha sido un éxito, nuestros clientes han quedado muy contentos/as y quieren incorporar una nueva idea, un separador de menas, y han confiado en nosotres para llevar adelante este desarrollo.

Un separador de menas es una máquina que tiene un ingreso de menas y debe estar conectado a dos destinos, un destino primario y otro secundario, y cada vez que transporta tiene que despachar las menas a alguno de sus dos destinos. 

Además cuenta con tres modos de funcionamiento que determina cómo transportar las menas. Inicialmente está en modo neutro. Cuando el separador está:

- En modo neutro al transportar lo hace hacia su destino primario.
- En modo filtrado por tipo de materia, las menas se transportan según su tipo de material. Por ejemplo, filtrando por menas de hierro las menas de este material las despacha por su destino secundario y el resto por su destino primario.
- En modo balanceando cada mena recibida se transporta a un destino y la siguiente al otro, distribuyendo equitativamente la carga de un destino a otro, iniciando por el destino primario.

Finalmente, un separador puede cambiar de un modo a otro. Sólo están permitidos los siguientes cambios:

- Si el separador está en modo neutro puede pasar a modo balanceado, filtrado o neutro.
- Si el separador está en modo balanceado solo puedo cambiar a modo balanceado o a neutro.
- Si el separador está en modo filtrado puede ser cambiado a neutro o a modo filtrado (cualquiera sea la condición del material). 

En caso de un cambio que no cumpla estas restricciones indicarlo con un error.

Además, el cambio de modo solo tiene impacto si la configuración es diferente. Por ejemplo, si el separador está en modo balanceado, y la siguiente mena la debe despachar al destino secundario, al cambiar al modo balanceado, la próxima mena la debe seguir despachando al destino secundario. En el caso del modo filtrado solo cambia si el criterio de filtrado es diferente.

Ayudas:

Pueden cargar como código inicial AlgoIII-Factorio-2021-1C.st, ahí encontrarán nuestro trabajo sobre Factorio a lo largo del cuatrimestre. Por ejemplo, las clases MenaDeHierro y MenaDeCarbon, como la clase Caja que pueden utilizar sus instancias como destinos de un separador. Importante, deben trabajar en una categoría separada AlgoIII-Factorio-2021-1C-2doParcial. Si modifican alguna clase del código inicial la deben mover a esta categoría. No debería ser necesario modificar nada del código inicial.

Prioricen la calidad del trabajo en este orden:

1. TDD (tener tests en un orden y granularidad acorde a TDD)
2. Modelo (nombres, no repetir código, claridad, etc)
	1. Funcionamiento de la separación de menas en los diferentes modos
	2. Cambio de modo del separador
3. Correctitud de tests (repetición de código, claridad, etc)
4. Nombre de los tests (nombres claros de los tests)

