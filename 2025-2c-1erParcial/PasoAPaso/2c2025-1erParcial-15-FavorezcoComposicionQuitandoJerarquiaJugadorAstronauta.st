!classDefinition: #Casilla category: #'2c2025-1erParcial'!
Object subclass: #Casilla
	instanceVariableNames: 'juego'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!Casilla methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 13:19:16'!
desplazamientoDe: unJugador en: elJuego

	self subclassResponsibility! !


!classDefinition: #CasillaCaminataEspacial category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaCaminataEspacial
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaCaminataEspacial methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:31'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaCaminataEspacialDe: unJugador.
	! !


!classDefinition: #CasillaComunicaciones category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaComunicaciones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaComunicaciones methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:06'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaComunicacionesDe: unJugador ! !


!classDefinition: #CasillaEureka category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaEureka
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaEureka methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:11'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaEurekaDe: unJugador! !


!classDefinition: #CasillaFalloCritico category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaFalloCritico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaFalloCritico methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:15'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaFalloCriticoDe: unJugador! !


!classDefinition: #CasillaNeutra category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaNeutra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaNeutra methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:42'!
desplazamientoDe: unJugador en: elJuego

	^elJuego desplazamientoEnCasillaNeutraDe: unJugador! !


!classDefinition: #CasillaSoporteVital category: #'2c2025-1erParcial'!
Casilla subclass: #CasillaSoporteVital
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!CasillaSoporteVital methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 14:29:22'!
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


!classDefinition: #NaveAveriada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #NaveAveriada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!NaveAveriada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:26:07'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaCaminataEspacial.! !

!NaveAveriada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:02:24'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveAveriadaEnCasillaComunicaciones! !

!NaveAveriada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:03:34'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaEureka! !

!NaveAveriada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:03:46'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAColpasada.
	^unJugador desplazamientoConNaveAveriadaEnCasillaFalloCritico! !

!NaveAveriada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:05:17'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveAveriadaEnCasillaSoporteVital! !


!classDefinition: #NaveColapsada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #NaveColapsada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!NaveColapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:44'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!NaveColapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!NaveColapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!NaveColapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego jugadorNoPuedeDesplazarse! !

!NaveColapsada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 15:12:33'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	juego jugadorNoPuedeDesplazarse! !


!classDefinition: #NaveDegradada category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #NaveDegradada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!NaveDegradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:26:14'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^unJugador desplazamientoConNaveDegradadaEnCasillaCaminataEspacial! !

!NaveDegradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:02:40'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveDegradadaEnCasillaComunicaciones! !

!NaveDegradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:18:44'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	juego condicionDeLaNavePasaAOperativa.
	^unJugador desplazamientoConNaveDegradadaEnCasillaEureka! !

!NaveDegradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:18:56'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaAAveriada. 
	^unJugador desplazamientoConNaveDegradadaEnCasillaFalloCritico! !

!NaveDegradada methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:19:21'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveDegradadaEnCasillaSoporteVital! !


!classDefinition: #NaveOperativa category: #'2c2025-1erParcial'!
CondicionDeLaNave subclass: #NaveOperativa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!NaveOperativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:25:44'!
afectarDesplazamientoEnCasillaCaminataEspacialDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaCaminataEspecial! !

!NaveOperativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:26'!
afectarDesplazamientoEnCasillaComunicacionesDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaComunicaciones! !

!NaveOperativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:38'!
afectarDesplazamientoEnCasillaEurekaDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaEureka! !

!NaveOperativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:21:53'!
afectarDesplazamientoEnCasillaFalloCriticoDe: unJugador

	juego condicionDeLaNavePasaADegradada.
	^unJugador desplazamientoConNaveOperativaEnCasillaFalloCritico! !

!NaveOperativa methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:22:04'!
afectarDesplazamientoEnCasillaSoporteVitalDe: unJugador

	^unJugador desplazamientoConNaveOperativaEnCasillaSoporteVital! !


!classDefinition: #JuegoDeLaMisionAMarte category: #'2c2025-1erParcial'!
Object subclass: #JuegoDeLaMisionAMarte
	instanceVariableNames: 'dado jugadores casillasEspeciales posiciones turno condicionDeLaNave'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JuegoDeLaMisionAMarte methodsFor: 'initialization' stamp: 'LL 9/25/2025 22:32:12'!
initializeConDado: unDado conJugadores: unConjuntoDeJugadores conCasillasEspeciales: unConjuntoDeCasillasEspeciales.

	dado := unDado.
	jugadores := unConjuntoDeJugadores.
	casillasEspeciales := Dictionary newFrom: unConjuntoDeCasillasEspeciales.
	posiciones := Dictionary newFrom: (unConjuntoDeJugadores collect: [ :unJugador | unJugador -> 1 ]).
	turno := 1.
	condicionDeLaNave := NaveOperativa en: self.! !


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


!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 22:31:56'!
condicionDeLaNavePasaAAveriada
	condicionDeLaNave := NaveAveriada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 22:32:01'!
condicionDeLaNavePasaAColpasada
	condicionDeLaNave := NaveColapsada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 22:32:07'!
condicionDeLaNavePasaADegradada

	condicionDeLaNave := NaveDegradada en: self! !

!JuegoDeLaMisionAMarte methodsFor: 'cambio de condicion de nave' stamp: 'LL 9/25/2025 22:32:12'!
condicionDeLaNavePasaAOperativa
	condicionDeLaNave := NaveOperativa en: self! !


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


!JuegoDeLaMisionAMarte methodsFor: 'private' stamp: 'LL 9/25/2025 22:31:34'!
casillaDe: unaPosicion

	^ casillasEspeciales at: unaPosicion ifAbsent: [ CasillaNeutra new ]! !

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


!classDefinition: #JugadorAstronauta category: #'2c2025-1erParcial'!
Object subclass: #JugadorAstronauta
	instanceVariableNames: 'muplicadorSubidonDeAdrenalina desplazamientoConNaveAveriadaEnCasillaComunicaciones desplazamientoConNaveDegradadaEnCasillaComunicaciones'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erParcial'!

!JugadorAstronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:26:07'!
desplazamientoConNaveAveriadaEnCasillaCaminataEspacial

	^0! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:50:28'!
desplazamientoConNaveAveriadaEnCasillaComunicaciones

	^desplazamientoConNaveAveriadaEnCasillaComunicaciones! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:04:42'!
desplazamientoConNaveAveriadaEnCasillaEureka

	^0! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:04:13'!
desplazamientoConNaveAveriadaEnCasillaFalloCritico

	^0! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave averiada' stamp: 'LL 9/25/2025 22:05:27'!
desplazamientoConNaveAveriadaEnCasillaSoporteVital

	^-2! !


!JugadorAstronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:26:14'!
desplazamientoConNaveDegradadaEnCasillaCaminataEspacial

	^0! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:50:15'!
desplazamientoConNaveDegradadaEnCasillaComunicaciones

	^desplazamientoConNaveDegradadaEnCasillaComunicaciones! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:19:52'!
desplazamientoConNaveDegradadaEnCasillaEureka

	^1! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:20:28'!
desplazamientoConNaveDegradadaEnCasillaFalloCritico

	^-2! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave degradada' stamp: 'LL 9/25/2025 22:20:32'!
desplazamientoConNaveDegradadaEnCasillaSoporteVital

	^-1! !


!JugadorAstronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:52'!
desplazamientoConNaveOperativaEnCasillaCaminataEspecial

	^0! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:48'!
desplazamientoConNaveOperativaEnCasillaComunicaciones

	^1! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:22:40'!
desplazamientoConNaveOperativaEnCasillaEureka

	^2! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:23:31'!
desplazamientoConNaveOperativaEnCasillaFalloCritico

	^-1! !

!JugadorAstronauta methodsFor: 'desplazamiento - nave operativa' stamp: 'LL 9/25/2025 22:22:14'!
desplazamientoConNaveOperativaEnCasillaSoporteVital

	^2! !


!JugadorAstronauta methodsFor: 'desplazamiento - neutro' stamp: 'LL 9/25/2025 21:56:20'!
desplazamientoEnCasillaNeutra

	^0! !


!JugadorAstronauta methodsFor: 'desplazamiento - subidon adrenalina' stamp: 'LL 9/25/2025 22:49:19'!
modificarDesplazamientoPorSubidonDeAdrenalina: desplazamientoBase

	| nuevoDesplazamiento desplazamiento |
	nuevoDesplazamiento := desplazamientoBase * muplicadorSubidonDeAdrenalina.
	nuevoDesplazamiento <= 0 ifTrue: [ desplazamiento  := nuevoDesplazamiento truncated ].
	nuevoDesplazamiento = nuevoDesplazamiento truncated
		ifTrue: [ desplazamiento  := nuevoDesplazamiento truncated ]
		ifFalse: [ desplazamiento  := nuevoDesplazamiento truncated + 1 ].
	^desplazamiento! !


!JugadorAstronauta methodsFor: 'initialization' stamp: 'LL 9/25/2025 22:45:55'!
initializeConMuplicadorPorSubidonDeAdrenalina: unMultiplicador conDesplazamientoConNaveAveriadaEnCasillaComunicaciones: unDesplazamientoConNaveAveriadaEnCasillaComunicaciones conDesplazamientoConNaveDegradadaEnCasillaComunicaciones: unDesplazamientoConNaveDegradadaEnCasillaComunicaciones

	muplicadorSubidonDeAdrenalina := unMultiplicador.
	desplazamientoConNaveAveriadaEnCasillaComunicaciones := unDesplazamientoConNaveAveriadaEnCasillaComunicaciones.
	desplazamientoConNaveDegradadaEnCasillaComunicaciones := unDesplazamientoConNaveDegradadaEnCasillaComunicaciones
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'JugadorAstronauta class' category: #'2c2025-1erParcial'!
JugadorAstronauta class
	instanceVariableNames: ''!

!JugadorAstronauta class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:54:00'!
conFamilia

	^self new initializeConMuplicadorPorSubidonDeAdrenalina: 2.5 conDesplazamientoConNaveAveriadaEnCasillaComunicaciones: -3 conDesplazamientoConNaveDegradadaEnCasillaComunicaciones: -1! !

!JugadorAstronauta class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:54:07'!
especialistaEnComunicaciones

	^self new initializeConMuplicadorPorSubidonDeAdrenalina: 1.5 conDesplazamientoConNaveAveriadaEnCasillaComunicaciones: -2 conDesplazamientoConNaveDegradadaEnCasillaComunicaciones: 0! !

!JugadorAstronauta class methodsFor: 'as yet unclassified' stamp: 'LL 9/25/2025 22:54:16'!
ingenieroMecanico

	^self new initializeConMuplicadorPorSubidonDeAdrenalina: 1 conDesplazamientoConNaveAveriadaEnCasillaComunicaciones: -1 conDesplazamientoConNaveDegradadaEnCasillaComunicaciones: 1! !


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


!TestJuegoDeLaMisionAMarte methodsFor: 'setUp/tearDown' stamp: 'LL 9/25/2025 22:54:16'!
setUp

	astronautaIngenieroMecanico := JugadorAstronauta ingenieroMecanico.
	astronautaEspecialistaEnComunicaciones := JugadorAstronauta especialistaEnComunicaciones.
	astronautaConFamilia := JugadorAstronauta conFamilia.! !


!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 22:30:59'!
casillaCaminataEspacial

	^CasillaCaminataEspacial new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 22:31:11'!
casillaComunicaciones

	^CasillaComunicaciones new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 22:31:18'!
casillaEureka

	^CasillaEureka new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 22:31:26'!
casillaFalloCritico

	^CasillaFalloCritico new! !

!TestJuegoDeLaMisionAMarte methodsFor: 'casillas' stamp: 'LL 9/25/2025 22:31:41'!
casillaSoporteVital

	^CasillaSoporteVital new! !
