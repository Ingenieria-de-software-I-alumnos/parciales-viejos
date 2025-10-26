!classDefinition: #Astronauta category: #'2c2025-1erParcial'!
Object subclass: #Astronauta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Astronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:26:07'!
desplazamientoConNaveAveriadaEnCasillaCaminataEspacial

	^0! !

!Astronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:02:24'!
desplazamientoConNaveAveriadaEnCasillaComunicaciones

	self subclassResponsibility! !

!Astronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:04:42'!
desplazamientoConNaveAveriadaEnCasillaEureka

	^0! !

!Astronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:04:13'!
desplazamientoConNaveAveriadaEnCasillaFalloCritico

	^0! !

!Astronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:05:27'!
desplazamientoConNaveAveriadaEnCasillaSoporteVital

	^-2! !


!Astronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:26:14'!
desplazamientoConNaveDegradadaEnCasillaCaminataEspacial

	^0! !

!Astronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:02:40'!
desplazamientoConNaveDegradadaEnCasillaComunicaciones

	self subclassResponsibility! !

!Astronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:19:52'!
desplazamientoConNaveDegradadaEnCasillaEureka

	^1! !

!Astronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:20:28'!
desplazamientoConNaveDegradadaEnCasillaFalloCritico

	^-2! !

!Astronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:20:32'!
desplazamientoConNaveDegradadaEnCasillaSoporteVital

	^-1! !


!Astronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:52'!
desplazamientoConNaveOperativaEnCasillaCaminataEspecial

	^0! !

!Astronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:48'!
desplazamientoConNaveOperativaEnCasillaComunicaciones

	^1! !

!Astronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:22:40'!
desplazamientoConNaveOperativaEnCasillaEureka

	^2! !

!Astronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:31'!
desplazamientoConNaveOperativaEnCasillaFalloCritico

	^-1! !

!Astronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:22:14'!
desplazamientoConNaveOperativaEnCasillaSoporteVital

	^2! !


!Astronauta methodsFor: 'desplazamiento - neutro' stamp: 'LL 9/25/2025 21:56:20'!
desplazamientoEnCasillaNeutra

	^0! !


!Astronauta methodsFor: 'desplazamiento - subidon adrenalina' stamp: 'LL 9/25/2025 15:27:22'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	self subclassResponsibility! !


!classDefinition: #AstronautaConFamilia category: #'2c2025-1erParcial'!
Astronauta subclass: #AstronautaConFamilia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!AstronautaConFamilia methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:02:24'!
desplazamientoConNaveAveriadaEnCasillaComunicaciones

	^-3! !


!AstronautaConFamilia methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:02:40'!
desplazamientoConNaveDegradadaEnCasillaComunicaciones

	^-1! !


!AstronautaConFamilia methodsFor: 'desplazamiento - subidon adrenalina' stamp: 'LL 9/25/2025 15:27:22'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	| truncation newDesp desplazamiento |
	desplazamiento := desplazamientoBase.
	newDesp := desplazamiento * 2.5.
	truncation := newDesp truncated.
	newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
	newDesp = truncation
		ifTrue: [ desplazamiento  := truncation ]
		ifFalse: [ desplazamiento  := truncation + 1 ].
	^desplazamiento! !


!classDefinition: #AstronautaEspecialistaEnComunicaciones category: #'2c2025-1erParcial'!
Astronauta subclass: #AstronautaEspecialistaEnComunicaciones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!AstronautaEspecialistaEnComunicaciones methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:02:24'!
desplazamientoConNaveAveriadaEnCasillaComunicaciones

	^-2! !


!AstronautaEspecialistaEnComunicaciones methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:02:40'!
desplazamientoConNaveDegradadaEnCasillaComunicaciones

	^0! !


!AstronautaEspecialistaEnComunicaciones methodsFor: 'desplazamiento - subidon adrenalina' stamp: 'LL 9/25/2025 15:27:22'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	| truncation newDesp desplazamiento |
	desplazamiento := desplazamientoBase.
	newDesp := desplazamiento * 1.5.
	truncation := newDesp truncated.
	newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
	newDesp = truncation
		ifTrue: [ desplazamiento  := truncation ]
		ifFalse: [ desplazamiento  := truncation + 1 ].
	^desplazamiento! !


!classDefinition: #AstronautaIngenieroMecanico category: #'2c2025-1erParcial'!
Astronauta subclass: #AstronautaIngenieroMecanico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!AstronautaIngenieroMecanico methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:02:24'!
desplazamientoConNaveAveriadaEnCasillaComunicaciones

	^-1! !


!AstronautaIngenieroMecanico methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:02:40'!
desplazamientoConNaveDegradadaEnCasillaComunicaciones

	^1! !


!AstronautaIngenieroMecanico methodsFor: 'desplazamiento - subidon adrenalina' stamp: 'LL 9/25/2025 15:27:22'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	^desplazamientoBase! !


!classDefinition: #Casilla category: #'2c2025-1erParcial'!
Object subclass: #Casilla
	instanceVariableNames: 'juego'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Casilla methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:19:16'!
desplazamientoDe: unJugador en: elJuego

	self subclassResponsibility! !


!classDefinition: #CaminataEspacial category: #'2c2025-1erParcial'!
Casilla subclass: #CaminataEspacial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CaminataEspacial methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:31'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaCaminataEspacialDe: unJugador.
	! !


!classDefinition: #Comunicaciones category: #'2c2025-1erParcial'!
Casilla subclass: #Comunicaciones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Comunicaciones methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:06'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaComunicacionesDe: unJugador ! !


!classDefinition: #Eureka category: #'2c2025-1erParcial'!
Casilla subclass: #Eureka
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Eureka methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:11'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaEurekaDe: unJugador! !


!classDefinition: #FalloCritico category: #'2c2025-1erParcial'!
Casilla subclass: #FalloCritico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!FalloCritico methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:15'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaFalloCriticoDe: unJugador! !


!classDefinition: #Neutra category: #'2c2025-1erParcial'!
Casilla subclass: #Neutra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Neutra methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:42'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaNeutraDe: unJugador! !


!classDefinition: #SoporteVital category: #'2c2025-1erParcial'!
Casilla subclass: #SoporteVital
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!SoporteVital methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:22'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaSoporteVitalDe: unJugador! !


!classDefinition: #CondicionDeLaNave category: #'2c2025-1erParcial'!
Object subclass: #CondicionDeLaNave
	instanceVariableNames: 'juego'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:44'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:05:00'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:05:10'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:05:16'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 21:58:57'!
afectarDesplazamientoEnCasillaNeutraDe: unJugador

	^unJugador desplazamientoEnCasillaNeutra! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:05:23'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:55:14'!
initializeWith: elJuego

	juego := elJuego! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CondicionDeLaNave class' category: #'2c2025-1erParcial'!
CondicionDeLaNave class
	instanceVariableNames: ''!

!CondicionDeLaNave class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:54:43'!
en: elJuego

	^self new initializeWith: elJuego! !


!classDefinition: #Averiada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Averiada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:26:07'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaCaminataEspacial.! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:02:24'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveAveriadaEnCasillaComunicaciones! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:03:34'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaEureka! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:03:46'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAColpasada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaFalloCritico! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:05:17'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveAveriadaEnCasillaSoporteVital! !


!classDefinition: #Colapsada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Colapsada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:44'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	juego jugadorNoPuedeDesplazarse! !


!classDefinition: #Degradada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Degradada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:26:14'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^unJugador desplazamientoConNaveDegradadaEnCasillaCaminataEspacial! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:02:40'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveDegradadaEnCasillaComunicaciones! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:18:44'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^unJugador desplazamientoConNaveDegradadaEnCasillaEureka! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:18:56'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAAveriada. 
	^unJugador desplazamientoConNaveDegradadaEnCasillaFalloCritico! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:19:21'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveDegradadaEnCasillaSoporteVital! !


!classDefinition: #Operativa category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Operativa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:44'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaCaminataEspecial! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:26'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaComunicaciones! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:38'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaEureka! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:53'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveOperativaEnCasillaFalloCritico! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:22:04'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaSoporteVital! !


!classDefinition: #JuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
Object subclass: #JuegoDeLaMisionAMarte
	instanceVariableNames: 'dado jugadores casillasEspeciales posiciones turno condicionDeLaNave'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JuegoDeLaMisionAMarte methodsFor: 'initialization' stamp: 'LL 9/25/2025 16:46:35'!
initializeConDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales.

	dado := unDado.
	jugadores := unConjuntoDeJugadores.
	casillasEspeciales := Dictionary newFrom: unConjuntoDeCasillasEspeciales.
	posiciones := Dictionary newFrom: (unConjuntoDeJugadores collect: [ :unJugador | unJugador -> 1 ]).
	turno := 1.
	condicionDeLaNave := Operativa en: self.! !


!JuegoDeLaMisionAMarte methodsFor: 'main protocol' stamp: 'LL 9/25/2025 21:47:04'!
siguienteTurno

	| posicionActual posicionSegunElDado posicionFinal jugadorEnTurno |
	
	jugadorEnTurno := self jugadorEnTurno.

	self establecerTurno.	
	
	posicionActual := self posicionDe: jugadorEnTurno.
	
	posicionSegunElDado := self nuevaPosicionSegunDado: posicionActual.
	
	posicionFinal := self nuevaPosicionDe: jugadorEnTurno partiendoDe: posicionSegunElDado.

	self mover: jugadorEnTurno a: posicionFinal
! !


!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 13:59:45'!
condicionDeLaNavePasaAAveriada
	condicionDeLaNave := Averiada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 14:59:46'!
condicionDeLaNavePasaAColpasada
	condicionDeLaNave := Colapsada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 14:05:26'!
condicionDeLaNavePasaADegradada

	condicionDeLaNave := Degradada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 14:05:33'!
condicionDeLaNavePasaAOperativa
	condicionDeLaNave := Operativa en: self! !


!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 22:25:44'!
desplazamientoEnCasillaCaminataEspacialDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:27:52'!
desplazamientoEnCasillaComunicacionesDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaComunicacionesDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:03'!
desplazamientoEnCasillaEurekaDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaEurekaDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:20'!
desplazamientoEnCasillaFalloCriticoDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 21:58:40'!
desplazamientoEnCasillaNeutraDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaNeutraDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:44'!
desplazamientoEnCasillaSoporteVitalDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador! !


!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:31:36'!
casillaDe: unaPosicion

	^ casillasEspeciales at: unaPosicion ifAbsent: [ Neutra new ]! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:32:46'!
desplazamientoDe: jugadorEnTurno alPasarPor: casilla

	| desplazamiento |
	desplazamiento := casilla desplazamientoDe: jugadorEnTurno en: self.
	self puntajeColectivo > 20 ifTrue: [
		desplazamiento := jugadorEnTurno modificarDesplazamientoPorSubidonDeAdrenalina: desplazamiento.
	].
	^desplazamiento
	! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:44:01'!
establecerTurno

	turno := turno \\ jugadores size + 1! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:30:47'!
jugadorEnTurno

	^ jugadores at: turno! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 15:12:33'!
jugadorNoPuedeDesplazarse

	self error: self class juegoTerminadoError! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:47:04'!
mover: jugadorEnTurno a: posicionFinal

	^ posiciones at: jugadorEnTurno put: posicionFinal! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:45:17'!
nuevaPosicionDe: jugadorEnTurno partiendoDe: unaPosicion 
	
	| desplazamiento casilla |
	casilla := self casillaDe: unaPosicion.
	desplazamiento := self desplazamientoDe: jugadorEnTurno alPasarPor: casilla. 
	^(unaPosicion + desplazamiento) max: 1.! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:40:22'!
nuevaPosicionSegunDado: posicionActual

	^ posicionActual + dado value! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'JS 9/23/2025 12:29:14'!
posicionDe: unJugador 

	^posiciones at: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 21:50:00'!
puntajeColectivo

	^posiciones sum.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JuegoDeLaMisionAMarte class' category: #'2c2025-1erParcial'!
JuegoDeLaMisionAMarte class
	instanceVariableNames: ''!

!JuegoDeLaMisionAMarte class methodsFor: 'instance creation' stamp: 'LL 9/25/2025 16:43:36'!
conDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales
	^self new initializeConDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales.! !


!JuegoDeLaMisionAMarte class methodsFor: 'error descriptions' stamp: 'JS 9/23/2025 12:37:34'!
juegoTerminadoError
	^ 'El juego a terminado'! !


!classDefinition: #TestJuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
TestCase subclass: #TestJuegoDeLaMisionAMarte
	instanceVariableNames: 'astronautaIngenieroMecanico astronautaEspecialistaEnComunicaciones astronautaConFamilia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:43:20'!
nuevoJuegoConDado: unDado conJugadores: unConjuntoDeJugadores yConCasillasEspeciales: unConjuntoDeCasillasEspeciales

	^JuegoDeLaMisionAMarte conDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test01UnJugadorAvanzaCuandoEsSuTurno

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].
	
	juego := self nuevoJuegoConDado: dado conJugadores: {astronautaIngenieroMecanico} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test02LosJugadoresAvanzanUnoALaVez

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test03ElTurnoEstaDadoPorElOrdenInicialDeLosJugadores

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test04LaRondaVuelveAComenzarConElPrimerJugador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.

	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 3.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test05CadaJugadorAvanzaSegunElValorIndicadoPorElDado

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 5.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 3.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test06ElJugadorNoSeVeAfectadoPorCasillaEspecialSiNoCaeEnUna

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test07AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test08AstronautaEnNaveOperativaAvanza1CasillaMasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test09AstronautaEnNaveOperativaRetrocede1CasillaAlCaerEnFalloCritico

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test10AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaEureka}.

	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test11AstronautaEnNaveDegradadaRetrocede1CasillaAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test12AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
			 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
			 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.

	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test13AstronautaEnNaveDegradadaRetrocede2CasillasAlCaerEnFalloCritico

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:49'!
test14AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:49'!
test15AstronautaEnNaveAveriadaRetrocede2CasillasAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test16AstronautaEnNaveAveriadaRetrocede1CasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test17AstronautaEnNaveAveriadaSeQuedaEnLaCasillaAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	

	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.	
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 0.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test18LaCasillaEurekaMejoraLaCondicionDeDegradadaAOperativa

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test19LaCasillaEurekaMejoraLaCondicionDeAveriadaADegradada

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test20LaCasillaCaminataEspacialMejoraLaCondicionDeDegradadaAOperativa

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 3 2) readStream.
	dado := [ tiradasDelDado next ].	

	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka. 4 -> self casillaCaminataEspacial}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test21LaCasillaCaminataEspacialMejoraLaCondicionDeAveriadaADegradada

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 3 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka. 4 -> self casillaCaminataEspacial}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test22AstronautaEspecialistaEnComunicacionesEnNaveDegradadaSeQuedaEnLaCasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaEspecialistaEnComunicaciones.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.	
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 2 + 0.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test23AstronautaConFamiliaEnNaveDegradadaRetrocede1CasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaConFamilia.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test24AstronautaEspecialistaEnComunicacionesEnNaveAveriadaRetrocede2CasillasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaConFamilia. astronautaEspecialistaEnComunicaciones}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:49'!
test25AstronautaConFamiliaEnNaveAveriadaRetrocede3CasillasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico. astronautaConFamilia.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 4 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1 + 3 - 3.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test26AstronautaNoSeSaleDelTablero

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
			 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico. astronautaConFamilia.}
			 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test27SiLaNaveColapsaElJuegoTermina

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico}
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
		
	self 
		should: [ juego siguienteTurno ] 
		raise:  Error - MessageNotUnderstood 
		withExceptionDo: [ : aRaisedError |
			self assert: aRaisedError messageText equals: JuegoDeLaMisionAMarte juegoTerminadoError.
			self assert: (	juego posicionDe: astronautaIngenieroMecanico) equals: 2.
		]
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test28ElPuntajeColectivoEsLaSumaDeLasPosicionesDeLosJugadores

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico}
				 yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: juego puntajeColectivo equals: 9! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:48'!
test29SiElPuntajeColectivoSuperaLos20PuntosElAstronautaEspecialistaEnComunicacionesUsaSuMultiplicador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(6 6 6 2 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones}
				 yConCasillasEspeciales: {22 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 6 + 6 + 6 + 2 + 1 + 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 16:41:49'!
test30SiElPuntajeColectivoSuperaLos20PuntosElAstronautaConFamiliaUsaSuMultiplicador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(6 6 6 2 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaConFamilia}
				 yConCasillasEspeciales: {22 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1 + 6 + 6 + 6 + 2 + 1 + 3.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'setUp/tearDown' stamp: 'LL 9/25/2025 14:45:20'!
setUp

	astronautaIngenieroMecanico := AstronautaIngenieroMecanico new.
	astronautaEspecialistaEnComunicaciones := AstronautaEspecialistaEnComunicaciones new.
	astronautaConFamilia := AstronautaConFamilia new.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:40:33'!
casillaCaminataEspacial

	^CaminataEspacial new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:25:13'!
casillaComunicaciones

	^Comunicaciones new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:36:42'!
casillaEureka

	^Eureka new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:27:14'!
casillaFalloCritico

	^FalloCritico new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:19:39'!
casillaSoporteVital

	^SoporteVital new! !
