!classDefinition: #CasaInteligente category: #'1c2026-1erParcial'!
Object subclass: #CasaInteligente
	instanceVariableNames: 'modo puertaPrincipalBloqueada alarma climatizacionEncendida temperaturaClimatizacion habitaciones configuracionDeEnergia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!CasaInteligente methodsFor: 'accessing' stamp: 'JS 4/19/2026 22:02:30'!
configuracionDeEnergia

	^configuracionDeEnergia ! !

!CasaInteligente methodsFor: 'accessing' stamp: 'JS 4/19/2026 22:02:26'!
modo

	^modo! !


!CasaInteligente methodsFor: 'initialization' stamp: 'JS 4/19/2026 22:02:21'!
initializeEnModo: modoInicial 

	modo := modoInicial.
	alarma := false.
	habitaciones := OrderedCollection new.
	climatizacionEncendida := false.
	configuracionDeEnergia := #Normal! !


!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:01:55'!
alarmaEncendida

	^alarma! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:01:58'!
climatizacionApagada

	^climatizacionEncendida not! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:02'!
climatizacionEncendidaEn: unaPosibleTemperatura 

	^climatizacionEncendida and: [ temperaturaClimatizacion = unaPosibleTemperatura ]! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:06'!
puertaPrincipalBloqueada

	^puertaPrincipalBloqueada! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:10'!
puertaPrincipalDesbloqueada

	^puertaPrincipalBloqueada not! !


!CasaInteligente methodsFor: 'set values' stamp: 'JS 4/19/2026 22:01:46'!
bloquearPuertaPrincipal

	puertaPrincipalBloqueada := true! !

!CasaInteligente methodsFor: 'set values' stamp: 'JS 4/19/2026 22:01:48'!
desbloquearPuertaPrincipal

	puertaPrincipalBloqueada := false! !

!CasaInteligente methodsFor: 'set values' stamp: 'JS 4/19/2026 22:01:51'!
encenderAlarma

	alarma := true! !


!CasaInteligente methodsFor: 'apagar alarma' stamp: 'JS 4/19/2026 22:01:40'!
apagarAlarma

	alarma := false! !


!CasaInteligente methodsFor: 'private' stamp: 'JS 4/21/2026 14:52:00'!
sincronizarClimatizacionCentral
	
	self tempProm > self umbralSup ifTrue: [
		climatizacionEncendida := true.
		temperaturaClimatizacion := self temperaturaParaRefrigeracion.
		configuracionDeEnergia = #Confort ifTrue: [temperaturaClimatizacion := temperaturaClimatizacion - (2 * celsius)].
		^self
	].
	
	self tempProm < self umbralInf ifTrue: [
		climatizacionEncendida := true.
		temperaturaClimatizacion := self temperaturaParaCalefaccion.
		configuracionDeEnergia = #Confort ifTrue: [temperaturaClimatizacion := temperaturaClimatizacion + (2 * celsius)].
		^self
	].

	climatizacionEncendida := false! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/21/2026 14:53:14'!
tempProm

	| p size suma habitacionesConTemperaturaRegistrada |
	
	habitacionesConTemperaturaRegistrada := OrderedCollection new.
	habitaciones do: [:unaHabitacion | unaHabitacion tieneTemperaturaRegistrada ifTrue: [ habitacionesConTemperaturaRegistrada add: unaHabitacion ] ].
	
	suma := 0 * celsius.
	habitacionesConTemperaturaRegistrada do: [ :unaHabitacion | suma := suma + unaHabitacion temperaturaRegistrada ].
	
	size := 0.
	habitacionesConTemperaturaRegistrada do: [ :unaHabitacion | size := size + 1 ].
	
	p := suma / size.
	
	^p! !

!CasaInteligente methodsFor: 'private' stamp: 'LL 4/20/2026 20:23:09'!
umbralInf

	configuracionDeEnergia = #AhorroDeEnergia ifTrue: [ ^self umbralInferiorBase - (0  * celsius) ].
	configuracionDeEnergia = #AhorroDeEnergiaFuerte ifTrue: [ ^self umbralInferiorBase - (5  * celsius) ].
	configuracionDeEnergia = #AhorroDeEnergiaExtremo ifTrue: [ ^self umbralInferiorBase - (10  * celsius) ].
	
	^self umbralInferiorBase! !

!CasaInteligente methodsFor: 'private' stamp: 'LL 4/20/2026 20:23:43'!
umbralSup

	configuracionDeEnergia = #AhorroDeEnergia ifTrue: [ ^self umbralSuperiorBase + (0  * celsius) ].
	configuracionDeEnergia = #AhorroDeEnergiaFuerte ifTrue: [ ^self umbralSuperiorBase + (5  * celsius) ].
	configuracionDeEnergia = #AhorroDeEnergiaExtremo ifTrue: [ ^self umbralSuperiorBase + (10  * celsius) ].
	
	^self umbralSuperiorBase! !


!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/19/2026 19:06:04'!
agregarHabitacion: unaNuevaHabitacionDeLaCasa

	habitaciones add: unaNuevaHabitacionDeLaCasa! !


!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/19/2026 22:00:16'!
usarAhorroDeEnergia

	configuracionDeEnergia := #AhorroDeEnergia! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/19/2026 22:00:22'!
usarAhorroDeEnergiaExtremo

	configuracionDeEnergia := #AhorroDeEnergiaExtremo! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/19/2026 22:00:25'!
usarAhorroDeEnergiaFuerte

	configuracionDeEnergia := #AhorroDeEnergiaFuerte! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/19/2026 22:00:28'!
usarConfort

	configuracionDeEnergia := #Confort! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/19/2026 22:46:09'!
usarNormal

	configuracionDeEnergia := #Normal! !


!CasaInteligente methodsFor: 'temperaturas' stamp: 'LL 4/20/2026 19:53:22'!
temperaturaParaCalefaccion

	^ 28 * celsius! !

!CasaInteligente methodsFor: 'temperaturas' stamp: 'LL 4/20/2026 19:53:11'!
temperaturaParaRefrigeracion

	^ 24 * celsius! !

!CasaInteligente methodsFor: 'temperaturas' stamp: 'LL 4/20/2026 20:20:40'!
umbralInferiorBase
	
	^15 * celsius.! !

!CasaInteligente methodsFor: 'temperaturas' stamp: 'LL 4/20/2026 20:20:35'!
umbralSuperiorBase
	
	^25 * celsius.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CasaInteligente class' category: #'1c2026-1erParcial'!
CasaInteligente class
	instanceVariableNames: ''!

!CasaInteligente class methodsFor: 'instance creation' stamp: 'JS 4/19/2026 17:41:43'!
enModo: modoInicial 
	^self new initializeEnModo: modoInicial ! !


!classDefinition: #Evento category: #'1c2026-1erParcial'!
Object subclass: #Evento
	instanceVariableNames: 'tipo valor'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!Evento methodsFor: 'initialization' stamp: 'JS 4/19/2026 22:07:42'!
initializeDe: tipoDeEvento

	tipo := tipoDeEvento! !


!Evento methodsFor: 'accessing' stamp: 'JS 4/19/2026 22:03:51'!
tipo

	^tipo! !

!Evento methodsFor: 'accessing' stamp: 'JS 4/19/2026 22:03:54'!
valor

	^valor! !


!Evento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:34:15'!
esCriticoPara: unaCasa

	self subclassResponsibility! !


!Evento methodsFor: 'setters' stamp: 'JS 4/19/2026 22:09:44'!
setValor: valorDelEvento

	valor := valorDelEvento ! !


!Evento methodsFor: 'umbrales' stamp: 'LL 4/20/2026 19:59:19'!
umbralInfCritico

	^ 0 * celsius! !

!Evento methodsFor: 'umbrales' stamp: 'LL 4/20/2026 19:59:08'!
umbralSupCritico

	^ 40 * celsius! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Evento class' category: #'1c2026-1erParcial'!
Evento class
	instanceVariableNames: ''!

!Evento class methodsFor: 'instance creation' stamp: 'JS 4/19/2026 16:58:20'!
de: tipoDeEvento 
	^self new initializeDe: tipoDeEvento ! !


!classDefinition: #EventoDeCambioDeTemperatura category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeCambioDeTemperatura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeCambioDeTemperatura methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:34:37'!
esCriticoPara: unaCasa

	^valor > (self umbralSupCritico) or: [ valor < (self umbralInfCritico) ]
	! !


!classDefinition: #EventoDeDeteccionDeHumo category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeDeteccionDeHumo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeDeteccionDeHumo methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:34:57'!
esCriticoPara: unaCasa

	^true 
	! !


!classDefinition: #EventoDeDeteccionDeMovimiento category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeDeteccionDeMovimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeDeteccionDeMovimiento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:35:13'!
esCriticoPara: unaCasa

	^unaCasa modo = #Ausente
	! !


!classDefinition: #EventoDeFinDeDeteccionDeMovimiento category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeFinDeDeteccionDeMovimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeFinDeDeteccionDeMovimiento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:35:24'!
esCriticoPara: unaCasa

	^false
	! !


!classDefinition: #HabitacionInteligente category: #'1c2026-1erParcial'!
Object subclass: #HabitacionInteligente
	instanceVariableNames: 'casaInteligente nivelDeIluminacion persiana temperaturaRegistrada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!HabitacionInteligente methodsFor: 'initialization' stamp: 'JS 4/19/2026 22:04:21'!
initializePara: unaCasaInteligente 

	casaInteligente := unaCasaInteligente.
	casaInteligente agregarHabitacion: self! !


!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:24'!
nivelDeIluminacionEs: unPosibleNivelDeIluminacion

	^unPosibleNivelDeIluminacion = nivelDeIluminacion! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:31'!
persianaAbierta

	^persiana = #Abierta! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:34'!
persianaCerrada

	^persiana = #Cerrada! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:37'!
persianaMedioAbierta

	^persiana = #MedioAbierta! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:54'!
tieneTemperaturaRegistrada

	^temperaturaRegistrada notNil! !


!HabitacionInteligente methodsFor: 'private' stamp: 'LL 4/20/2026 20:58:50'!
ajustarIluminacion: niv

	| nuevoNivel |
	
	casaInteligente configuracionDeEnergia = #Normal ifTrue: [ nuevoNivel := niv ].
	casaInteligente configuracionDeEnergia = #AhorroDeEnergia ifTrue: [ nuevoNivel := niv - 1 ].
	casaInteligente configuracionDeEnergia = #AhorroDeEnergiaFuerte ifTrue: [ nuevoNivel := niv - 1 ].
	casaInteligente configuracionDeEnergia = #AhorroDeEnergiaExtremo ifTrue: [ nuevoNivel := niv - 2 ].
	casaInteligente configuracionDeEnergia = #Confort ifTrue: [ nuevoNivel := niv + 1 ].
	
	nuevoNivel ifNil: [self error: 'Configuracion de energia desconocida'].
	
	nuevoNivel > 5 ifTrue: [^self nivelDeluzPrendida].
	nuevoNivel < 0 ifTrue: [^self nivelDeluzApagada].
	^nuevoNivel ! !


!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 14:43:17'!
procesarEvento: eventoAProcesar

	(eventoAProcesar esCriticoPara: casaInteligente) ifTrue: [casaInteligente encenderAlarma].

	eventoAProcesar tipo = #DeteccionDeMovimiento ifTrue: [
		self procesarEventoDeDeteccionDeMovimiento.
		^self
	].

	eventoAProcesar tipo = #FinDeDeteccionDeMovimiento ifTrue: [
		self procesarEventoDeFinDeDeteccionDeMovimiento.
		^self
	].

	eventoAProcesar tipo = #DeteccionDeHumo ifTrue: [
		self procesarEventoDeDeteccionDeHumo.
		^self
	].

	eventoAProcesar tipo = #CambioDeTemperatura ifTrue: [
		self procesarEventoDeCambioDeTemperatura: eventoAProcesar.
		^self
	].

	self error: 'Tipo de evento desconocido'! !

!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 14:44:56'!
procesarEventoDeCambioDeTemperatura: eventoAProcesar

	temperaturaRegistrada := eventoAProcesar valor.
	casaInteligente modo = #Ausente ifFalse: [ casaInteligente sincronizarClimatizacionCentral ]! !

!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 14:44:52'!
procesarEventoDeDeteccionDeHumo

	^casaInteligente desbloquearPuertaPrincipal! !

!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 14:44:18'!
procesarEventoDeDeteccionDeMovimiento

	casaInteligente modo = #EnCasa ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzPrendida.
		persiana := #Cerrada.
		casaInteligente desbloquearPuertaPrincipal.
		^self
	].
	casaInteligente modo = #Noche ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzDeNoche.
		persiana := #Abierta.
		casaInteligente desbloquearPuertaPrincipal.
		^self
	].
	casaInteligente modo = #Ausente ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
		persiana := #MedioAbierta.
		casaInteligente desbloquearPuertaPrincipal.
		^self
	].
	self error: 'Modo desconocido'! !

!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 14:44:42'!
procesarEventoDeFinDeDeteccionDeMovimiento

	casaInteligente modo = #EnCasa ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzAtenuada.
		persiana := #MedioAbierta.
		casaInteligente desbloquearPuertaPrincipal.
		^self
	].
	casaInteligente modo = #Noche ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
		persiana := #Cerrada.
		casaInteligente bloquearPuertaPrincipal.
		^self
	].
	casaInteligente modo = #Ausente ifTrue: [
		nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
		persiana := #MedioAbierta.
		casaInteligente bloquearPuertaPrincipal.
		^self
	].
	self error: 'Modo desconocido'! !


!HabitacionInteligente methodsFor: 'accessing' stamp: 'JS 4/19/2026 22:04:51'!
temperaturaRegistrada

	^temperaturaRegistrada! !


!HabitacionInteligente methodsFor: 'niveles de iluminacion' stamp: 'LL 4/20/2026 20:58:34'!
nivelDeluzApagada

	^ 0! !

!HabitacionInteligente methodsFor: 'niveles de iluminacion' stamp: 'LL 4/20/2026 20:59:04'!
nivelDeluzAtenuada

	^ 3! !

!HabitacionInteligente methodsFor: 'niveles de iluminacion' stamp: 'LL 4/20/2026 20:58:57'!
nivelDeluzDeNoche

	^ 2! !

!HabitacionInteligente methodsFor: 'niveles de iluminacion' stamp: 'LL 4/20/2026 20:58:50'!
nivelDeluzPrendida

	^ 5! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HabitacionInteligente class' category: #'1c2026-1erParcial'!
HabitacionInteligente class
	instanceVariableNames: ''!

!HabitacionInteligente class methodsFor: 'instance creation' stamp: 'JS 4/19/2026 16:57:24'!
para: unaCasaInteligente 
	^self new initializePara: unaCasaInteligente ! !


!classDefinition: #TestCasaInteligente category: #'1c2026-1erParcial'!
TestCase subclass: #TestCasaInteligente
	instanceVariableNames: 'unaCasaInteligenteModoEnCasa unaHabitacionInteligenteModoEnCasa unaCasaInteligenteModoNoche unaHabitacionInteligenteModoNoche unaCasaInteligenteModoAusente unaHabitacionInteligenteModoAusente otraHabitacionInteligenteModoEnCasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!TestCasaInteligente methodsFor: 'setUp' stamp: 'JS 4/19/2026 22:05:09'!
setUp

	unaCasaInteligenteModoEnCasa := self casaInteligenteModoEnCasa.
	unaHabitacionInteligenteModoEnCasa := HabitacionInteligente para: unaCasaInteligenteModoEnCasa.
	otraHabitacionInteligenteModoEnCasa := HabitacionInteligente para: unaCasaInteligenteModoEnCasa.
	
	unaCasaInteligenteModoNoche := self casaInteligenteModoNoche.
	unaHabitacionInteligenteModoNoche := HabitacionInteligente para: unaCasaInteligenteModoNoche.
	
	unaCasaInteligenteModoAusente := self casaInteligenteModoAusente.
	unaHabitacionInteligenteModoAusente := HabitacionInteligente para: unaCasaInteligenteModoAusente! !


!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/19/2026 18:03:44'!
casaInteligenteModoAusente

	^CasaInteligente enModo: #Ausente! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/19/2026 18:03:48'!
casaInteligenteModoEnCasa

	^CasaInteligente enModo: #EnCasa! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/19/2026 18:03:51'!
casaInteligenteModoNoche

	^CasaInteligente enModo: #Noche! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:36:15'!
eventoDeCambioDeTemperaturaA: nuevaTemperatura

	^(EventoDeCambioDeTemperatura de: #CambioDeTemperatura) setValor: nuevaTemperatura! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:36:23'!
eventoDeDeteccionDeHumo

	^EventoDeDeteccionDeHumo de: #DeteccionDeHumo! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:36:29'!
eventoDeDeteccionDeMovimiento

	^EventoDeDeteccionDeMovimiento de: #DeteccionDeMovimiento! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:36:35'!
eventoDeFinDeDeteccionDeMovimiento

	^EventoDeFinDeDeteccionDeMovimiento de: #FinDeDeteccionDeMovimiento! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/19/2026 17:19:33'!
habitacionInteligentePara: casaALaQuePertenece

	 ^HabitacionInteligente para: casaALaQuePertenece ! !


!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:58:50'!
test01DetectarMovimientoEnModoEnCasa
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeDeteccionDeMovimiento.
	
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida).
	self assert: unaHabitacionInteligenteModoEnCasa persianaCerrada.
	self deny: unaCasaInteligenteModoEnCasa alarmaEncendida.
	self assert: unaCasaInteligenteModoEnCasa puertaPrincipalDesbloqueada! !

!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:59:04'!
test02DejarDeDetectarMovimientoEnModoEnCasa
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeDeteccionDeMovimiento.
	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeFinDeDeteccionDeMovimiento.
	
	self deny: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida).
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzAtenuada).
	self deny: unaHabitacionInteligenteModoEnCasa persianaCerrada.
	self assert: unaHabitacionInteligenteModoEnCasa persianaMedioAbierta.
	self deny: unaCasaInteligenteModoEnCasa alarmaEncendida.
	self assert: unaCasaInteligenteModoEnCasa puertaPrincipalDesbloqueada! !

!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:58:57'!
test03DetectarMovimientoEnModoNoche
	
	unaHabitacionInteligenteModoNoche procesarEvento: self eventoDeDeteccionDeMovimiento.
	
	self assert: (unaHabitacionInteligenteModoNoche nivelDeIluminacionEs: unaHabitacionInteligenteModoNoche nivelDeluzDeNoche).
	self assert: unaHabitacionInteligenteModoNoche persianaAbierta.
	self deny: unaCasaInteligenteModoNoche alarmaEncendida.
	self assert: unaCasaInteligenteModoNoche puertaPrincipalDesbloqueada! !

!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:58:34'!
test04DejarDeDetectarMovimientoEnModoNoche
	
	unaHabitacionInteligenteModoNoche procesarEvento: self eventoDeDeteccionDeMovimiento.
	unaHabitacionInteligenteModoNoche procesarEvento: self eventoDeFinDeDeteccionDeMovimiento.
	
	self assert: (unaHabitacionInteligenteModoNoche nivelDeIluminacionEs: unaHabitacionInteligenteModoNoche nivelDeluzApagada).
	self assert: unaHabitacionInteligenteModoNoche persianaCerrada.
	self deny: unaCasaInteligenteModoNoche alarmaEncendida.
	self deny: unaCasaInteligenteModoNoche puertaPrincipalDesbloqueada.
	self assert: unaCasaInteligenteModoNoche puertaPrincipalBloqueada! !

!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:58:34'!
test05DetectarMovimientoEnModoAusente
	
	unaHabitacionInteligenteModoAusente procesarEvento: self eventoDeDeteccionDeMovimiento.
	
	self assert: (unaHabitacionInteligenteModoAusente nivelDeIluminacionEs: unaHabitacionInteligenteModoAusente nivelDeluzApagada).
	self assert: unaHabitacionInteligenteModoAusente persianaMedioAbierta.
	self assert: unaCasaInteligenteModoAusente alarmaEncendida.
	self assert: unaCasaInteligenteModoAusente puertaPrincipalDesbloqueada! !

!TestCasaInteligente methodsFor: 'tests - movimiento' stamp: 'LL 4/20/2026 20:58:34'!
test06DejarDeDetectarMovimientoEnModoAusente
	
	unaHabitacionInteligenteModoAusente procesarEvento: self eventoDeDeteccionDeMovimiento.
	unaHabitacionInteligenteModoAusente procesarEvento: self eventoDeFinDeDeteccionDeMovimiento.
	
	self assert: (unaHabitacionInteligenteModoAusente nivelDeIluminacionEs: unaHabitacionInteligenteModoAusente nivelDeluzApagada).
	self assert: unaHabitacionInteligenteModoAusente persianaMedioAbierta.
	self assert: unaCasaInteligenteModoAusente alarmaEncendida.
	self assert: unaCasaInteligenteModoAusente puertaPrincipalBloqueada! !


!TestCasaInteligente methodsFor: 'tests - humo/alarma' stamp: 'JS 4/19/2026 22:06:00'!
test07DetectarHumoEnciendeLaAlarmaYDesbloqueaLaPuertaPrincipal

	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeDeteccionDeHumo.
	
	self assert: unaCasaInteligenteModoEnCasa puertaPrincipalDesbloqueada.
	self assert: unaCasaInteligenteModoEnCasa alarmaEncendida! !

!TestCasaInteligente methodsFor: 'tests - humo/alarma' stamp: 'LL 4/20/2026 17:25:12'!
test08LaAlarmaPermaneceEncendidaAunFinalizadaLaDeteccionDeHumo

	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeDeteccionDeHumo.
	unaHabitacionInteligenteModoEnCasa procesarEvento: self eventoDeFinDeDeteccionDeMovimiento.

	self assert: unaCasaInteligenteModoEnCasa alarmaEncendida.
	
	unaCasaInteligenteModoEnCasa apagarAlarma.
	
	self deny: unaCasaInteligenteModoEnCasa alarmaEncendida! !


!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 20:30:28'!
test09UnAumentoDeTemperaturaEnciendeLaClimatizacionCentralEn24Grados

	| temperaturaArribaDelUmbral |
	temperaturaArribaDelUmbral := unaCasaInteligenteModoEnCasa umbralSuperiorBase + (1 * celsius).
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaArribaDelUmbral).
	
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: 24 * celsius)! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 20:30:35'!
test10UnDescensoDeTemperaturaEnciendeLaClimatizacionCentralEn28Grados

	| temperaturaDebajoDelUmbral |
	temperaturaDebajoDelUmbral := unaCasaInteligenteModoEnCasa umbralInferiorBase - (1 * celsius).
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaDebajoDelUmbral).
	
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: 28 * celsius)! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 20:24:58'!
test11PasarATemperaturaConfortableApagaLaClimatizacionCentral

	| temperaturaDentroDelUmbral |
	temperaturaDentroDelUmbral := unaCasaInteligenteModoEnCasa umbralInferiorBase + (1 * celsius).
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaDentroDelUmbral).
	
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 21:03:30'!
test12LaClimatizacionCentralUsaElPromedioEntreLasHabitaciones

	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: 10 * celsius).
	otraHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: 30 * celsius).
	
	"promedio es 20 * celsius, dentro del umbral, por lo que no se aprende la climatización"
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 21:03:37'!
test13LaClimatizacionCentralUsaLaUltimaTemperaturaRegistradaDeCadaHabitacion

	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: 30 * celsius).
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: 10 * celsius).
	
	otraHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: 30 * celsius).
	
	"promedio es 20 * celsius, dentro del umbral, por lo que no se aprende la climatización"
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'LL 4/20/2026 20:24:41'!
test14EnModoAusenteUnCambioDeTemperaturaNoAfectaALaClimatizacionCentral
	| temperaturaFueraDelUmbral |
	temperaturaFueraDelUmbral := unaCasaInteligenteModoEnCasa umbralSuperiorBase + (1 * celsius).

	unaHabitacionInteligenteModoAusente procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaFueraDelUmbral).
	
	self assert: unaCasaInteligenteModoAusente climatizacionApagada! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'JS 4/25/2026 14:24:19'!
test15UnAumentoDeTemperaturaExcesivoEnciendeLaAlarma

	| temperaturaArribaDelUmbralCritico |
	temperaturaArribaDelUmbralCritico := 40 * celsius + (1 * celsius).
	
	unaHabitacionInteligenteModoAusente procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaArribaDelUmbralCritico).
	
	self assert: unaCasaInteligenteModoAusente alarmaEncendida! !

!TestCasaInteligente methodsFor: 'tests - temperatura' stamp: 'JS 4/25/2026 14:24:32'!
test16UnDescensoDeTemperaturaExcesivoEnciendeLaAlarma

	| temperaturaAbajoDelUmbralCritico |
	temperaturaAbajoDelUmbralCritico := 0 * celsius - (1 * celsius).

	unaHabitacionInteligenteModoAusente procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaAbajoDelUmbralCritico).
	
	self assert: unaCasaInteligenteModoAusente alarmaEncendida! !


!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:50'!
test17AhorroDeEnergiaReduceEnUnoLaIluminacion

	unaCasaInteligenteModoEnCasa usarAhorroDeEnergia.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeDeteccionDeMovimiento).
	
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida - 1)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:50'!
test18AhorroDeEnergiaFuerteTambienReduceEnUnoLaIluminacion

	unaCasaInteligenteModoEnCasa usarAhorroDeEnergiaFuerte.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeDeteccionDeMovimiento).
	
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida - 1)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:50'!
test19AhorroDeEnergiaFuerteReduceEnDosLaIluminacion

	unaCasaInteligenteModoEnCasa usarAhorroDeEnergiaExtremo.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeDeteccionDeMovimiento).
	
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida - 2)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:57'!
test20ConfortAumentaEnUnoLaIluminacion

	unaCasaInteligenteModoNoche usarConfort.
	
	unaHabitacionInteligenteModoNoche procesarEvento: (self eventoDeDeteccionDeMovimiento).
	
	self assert: (unaHabitacionInteligenteModoNoche nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzDeNoche + 1)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:50'!
test21LaIluminacionSeMantieneEnRango

	unaCasaInteligenteModoNoche usarAhorroDeEnergia.
	unaHabitacionInteligenteModoNoche procesarEvento: (self eventoDeFinDeDeteccionDeMovimiento).
	self assert: (unaHabitacionInteligenteModoNoche nivelDeIluminacionEs: unaHabitacionInteligenteModoNoche nivelDeluzApagada).

	unaCasaInteligenteModoEnCasa usarConfort.
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeDeteccionDeMovimiento).
	self assert: (unaHabitacionInteligenteModoEnCasa nivelDeIluminacionEs: unaHabitacionInteligenteModoEnCasa nivelDeluzPrendida)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:28:17'!
test22AhorroDeEnergiaFuerteAmpliaElRangoDeTemperaturasParaLaClimatizacionEn5Grados

	| temperaturaEnUmbralSuperior temperaturaEnUmbralInferior |
	temperaturaEnUmbralSuperior := unaCasaInteligenteModoEnCasa umbralSuperiorBase + (5 * celsius).
	temperaturaEnUmbralInferior := unaCasaInteligenteModoEnCasa umbralInferiorBase - (5 * celsius).

	unaCasaInteligenteModoEnCasa usarAhorroDeEnergiaFuerte.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralSuperior).
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralSuperior + (1 * celsius)).
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: unaCasaInteligenteModoEnCasa temperaturaParaRefrigeracion).
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralInferior).
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralInferior - (1 * celsius)).
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: unaCasaInteligenteModoEnCasa temperaturaParaCalefaccion)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:29:43'!
test23AhorroDeEnergiaExtremoAmpliaElRangoDeTemperaturasParaLaClimatizacionEn10Grados

	| temperaturaEnUmbralSuperior temperaturaEnUmbralInferior |
	temperaturaEnUmbralSuperior := unaCasaInteligenteModoEnCasa umbralSuperiorBase + (10 * celsius).
	temperaturaEnUmbralInferior := unaCasaInteligenteModoEnCasa umbralInferiorBase - (10 * celsius).

	unaCasaInteligenteModoEnCasa usarAhorroDeEnergiaExtremo.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralSuperior).
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralSuperior + (1 * celsius)).
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: unaCasaInteligenteModoEnCasa temperaturaParaRefrigeracion).
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralInferior).
	self assert: unaCasaInteligenteModoEnCasa climatizacionApagada.
	
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaEnUmbralInferior - (1 * celsius)).
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: unaCasaInteligenteModoEnCasa temperaturaParaCalefaccion)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:31:14'!
test24UnAumentoDeTemperaturaEnConfortEnciendeLaClimatizacionCentralEn22Grados

	| temperaturaArribaDelUmbral |
	temperaturaArribaDelUmbral := unaCasaInteligenteModoEnCasa umbralSuperiorBase + (1 * celsius).

	unaCasaInteligenteModoEnCasa usarConfort.
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaArribaDelUmbral).
	
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: 22 * celsius)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:31:52'!
test25UnDescensoDeTemperaturaEnConfortEnciendeLaClimatizacionCentralEn30Grados

	| temperaturaDebajoDelUmbral |
	temperaturaDebajoDelUmbral := unaCasaInteligenteModoEnCasa umbralInferiorBase - (1 * celsius).

	unaCasaInteligenteModoEnCasa usarConfort.
	unaHabitacionInteligenteModoEnCasa procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaDebajoDelUmbral).
	
	self assert: (unaCasaInteligenteModoEnCasa climatizacionEncendidaEn: 30 * celsius)! !

!TestCasaInteligente methodsFor: 'tests - configuracion de energia' stamp: 'LL 4/20/2026 20:58:57'!
test26SePuedeVolverAModoNormal

	| temperaturaDebajoDelUmbral |
	temperaturaDebajoDelUmbral := unaCasaInteligenteModoNoche umbralInferiorBase - (1 * celsius).

	unaCasaInteligenteModoNoche usarConfort.
	unaCasaInteligenteModoNoche usarNormal.
	
	unaHabitacionInteligenteModoNoche procesarEvento: (self eventoDeDeteccionDeMovimiento).
	unaHabitacionInteligenteModoNoche procesarEvento: (self eventoDeCambioDeTemperaturaA: temperaturaDebajoDelUmbral).
	
	self assert: (unaHabitacionInteligenteModoNoche nivelDeIluminacionEs: unaHabitacionInteligenteModoNoche nivelDeluzDeNoche).
	self assert: (unaCasaInteligenteModoNoche climatizacionEncendidaEn: unaCasaInteligenteModoNoche temperaturaParaCalefaccion)! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 63 8 17 56 64 57 53 56 61 63 53 60 61 53 56 17 83 72 87 91 86 87 52 61 80 88 79 86 87 75 79 17 83 72 87 91 86 87 52 61 80 88 79 86 87 75 79 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 57 56 65 59 64 53 57 59 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 74 118 107 112 110 118 80 117 112 106 112 104 115 53 122 123 17 60 56 60 60 62 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 57 59 65 60 64 53 62 55 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 74 118 107 112 110 118 80 117 112 106 112 104 115 53 122 123 17 58 55 61 64 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 55 65 59 63 53 60 64 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 56 52 111 104 110 118 52 119 104 122 104 121 52 115 118 122 52 123 108 122 123 122 53 122 123 17 58 55 62 58 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 57 65 56 57 53 64 56 60 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 57 104 52 104 106 118 116 118 107 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 55 62 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 62 65 57 55 53 59 60 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 57 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 57 56 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 59 60 65 57 56 53 59 62 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 58 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 107 108 123 108 106 106 112 118 117 52 107 108 52 108 125 108 117 123 118 53 122 123 17 58 57 63 62 60 17 52 52 52 52 52 52 52 52 52 52 17 17))!