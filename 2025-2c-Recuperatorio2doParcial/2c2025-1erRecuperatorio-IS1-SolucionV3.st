!classDefinition: #CentroDeDespacho category: #'2c2025-1erRecuperatorio-IS1'!
Object subclass: #CentroDeDespacho
	instanceVariableNames: 'paquetesAlmacenados generadorDeNumerosAleatorios'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!CentroDeDespacho methodsFor: 'initialization' stamp: 'LL 12/5/2025 18:44:59'!
initializeConGeneradorDeNumerosAleatorios: unGeneradorDeNumerosAleatorios 
	generadorDeNumerosAleatorios := unGeneradorDeNumerosAleatorios.
	paquetesAlmacenados := OrderedCollection new! !


!CentroDeDespacho methodsFor: 'public' stamp: 'LL 12/11/2025 16:14:26'!
despachar: unosPaquetes siendo: unRobot
	paquetesAlmacenados addAll: unosPaquetes.
	
	self tocaRecargarBaterias ifTrue: [ unRobot recargarBaterias ].! !


!CentroDeDespacho methodsFor: 'testing' stamp: 'LL 12/5/2025 11:49:21'!
tienePaqueteAlmacenado: unPaquete 
	^paquetesAlmacenados includes: unPaquete! !


!CentroDeDespacho methodsFor: 'private' stamp: 'LL 12/8/2025 23:29:06'!
tocaRecargarBaterias

	^ generadorDeNumerosAleatorios value >= 0.5! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CentroDeDespacho class' category: #'2c2025-1erRecuperatorio-IS1'!
CentroDeDespacho class
	instanceVariableNames: ''!

!CentroDeDespacho class methodsFor: 'instance creation' stamp: 'LL 12/5/2025 14:41:17'!
conGeneradorDeNumerosAleatorios: unGeneradorDeNumerosAleatorios 
	^self new initializeConGeneradorDeNumerosAleatorios: unGeneradorDeNumerosAleatorios! !


!classDefinition: #EstadoDelRobot category: #'2c2025-1erRecuperatorio-IS1'!
Object subclass: #EstadoDelRobot
	instanceVariableNames: 'robot'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!EstadoDelRobot methodsFor: 'initialization' stamp: 'LL 12/5/2025 13:19:29'!
initializeWith: unRobot

	robot := unRobot! !


!EstadoDelRobot methodsFor: 'public' stamp: 'LL 12/5/2025 14:15:30'!
bateriaAConsumirAlRecolectar: nivelADisminuirDeBase

	self subclassResponsibility! !

!EstadoDelRobot methodsFor: 'public' stamp: 'LL 12/5/2025 13:49:29'!
despacharPaquetesEn: unCentroDeDespacho
	self subclassResponsibility! !

!EstadoDelRobot methodsFor: 'public' stamp: 'LL 12/5/2025 13:54:29'!
recolectarPaquete: unPaquete

	self subclassResponsibility! !


!EstadoDelRobot methodsFor: 'testing' stamp: 'LL 12/5/2025 14:14:29'!
estaFueraDeServicio

	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDelRobot class' category: #'2c2025-1erRecuperatorio-IS1'!
EstadoDelRobot class
	instanceVariableNames: ''!

!EstadoDelRobot class methodsFor: 'as yet unclassified' stamp: 'LL 12/5/2025 13:19:09'!
de: unRobot

	^self new initializeWith: unRobot! !


!classDefinition: #FallaDeSensores category: #'2c2025-1erRecuperatorio-IS1'!
EstadoDelRobot subclass: #FallaDeSensores
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!FallaDeSensores methodsFor: 'public' stamp: 'LL 12/11/2025 10:52:13'!
bateriaAConsumirAlRecolectar: unPaquete

	^unPaquete bateriaAConsumirAlRecolectarDe: robot! !

!FallaDeSensores methodsFor: 'public' stamp: 'LL 12/11/2025 16:17:18'!
despacharPaquetesEn: unCentroDeDespacho

	robot despacharPaquetesEnEstadoFallaDeSensoresEn: unCentroDeDespacho! !

!FallaDeSensores methodsFor: 'public' stamp: 'LL 12/11/2025 15:44:22'!
recolectarPaquete: unPaquete

	robot recolectarPaqueteEnEstadoFallaDeSensores: unPaquete! !


!classDefinition: #FallaMecanica category: #'2c2025-1erRecuperatorio-IS1'!
EstadoDelRobot subclass: #FallaMecanica
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!FallaMecanica methodsFor: 'public' stamp: 'LL 12/11/2025 10:54:12'!
bateriaAConsumirAlRecolectar: unPaquete

	^(unPaquete bateriaAConsumirAlRecolectarDe: robot) * 2! !

!FallaMecanica methodsFor: 'public' stamp: 'LL 12/11/2025 16:17:20'!
despacharPaquetesEn: unCentroDeDespacho

	robot despacharPaquetesEnEstadoFallaMecanicaEn: unCentroDeDespacho
! !

!FallaMecanica methodsFor: 'public' stamp: 'LL 12/11/2025 15:44:33'!
recolectarPaquete: unPaquete

	robot recolectarPaqueteEnEstadoFallaMecanica: unPaquete! !


!classDefinition: #FueraDeServicio category: #'2c2025-1erRecuperatorio-IS1'!
EstadoDelRobot subclass: #FueraDeServicio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!FueraDeServicio methodsFor: 'public' stamp: 'LL 12/5/2025 14:20:15'!
bateriaAConsumirAlRecolectar: unPaquete! !

!FueraDeServicio methodsFor: 'public' stamp: 'LL 12/11/2025 16:17:24'!
despacharPaquetesEn: unCentroDeDespacho

	robot despacharPaquetesEnEstadoFueraDeServicioEn: unCentroDeDespacho! !

!FueraDeServicio methodsFor: 'public' stamp: 'LL 12/11/2025 15:44:47'!
recolectarPaquete: unPaquete

	robot recolectarPaqueteEnEstadoFueraDeServicio: unPaquete
	! !


!FueraDeServicio methodsFor: 'testing' stamp: 'LL 12/5/2025 14:14:37'!
estaFueraDeServicio

	^true! !


!classDefinition: #FuncionamientoNormal category: #'2c2025-1erRecuperatorio-IS1'!
EstadoDelRobot subclass: #FuncionamientoNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!FuncionamientoNormal methodsFor: 'public' stamp: 'LL 12/11/2025 10:54:24'!
bateriaAConsumirAlRecolectar: unPaquete

	^unPaquete bateriaAConsumirAlRecolectarDe: robot! !

!FuncionamientoNormal methodsFor: 'public' stamp: 'LL 12/11/2025 16:17:27'!
despacharPaquetesEn: unCentroDeDespacho

	robot despacharPaquetesEnEstadoNormalEn: unCentroDeDespacho! !

!FuncionamientoNormal methodsFor: 'public' stamp: 'LL 12/11/2025 15:45:00'!
recolectarPaquete: unPaquete

	robot recolectarPaqueteEnEstadoNormal: unPaquete! !


!classDefinition: #Paquete category: #'2c2025-1erRecuperatorio-IS1'!
Object subclass: #Paquete
	instanceVariableNames: 'peso altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!Paquete methodsFor: 'initialization' stamp: 'LL 12/5/2025 14:12:37'!
initializeConPeso: unPeso conAltura: unaAltura
	peso := unPeso.
	altura := unaAltura.! !


!Paquete methodsFor: 'public' stamp: 'LL 12/8/2025 22:49:46'!
alturaLuegoDeApilarSobre: otrosPaquetes
	self subclassResponsibility! !

!Paquete methodsFor: 'public' stamp: 'LL 12/11/2025 11:08:14'!
bateriaAConsumirAlRecolectarDe: unRobot

	self subclassResponsibility

	! !

!Paquete methodsFor: 'public' stamp: 'LL 12/8/2025 23:14:43'!
pesoLuegoDeApilarSobre: otrosPaquetes
	^peso + (self pesoDe: otrosPaquetes)! !

!Paquete methodsFor: 'public' stamp: 'LL 12/5/2025 14:01:20'!
puedeSerColocadoEn: unTrailer

	self subclassResponsibility! !


!Paquete methodsFor: 'testing' stamp: 'LL 12/4/2025 23:44:36'!
pesa: unPesoEsperado yMide: unaAlturaEsperada 
	^unPesoEsperado = peso and: [ unaAlturaEsperada = altura ]! !


!Paquete methodsFor: 'private' stamp: 'LL 12/8/2025 23:12:53'!
alturaDe: otrosPaquetes
	| elRestoDeLosPaquetes |
	elRestoDeLosPaquetes := otrosPaquetes copyWithout: self.
	^otrosPaquetes sum: [ :otroPaquete | otroPaquete alturaLuegoDeApilarSobre: elRestoDeLosPaquetes ] ifEmpty: [ 0 ]
! !

!Paquete methodsFor: 'private' stamp: 'LL 12/8/2025 23:14:22'!
pesoDe: otrosPaquetes
	| elRestoDeLosPaquetes |
	elRestoDeLosPaquetes := otrosPaquetes copyWithout: self.
	^otrosPaquetes sum: [ :otroPaquete | otroPaquete pesoLuegoDeApilarSobre: elRestoDeLosPaquetes ] ifEmpty: [ 0 ].
! !

!Paquete methodsFor: 'private' stamp: 'LL 12/5/2025 09:18:48'!
volumen
	^peso * altura! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Paquete class' category: #'2c2025-1erRecuperatorio-IS1'!
Paquete class
	instanceVariableNames: ''!

!Paquete class methodsFor: 'instance creation' stamp: 'LL 12/5/2025 14:12:48'!
conPeso: unPeso conAltura: unaAltura 
	^self new initializeConPeso: unPeso conAltura: unaAltura! !


!classDefinition: #Bolsa category: #'2c2025-1erRecuperatorio-IS1'!
Paquete subclass: #Bolsa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!Bolsa methodsFor: 'public' stamp: 'LL 12/8/2025 23:13:37'!
alturaLuegoDeApilarSobre: otrosPaquetes
	^self alturaDe: otrosPaquetes! !

!Bolsa methodsFor: 'public' stamp: 'LL 12/11/2025 10:55:12'!
bateriaAConsumirAlRecolectarDe: unRobot

	^unRobot bateriaAConsumirAlRecolectarBolsaConVolumen: self volumen! !

!Bolsa methodsFor: 'public' stamp: 'LL 12/5/2025 14:27:30'!
puedeSerColocadoEn: unTrailer

	unTrailer sePuedeColocarBolsa: self! !


!classDefinition: #Caja category: #'2c2025-1erRecuperatorio-IS1'!
Paquete subclass: #Caja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!Caja methodsFor: 'public' stamp: 'LL 12/8/2025 23:13:48'!
alturaLuegoDeApilarSobre: otrosPaquetes
	^altura + (self alturaDe: otrosPaquetes)! !

!Caja methodsFor: 'public' stamp: 'LL 12/11/2025 10:55:47'!
bateriaAConsumirAlRecolectarDe: unRobot

	^unRobot bateriaAConsumirAlRecolectarCajaConVolumen: self volumen! !

!Caja methodsFor: 'public' stamp: 'LL 12/5/2025 14:27:41'!
puedeSerColocadoEn: unTrailer

	unTrailer sePuedeColocarCaja: self! !


!classDefinition: #Robot category: #'2c2025-1erRecuperatorio-IS1'!
Object subclass: #Robot
	instanceVariableNames: 'trailer estado bateria'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!Robot methodsFor: 'initialization' stamp: 'LL 12/5/2025 13:21:29'!
initializeConTrailer: unTrailer 
	trailer := unTrailer.
	bateria := 100.
	estado := FuncionamientoNormal de: self! !


!Robot methodsFor: 'public' stamp: 'LL 12/8/2025 23:35:08'!
despacharPaquetesEn: unCentroDeDespacho
	self verificarQueElTrailerNoEstaVacio.
	
	estado despacharPaquetesEn: unCentroDeDespacho
	! !

!Robot methodsFor: 'public' stamp: 'LL 12/5/2025 13:23:00'!
recolectarPaquete: unPaquete

	estado recolectarPaquete: unPaquete! !


!Robot methodsFor: 'cambios de estado' stamp: 'LL 12/5/2025 13:21:11'!
ponerFueraDeServicio
	estado := FueraDeServicio de: self! !

!Robot methodsFor: 'cambios de estado' stamp: 'LL 12/5/2025 13:21:17'!
tieneFallaDeSensores
	estado := FallaDeSensores de: self! !

!Robot methodsFor: 'cambios de estado' stamp: 'LL 12/5/2025 13:21:21'!
tieneFallaMecanica
	estado := FallaMecanica de: self! !


!Robot methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 11:36:51'!
noHayBateriaDisponibleMensajeDeError
	^'No hay bateria disponible'! !

!Robot methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 01:02:14'!
noHayPaquetesParaDespacharMensajeDeError
	^'No hay paquetes para despachar'! !

!Robot methodsFor: 'mensajes de error' stamp: 'LL 12/4/2025 23:50:20'!
noPuedeRecoletarFueraDeServicioMensajeDeError
	^'No puede recolectar fuera de servicio'! !

!Robot methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 01:16:38'!
noPuedoDespacharSiEstoyFueraDeServicioMensajeDeError
	^'No puedo despachar si estoy fuera de servicio'! !

!Robot methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 01:18:43'!
noPuedoDespacharSiTengoFallaDeSensoresMensajeDeError
	^'No puedo despachar con falla de sensores'! !


!Robot methodsFor: 'testing' stamp: 'LL 12/5/2025 14:14:45'!
estaFueraDeServicio
	^estado estaFueraDeServicio! !

!Robot methodsFor: 'testing' stamp: 'LL 12/5/2025 09:16:01'!
tieneBateria: unaCantidadEsperadaDeBateria 
	^bateria = unaCantidadEsperadaDeBateria! !

!Robot methodsFor: 'testing' stamp: 'LL 12/4/2025 23:45:39'!
tienePaqueteRecolectado: unPaquete 
	^trailer includes: unPaquete! !

!Robot methodsFor: 'testing' stamp: 'LL 12/8/2025 23:19:43'!
tienePaqueteRecolectado: unPaquete conPeso: unPesoEsperado yAltura: unaAlturaEsperada 
	^(self tienePaqueteRecolectado: unPaquete) and: [ unPaquete pesa: unPesoEsperado yMide: unaAlturaEsperada ].
	! !


!Robot methodsFor: 'dd - con paquete' stamp: 'LL 12/11/2025 10:56:20'!
bateriaAConsumirAlRecolectarBolsaConVolumen: unVolumen

	^unVolumen / ( gram * meter)! !

!Robot methodsFor: 'dd - con paquete' stamp: 'LL 12/11/2025 10:56:46'!
bateriaAConsumirAlRecolectarCajaConVolumen: unVolumen

	^unVolumen * 2 / ( gram * meter)! !


!Robot methodsFor: 'centro de despacho' stamp: 'LL 12/5/2025 14:43:03'!
recargarBaterias
	bateria := 100.! !


!Robot methodsFor: 'private' stamp: 'LL 12/8/2025 23:34:15'!
actualizarNivelDeBateria: nivelDeBateriaAConsumir

	(self tieneMenosBateriaQue: nivelDeBateriaAConsumir) ifTrue: [ 
		self ponerFueraDeServicio.
		self error: self noHayBateriaDisponibleMensajeDeError.
	].

	bateria := bateria - nivelDeBateriaAConsumir! !

!Robot methodsFor: 'private' stamp: 'LL 12/8/2025 23:24:12'!
hacerEfectivaLaRecoleccionDe: unPaquete

	self actualizarNivelDeBateria: (estado bateriaAConsumirAlRecolectar: unPaquete).

	trailer colocar: unPaquete
	! !

!Robot methodsFor: 'private' stamp: 'LL 12/8/2025 23:34:27'!
tieneMenosBateriaQue: nivelDeBateriaAConsumir

	^ bateria < nivelDeBateriaAConsumir! !

!Robot methodsFor: 'private' stamp: 'LL 12/8/2025 23:35:08'!
verificarQueElTrailerNoEstaVacio

	^trailer estaVacio ifTrue: [self error: self noHayPaquetesParaDespacharMensajeDeError ]! !


!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:47:29'!
despacharPaquetesEnEstadoFallaDeSensoresEn: unCentroDeDespacho

	self error: self noPuedoDespacharSiTengoFallaDeSensoresMensajeDeError! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 16:15:16'!
despacharPaquetesEnEstadoFallaMecanicaEn: unCentroDeDespacho

	self ponerFueraDeServicio.
	
	trailer despacharPaquetesA: unCentroDeDespacho siendo: self! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:48:21'!
despacharPaquetesEnEstadoFueraDeServicioEn: unCentroDeDespacho

	self error: self noPuedoDespacharSiEstoyFueraDeServicioMensajeDeError! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 16:15:30'!
despacharPaquetesEnEstadoNormalEn: unCentroDeDespacho

	trailer despacharPaquetesA: unCentroDeDespacho siendo: self! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:38:04'!
recolectarPaqueteEnEstadoFallaDeSensores: unPaquete
	
	self hacerEfectivaLaRecoleccionDe: unPaquete! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:37:42'!
recolectarPaqueteEnEstadoFallaMecanica: unPaquete
	
	self hacerEfectivaLaRecoleccionDe: unPaquete! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:37:25'!
recolectarPaqueteEnEstadoFueraDeServicio: unPaquete
	
	self error: self noPuedeRecoletarFueraDeServicioMensajeDeError! !

!Robot methodsFor: 'dd - con estado' stamp: 'LL 12/11/2025 15:37:03'!
recolectarPaqueteEnEstadoNormal: unPaquete
	
	self hacerEfectivaLaRecoleccionDe: unPaquete! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Robot class' category: #'2c2025-1erRecuperatorio-IS1'!
Robot class
	instanceVariableNames: ''!

!Robot class methodsFor: 'instance creation' stamp: 'LL 12/5/2025 00:16:14'!
conTrailer: unTrailer 
	^self new initializeConTrailer: unTrailer ! !


!classDefinition: #Trailer category: #'2c2025-1erRecuperatorio-IS1'!
Object subclass: #Trailer
	instanceVariableNames: 'pesoMaximo alturaMaxima paquetes'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!Trailer methodsFor: 'initialization' stamp: 'LL 12/5/2025 00:17:56'!
initializeConCapacidadDePeso: unPesoMaximo yCapacidadDeAltura: unaAlturaMaxima 
	paquetes := OrderedCollection new.
	pesoMaximo := unPesoMaximo.
	alturaMaxima := unaAlturaMaxima.! !


!Trailer methodsFor: 'main' stamp: 'LL 12/8/2025 23:16:57'!
colocar: unPaquete
	unPaquete puedeSerColocadoEn: self.

	paquetes add: unPaquete! !

!Trailer methodsFor: 'main' stamp: 'LL 12/11/2025 16:14:57'!
despacharPaquetesA: aCentroDeDespacho siendo: unRobot
	aCentroDeDespacho despachar: paquetes copy siendo: unRobot.
	
	self vaciar.! !


!Trailer methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 13:58:56'!
alturaMaximaExcedidaMensajeDeError
	^'Altura máxima excedida'! !

!Trailer methodsFor: 'mensajes de error' stamp: 'LL 12/5/2025 13:59:04'!
pesoMaximoExcedidoMensajeDeError
	^'Peso maximo excedido'! !


!Trailer methodsFor: 'testing' stamp: 'LL 12/5/2025 01:07:56'!
estaVacio
	^paquetes isEmpty! !

!Trailer methodsFor: 'testing' stamp: 'LL 12/5/2025 00:21:24'!
includes: unPaquete

	^paquetes includes: unPaquete! !


!Trailer methodsFor: 'private' stamp: 'LL 12/8/2025 22:51:14'!
soportaAlturaDe: unPaquete 
	^(unPaquete alturaLuegoDeApilarSobre: paquetes) <= alturaMaxima.! !

!Trailer methodsFor: 'private' stamp: 'LL 12/8/2025 22:55:55'!
soportaPesoDe: unPaquete 
	^(unPaquete pesoLuegoDeApilarSobre: paquetes) <= pesoMaximo.! !

!Trailer methodsFor: 'private' stamp: 'LL 12/5/2025 01:26:09'!
vaciar
	paquetes := OrderedCollection new! !

!Trailer methodsFor: 'private' stamp: 'LL 12/8/2025 23:35:46'!
verificarQueSoportaAlturaDe: unPaquete

	^ (self soportaAlturaDe: unPaquete) ifFalse: [ self error: self alturaMaximaExcedidaMensajeDeError ]! !

!Trailer methodsFor: 'private' stamp: 'LL 12/8/2025 23:36:04'!
verificarQueSoportaPesoDe: unPaquete

	^ (self soportaPesoDe: unPaquete) ifFalse: [ self error: self pesoMaximoExcedidoMensajeDeError ]! !


!Trailer methodsFor: 'dd' stamp: 'LL 12/8/2025 23:36:23'!
sePuedeColocarBolsa: unaBolsa

	self verificarQueSoportaPesoDe: unaBolsa.! !

!Trailer methodsFor: 'dd' stamp: 'LL 12/8/2025 23:36:04'!
sePuedeColocarCaja: unaCaja

	self verificarQueSoportaAlturaDe: unaCaja.
	self verificarQueSoportaPesoDe: unaCaja.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Trailer class' category: #'2c2025-1erRecuperatorio-IS1'!
Trailer class
	instanceVariableNames: ''!

!Trailer class methodsFor: 'instance creation' stamp: 'LL 12/5/2025 00:15:59'!
conCapacidadDePeso: unPesoMaximo yCapacidadDeAltura: unaAlturaMaxima 
	^self new initializeConCapacidadDePeso: unPesoMaximo yCapacidadDeAltura: unaAlturaMaxima! !


!classDefinition: #TestRoboDelivery category: #'2c2025-1erRecuperatorio-IS1'!
TestCase subclass: #TestRoboDelivery
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2c2025-1erRecuperatorio-IS1'!

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 00:57:27'!
test01PuedoRecolectarPaquetes

	| unRobot unaCaja unTrailer |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (1 * kilogram) yAltura: (1 * centimeter).
	
	unRobot recolectarPaquete: unaCaja.
	
	self assert: (unRobot tienePaqueteRecolectado: unaCaja conPeso: (1*kilogram) yAltura: (1*centimeter)).! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 15:11:30'!
test02NoPuedoRecolectarPaqueteSiRobotEstaFueraDeServicio

	| unRobot unaCaja unTrailer |
	unTrailer := Trailer conCapacidadDePeso: 100 * gram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (100 * gram) yAltura: (1 * centimeter).
	unRobot ponerFueraDeServicio.
	
	self should: [ unRobot recolectarPaquete: unaCaja ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: unRobot noPuedeRecoletarFueraDeServicioMensajeDeError.
			self deny: (unRobot tienePaqueteRecolectado: unaCaja).
		]
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:21:41'!
test03UnPaqueteNoPuedeSuperarElPesoMaximoDelTrailer

	| unRobot unaCaja unTrailer |
	unTrailer := Trailer conCapacidadDePeso: 100 * gram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (110 * gram) yAltura: (1 * centimeter).
	
	self should: [ unRobot recolectarPaquete: unaCaja ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: unTrailer pesoMaximoExcedidoMensajeDeError.
			self deny: (unRobot tienePaqueteRecolectado: unaCaja).
		]
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:21:54'!
test04VariosPaquetesNoPuedenSumarMasQueElPesoMaximoDelTrailer

	| unRobot unaCaja unTrailer otraCaja |
	unTrailer := Trailer conCapacidadDePeso: 1 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (500 * gram) yAltura: (1 * centimeter).
	otraCaja := self unaCajaConPeso: (600 * gram) yAltura: (1 * centimeter).
	unRobot recolectarPaquete: unaCaja.
	
	self should: [ unRobot recolectarPaquete: otraCaja ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: unTrailer pesoMaximoExcedidoMensajeDeError.
			self assert: (unRobot tienePaqueteRecolectado: unaCaja).
			self deny: (unRobot tienePaqueteRecolectado: otraCaja).
		]
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:22:08'!
test05PaquetesApilablesNoPuedenSumarMasQueLaAlturaMaximaDelTrailer

	| unRobot unaCaja unTrailer otraCaja |
	unTrailer := Trailer conCapacidadDePeso: 1 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (100 * gram) yAltura: (5 * centimeter).
	otraCaja := self unaCajaConPeso: (100 * gram) yAltura: (6 * centimeter).
	unRobot recolectarPaquete: unaCaja.
	
	self should: [ unRobot recolectarPaquete: otraCaja ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: unTrailer alturaMaximaExcedidaMensajeDeError.
			self assert: (unRobot tienePaqueteRecolectado: unaCaja).
			self deny: (unRobot tienePaqueteRecolectado: otraCaja).
		]
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 11:37:29'!
test06ParaPaquetesNoApilablesNoImportaLaAltura

	| unRobot unTrailer otraBolsa unaBolsa |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (5 * centimeter).
	otraBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (6 * centimeter).
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot recolectarPaquete: otraBolsa.
	
	self assert: (unRobot tienePaqueteRecolectado: unaBolsa).
	self assert: (unRobot tienePaqueteRecolectado: otraBolsa).
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 20:18:05'!
test06bUnPaqueteApilableSobreUnoNoApilableNoConsideraSuAltura

	| unRobot unTrailer unaBolsa unaCaja |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (5 * centimeter).
	unaCaja := self unaCajaConPeso: (100 * gram) yAltura: (6 * centimeter).
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot recolectarPaquete: unaCaja.
	
	self assert: (unRobot tienePaqueteRecolectado: unaBolsa).
	self assert: (unRobot tienePaqueteRecolectado: unaCaja).! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:44:06'!
test07NoPuedoDespacharPaquetesSiElTrailerEstaVacio

	| unRobot unTrailer |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	
	self should: [ unRobot despacharPaquetesEn: (CentroDeDespacho conGeneradorDeNumerosAleatorios: [ 0 ]) ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noHayPaquetesParaDespacharMensajeDeError.
		]
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:44:35'!
test08PuedoDespacharPaquetes

	| unRobot unTrailer otraBolsa unaBolsa unCentroDeDespacho |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (5 * centimeter).
	otraBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (6 * centimeter).
	unCentroDeDespacho := self unCentroDeDespacho.
	
	unRobot recolectarPaquete: unaBolsa.
	unRobot recolectarPaquete: otraBolsa.
	
	unRobot despacharPaquetesEn: unCentroDeDespacho.
	
	self assert: (unCentroDeDespacho tienePaqueteAlmacenado: unaBolsa).
	self assert: (unCentroDeDespacho tienePaqueteAlmacenado: otraBolsa)
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:43:48'!
test09NoPuedoDespacharPaquetesSiElRobotEstaFueraDeServicio

	| unRobot unTrailer unaBolsa unCentroDeDespacho |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	unCentroDeDespacho := CentroDeDespacho conGeneradorDeNumerosAleatorios: [ 0 ].
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot ponerFueraDeServicio.

	self should: [ unRobot despacharPaquetesEn: CentroDeDespacho new ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noPuedoDespacharSiEstoyFueraDeServicioMensajeDeError.
			self deny: (unCentroDeDespacho tienePaqueteAlmacenado: unaBolsa).
		]
	
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:44:41'!
test10NoPuedoDespacharPaquetesSiElRobotTieneUnaFallaDeSensores

	| unRobot unTrailer unaBolsa unCentroDeDespacho |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	unCentroDeDespacho := self unCentroDeDespacho.
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot tieneFallaDeSensores.

	self should: [ unRobot despacharPaquetesEn: CentroDeDespacho new ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noPuedoDespacharSiTengoFallaDeSensoresMensajeDeError.
			self deny: (unCentroDeDespacho tienePaqueteAlmacenado: unaBolsa).
		]
	
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:44:45'!
test11ConFallaMecanicaElRobotPasaAEstarFueraDeServicioLuegoDeDespachar

	| unRobot unTrailer unaBolsa unCentroDeDespacho otraBolsa |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	otraBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	unCentroDeDespacho := self unCentroDeDespacho.
	unRobot recolectarPaquete: unaBolsa.
	unRobot tieneFallaMecanica.
	
	unRobot despacharPaquetesEn: unCentroDeDespacho.

	self should: [ unRobot recolectarPaquete: otraBolsa ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noPuedeRecoletarFueraDeServicioMensajeDeError.
			self assert: (unCentroDeDespacho tienePaqueteAlmacenado: unaBolsa).
			self deny: (unCentroDeDespacho tienePaqueteAlmacenado: otraBolsa).
		]
	
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:45:06'!
test12NoPuedoDespacharDosVecesLosMismosPaquetes

	| unRobot unTrailer unaBolsa unCentroDeDespacho otraBolsa |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	otraBolsa := self unaBolsaConPeso: (1 * kilogram) yAltura: (5 * centimeter).
	unCentroDeDespacho := self unCentroDeDespacho.
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot despacharPaquetesEn: unCentroDeDespacho.

	self should: [ unRobot despacharPaquetesEn: unCentroDeDespacho ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noHayPaquetesParaDespacharMensajeDeError.
			self assert: (unCentroDeDespacho tienePaqueteAlmacenado: unaBolsa).
		]
	
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 09:31:52'!
test13RecolectarUnaBolsaDisminuye1PorCientoLaBateriaProporcionalAlVolumen

	| unRobot unTrailer unaBolsa |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (5 * centimeter).
	
	unRobot recolectarPaquete: unaBolsa.
	
	self assert: (unRobot tieneBateria: 95)
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 09:31:59'!
test14RecolectarUnaCajaDisminuye2PorCientoLaBateriaProporcionalAlVolumen

	| unRobot unTrailer unaCaja |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (100 * gram) yAltura: (5 * centimeter).
	
	unRobot recolectarPaquete: unaCaja.
	
	self assert: (unRobot tieneBateria: 90)
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 09:35:27'!
test15SiHayFallaMecanicaLaRecoleccionConsumeElDobleDeBateria

	| unRobot unTrailer unaCaja |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (100 * gram) yAltura: (5 * centimeter).
	unRobot tieneFallaMecanica.
	
	unRobot recolectarPaquete: unaCaja.
	
	self assert: (unRobot tieneBateria: 80)
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 11:38:38'!
test16NoPuedoRecolectarSiNoTengoBateria

	| unRobot unTrailer unaCaja |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaCaja := self unaCajaConPeso: (1 * kilogram) yAltura: (6 * centimeter).
	
	self should: [ unRobot recolectarPaquete: unaCaja ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :unaExcepcion | 
			self assert: unaExcepcion messageText equals: unRobot noHayBateriaDisponibleMensajeDeError.
			self assert: unRobot estaFueraDeServicio.
			self assert: (unRobot tieneBateria: 100)
		].
	
	
	
	
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'tests' stamp: 'LL 12/5/2025 14:46:01'!
test17SiSeGeneraUnNumeroAleatorioMayorA05ElRobotRecargaBateriasAlDespachar

	| unRobot unTrailer unaBolsa unCentroDeDespacho |
	unTrailer := Trailer conCapacidadDePeso: 10 * kilogram yCapacidadDeAltura: (10 * centimeter).
	unRobot := Robot conTrailer: unTrailer.
	unaBolsa := self unaBolsaConPeso: (100 * gram) yAltura: (5 * centimeter).
	unCentroDeDespacho := CentroDeDespacho conGeneradorDeNumerosAleatorios: [ 1 ].
	unRobot recolectarPaquete: unaBolsa.
	
	unRobot despacharPaquetesEn: unCentroDeDespacho.
	
	self assert: (unRobot tieneBateria: 100).
	
	
	
	
	
	
	
	
	! !


!TestRoboDelivery methodsFor: 'test objects' stamp: 'LL 12/5/2025 14:44:21'!
unCentroDeDespacho

	^CentroDeDespacho conGeneradorDeNumerosAleatorios: [ 0 ]
	
	
	
	
	
	! !

!TestRoboDelivery methodsFor: 'test objects' stamp: 'LL 12/5/2025 14:12:48'!
unaBolsaConPeso: unPesoDeterminado yAltura: unaAlturaDeterminada 
	^Bolsa conPeso: unPesoDeterminado conAltura: unaAlturaDeterminada! !

!TestRoboDelivery methodsFor: 'test objects' stamp: 'LL 12/5/2025 14:12:48'!
unaCajaConPeso: unPeso yAltura: unaAltura
	
	^Caja conPeso: unPeso conAltura: unaAltura.! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 62 53 63 52 58 55 55 53 109 106 59 58 53 127 63 61 102 61 59 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 8 53 17 56 64 57 53 56 61 63 53 56 53 59 61 17 109 108 107 118 121 104 17 109 108 107 118 121 104 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 55 65 56 63 65 55 56 53 64 61 57 64 60 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 63 62 53 122 123 17 59 63 62 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 56 65 57 57 65 58 62 53 55 58 61 59 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 53 122 123 17 59 60 55 55 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 56 65 59 60 65 60 59 53 63 55 63 62 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 59 62 63 53 122 123 17 62 57 59 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 56 61 65 56 59 53 62 59 63 58 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 53 122 123 17 60 58 63 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 57 65 59 61 53 57 64 60 60 57 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 62 65 60 58 53 59 59 57 61 57 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 57 64 53 122 123 17 58 63 59 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 63 65 59 59 53 61 55 60 63 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 61 91 57 57 65 57 64 65 55 63 53 56 59 55 63 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 57 64 53 122 123 17 58 63 59 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 59 61 65 55 64 53 58 61 60 64 55 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 90 123 104 123 108 53 122 123 17 59 60 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 55 65 57 61 53 55 55 58 64 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 75 108 106 118 121 104 123 118 121 53 122 123 17 58 56 55 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 55 65 59 58 53 61 55 61 56 63 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 90 123 104 123 108 53 122 123 17 59 60 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 62 91 56 64 65 60 58 65 60 59 53 56 56 58 57 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 104 115 110 118 58 54 121 108 119 118 122 54 108 113 108 121 106 112 106 112 118 122 52 108 117 52 106 115 104 122 108 52 57 55 57 56 52 56 106 54 87 104 123 121 118 117 108 122 54 87 104 123 121 118 117 108 122 52 72 107 104 119 123 108 121 53 122 123 17 59 64 57 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 55 60 65 56 61 53 55 62 59 61 63 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 60 57 62 53 122 123 17 59 55 63 62 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 57 55 65 58 64 53 61 61 61 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 55 60 53 122 123 17 59 55 56 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 56 65 58 59 65 58 59 53 55 56 63 59 59 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 64 61 55 53 122 123 17 60 55 57 61 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 57 65 57 59 65 59 59 53 64 58 59 62 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 57 62 55 53 122 123 17 59 58 64 64 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 56 64 91 57 57 65 58 62 65 59 56 53 56 62 60 57 59 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 58 59 53 122 123 17 59 63 56 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 58 56 65 56 62 53 61 64 58 63 58 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 53 122 123 17 59 60 55 55 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 58 61 65 58 62 53 57 58 60 63 62 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 63 62 58 60 53 122 123 17 59 59 58 57 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 59 62 65 60 60 53 60 61 57 64 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 118 121 121 108 106 106 112 118 117 52 119 104 121 106 112 104 115 108 122 54 57 106 57 55 57 60 54 56 56 55 55 59 58 53 122 123 17 58 61 59 62 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 55 65 59 63 65 59 59 53 58 59 58 59 64 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 63 62 53 122 123 17 59 63 62 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 58 65 55 57 65 57 58 53 60 60 58 57 61 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 53 122 123 17 60 58 63 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 56 91 57 58 65 55 58 65 55 63 53 56 57 60 59 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 60 56 64 55 53 122 123 17 58 64 63 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 59 91 57 55 65 55 55 65 59 63 53 56 63 60 63 60 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 55 60 53 122 123 17 59 55 56 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 55 52 57 59 91 57 56 65 59 64 65 60 63 53 56 55 55 56 55 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 56 60 63 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 57 106 57 55 57 60 52 56 108 121 87 104 121 106 112 104 115 52 56 60 52 77 104 125 118 121 108 129 106 118 74 118 116 119 118 122 112 106 112 118 117 88 124 112 123 104 117 107 118 81 108 121 104 121 120 124 112 104 81 124 110 104 107 118 121 72 122 123 121 118 117 104 124 123 104 53 122 123 17 59 55 64 55 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 62 65 60 57 65 60 58 53 63 55 62 60 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 121 108 119 118 122 54 91 124 122 83 112 105 121 118 122 94 108 105 54 105 104 106 114 108 117 107 102 106 124 112 122 54 91 124 122 83 112 105 121 118 122 52 80 123 108 121 104 106 112 118 117 55 56 52 90 123 118 121 128 55 57 52 56 90 118 115 118 75 118 116 112 117 112 118 53 122 123 17 58 57 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 55 62 91 56 63 65 55 57 65 58 62 53 60 60 57 60 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 121 108 119 118 122 54 91 124 122 83 112 105 121 118 122 94 108 105 54 105 104 106 114 108 117 107 102 106 124 112 122 54 91 124 122 83 112 105 121 118 122 52 80 123 108 121 104 106 112 118 117 55 56 52 90 123 118 121 128 55 57 52 57 53 122 123 17 56 64 56 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 62 91 57 56 65 55 61 65 60 59 53 58 56 63 60 63 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 59 55 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 56 57 65 55 60 53 64 55 55 64 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 91 108 122 123 82 104 117 105 104 117 52 123 108 122 123 56 62 53 122 123 17 60 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 55 65 58 55 65 58 64 53 56 56 57 61 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 64 52 123 108 122 123 56 63 53 122 123 17 60 62 59 59 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 56 63 91 55 64 65 60 64 65 59 61 53 58 62 56 60 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 58 55 52 74 121 108 118 81 108 121 104 121 120 124 112 104 75 108 84 112 108 116 105 121 118 122 75 108 87 121 118 128 108 106 123 118 53 122 123 17 60 64 61 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 56 91 56 59 65 58 55 65 60 59 53 61 59 62 64 61 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 59 58 53 122 123 17 57 55 61 56 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 56 91 56 60 65 56 55 65 60 56 53 64 59 62 61 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 55 60 64 52 57 107 118 53 122 123 17 57 61 56 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 56 91 56 60 65 58 63 65 58 63 53 60 60 64 63 59 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 55 60 64 52 57 107 118 53 122 123 17 57 61 56 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 56 91 56 62 65 56 59 65 56 60 53 58 55 56 55 58 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 52 57 107 118 53 122 123 17 58 58 56 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 57 91 56 56 65 56 62 65 59 58 53 58 56 56 55 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 58 57 52 123 108 122 123 55 61 79 112 122 123 118 121 112 104 93 104 115 112 107 104 52 72 113 124 122 123 108 76 117 124 117 106 112 104 107 118 53 122 123 17 61 56 59 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 57 91 56 56 65 59 62 65 56 64 53 63 63 56 61 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 52 57 107 118 53 122 123 17 58 58 56 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 57 91 56 56 65 60 59 65 55 64 53 62 59 60 55 56 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 62 59 58 52 57 107 118 53 122 123 17 56 61 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 57 91 56 57 65 56 64 65 57 57 53 58 56 60 57 64 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 58 57 52 123 108 122 123 55 61 79 112 122 123 118 121 112 104 93 104 115 112 107 104 52 72 113 124 122 123 108 76 117 124 117 106 112 104 107 118 53 122 123 17 61 56 59 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 57 91 56 57 65 57 56 65 58 62 53 64 63 56 56 63 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 62 59 58 52 57 107 118 53 122 123 17 56 61 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 59 91 57 57 65 59 59 65 57 64 53 56 62 57 58 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 52 57 107 118 53 122 123 17 58 59 56 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 59 91 57 58 65 60 57 65 55 55 53 55 58 63 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 55 60 64 52 57 107 118 53 122 123 17 57 61 56 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 55 60 65 56 58 53 58 62 55 57 56 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 52 57 107 118 53 122 123 17 58 59 56 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 56 61 65 58 60 53 60 60 59 61 61 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 59 58 52 57 107 118 53 122 123 17 57 55 61 56 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 56 62 65 58 59 53 64 58 56 64 59 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 55 60 64 52 57 107 118 53 122 123 17 57 61 56 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 56 63 65 56 60 53 59 59 62 61 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 52 57 107 118 53 122 123 17 58 58 56 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 57 61 65 57 62 53 61 57 56 56 55 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 52 57 107 118 53 122 123 17 58 58 56 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 57 62 65 56 55 53 64 56 63 55 57 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 62 59 58 52 57 107 118 53 122 123 17 56 61 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 60 91 55 55 65 57 64 65 58 59 53 62 55 62 61 60 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 62 56 52 57 107 118 53 122 123 17 58 61 64 62 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 55 65 59 61 65 57 64 53 55 55 59 55 58 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 64 56 52 57 107 118 53 122 123 17 57 62 58 60 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 57 65 57 55 65 55 60 53 58 55 57 58 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 64 59 61 52 57 107 118 53 122 123 17 57 57 58 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 57 65 60 58 65 56 61 53 61 55 64 55 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 60 59 60 52 57 107 118 53 122 123 17 56 61 62 61 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 56 55 65 55 58 53 62 59 61 59 58 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 57 64 61 52 57 107 118 53 122 123 17 57 55 57 64 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 57 64 65 57 56 53 59 63 61 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 55 59 58 52 57 107 118 53 122 123 17 57 55 61 56 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 57 64 65 58 55 53 64 61 63 60 60 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 55 60 64 52 57 107 118 53 122 123 17 57 61 56 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 57 64 65 59 55 53 61 57 64 58 58 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 62 60 62 52 57 107 118 53 122 123 17 58 58 56 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 57 64 65 60 56 53 62 59 62 56 58 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 62 59 58 52 57 107 118 53 122 123 17 56 61 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 55 56 53 61 61 64 60 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 57 56 63 59 52 57 107 118 53 122 123 17 58 59 56 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 56 56 53 58 61 57 59 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 61 62 56 52 57 107 118 53 122 123 17 58 61 64 62 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 57 56 53 56 62 61 61 64 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 63 64 56 52 57 107 118 53 122 123 17 57 62 58 60 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 57 63 53 63 58 58 55 60 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 55 64 64 59 61 52 57 107 118 53 122 123 17 57 57 58 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 58 61 53 62 64 55 60 55 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 55 60 59 60 52 57 107 118 53 122 123 17 56 61 62 61 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 57 61 91 57 58 65 58 55 65 59 62 53 56 64 59 57 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 56 56 57 64 61 52 57 107 118 53 122 123 17 57 55 57 64 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 55 64 65 60 56 53 61 58 62 56 56 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 56 52 123 108 122 123 55 56 53 122 123 17 56 60 56 55 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 57 65 59 60 53 60 60 61 64 55 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 57 52 123 108 122 123 55 57 53 122 123 17 56 61 60 58 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 57 65 60 61 53 57 63 63 63 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 59 52 123 108 122 123 55 60 53 122 123 17 56 64 61 56 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 58 65 56 55 53 60 56 55 62 59 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 60 52 123 108 122 123 55 61 53 122 123 17 57 55 64 58 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 59 65 55 55 53 64 64 64 55 60 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 58 57 52 123 108 122 123 55 61 79 112 122 123 118 121 112 104 93 104 115 112 107 104 52 72 113 124 122 123 108 76 117 124 117 106 112 104 107 118 53 122 123 17 61 56 59 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 59 65 59 62 53 59 62 62 62 59 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 60 52 123 108 122 123 55 61 53 122 123 17 57 55 64 58 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 56 59 65 60 62 53 56 63 61 61 63 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 59 52 123 108 122 123 55 60 53 122 123 17 56 64 61 56 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 58 55 65 55 59 53 64 57 60 60 59 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 60 52 123 108 122 123 55 61 53 122 123 17 59 61 62 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 58 55 65 58 60 53 57 57 56 63 56 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 55 61 52 123 108 122 123 55 62 53 122 123 17 57 57 56 55 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 58 56 65 55 59 53 55 61 64 64 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 55 52 123 108 122 123 56 56 53 122 123 17 57 63 58 57 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 58 61 65 55 59 53 64 64 59 57 55 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 56 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 96 89 108 118 121 110 104 117 112 129 118 80 109 122 53 122 123 17 58 55 55 62 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 58 64 65 58 59 53 56 55 58 61 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 55 65 59 60 53 59 56 64 55 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 58 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 123 121 108 84 118 125 108 121 72 96 84 118 125 108 121 72 90 112 108 117 107 118 53 122 123 17 58 58 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 56 65 56 62 53 63 63 59 61 58 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 56 65 59 62 53 59 62 62 64 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 58 65 58 60 53 60 64 61 62 60 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 58 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 123 121 108 84 118 125 108 121 72 96 84 118 125 108 121 72 90 112 108 117 107 118 53 122 123 17 58 58 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 59 65 57 57 53 57 62 63 62 57 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 59 61 65 59 63 53 63 59 58 63 57 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 60 57 65 60 60 53 57 57 55 64 57 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 60 58 65 58 58 53 62 59 57 61 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 56 65 60 63 65 56 59 53 63 61 62 63 58 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 58 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 123 121 108 84 118 125 108 121 72 96 84 118 125 108 121 72 90 112 108 117 107 118 53 122 123 17 58 58 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 55 65 55 62 53 57 55 56 57 64 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 56 65 55 61 53 63 60 63 62 58 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 53 122 123 17 58 57 63 56 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 57 65 57 60 53 57 61 60 57 62 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 57 52 123 108 122 123 56 57 106 118 116 108 117 123 104 107 118 53 122 123 17 56 56 57 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 57 65 60 62 53 58 60 62 61 60 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 58 52 89 108 109 104 106 123 118 121 72 107 107 87 104 121 104 116 108 123 108 121 96 123 108 122 123 56 57 119 104 122 104 117 107 118 53 122 123 17 58 58 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 58 65 59 63 53 64 61 56 64 62 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 60 52 123 108 122 123 56 59 53 122 123 17 58 61 56 58 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 61 65 58 59 53 56 61 56 57 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 61 52 89 108 118 121 110 104 117 112 129 118 80 109 122 75 108 76 122 123 104 107 118 122 53 122 123 17 58 61 63 59 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 63 65 55 56 53 55 58 61 56 61 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 62 52 89 108 109 104 106 123 118 121 75 108 115 108 110 104 121 84 118 125 108 121 72 90 112 108 117 107 118 72 115 76 122 123 104 107 118 53 122 123 17 58 64 57 59 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 55 63 65 59 58 53 57 58 64 59 62 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 63 52 89 108 109 104 106 123 118 121 88 124 112 123 118 87 121 112 116 108 121 118 122 80 109 122 75 108 76 122 123 104 107 118 53 122 123 17 59 55 60 56 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 56 65 60 62 53 56 60 63 64 58 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 56 64 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 75 108 74 118 117 107 112 106 112 118 117 75 108 84 118 125 108 121 72 84 112 122 116 118 76 122 123 104 107 118 53 122 123 17 59 56 60 56 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 57 65 56 60 53 61 57 62 56 63 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 55 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 77 112 117 104 115 112 129 104 107 104 53 122 123 17 59 57 62 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 57 65 58 63 53 60 57 63 59 55 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 56 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 87 108 117 107 112 108 117 123 108 53 122 123 17 59 58 64 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 58 65 56 57 53 57 56 55 58 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 57 52 84 124 108 125 118 89 108 122 119 118 117 122 104 105 112 115 104 107 75 108 84 118 125 108 121 79 112 122 123 118 121 112 104 122 72 115 84 112 108 116 105 121 118 75 108 87 121 118 128 108 106 123 118 53 122 123 17 59 60 63 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 58 65 60 62 53 60 56 58 63 59 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 58 52 88 124 112 123 118 80 109 122 87 118 121 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 59 64 64 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 56 59 65 59 60 53 58 58 62 63 62 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 56 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 87 108 117 107 112 108 117 123 108 53 122 123 17 59 58 64 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 57 59 65 60 59 53 61 61 62 57 55 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 57 52 84 124 108 125 118 89 108 122 119 118 117 122 104 105 112 115 104 107 75 108 84 118 125 108 121 79 112 122 123 118 121 112 104 122 72 115 84 112 108 116 105 121 118 75 108 87 121 118 128 108 106 123 118 53 122 123 17 59 60 63 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 57 60 65 59 58 53 64 55 57 59 64 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 58 52 88 124 112 123 118 80 109 122 87 118 121 89 118 115 75 108 84 112 108 116 105 121 118 53 122 123 17 59 64 64 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 57 64 65 57 60 53 62 60 57 57 62 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 59 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 117 81 108 121 104 121 120 124 112 104 75 108 76 122 123 104 107 118 122 53 122 123 17 60 55 62 63 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 58 57 65 57 64 53 62 62 64 60 62 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 60 52 123 108 122 123 56 60 53 122 123 17 60 56 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 58 57 65 59 57 53 64 57 57 63 59 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 62 52 123 108 122 123 56 62 53 122 123 17 60 61 59 59 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 58 59 65 57 57 53 59 59 61 59 59 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 104 122 118 72 87 104 122 118 54 80 90 56 52 57 106 57 55 57 60 52 57 107 118 87 104 121 106 112 104 115 52 57 64 52 123 108 122 123 56 63 53 122 123 17 60 62 59 59 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 60 52 56 56 52 58 55 91 56 57 65 58 60 65 56 62 53 57 60 64 60 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 10[..])!