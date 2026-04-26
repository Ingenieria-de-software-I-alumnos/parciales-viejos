!classDefinition: #CasaInteligente category: #'1c2026-1erParcial'!
Object subclass: #CasaInteligente
	instanceVariableNames: 'modo puertaPrincipalBloqueada alarma climatizacionEncendida temperaturaClimatizacion habitaciones configuracionDeEnergia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!CasaInteligente methodsFor: 'initialization' stamp: 'JS 4/25/2026 17:34:45'!
initializeEnModo: modoInicial 

	habitaciones := OrderedCollection new.
	modo := modoInicial.
	configuracionDeEnergia := ConfiguracionDeEnergiaNormal new.
	alarma := false.
	puertaPrincipalBloqueada := false.
	climatizacionEncendida := false.
	temperaturaClimatizacion := self temperaturaParaRefrigeracion.
	
	
	! !


!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:01:55'!
alarmaEncendida

	^alarma! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:01:58'!
climatizacionApagada

	^climatizacionEncendida not! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:02'!
climatizacionEncendidaEn: unaPosibleTemperatura 

	^climatizacionEncendida and: [ temperaturaClimatizacion = unaPosibleTemperatura ]! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/25/2026 16:38:58'!
estaEnModoAusente

	^modo isKindOf: ModoAusente! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:06'!
puertaPrincipalBloqueada

	^puertaPrincipalBloqueada! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:10'!
puertaPrincipalDesbloqueada

	^puertaPrincipalBloqueada not! !


!CasaInteligente methodsFor: 'apagar alarma' stamp: 'JS 4/19/2026 22:01:40'!
apagarAlarma

	alarma := false! !


!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:45:12'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente

	self bloquearPuertaPrincipal! !

!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:44:41'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa

	self desbloquearPuertaPrincipal! !

!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:45:20'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche

	self bloquearPuertaPrincipal! !


!CasaInteligente methodsFor: 'private' stamp: 'JS 4/19/2026 22:01:46'!
bloquearPuertaPrincipal

	puertaPrincipalBloqueada := true! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/19/2026 22:01:48'!
desbloquearPuertaPrincipal

	puertaPrincipalBloqueada := false! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/19/2026 22:01:51'!
encenderAlarma

	alarma := true! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:06:05'!
sincronizarClimatizacionCentral
	
	self temperaturaPromedioDeLasHabitaciones > (configuracionDeEnergia ajustarUmbralSuperiorDeClimatizacion: self umbralSuperiorBase) ifTrue: [
		climatizacionEncendida := true.
		temperaturaClimatizacion := self temperaturaParaRefrigeracion.
		^self
	].
	
	self temperaturaPromedioDeLasHabitaciones < (configuracionDeEnergia ajustarUmbralInferiorDeClimatizacion: self umbralInferiorBase) ifTrue: [
		climatizacionEncendida := true.
		temperaturaClimatizacion := self temperaturaParaCalefaccion.
		^self
	].

	climatizacionEncendida := false! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 15:31:20'!
sincronizarClimatizacionCentralSegunModo

	modo siNoEsModoAusente: [ self sincronizarClimatizacionCentral ]! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:06:05'!
temperaturaPromedioDeLasHabitaciones

	| habitacionesConTemperaturaRegistrada |
	
	habitacionesConTemperaturaRegistrada := habitaciones select: [ :unaHabitacion | unaHabitacion tieneTemperaturaRegistrada ].	
	^habitacionesConTemperaturaRegistrada average: [ :unaHabitacion | unaHabitacion temperaturaRegistrada ].! !


!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:53:50'!
afectarPorCambioDeTemperatura

	self sincronizarClimatizacionCentralSegunModo
	! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:51:41'!
afectarPorDeteccionDeHumo

	self desbloquearPuertaPrincipal

	! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:42:20'!
afectarPorDeteccionDeMovimientoEnHabitacion: habitacionDondeOcurreElEvento

	modo afectarPorDeteccionDeMovimiento: habitacionDondeOcurreElEvento.
	self desbloquearPuertaPrincipal

	! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:39:13'!
afectarPorFinDeDeteccionDeMovimientoEnHabitacion: habitacionDondeOcurreElEvento

	modo afectarPorFinDeDeteccionDeMovimiento: habitacionDondeOcurreElEvento
	! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/19/2026 19:06:04'!
agregarHabitacion: unaNuevaHabitacionDeLaCasa

	habitaciones add: unaNuevaHabitacionDeLaCasa! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 15:45:24'!
ajustarIluminacionSegunConfiguracion: unNivelDeIluminacionAAjustar

	^configuracionDeEnergia ajustarIluminacion: unNivelDeIluminacionAAjustar! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:49:14'!
procesarEvento: eventoAProcesar enHabitacion: habitacionDondeOcurreElEvento

	(eventoAProcesar esCriticoPara: self) ifTrue: [self encenderAlarma].

	eventoAProcesar serProcesadoPara: habitacionDondeOcurreElEvento! !


!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/25/2026 17:35:18'!
usarAhorroDeEnergia

	configuracionDeEnergia := ConfiguracionDeEnergiaAhorro ahorro! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/25/2026 17:35:15'!
usarAhorroDeEnergiaExtremo

	configuracionDeEnergia := ConfiguracionDeEnergiaAhorro ahorroExtremo! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/25/2026 17:35:11'!
usarAhorroDeEnergiaFuerte

	configuracionDeEnergia := ConfiguracionDeEnergiaAhorro ahorroFuerte! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/25/2026 17:37:09'!
usarConfort

	configuracionDeEnergia := ConfiguracionDeEnergiaConfort new! !

!CasaInteligente methodsFor: 'configuracion de energia' stamp: 'JS 4/25/2026 17:37:06'!
usarNormal

	configuracionDeEnergia := ConfiguracionDeEnergiaNormal new! !


!CasaInteligente methodsFor: 'temperaturas' stamp: 'JS 4/25/2026 16:00:40'!
temperaturaParaCalefaccion

	^configuracionDeEnergia ajustarTemperaturaDeClimatizacionSuperior: 28 * celsius! !

!CasaInteligente methodsFor: 'temperaturas' stamp: 'JS 4/25/2026 16:00:49'!
temperaturaParaRefrigeracion

	^configuracionDeEnergia ajustarTemperaturaDeClimatizacionInferior: 24 * celsius.! !

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

!CasaInteligente class methodsFor: 'private' stamp: 'JS 4/25/2026 15:24:34'!
enModo: unaClaseDeModo
	| modoInicial nuevaCasaInteligente |
	nuevaCasaInteligente := self new.
	modoInicial := unaClaseDeModo para: nuevaCasaInteligente.
	^nuevaCasaInteligente initializeEnModo: modoInicial! !


!CasaInteligente class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 15:24:44'!
enModoAusente
	^self enModo: ModoAusente! !

!CasaInteligente class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 15:24:48'!
enModoEnCasa
	^self enModo: ModoEnCasa! !

!CasaInteligente class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 15:24:53'!
enModoNoche
	^self enModo: ModoNoche! !


!classDefinition: #ConfiguracionDeEnergiaDeCasaInteligente category: #'1c2026-1erParcial'!
Object subclass: #ConfiguracionDeEnergiaDeCasaInteligente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:21:06'!
ajustarIluminacion: nivelDeIluminacionAAjustar

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:15'!
ajustarTemperaturaDeClimatizacionInferior: unaTemperatura

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:17'!
ajustarTemperaturaDeClimatizacionSuperior: unaTemperatura

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:20'!
ajustarUmbralInferiorDeClimatizacion: umbralDeClimatizacion

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:24'!
ajustarUmbralSuperiorDeClimatizacion: umbralDeClimatizacion

	self subclassResponsibility! !


!classDefinition: #ConfiguracionDeEnergiaAhorro category: #'1c2026-1erParcial'!
ConfiguracionDeEnergiaDeCasaInteligente subclass: #ConfiguracionDeEnergiaAhorro
	instanceVariableNames: 'disminucionAlNivelDeIluminacion expansionAlUmbralDeClimatizacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ConfiguracionDeEnergiaAhorro methodsFor: 'initialization' stamp: 'JS 4/25/2026 17:32:41'!
initializeConDisminucionALaIluminacion: disminucionDelNivelDeIluminacion expansionAlUmbralDeClimatizacion: expansionDelUmbralDeClimatizacion

	disminucionAlNivelDeIluminacion := disminucionDelNivelDeIluminacion.
	expansionAlUmbralDeClimatizacion := expansionDelUmbralDeClimatizacion! !


!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:28:39'!
ajustarIluminacion: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar - disminucionAlNivelDeIluminacion! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:52'!
ajustarTemperaturaDeClimatizacionInferior: unaTemperatura

	^unaTemperatura! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:25:10'!
ajustarTemperaturaDeClimatizacionSuperior: unaTemperatura

	^unaTemperatura! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:29:53'!
ajustarUmbralInferiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion - expansionAlUmbralDeClimatizacion! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:29:53'!
ajustarUmbralSuperiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion + expansionAlUmbralDeClimatizacion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ConfiguracionDeEnergiaAhorro class' category: #'1c2026-1erParcial'!
ConfiguracionDeEnergiaAhorro class
	instanceVariableNames: ''!

!ConfiguracionDeEnergiaAhorro class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 17:37:38'!
ahorro
	^ConfiguracionDeEnergiaAhorro new initializeConDisminucionALaIluminacion: 1 expansionAlUmbralDeClimatizacion: 0 * celsius! !

!ConfiguracionDeEnergiaAhorro class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 17:37:35'!
ahorroExtremo
	^ConfiguracionDeEnergiaAhorro new initializeConDisminucionALaIluminacion: 2 expansionAlUmbralDeClimatizacion: 10 * celsius! !

!ConfiguracionDeEnergiaAhorro class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 17:37:32'!
ahorroFuerte
	^ConfiguracionDeEnergiaAhorro new initializeConDisminucionALaIluminacion: 1 expansionAlUmbralDeClimatizacion: 5 * celsius! !


!classDefinition: #ConfiguracionDeEnergiaConfort category: #'1c2026-1erParcial'!
ConfiguracionDeEnergiaDeCasaInteligente subclass: #ConfiguracionDeEnergiaConfort
	instanceVariableNames: 'aumentoAlNivelDeIluminacion expansionALaTemperaturaDeClimatizacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:28:02'!
ajustarIluminacion: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar + aumentoAlNivelDeIluminacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:31:07'!
ajustarTemperaturaDeClimatizacionInferior: unaTemperatura

	^unaTemperatura - expansionALaTemperaturaDeClimatizacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:31:02'!
ajustarTemperaturaDeClimatizacionSuperior: unaTemperatura

	^unaTemperatura + expansionALaTemperaturaDeClimatizacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:23:11'!
ajustarUmbralInferiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:23:32'!
ajustarUmbralSuperiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion! !


!ConfiguracionDeEnergiaConfort methodsFor: 'initialization' stamp: 'JS 4/25/2026 17:37:58'!
initialize

	aumentoAlNivelDeIluminacion := 1.
	expansionALaTemperaturaDeClimatizacion := 2 * celsius.! !


!classDefinition: #ConfiguracionDeEnergiaNormal category: #'1c2026-1erParcial'!
ConfiguracionDeEnergiaDeCasaInteligente subclass: #ConfiguracionDeEnergiaNormal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:23:56'!
ajustarIluminacion: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:24:48'!
ajustarTemperaturaDeClimatizacionInferior: unaTemperatura

	^unaTemperatura! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:25:03'!
ajustarTemperaturaDeClimatizacionSuperior: unaTemperatura

	^unaTemperatura! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:23:15'!
ajustarUmbralInferiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'JS 4/25/2026 17:23:40'!
ajustarUmbralSuperiorDeClimatizacion: umbralDeClimatizacion

	^umbralDeClimatizacion! !


!classDefinition: #Evento category: #'1c2026-1erParcial'!
Object subclass: #Evento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!Evento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 14:34:15'!
esCriticoPara: unaCasa

	self subclassResponsibility! !


!Evento methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	self subclassResponsibility! !


!classDefinition: #EventoDeCambioDeTemperatura category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeCambioDeTemperatura
	instanceVariableNames: 'temperaturaDetectada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeCambioDeTemperatura methodsFor: 'criticidad' stamp: 'JS 4/25/2026 16:12:05'!
esCriticoPara: unaCasa

	^temperaturaDetectada > (self umbralSupCritico) or: [ temperaturaDetectada < (self umbralInfCritico) ]
	! !


!EventoDeCambioDeTemperatura methodsFor: 'initialization' stamp: 'JS 4/25/2026 16:12:05'!
initializeConTemperatura: nuevaTemperaturaDetectada

	temperaturaDetectada := nuevaTemperaturaDetectada! !


!EventoDeCambioDeTemperatura methodsFor: 'accessing' stamp: 'JS 4/25/2026 16:12:05'!
temperaturaDetectada

	^temperaturaDetectada! !


!EventoDeCambioDeTemperatura methodsFor: 'umbrales' stamp: 'JS 4/25/2026 14:59:14'!
umbralInfCritico

	^ 0 * celsius! !

!EventoDeCambioDeTemperatura methodsFor: 'umbrales' stamp: 'JS 4/25/2026 14:59:23'!
umbralSupCritico

	^ 40 * celsius! !


!EventoDeCambioDeTemperatura methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeCambioDeTemperatura: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoDeCambioDeTemperatura class' category: #'1c2026-1erParcial'!
EventoDeCambioDeTemperatura class
	instanceVariableNames: ''!

!EventoDeCambioDeTemperatura class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 16:10:42'!
conTemperatura: nuevaTemperaturaDetectada
	^self new initializeConTemperatura: nuevaTemperaturaDetectada! !


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


!EventoDeDeteccionDeHumo methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeDeteccionDeHumo.! !


!classDefinition: #EventoDeDeteccionDeMovimiento category: #'1c2026-1erParcial'!
Evento subclass: #EventoDeDeteccionDeMovimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeDeteccionDeMovimiento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 16:38:32'!
esCriticoPara: unaCasa

	^unaCasa estaEnModoAusente
	! !


!EventoDeDeteccionDeMovimiento methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeDeteccionDeMovimiento.! !


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


!EventoDeFinDeDeteccionDeMovimiento methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeFinDeDeteccionDeMovimiento.! !


!classDefinition: #HabitacionInteligente category: #'1c2026-1erParcial'!
Object subclass: #HabitacionInteligente
	instanceVariableNames: 'casaInteligente nivelDeIluminacion persiana temperaturaRegistrada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!HabitacionInteligente methodsFor: 'initialization' stamp: 'JS 4/25/2026 16:18:10'!
initializePara: unaCasaInteligente 

	casaInteligente := unaCasaInteligente.
	casaInteligente agregarHabitacion: self.
	persiana := #Cerrada.
	nivelDeIluminacion := self nivelDeluzApagada.
	temperaturaRegistrada := nil. "Ojo: estamos modelado la falta de registro con nil"
	! !


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


!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:14:14'!
afectarPorEventoDeDeteccionDeMovimientoEnModoAusente

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
	persiana := #MedioAbierta! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:14:31'!
afectarPorEventoDeDeteccionDeMovimientoEnModoEnCasa

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzPrendida.
	persiana := #Cerrada! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:14:42'!
afectarPorEventoDeDeteccionDeMovimientoEnModoNoche

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzDeNoche.
	persiana := #Abierta! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:14:52'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
	persiana := #MedioAbierta! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:15:01'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzAtenuada.
	persiana := #MedioAbierta! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:15:09'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche

	nivelDeIluminacion := self ajustarIluminacion: self nivelDeluzApagada.
	persiana := #Cerrada! !


!HabitacionInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 15:44:50'!
ajustarIluminacion: nivelDeIluminacionAAjustar
	
	^(casaInteligente ajustarIluminacionSegunConfiguracion: nivelDeIluminacionAAjustar) min: self nivelDeluzPrendida max: self nivelDeluzApagada! !

!HabitacionInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:53:13'!
procesarEventoDeCambioDeTemperatura: eventoAProcesar

	temperaturaRegistrada := eventoAProcesar temperaturaDetectada.
	casaInteligente afectarPorCambioDeTemperatura.! !

!HabitacionInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:51:19'!
procesarEventoDeDeteccionDeHumo

	^casaInteligente afectarPorDeteccionDeHumo! !

!HabitacionInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:36:32'!
procesarEventoDeDeteccionDeMovimiento

	casaInteligente afectarPorDeteccionDeMovimientoEnHabitacion: self! !

!HabitacionInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:36:23'!
procesarEventoDeFinDeDeteccionDeMovimiento

	casaInteligente afectarPorFinDeDeteccionDeMovimientoEnHabitacion: self! !


!HabitacionInteligente methodsFor: 'procesamiento de eventos' stamp: 'JS 4/25/2026 16:49:41'!
procesarEvento: eventoAProcesar

	casaInteligente procesarEvento: eventoAProcesar enHabitacion: self! !


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


!classDefinition: #ModoDeCasaInteligente category: #'1c2026-1erParcial'!
Object subclass: #ModoDeCasaInteligente
	instanceVariableNames: 'casaInteligente'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ModoDeCasaInteligente methodsFor: 'evaluating' stamp: 'JS 4/25/2026 15:30:30'!
siNoEsModoAusente: unBloqueAEvaluar

	unBloqueAEvaluar value! !


!ModoDeCasaInteligente methodsFor: 'initialization' stamp: 'JS 4/25/2026 15:25:50'!
initializePara: unaCasaInteligente

	casaInteligente := unaCasaInteligente! !


!ModoDeCasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:16:20'!
afectarPorDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	self subclassResponsibility! !

!ModoDeCasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:22:27'!
afectarPorFinDeDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ModoDeCasaInteligente class' category: #'1c2026-1erParcial'!
ModoDeCasaInteligente class
	instanceVariableNames: ''!

!ModoDeCasaInteligente class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 15:25:34'!
para: unaCasaInteligente
	^self new initializePara: unaCasaInteligente! !


!classDefinition: #ModoAusente category: #'1c2026-1erParcial'!
ModoDeCasaInteligente subclass: #ModoAusente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ModoAusente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:41:50'!
afectarPorDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeDeteccionDeMovimientoEnModoAusente.! !

!ModoAusente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:43:48'!
afectarPorFinDeDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente.
	casaInteligente afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente! !


!ModoAusente methodsFor: 'evaluating' stamp: 'JS 4/25/2026 15:30:39'!
siNoEsModoAusente: unBloqueAEvaluar! !


!classDefinition: #ModoEnCasa category: #'1c2026-1erParcial'!
ModoDeCasaInteligente subclass: #ModoEnCasa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ModoEnCasa methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:41:55'!
afectarPorDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeDeteccionDeMovimientoEnModoEnCasa.! !

!ModoEnCasa methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:43:36'!
afectarPorFinDeDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa.
	casaInteligente afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa! !


!classDefinition: #ModoNoche category: #'1c2026-1erParcial'!
ModoDeCasaInteligente subclass: #ModoNoche
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!ModoNoche methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:41:59'!
afectarPorDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeDeteccionDeMovimientoEnModoNoche.! !

!ModoNoche methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:43:43'!
afectarPorFinDeDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	habitacionAfectadaPorElEvento afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche.
	casaInteligente afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche! !


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


!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 15:25:05'!
casaInteligenteModoAusente

	^CasaInteligente enModoAusente! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 15:25:11'!
casaInteligenteModoEnCasa

	^CasaInteligente enModoEnCasa! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 15:25:20'!
casaInteligenteModoNoche

	^CasaInteligente enModoNoche! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 16:11:30'!
eventoDeCambioDeTemperaturaA: nuevaTemperatura

	^EventoDeCambioDeTemperatura conTemperatura: nuevaTemperatura! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:54:27'!
eventoDeDeteccionDeHumo

	^EventoDeDeteccionDeHumo new! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:54:33'!
eventoDeDeteccionDeMovimiento

	^EventoDeDeteccionDeMovimiento new! !

!TestCasaInteligente methodsFor: 'creacion de instancias - pueden modificar' stamp: 'JS 4/25/2026 14:54:39'!
eventoDeFinDeDeteccionDeMovimiento

	^EventoDeFinDeDeteccionDeMovimiento new! !

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
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 99 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 94 112 117 58 57 17 61 53 57 17 95 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 94 112 117 107 118 126 122 17 94 112 117 58 57 39 105 124 112 115 123 39 118 117 39 84 104 121 39 39 56 39 57 55 57 60 39 55 56 65 55 59 65 57 57 39 78 84 91 39 74 118 116 119 112 115 108 121 65 39 59 53 57 53 56 39 74 118 116 119 104 123 112 105 115 108 39 74 115 104 117 110 39 63 53 55 53 56 39 47 123 104 110 122 54 89 76 83 76 72 90 76 102 63 55 56 54 109 112 117 104 115 48 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 84 104 121 39 39 56 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 63 8 17 56 64 57 53 56 61 63 53 60 61 53 56 17 83 72 87 91 86 87 52 61 80 88 79 86 87 75 79 17 83 72 87 91 86 87 52 61 80 88 79 86 87 75 79 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 57 56 65 59 64 53 57 59 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 74 118 107 112 110 118 80 117 112 106 112 104 115 53 122 123 17 60 56 60 60 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 56 58 65 57 61 53 61 59 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 59 57 62 58 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 62 65 57 57 53 55 62 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 61 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 115 52 121 104 117 110 118 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 60 60 62 55 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 63 65 55 62 53 60 55 56 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 62 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 115 104 52 123 108 116 119 108 121 104 123 124 121 104 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 60 62 56 63 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 63 65 59 55 53 64 63 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 63 52 121 108 109 104 106 123 118 121 52 123 108 116 119 108 121 104 123 124 121 104 52 119 121 118 116 108 107 112 118 53 122 123 17 60 62 61 55 55 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 57 59 65 60 64 53 62 55 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 74 118 107 112 110 118 80 117 112 106 112 104 115 53 122 123 17 58 55 61 64 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 55 65 59 63 53 60 64 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 56 52 111 104 110 118 52 119 104 122 104 121 52 115 118 122 52 123 108 122 123 122 53 122 123 17 58 55 62 58 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 57 65 56 57 53 64 56 60 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 57 104 52 104 106 118 116 118 107 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 55 62 63 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 58 62 65 57 55 53 59 60 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 57 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 57 56 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 59 60 65 57 56 53 59 62 55 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 58 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 107 108 123 108 106 106 112 118 117 52 107 108 52 108 125 108 117 123 118 53 122 123 17 58 57 63 62 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 60 55 65 60 63 53 57 61 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 58 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 107 108 123 108 106 106 112 118 117 52 107 108 52 108 125 108 117 123 118 53 122 123 17 58 58 59 58 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 59 65 60 64 65 59 62 53 58 61 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 58 106 52 108 115 112 116 112 117 118 52 123 112 119 118 52 128 52 125 104 115 118 121 52 107 108 52 108 125 108 117 123 118 53 122 123 17 58 57 64 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 55 62 65 56 59 53 60 63 57 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 58 59 55 55 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 55 64 65 60 64 53 62 59 61 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 58 59 55 55 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 56 60 65 57 63 53 55 56 59 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 58 59 55 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 57 57 65 55 59 53 60 63 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 58 60 62 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 57 58 65 58 55 53 64 58 57 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 106 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 109 112 117 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 58 61 57 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 57 61 65 58 55 53 57 59 56 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 107 52 106 121 108 118 52 108 115 52 116 118 107 118 52 106 118 116 119 115 108 123 118 53 122 123 17 58 62 56 55 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 58 56 65 59 59 53 56 58 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 59 108 52 120 124 112 123 118 52 112 109 52 123 108 116 119 108 121 104 123 124 121 104 52 116 118 107 118 52 104 124 122 108 117 123 108 53 122 123 17 58 62 60 58 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 58 60 65 57 63 53 59 57 62 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 60 104 52 121 108 109 104 106 123 118 121 52 104 113 124 122 123 104 121 52 112 115 124 116 112 117 104 106 112 118 117 53 122 123 17 58 62 61 61 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 59 62 65 55 61 53 57 58 60 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 61 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 115 52 121 104 117 110 118 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 59 55 57 61 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 60 65 60 61 65 58 62 53 61 57 63 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 61 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 115 52 121 104 117 110 118 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 59 56 60 56 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 56 65 58 64 53 62 56 63 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 62 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 115 104 52 123 108 116 119 108 121 104 123 124 121 104 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 59 57 58 58 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 61 65 59 62 53 62 58 57 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 63 52 121 108 109 104 106 123 118 121 52 123 108 116 119 108 121 104 123 124 121 104 52 119 121 118 116 108 107 112 118 53 122 123 17 59 57 56 61 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 62 65 59 61 53 62 59 63 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 61 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 115 52 121 104 117 110 118 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 56 53 122 123 17 59 55 60 59 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 63 65 57 63 53 58 57 64 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 62 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 115 104 52 123 108 116 119 108 121 104 123 124 121 104 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 56 53 122 123 17 59 56 58 61 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 55 63 65 60 63 53 56 64 60 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 63 52 121 108 109 104 106 123 118 121 52 123 108 116 119 108 121 104 123 124 121 104 52 119 121 118 116 108 107 112 118 56 53 122 123 17 59 56 56 64 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 56 58 65 57 56 53 57 59 58 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 64 52 118 105 113 108 123 118 52 106 118 116 119 115 108 123 118 52 106 104 116 105 112 118 52 107 108 52 123 108 116 119 108 121 104 123 124 121 104 53 122 123 17 59 56 62 61 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 57 55 65 59 56 53 55 56 61 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 55 64 105 52 118 105 113 108 123 118 122 52 106 118 116 119 115 108 123 118 122 52 106 104 122 104 52 128 52 111 104 105 112 123 104 106 112 118 117 53 122 123 17 59 57 55 57 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 59 56 65 55 61 53 59 64 59 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 56 55 104 52 108 117 106 104 119 122 124 115 104 116 112 108 117 123 118 52 107 108 52 116 118 107 118 53 122 123 17 59 57 59 57 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 61 65 60 64 65 58 59 53 63 61 57 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 56 55 105 52 121 108 122 119 118 117 122 104 105 112 115 112 107 104 107 108 122 52 106 104 122 104 52 116 118 107 118 52 111 104 105 112 123 104 106 112 118 117 53 122 123 17 59 58 59 56 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 62 65 58 63 65 60 58 53 61 58 57 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 56 56 52 106 118 116 119 118 122 112 106 112 118 117 52 107 108 52 106 118 117 109 112 110 124 121 104 106 112 118 117 108 122 53 122 123 17 59 60 55 61 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 56 62 65 59 57 65 57 60 53 59 57 56 61 62 56 52 55 58 65 55 55 17 74 65 99 92 122 108 121 122 99 113 118 104 120 124 99 75 118 126 117 115 118 104 107 122 99 126 112 117 107 118 126 122 61 59 39 47 57 48 99 126 112 117 107 118 126 122 61 59 52 92 122 108 121 77 112 115 108 122 99 77 112 115 108 86 124 123 122 99 87 104 122 118 72 87 104 122 118 99 119 104 122 118 56 57 104 52 106 104 123 108 110 118 121 112 129 118 53 122 123 17 59 59 64 61 62 17 52 52 52 52 52 52 52 52 52 52 17 17))!