!classDefinition: #Astronauta category: #'2c2025-1erParcial'!
Object subclass: #Astronauta
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Astronauta methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:41:56'!
desplazamientoEnNaveAveriada

	self subclassResponsibility! !

!Astronauta methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:50:24'!
desplazamientoEnNaveDegradada

	self subclassResponsibility! !

!Astronauta methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:27:22'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	self subclassResponsibility! !


!classDefinition: #AstronautaConFamilia category: #'2c2025-1erParcial'!
Astronauta subclass: #AstronautaConFamilia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!AstronautaConFamilia methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:42:56'!
desplazamientoEnNaveAveriada

	^-3! !

!AstronautaConFamilia methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:51:09'!
desplazamientoEnNaveDegradada

	^-1! !

!AstronautaConFamilia methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:27:22'!
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

!AstronautaEspecialistaEnComunicaciones methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:43:10'!
desplazamientoEnNaveAveriada

	^-2! !

!AstronautaEspecialistaEnComunicaciones methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:50:55'!
desplazamientoEnNaveDegradada

	^0! !

!AstronautaEspecialistaEnComunicaciones methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:27:22'!
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

!AstronautaIngenieroMecanico methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:41:18'!
desplazamientoEnNaveAveriada

	^-1! !

!AstronautaIngenieroMecanico methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:51:28'!
desplazamientoEnNaveDegradada

	^1! !

!AstronautaIngenieroMecanico methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:27:22'!
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

!CaminataEspacial methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:27:16'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaCaminataEspecialDe: unJugador.
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

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:04:39'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

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

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:08:56'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^0! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:43:59'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoEnNaveAveriada! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:15:48'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^0 ! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:17:42'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAColpasada.
	^0! !

!Averiada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:24:51'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^-2! !


!classDefinition: #Colapsada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Colapsada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Colapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

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

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:08:56'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^0! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:51:50'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoEnNaveDegradada! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:13:19'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^1! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:17:17'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAAveriada. 
	^-2! !

!Degradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:24:39'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^-1! !


!classDefinition: #Operativa category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #Operativa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:08:56'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

	^0! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:09:21'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^1! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:13:05'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	^2! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:17:01'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^-1! !

!Operativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:24:23'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^2! !


!classDefinition: #JuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
Object subclass: #JuegoDeLaMisionAMarte
	instanceVariableNames: 'dado jugadores casillasEspeciales posiciones turno condicionDeLaNave'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 13:45:37'!
desplazamientoDe: jugadorEnTurno alPasarPor: casilla

	^casilla desplazamientoDe: jugadorEnTurno en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 15:12:33'!
jugadorNoPuedeDesplazarse

	self error: self class juegoTerminadoError! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'JS 9/23/2025 12:29:14'!
posicionDe: unJugador 

	^posiciones at: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'JS 9/23/2025 12:59:55'!
puntajeColectivo

	| k tot |
	
	k := posiciones keys asOrderedCollection.
	tot := 0.

	1 to: k size do: [:i |
	    | key value |
	    key := k at: i.
	    value := posiciones at: key.
	    tot := tot + value ].

	^tot
! !


!JuegoDeLaMisionAMarte methodsFor: 'main protocol' stamp: 'LL 9/25/2025 16:18:25'!
siguienteTurno

	| pos0 pos1 pos2 jugadorEnTurno casilla desplazamiento |
	
	jugadorEnTurno := jugadores at: turno.
	turno := turno \\ jugadores size + 1. 
	
	pos0 := self posicionDe: jugadorEnTurno.
	pos1 := pos0 + dado value.
	casilla := casillasEspeciales at: pos1 ifAbsent: [ Neutra new ].
	
	desplazamiento := self desplazamientoDe: jugadorEnTurno alPasarPor: casilla. 
	
	self puntajeColectivo > 20 ifTrue: [
		desplazamiento := jugadorEnTurno modificarDesplazamientoPorSubidonDeAdrenalina: desplazamiento.
	].
	
	pos2 := (pos1 + desplazamiento).
	pos2 < 1 ifTrue: [ pos2 := 1 ].
	
	posiciones at: jugadorEnTurno put: pos2
! !


!JuegoDeLaMisionAMarte methodsFor: 'initialization' stamp: 'LL 9/25/2025 16:46:35'!
initializeConDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales.

	dado := unDado.
	jugadores := unConjuntoDeJugadores.
	casillasEspeciales := Dictionary newFrom: unConjuntoDeCasillasEspeciales.
	posiciones := Dictionary newFrom: (unConjuntoDeJugadores collect: [ :unJugador | unJugador -> 1 ]).
	turno := 1.
	condicionDeLaNave := Operativa en: self.! !


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


!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:27:27'!
desplazamientoEnCasillaCaminataEspecialDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:27:52'!
desplazamientoEnCasillaComunicacionesDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaComunicacionesDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:03'!
desplazamientoEnCasillaEurekaDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaEurekaDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:20'!
desplazamientoEnCasillaFalloCriticoDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:29:56'!
desplazamientoEnCasillaNeutraDe: unJugador

	^0! !

!JuegoDeLaMisionAMarte methodsFor: 'desplazamiento segun casilla' stamp: 'LL 9/25/2025 14:28:44'!
desplazamientoEnCasillaSoporteVitalDe: unJugador

	^condicionDeLaNave afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador! !

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
