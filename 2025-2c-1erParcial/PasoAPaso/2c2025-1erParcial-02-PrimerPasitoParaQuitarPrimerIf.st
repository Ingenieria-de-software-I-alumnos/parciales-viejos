!classDefinition: #Casilla category: #'2c2025-1erParcial'!
Object subclass: #Casilla
	instanceVariableNames: 'juego'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Casilla methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:19:16'!
desplazamientoDe: unJugador en: elJuego

	self subclassResponsibility! !


!classDefinition: #SoporteVital category: #'2c2025-1erParcial'!
Casilla subclass: #SoporteVital
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!SoporteVital methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:19:07'!
desplazamientoDe: unJugador en: elJuego

	elJuego condicionDeLaNave = #Operativa ifTrue: [ ^2 ].
	elJuego condicionDeLaNave = #Degradada ifTrue: [ ^-1 ].
	elJuego condicionDeLaNave = #Averiada ifTrue: [ ^-2 ].! !


!classDefinition: #JuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
Object subclass: #JuegoDeLaMisionAMarte
	instanceVariableNames: 'dado jugadores casillasEspeciales posiciones turno condicionDeLaNave'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 13:19:58'!
desplazamientoDe: jugadorEnTurno alPasarPor: casilla

	(casilla isKindOf: SoporteVital) ifTrue: [
		^casilla desplazamientoDe: jugadorEnTurno en: self
	].
	casilla = #Comunicaciones ifTrue: [
		condicionDeLaNave = #Operativa ifTrue: [ ^1 ].
		condicionDeLaNave = #Degradada ifTrue: [ 
			| res |
			res := 0.
			jugadorEnTurno = #AstronautaEspecialistaEnComunicaciones ifTrue: [ res := 1 ].
			jugadorEnTurno = #AstronautaConFamilia ifTrue: [ res := 2  ].
			^1 - res
		].
		condicionDeLaNave = #Averiada ifTrue: [ 
			| res |
			res := 0.
			jugadorEnTurno = #AstronautaEspecialistaEnComunicaciones ifTrue: [ res := 1 ].
			jugadorEnTurno = #AstronautaConFamilia ifTrue: [ res := 2  ].
			^-1 - res
		].
		 
	].
	casilla = #FalloCritico ifTrue: [
		condicionDeLaNave = #Operativa ifTrue: [ 
			condicionDeLaNave := #Degradada.
			^-1
		].
		condicionDeLaNave = #Degradada ifTrue: [ 
			condicionDeLaNave := #Averiada. 
			^-2
		].
		condicionDeLaNave = #Averiada ifTrue: [ 
			condicionDeLaNave := #Colapsada.
			^0
		].
	].

	casilla = #Eureka ifTrue: [
		condicionDeLaNave = #Operativa ifTrue: [ 
			^2
		].
		condicionDeLaNave = #Degradada ifTrue: [ 
			condicionDeLaNave := #Operativa.
			^1
		].
		condicionDeLaNave = #Averiada ifTrue: [ 
			condicionDeLaNave := #Degradada.
			^0 
		].
		 
	].
	casilla = #CaminataEspacial ifTrue: [
		condicionDeLaNave = #Operativa ifTrue: [ 
			^0
		].
		condicionDeLaNave = #Averiada ifTrue: [ 
			condicionDeLaNave := #Degradada.
			^0
		].
		condicionDeLaNave = #Degradada ifTrue: [ 
			condicionDeLaNave := #Operativa.
			^0
		].
	].
	casilla = #Neutra ifTrue: [ ^0 ].
	
	self error: 'desplazamiento invalido'! !

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


!JuegoDeLaMisionAMarte methodsFor: 'main protocol' stamp: 'LL 9/25/2025 12:53:47'!
siguienteTurno

	| pos0 pos1 pos2 jugadorEnTurno casilla desplazamiento |
	
	turno ifNil: [turno := 1].
	condicionDeLaNave ifNil: [condicionDeLaNave := #Operativa].
	
	jugadorEnTurno := jugadores at: turno.
	turno := turno \\ jugadores size + 1. 
	
	pos0 := self posicionDe: jugadorEnTurno.
	pos1 := pos0 + dado value.
	casilla := casillasEspeciales at: pos1 ifAbsent: [ #Neutra ].
	desplazamiento := self desplazamientoDe: jugadorEnTurno alPasarPor: casilla. 
	
	condicionDeLaNave = #Colapsada ifTrue: [ self error: self class juegoTerminadoError ].
	
	self puntajeColectivo > 20 ifTrue: [
		jugadorEnTurno = #AstronautaEspecialistaEnComunicaciones ifTrue: [ 
			| truncation newDesp |
			newDesp := desplazamiento * 1.5.
			truncation := newDesp truncated.
			newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
			newDesp = truncation
				ifTrue: [ desplazamiento  := truncation ]
				ifFalse: [ desplazamiento  := truncation + 1 ]
		].
		jugadorEnTurno = #AstronautaConFamilia ifTrue: [ 
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


!JuegoDeLaMisionAMarte methodsFor: 'initialization' stamp: 'JS 9/23/2025 11:07:11'!
initializeConDado: unDado

	dado := unDado.
	jugadores := nil.
	casillasEspeciales := nil.
	posiciones := nil.
	turno := nil.
	condicionDeLaNave := nil.! !


!JuegoDeLaMisionAMarte methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:04:45'!
condicionDeLaNave

	^condicionDeLaNave! !

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


!TestJuegoDeLaMisionAMarte methodsFor: 'setUp/tearDown' stamp: 'JS 9/23/2025 12:04:33'!
setUp

	astronautaIngenieroMecanico := #AstronautaIngenieroMecanico.
	astronautaEspecialistaEnComunicaciones := #AstronautaEspecialistaEnComunicaciones.
	astronautaConFamilia := #AstronautaConFamilia! !


!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'JS 9/23/2025 09:59:20'!
casillaCaminataEspacial

	^#CaminataEspacial! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'JS 9/23/2025 09:44:10'!
casillaComunicaciones

	^#Comunicaciones! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'JS 9/23/2025 09:57:16'!
casillaEureka

	^#Eureka! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'JS 9/23/2025 09:52:55'!
casillaFalloCritico

	^#FalloCritico! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 13:19:39'!
casillaSoporteVital

	^SoporteVital new! !
