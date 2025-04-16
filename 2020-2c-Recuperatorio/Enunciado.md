# Enunciado

Luego del éxito de los FiubaCOINs, la Fintech decidió implementar una nueva funcionalidad, ofreciendo la posibilidad a los usuarios de invertir sus criptomonedas. Para esto, nos pidieron implementar los siguientes nuevos servicios:

1. invest: anAmountOfFiubaCoins from: aWalletId → Invierte una cantidad de FiubaCOINs de la billetera. Al invertir, se realiza una transferencia por el monto invertido hacia una billetera interna de la Fintech. A diferencia de una transferencia convencional, esta transferencia no tiene comisión ni demora en impactar. La inversión debe ser por un monto positivo, y no es posible invertir más dinero si ya me encuentro invirtiendo.
2. stopInvestmentOn: aWalletId → Frena la inversión en curso de la billetera en cuestión (notar que no es posible frenar la inversión si no hay una en curso). Al frenar la inversión, el dinero invertido es transferido nuevamente a la billetera (sin comisión ni demora en impactar), sumando un monto adicional ganado por la inversión (llamado retorno o “return” en inglés), según los siguientes criterios:
	1. Si se frena la inversión ANTES de una semana y la wallet NO es promocional, NO tiene retorno.
	2. Si se frena la inversión ANTES de una semana pero la wallet ES promocional, tiene 1% de retorno sobre el valor total invertido.
	3. Si se frena la inversión LUEGO de una semana (o más) y la wallet NO es promocional, tiene 1% de retorno sobre el valor total invertido.
	4. Si se frena la inversión LUEGO de una semana (o más) y el wallet ES promocional, tiene 2% de retorno sobre el valor total invertido.

Resolver el ejercicio mediante TDD, aplicando todas las heurísticas de diseño vistas en la materia. Separar los tests bajo una nueva suite (InvestmentsTest) en lugar de extender FintechTest.

## Ayuda

Por cuestiones de tiempo, recomendamos no contemplar otras restricciones de funcionalidad más allá de las explícitamente mencionadas en el enunciado.

1. Los servicios createPromotionalWallet y createWallet de la Fintech (provistos en el código inicial) son aquellos que les permiten crear billeteras promocionales y no promocionales respectivamente.
2. Pueden asumir que la billetera interna de la Fintech siempre va a tener dinero suficiente para devolver los intereses obtenidos por todas las inversiones. Es decir, pueden crearla con un saldo arbitrario de 1000 FiubaCOINs y no preocuparse por que pasa si se agota. 
3. Explorar estos casos donde esta billetera se queda sin fondos sólo sumará puntos extras, tipo bonus track.
