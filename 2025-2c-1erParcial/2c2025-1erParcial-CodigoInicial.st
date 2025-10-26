!classDefinition: #JuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
Object subclass: #JuegoDeLaMisionAMarte
	instanceVariableNames: 'dado jugadores casillasEspeciales posiciones turno condicionDeLaNave'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'JS 9/26/2025 12:36:44'!
desplazamientoDe: jugadorEnTurno alPasarPor: casilla

	condicionDeLaNave = #Colapsada ifTrue: [ self error: self class juegoTerminadoError ].

	casilla = #SoporteVital ifTrue: [
		condicionDeLaNave = #Operativa ifTrue: [ ^0 ].
		condicionDeLaNave = #Degradada ifTrue: [ ^-1 ].
		condicionDeLaNave = #Averiada ifTrue: [ ^-2 ].
		 
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


!JuegoDeLaMisionAMarte methodsFor: 'main protocol' stamp: 'JS 9/26/2025 14:49:16'!
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
	
	self puntajeColectivo > 20 ifTrue: [
		jugadorEnTurno = #AstronautaEspecialistaEnComunicaciones ifTrue: [ 
			"Redondeo para arriba"
			| truncation newDesp |
			newDesp := desplazamiento * 1.5.
			truncation := newDesp truncated.
			newDesp = truncation
				ifTrue: [ desplazamiento  := truncation ]
				ifFalse: [ desplazamiento  := truncation + 1 ].
			newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
		].
		jugadorEnTurno = #AstronautaConFamilia ifTrue: [ 
			"Redondeo para arriba"
			| truncation newDesp |
			newDesp := desplazamiento * 2.5.
			truncation := newDesp truncated.
			newDesp = truncation
				ifTrue: [ desplazamiento  := truncation ]
				ifFalse: [ desplazamiento  := truncation + 1 ].
			newDesp <= 0 ifTrue: [ desplazamiento  := truncation ].
		].
	].
	
	"Me quedo con el mayor de dos valores: 1 y la nueva posición. Así evitamos que el astronauta se salga del tablero"
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

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Mecanica de turnos' stamp: 'JS 9/26/2025 12:21:53'!
test01UnAstronautaAvanzaCuandoEsSuTurno

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].
	
	juego := self nuevoJuegoConDado: dado conJugadores: {astronautaIngenieroMecanico} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Mecanica de turnos' stamp: 'JS 9/26/2025 12:22:00'!
test02LosAstronautasAvanzanUnoALaVez

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores: {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1.
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Mecanica de turnos' stamp: 'JS 9/26/2025 12:23:41'!
test03ElTurnoEstaDadoPorElOrdenInicialDeLosAstronautas

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1.
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Mecanica de turnos' stamp: 'JS 9/26/2025 12:23:15'!
test04LaRondaVuelveAComenzarConElPrimerAstronauta

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.

	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 + 1.
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Mecanica de turnos' stamp: 'JS 9/26/2025 12:23:27'!
test05CadaAstronautaAvanzaSegunElValorIndicadoPorElDado

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico . astronautaEspecialistaEnComunicaciones} yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 + 3.
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 2.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas' stamp: 'JS 9/26/2025 12:20:45'!
test06ElAstronautaNoSeVeAfectadoPorCasillaEspecialSiNoCaeEnUna
	"
	El astronauta al caer en la casilla 2 se encuentra con en una casilla neutra, por lo que no hay desplazamiento adicional
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas' stamp: 'JMB 9/26/2025 01:01:44'!
test07AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnSoporteVital
	"
	El astronauta al caer en la casilla 2 se encuentra con 'soporte vital', por lo que hace que avance dos casillas hasta la 4
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 + 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas' stamp: 'JMB 9/26/2025 01:02:14'!
test08AstronautaEnNaveOperativaAvanza1CasillaMasAlCaerEnComunicaciones
	"
	El astronauta al caer en la casilla 2 se encuentra con 'comunicaciones', por lo que hace que avance una casilla hasta la 3
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 + 1.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas' stamp: 'JMB 9/26/2025 01:02:30'!
test09AstronautaEnNaveOperativaRetrocede1CasillaAlCaerEnFalloCritico
	"
	El astronauta al caer en la casilla 2 se encuentra con un 'fallo critico', por lo que hace que retroceda una casilla y vuelva a la 1
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas' stamp: 'JMB 9/26/2025 01:02:52'!
test10AstronautaEnNaveOperativaAvanza2CasillasMasAlCaerEnEureka
	"
	El astronauta al caer en la casilla 2 se encuentra con 'eureka', por lo que hace que avance 2 casillas hasta la 4
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado conJugadores:  {astronautaIngenieroMecanico} yConCasillasEspeciales: {2 -> self casillaEureka}.

	juego siguienteTurno.
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 + 2.
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:03:16'!
test11AstronautaEnNaveDegradadaRetrocede1CasillaAlCaerEnSoporteVital
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Ingeniero mecanico cayo en la casilla 3 donde se encuentra 'soporte vital' y al estar la nave degradada retrocede 
	una casilla (hasta la 2)
	"

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:03:37'!
test12AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnComunicaciones
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Ingeniero mecanico cayo en la casilla 3 donde se encuentra 'comunicaciones' y al estar la nave degradada avanza
	una casilla (hasta la 4).
	"
	
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
			 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
			 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.

	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 + 1.	
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:03:53'!
test13AstronautaEnNaveDegradadaRetrocede2CasillasAlCaerEnFalloCritico
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Ingeniero mecanico cayo en la casilla 3 donde se encuentra otro 'fallo critico' y al estar la nave degradada retrocede 
	dos casillas (hasta la 1)
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaFalloCritico}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:04:11'!
test14AstronautaEnNaveDegradadaAvanza1CasillaMasAlCaerEnEureka
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Ingeniero mecanico cayo en la casilla 3 donde se encuentra 'eureka' y como la nave estaba degradada avanza
	una casilla (hasta la 4).
	"
	
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:04:34'!
test15AstronautaEnNaveAveriadaRetrocede2CasillasAlCaerEnSoporteVital
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave y retrocedio a la casilla 1 (ver test09).
	El Ingeniero mecanico cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada.
	El Especialista en comunicaciones cayo en la casilla 3 (estaba en 1 y avanzo 2) donde se encuentra con 'soporte vital' y al estar la nave averiada hace que retroceda 2 casillas (de la 3 a la 1)
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
		 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico} 
		 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaSoporteVital}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:04:50'!
test16AstronautaEnNaveAveriadaRetrocede1CasillaAlCaerEnComunicaciones
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauto con familia cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada.
	El Ingeniero mecanico cayo en la casilla 3 en 'comunicaciones', y al estar la nave averiada hace que retroceda una casilla (a la 2).
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun casillas y estado de la nave' stamp: 'JMB 9/26/2025 01:05:05'!
test17AstronautaEnNaveAveriadaSeQuedaEnLaCasillaAlCaerEnEureka
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauto con familia cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada.
	El Ingeniero mecanico cayo en la casilla 3 en 'eureka', y al estar la nave averiada no tiene efectos de desplazamientos (se queda en la casilla 3).
	"

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	

	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.	
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 - 0.
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Variaciones del estado de la nave' stamp: 'JMB 9/26/2025 01:05:32'!
test18LaCasillaEurekaMejoraLaCondicionDeDegradadaAOperativa
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauto con familia cayo en la casilla 3 en 'eureka' por lo que la nave paso de degradada a operativa.
	El Ingeniero mecanico cayo en la casilla 3 en 'eureka', por lo que al estar la nave operativa hace que avance 2 casillas hasta la 5 (test10)
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico} 
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Variaciones del estado de la nave' stamp: 'JMB 9/26/2025 01:05:59'!
test19LaCasillaEurekaMejoraLaCondicionDeAveriadaADegradada
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave y retrocedio a la casilla 1.
	El Ingeniero mecanico cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada y retrocedio a la casilla 1.
	El Especialista en comunicaciones cayo en la casilla 3 (paso de 1 a 3) en 'eureka', por lo que la nave pasa de averiada a degradada
	El Ingeniero mecanico cayo en la casilla 3 (paso de 1 a 3) en 'eureka', y como la nave estaba degradada avanza una casilla (hasta la 4) (test14).
	"
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
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 - 1 + 2 + 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Variaciones del estado de la nave' stamp: 'JMB 9/26/2025 01:06:30'!
test20LaCasillaCaminataEspacialMejoraLaCondicionDeDegradadaAOperativa
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauto con familia cayo en la casilla 4 en 'caminata espacial' por lo que la nave paso de degradada a operativa.
	El Ingeniero mecanico cayo en la casilla 3 en 'eureka', por lo que al estar la nave operativa hace que avance 2 casillas hasta la 5 (test10)
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 3 2) readStream.
	dado := [ tiradasDelDado next ].	

	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaEureka. 4 -> self casillaCaminataEspacial}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 2 + 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Variaciones del estado de la nave' stamp: 'JMB 9/26/2025 01:07:08'!
test21LaCasillaCaminataEspacialMejoraLaCondicionDeAveriadaADegradada
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave y retrocedio a la casilla 1.
	El Ingeniero mecanico cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada y retrocedio a la casilla 1.
	El Especialista en comunicaciones cayo en la casilla 4 (paso de 1 a 4) en 'caminata espacial', por lo que la nave pasa de averiada a degradada
	El Ingeniero mecanico cayo en la casilla 3 (paso de 1 a 3) en 'eureka', y como la nave estaba degradada avanza una casilla (hasta la 4) (test14).
	"
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
	
	self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 1 + 1 - 1 + 2 + 1.
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun astronautas' stamp: 'JMB 9/26/2025 01:19:45'!
test22AstronautaEspecialistaEnComunicacionesEnNaveDegradadaSeQuedaEnLaCasillaAlCaerEnComunicaciones
	"
	El  Ingeniero mecanico cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Especialista en comunicaciones cayo en la casilla 3 en 'comunicaciones', y al estar la nave degradada no tiene efectos de desplazamientos (se queda en la casilla 3).
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaEspecialistaEnComunicaciones.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.	
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 2 + 0.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun astronautas' stamp: 'JMB 9/26/2025 01:20:10'!
test23AstronautaConFamiliaEnNaveDegradadaRetrocede1CasillaAlCaerEnComunicaciones
	"
	El  Ingeniero mecanico cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauta con familia cayo en la casilla 3 en 'comunicaciones', y al estar la nave degradada hace que retroceda una casilla terminando en la casilla 2.
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaConFamilia.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaConFamilia en: juego es: 1 + 2 - 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun astronautas' stamp: 'JMB 9/26/2025 01:20:35'!
test24AstronautaEspecialistaEnComunicacionesEnNaveAveriadaRetrocede2CasillasAlCaerEnComunicaciones
	"
	El Ingeniero mecanico cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Astronauto con familia cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada.
	El Especialista en comunicaciones cayo en la casilla 3 en 'comunicaciones', por lo que al estar la nave averiada hace que retroceda 2 casillas hasta la 1.
	"

	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 2) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaIngenieroMecanico. astronautaConFamilia. astronautaEspecialistaEnComunicaciones}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 3 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 2 - 2.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Desplazamientos segun astronautas' stamp: 'JMB 9/26/2025 01:20:58'!
test25AstronautaConFamiliaEnNaveAveriadaRetrocede3CasillasAlCaerEnComunicaciones
	"
	El Especialista en comunicaciones cayo en la casilla 2 en un 'fallo critico' por lo que degrado la nave.
	El Ingeniero mecanico cayo en la casilla 2 en el 'fallo critico' por lo que la nave paso de degradada a averiada.
	El Astronauto con familia cayo en la casilla 4 en 'comunicaciones', por lo que al estar la nave averiada hace que retroceda 3 casillas hasta la 1. 
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 1 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaIngenieroMecanico. astronautaConFamilia.}
				 yConCasillasEspeciales: {2 -> self casillaFalloCritico . 4 -> self casillaComunicaciones. }.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno. 
	
	self assertLaPosicionDe: astronautaConFamilia en: juego es: 1 + 3 - 3.
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Casos bordes' stamp: 'JMB 9/26/2025 01:21:27'!
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
	
	self assertLaPosicionDe: astronautaConFamilia en: juego es: 1.
	! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Casos bordes' stamp: 'JMB 9/26/2025 01:21:46'!
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
			self assertLaPosicionDe: astronautaIngenieroMecanico en: juego es: 2.
		]
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Subidon de adrenalina' stamp: 'JS 9/26/2025 12:27:26'!
test28ElPuntajeColectivoEsLaSumaDeLasPosicionesDeLosJugadores
	"
	Los astronautas están en las casillas 2, 3 y 4, por lo que el puntaje colectivo es 9
	"
	| tiradasDelDado dado juego |
	
	tiradasDelDado := #(1 2 3) readStream.
	dado := [ tiradasDelDado next ].	
	
	juego := self nuevoJuegoConDado: dado 
				 conJugadores: {astronautaEspecialistaEnComunicaciones. astronautaConFamilia. astronautaIngenieroMecanico}
				 yConCasillasEspeciales: {}.
	
	juego siguienteTurno.
	juego siguienteTurno.
	juego siguienteTurno.
	
	self assert: juego puntajeColectivo equals: 2 + 3 + 4! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Subidon de adrenalina' stamp: 'JS 9/26/2025 15:27:04'!
test29SiElPuntajeColectivoSuperaLos20PuntosElAstronautaEspecialistaEnComunicacionesUsaSuMultiplicadorPorSubidonDeAdrenalina
	"
	El puntaje colectivo superó los 20 puntos, por lo que el Especialista en comunicaciones multiplica su desplazamiento adicional por subidon de adrenalina.
	1.5 * 1 (Desplazamiento adicional en la casilla comunicaciones para nave operativa) = 1.5 -> Redondeando para arriba es 2. 
	"
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
	
	self assertLaPosicionDe: astronautaEspecialistaEnComunicaciones en: juego es: 1 + 6 + 6 + 6 + 2 + 1 + 2.! !

!TestJuegoDeLaMisionAMarte methodsFor: 'tests - Subidon de adrenalina' stamp: 'JS 9/26/2025 15:27:13'!
test30SiElPuntajeColectivoSuperaLos20PuntosElAstronautaConFamiliaUsaSuMultiplicadorPorSubidonDeAdrenalina
	"
	El puntaje colectivo superó los 20 puntos, por lo que el Astronauta con familia multiplica su desplazamiento adicional por subidon de adrenalina.
	2.5 * 1 (Desplazamiento adicional en la casilla comunicaciones para nave operativa) = 2.5 -> Redondeando para arriba es 3. 
	"
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
	
	self assertLaPosicionDe: astronautaConFamilia en: juego es: 1 + 6 + 6 + 6 + 2 + 1 + 3.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'asserts' stamp: 'JMB 9/26/2025 00:58:13'!
assertLaPosicionDe: unAstronauta en: unJuego es: unaPosicionEsperada 
	self assert: (unJuego posicionDe: unAstronauta ) equals: unaPosicionEsperada
	! !


!TestJuegoDeLaMisionAMarte methodsFor: 'setUp/tearDown' stamp: 'LL 9/25/2025 23:12:56'!
setUp

	astronautaIngenieroMecanico := #AstronautaIngenieroMecanico.
	astronautaEspecialistaEnComunicaciones := #AstronautaEspecialistaEnComunicaciones.
	astronautaConFamilia := #AstronautaConFamilia.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'juego' stamp: 'LL 9/25/2025 16:41:48'!
nuevoJuegoConDado: unDado conJugadores: unConjuntoDeJugadores yConCasillasEspeciales: unConjuntoDeCasillasEspeciales

	| juego |
	juego := JuegoDeLaMisionAMarte conDado: unDado.
	juego setJugadores: unConjuntoDeJugadores.
	juego setCasillasEspeciales: unConjuntoDeCasillasEspeciales.
	
	^juego! !


!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 23:10:21'!
casillaCaminataEspacial

	^#CaminataEspacial! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 23:10:26'!
casillaComunicaciones

	^#Comunicaciones! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 23:10:31'!
casillaEureka

	^#Eureka! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 23:10:36'!
casillaFalloCritico

	^#FalloCritico! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 23:10:41'!
casillaSoporteVital

	^#SoporteVital! !
