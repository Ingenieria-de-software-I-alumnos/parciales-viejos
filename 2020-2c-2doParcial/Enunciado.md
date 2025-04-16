[Solución en vivo](https://www.youtube.com/watch?v=DlGdlhmdttU&list=PLX7BIRwCcTrlJG9kWzh9tLAmqB40ScUdk&index=3)

## Enunciado
Hoy nos toca incursionar en el dominio de las denominadas fintech (contracción de 'Finanzas' y 'Tecnología'), o sea una especie de banco digital. El primer servicio a implementar es una criptomoneda que se llamará FiubaCOIN. Para poder operar con dicha criptomoneda, la fintech ofrecerá los siguientes servicios:

1. **createWallet** → Crea una billetera virtual y devuelve el id de dicha billetera. Las billeteras se crean con un balance inicial de 0 FiubaCOIN y un id único. Se devuelve el id de la billetera y no la billetera para que no se pueda acceder a las mismas por fuera de la fintech. 

2. **createPromotionalWallet** → También necesitamos poder crear las wallets con un saldo inicial de 1 FiubaCOIN porque vamos a querer promocionar el uso de la plataforma.

3. **balanceOf: aWalletId** → Devuelve el balance actual de la billetera identificada con el id pasado. Por ejemplo luego de crear una billetera promocional #balanceOf: debería devolver 1 FiubaCOIN

4. **transfer: anAmount from: aSourceWalletId to: aTargetWalletId** → Hace una transferencia desde la billetera identificada por aSourceWalletId a aquella identificada por aTargetWalletId. Para dicha transferencia se cobra un comisión del 2%. La comisión no sale del monto transferido, sino que sale de la cuenta fuente (source). Las transferencias se realizan entre billeteras. La unidad mínima es  0.000001* FiubaCOIN. Hay más restricciones de una transferencia, ver aclaración más abajo.

5. **allTransactionsOf: aWalletId** → Devuelve los depósitos y extracciones por
transferencia registrados en la billetera identificada con aWalletId. Debido a que las
transacciones son inmutable, no hay problema en devolver dichos objetos.

6. **allPendingTransactionsOf: aWalletId** → Devuelve las extracciones por transferencias que aún están pendientes, o sea que están registradas pero aún no pueden afectar el
balance puesto que no llegó la hora de acreditación.

La temporalidad de **transfer: anAmount from: aSourceWalletId to: aTargetWalletId** → El dinero se debita cuando empieza la transferencia (comisión y monto a transferirse). La transferencia tarda 1 hora en acreditarse en la billetera destino. Es decir, no se debita apenas se inicia la transferencia. Se acredita luego de una hora (el monto).


## Ayudas:

1. Les vamos a entregar un código inicial. El mismo contiene:
	- Wallet - Una implementación inicial básica
	- Fintech - Sabe crear wallets (item 1 del ejercicio)
	- FintechTest - Tests de wallets (item 1 del ejercicio)
	- FiubaCOIN implementada, en el objeto Fintech
		- podemos crear “0.5 FiubaCOINs” con “0.5 * fintech coin”.
	- Primer iteración de una implementación de #balanceOf: aWalletId
2. Pueden repasar los ejericios anteriores. Acuerdense que pueden usar clases o jerarquias que ya hayan hecho. Si usan algo evalúen cuán útiles son tal cual están y si no hay que adaptarlos o modificarlos.
3. Prioricen la calidad del trabajo en este orden:
	- TDD (tener tests en un orden y granularidad acorde a TDD)
	- Modelo (nombres, no repetir código, claridad, etc)
	- Correctitud de tests (repetición de código, claridad, etc)
	- Nombre de los tests (nombres claros de los tests)

## Reglas y normas a cumplir para parcial remoto 

Siendo un parcial remoto que brinda la posibilidad de promoción, ​dentro de su propio breakout room particular​ cada alumno deberá cumplir con:

1. Tener compartido su escritorio principal durante la duración completa del parcial​. Importante destacar que debe ser el escritorio, y no sólo CUIS, pues se deberá poder
visualizar el resto de sus aplicaciones abiertas.

2. Reducir la cantidad de aplicaciones abiertas en su escritorio al mínimo. Una vez recibido el mail con el enunciado del parcial, no debería necesitar tener abierta ninguna otra
aplicación más allá de la que utilice para visualizarlo y CUIS.

3. Deberá mantener el vídeo de su cámara siempre prendido y el audio de su micrófono siempre abierto. En el caso de que considere que esto viola su privacidad, podrá prender cámara y micrófono sólo en el momento que un docente que ingresa a su breakout room particular quiera validar su identidad.

4. Si se produce una desconexión, intentar reconectarse de forma inmediata. De volverse imposible el inicio de sesión en zoom, comunicarse con la lista de docentes fiuba-algoritmos-iii-doc@googlegroups.com.
 

No cumplir con alguna de estas normas será motivo suficiente para que como mínimo pierda el beneficio de la promoción. Por favor, sean responsables con el uso de estas reglas y no se
comprometan ustedes, ni a los docentes.

IMPORTANTE: Los docentes entrarán y saldrán de su breakout room particular potencialmente varias veces durante la duración del parcial con su audio muteado. Si el mismo no entabla una conversación, no se distraiga y siga trabajando normalmente.

## Entrega del parcial

1. Tienen tiempo para entregarlo hasta las 22hs.
2. Entregar el fileout de la categoría de clase​ ALGO3-2020-2C-2doParcial que debe incluir toda la solución (modelo y tests). El archivo de fileout se debe llamar: ALGO3-2020-2C-2doParcial.st
3. Entregar también el archivo que se llama ​ CuisUniversity-nnnn.user.changes.
4. Probar que el archivo generado en el paso 1 se cargue correctamente en una imagen “limpia” (o sea, sin la solución que crearon) y que todo funcione correctamente. Esto es fundamental para que no haya problemas de que falten clases/métodos/objetos en la entrega.
5. Realizar la entrega enviando mail a la lista de Docentes ​fiuba-algoritmos-iii-doc@googlegroups.com con el Asunto: "Nro Padrón: nnnn - Solución Segundo Parcial 2c2020"

**IMPORTANTE**: Al enviar la solución del parcial deben recibir una confirmación de recepción ANTES de retirarse del aula virtual de Zoom.
