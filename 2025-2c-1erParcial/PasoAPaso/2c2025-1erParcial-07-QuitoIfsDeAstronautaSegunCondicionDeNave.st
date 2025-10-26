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

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:08:56'!
afectarDesplazamientoEnCasillaCaminataEspecialDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:08:47'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:12:45'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:16:33'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	self subclassResponsibility! !

!CondicionDeLaNave methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:19:36'!
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


!JuegoDeLaMisionAMarte methodsFor: 'setters' stamp: 'JS 9/22/2025 23:26:42'!
setCasillasEspeciales: casEsp

	casillasEspeciales := Dictionary newFrom: casEsp.
! !

!JuegoDeLaMisionAMarte methodsFor: 'setters' stamp: 'JS 9/22/2025 23:26:01'!
setJugadores: j

	jugadores := j.
	posiciones := Dictionary newFrom: (j collect: [ :each | each -> 1 ]).! !


!JuegoDeLaMisionAMarte methodsFor: 'main protocol' stamp: 'LL 9/25/2025 14:46:12'!
siguienteTurno

	| pos0 pos1 pos2 jugadorEnTurno casilla desplazamiento |
	
	turno ifNil: [turno := 1].
	condicionDeLaNave ifNil: [condicionDeLaNave := Operativa en: self ].
	
	jugadorEnTurno := jugadores at: turno.
	turno := turno \\ jugadores size + 1. 
	
	pos0 := self posicionDe: jugadorEnTurno.
	pos1 := pos0 + dado value.
	casilla := casillasEspeciales at: pos1 ifAbsent: [ Neutra new ].
	desplazamiento := self desplazamientoDe: jugadorEnTurno alPasarPor: casilla. 
	
	condicionDeLaNave = #Colapsada ifTrue: [ self error: self class juegoTerminadoError ].
	
	self puntajeColectivo > 20 ifTrue: [
		(jugadorEnTurno isKindOf: AstronautaEspecialistaEnComunicaciones) ifTrue: [ 
			| truncation newDesp |
			newDesp := desplazamiento * 1.5.
			truncation := newDesp truncated.
			newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
			newDesp = truncation
				ifTrue: [ desplazamiento  := truncation ]
				ifFalse: [ desplazamiento  := truncation + 1 ]
		].
		(jugadorEnTurno isKindOf: AstronautaConFamilia) ifTrue: [ 
			| truncation newDesp |
			newDesp := desplazamiento * 2.5.
			truncation := newDesp truncated.
			newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
			newDesp = truncation
				ifTrue: [ desplazamiento  := truncation ]
				ifFalse: [ desplazamiento  := truncation + 1 ]
		].
	].
	
	pos2 := (pos1 + desplazamiento).
	pos2 < 1 ifTrue: [ pos2 := 1 ].
	
	posiciones at: jugadorEnTurno put: pos2
! !


!JuegoDeLaMisionAMarte methodsFor: 'initialization' stamp: 'LL 9/25/2025 13:54:09'!
initializeConDado: unDado

	dado := unDado.
	jugadores := nil.
	casillasEspeciales := nil.
	posiciones := nil.
	turno := nil.
	condicionDeLaNave := nil! !


!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 13:59:45'!
condicionDeLaNavePasaAAveriada
	condicionDeLaNave := Averiada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 13:29:07'!
condicionDeLaNavePasaAColpasada
	condicionDeLaNave := #Colapsada! !

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

!JuegoDeLaMisionAMarte class methodsFor: 'instance creation' stamp: 'JS 9/22/2025 23:27:10'!
conDado: unDado
	^self new initializeConDado: unDado! !


!JuegoDeLaMisionAMarte class methodsFor: 'error descriptions' stamp: 'JS 9/23/2025 12:37:34'!
juegoTerminadoError
	^ 'El juego a terminado'! !


!classDefinition: #TestJuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
TestCase subclass: #TestJuegoDeLaMisionAMarte
	instanceVariableNames: 'astronautaIngenieroMecanico astronautaEspecialistaEnComunicaciones astronautaConFamilia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/22/2025 23:43:13'!
test01UnJugadorAvanzaCuandoEsSuTurno

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:18:41'!
test02LosJugadoresAvanzanUnoALaVez

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:24:43'!
test03ElTurnoEstaDadoPorElOrdenInicialDeLosJugadores

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 2.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:25:10'!
test04LaRondaVuelveAComenzarConElPrimerJugador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 3.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:27:29'!
test05CadaJugadorAvanzaSegunElValorIndicadoPorElDado

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 5.
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 3.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 13:19:39'!
test06ElJugadorNoSeVeAfectadoPorCasillaEspecialSiNoCaeEnUna

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {3 -> (self casillaSoporteVital)}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 13:19:39'!
test07AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> (self casillaSoporteVital)}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:52:11'!
test08AstronautaEnNaveOperativaAvanza1CasillaMasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:52:37'!
test09AstronautaEnNaveOperativaRetrocede1CasillaAlCaerEnFalloCritico

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 09:57:03'!
test10AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaEureka}.
	
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 13:19:39'!
test11AstronautaEnNaveDegradadaRetrocede1CasillaAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> (self casillaSoporteVital)}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:57:38'!
test12AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 10:35:37'!
test13AstronautaEnNaveDegradadaRetrocede2CasillasAlCaerEnFalloCritico

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaFalloCritico }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 10:38:47'!
test14AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'LL 9/25/2025 13:19:39'!
test15AstronautaEnNaveAveriadaRetrocede2CasillasAlCaerEnSoporteVital

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> (self casillaSoporteVital)}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:04:34'!
test16AstronautaEnNaveAveriadaRetrocede1CasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:34:43'!
test17AstronautaEnNaveAveriadaSeQuedaEnLaCasillaAlCaerEnEureka

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 - 0.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:34:49'!
test18LaCasillaEurekaMejoraLaCondicionDeDegradadaAOperativa

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:43:04'!
test19LaCasillaEurekaMejoraLaCondicionDeAveriadaADegradada

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:44:59'!
test20LaCasillaCaminataEspacialMejoraLaCondicionDeDegradadaAOperativa

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 3 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka . 4 -> self casillaCaminataEspacial}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 11:48:03'!
test21LaCasillaCaminataEspacialMejoraLaCondicionDeAveriadaADegradada

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 3 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka . 4 -> self casillaCaminataEspacial}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaIngenieroMecanico) equals: 1 + 1 - 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:03:02'!
test22AstronautaEspecialistaEnComunicacionesEnNaveDegradadaSeQuedaEnLaCasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 2 + 0.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:10:02'!
test23AstronautaConFamiliaEnNaveDegradadaRetrocede1CasillaAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaConFamilia}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:16:17'!
test24AstronautaEspecialistaEnComunicacionesEnNaveAveriadaRetrocede2CasillasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaIngenieroMecanico . astronautaConFamilia . astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:21:31'!
test25AstronautaConFamiliaEnNaveAveriadaRetrocede3CasillasAlCaerEnComunicaciones

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico . astronautaConFamilia}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 4 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1 + 3 - 3.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:24:44'!
test26AstronautaNoSeSaleDelTablero

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaIngenieroMecanico . astronautaConFamilia}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assert: (juego posicionDe: astronautaConFamilia) equals: 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:41:52'!
test27SiLaNaveColapsaElJuegoTermina

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {2 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	juego siguienteTurno.
		
	self 
		should: [ juego siguienteTurno ] 
		raise:  Error - MessageNotUnderstood 
		withExceptionDo: [ : aRaisedError |
			self assert: aRaisedError messageText equals: JuegoDeLaMisionAMarte juegoTerminadoError.
			self assert: (	juego posicionDe: astronautaIngenieroMecanico) equals: 1.
		]
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 12:55:05'!
test28ElPuntajeColectivoEsLaSumaDeLasPosicionesDeLosJugadores

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones . astronautaConFamilia . astronautaIngenieroMecanico}.
	juego setCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: juego puntajeColectivo equals: 9! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 13:12:06'!
test29SiElPuntajeColectivoSuperaLos20PuntosElAstronautaEspecialistaEnComunicacionesUsaSuMultiplicador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(6 6 6 2 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaEspecialistaEnComunicaciones}.
	juego setCasillasEspeciales: {22 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: (juego posicionDe: astronautaEspecialistaEnComunicaciones) equals: 1 + 6 + 6 + 6 + 2 + 1 + 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests' stamp: 'JS 9/23/2025 13:13:06'!
test30SiElPuntajeColectivoSuperaLos20PuntosElAstronautaConFamiliaUsaSuMultiplicador

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(6 6 6 2 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := JuegoDeLaMisionAMarte conDado: dado.
	juego setJugadores: {astronautaConFamilia}.
	juego setCasillasEspeciales: {22 -> self casillaComunicaciones}.
	
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
