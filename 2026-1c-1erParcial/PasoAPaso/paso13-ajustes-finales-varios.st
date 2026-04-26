!classDefinition: #CasaInteligente category: #'1c2026-1erParcial'!
Object subclass: #CasaInteligente
	instanceVariableNames: 'modo puertaPrincipalBloqueada alarmaEncendida habitaciones configuracionDeEnergia sistemaDeClimatizacionCentral'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!CasaInteligente methodsFor: 'initialization' stamp: 'JS 4/25/2026 18:03:27'!
initializeEnModo: modoInicial 

	habitaciones := OrderedCollection new.
	modo := modoInicial.
	configuracionDeEnergia := ConfiguracionDeEnergiaNormal new.
	sistemaDeClimatizacionCentral := SistemaDeClimatizacionCentral para: self.
	alarmaEncendida := false.
	puertaPrincipalBloqueada := false.
	
	
	! !


!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/25/2026 17:48:53'!
alarmaEncendida

	^alarmaEncendida! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/25/2026 18:05:24'!
climatizacionApagada

	^sistemaDeClimatizacionCentral climatizacionApagada! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/25/2026 18:05:58'!
climatizacionEncendidaEn: unaPosibleTemperatura 

	^sistemaDeClimatizacionCentral climatizacionEncendidaEn: unaPosibleTemperatura! !

!CasaInteligente methodsFor: 'testing' stamp: 'LL 4/26/2026 16:39:19'!
esCriticaLaDeteccionDeMovimiento

	^modo esCriticaLaDeteccionDeMovimiento! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:06'!
puertaPrincipalBloqueada

	^puertaPrincipalBloqueada! !

!CasaInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:02:10'!
puertaPrincipalDesbloqueada

	^puertaPrincipalBloqueada not! !


!CasaInteligente methodsFor: 'apagar alarma' stamp: 'JS 4/25/2026 17:48:53'!
apagarAlarma

	alarmaEncendida := false! !


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


!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/26/2026 17:01:35'!
seDebeCalefaccionarLaCasa

	^self temperaturaPromedioDeLasHabitaciones < (configuracionDeEnergia umbralInferiorDeClimatizacionPara: self umbralInferiorBase)! !

!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/26/2026 17:01:44'!
seDebeRefrigerarLaCasa

	^self temperaturaPromedioDeLasHabitaciones > (configuracionDeEnergia umbralSuperiorDeClimatizacionPara: self umbralSuperiorBase)! !

!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/26/2026 17:01:15'!
temperaturaParaCalefaccion

	^configuracionDeEnergia temperaturaDeClimatizacionSuperiorPara: 28 * celsius! !

!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/26/2026 17:01:00'!
temperaturaParaRefrigeracion

	^configuracionDeEnergia temperaturaDeClimatizacionInferiorPara: 24 * celsius.! !

!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/20/2026 20:20:40'!
umbralInferiorBase
	
	^15 * celsius.! !

!CasaInteligente methodsFor: 'climatizacion' stamp: 'LL 4/20/2026 20:20:35'!
umbralSuperiorBase
	
	^25 * celsius.! !


!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:45:12'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente

	self bloquearPuertaPrincipal! !

!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:44:41'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa

	self desbloquearPuertaPrincipal! !

!CasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 16:45:20'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche

	self bloquearPuertaPrincipal! !


!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'LL 4/26/2026 17:10:01'!
afectarPorCambioDeTemperatura

	self sincronizarClimatizacionCentral
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

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'LL 4/26/2026 17:00:08'!
iluminacionSegunConfiguracionPara: unNivelDeIluminacionAAjustar

	^configuracionDeEnergia iluminacionPara: unNivelDeIluminacionAAjustar! !

!CasaInteligente methodsFor: 'habitaciones - private' stamp: 'JS 4/25/2026 16:49:14'!
procesarEvento: eventoAProcesar enHabitacion: habitacionDondeOcurreElEvento

	(eventoAProcesar esCriticoPara: self) ifTrue: [self encenderAlarma].

	eventoAProcesar serProcesadoPara: habitacionDondeOcurreElEvento! !


!CasaInteligente methodsFor: 'private' stamp: 'JS 4/19/2026 22:01:46'!
bloquearPuertaPrincipal

	puertaPrincipalBloqueada := true! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/19/2026 22:01:48'!
desbloquearPuertaPrincipal

	puertaPrincipalBloqueada := false! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 17:48:53'!
encenderAlarma

	alarmaEncendida := true! !

!CasaInteligente methodsFor: 'private' stamp: 'LL 4/26/2026 17:10:01'!
sincronizarClimatizacionCentral

	modo sincronizarClimatizacionCentral: sistemaDeClimatizacionCentral! !

!CasaInteligente methodsFor: 'private' stamp: 'JS 4/25/2026 16:06:05'!
temperaturaPromedioDeLasHabitaciones

	| habitacionesConTemperaturaRegistrada |
	
	habitacionesConTemperaturaRegistrada := habitaciones select: [ :unaHabitacion | unaHabitacion tieneTemperaturaRegistrada ].	
	^habitacionesConTemperaturaRegistrada average: [ :unaHabitacion | unaHabitacion temperaturaRegistrada ].! !

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

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:00:08'!
iluminacionPara: nivelDeIluminacionAAjustar

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:00'!
temperaturaDeClimatizacionInferiorPara: unaTemperaturaAAjustar

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:15'!
temperaturaDeClimatizacionSuperiorPara: unaTemperaturaAAjustar

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:35'!
umbralInferiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	self subclassResponsibility! !

!ConfiguracionDeEnergiaDeCasaInteligente methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:44'!
umbralSuperiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

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


!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:00:08'!
iluminacionPara: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar - disminucionAlNivelDeIluminacion! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:00'!
temperaturaDeClimatizacionInferiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:15'!
temperaturaDeClimatizacionSuperiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:35'!
umbralInferiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar - expansionAlUmbralDeClimatizacion! !

!ConfiguracionDeEnergiaAhorro methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:44'!
umbralSuperiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar + expansionAlUmbralDeClimatizacion! !

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

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:00:08'!
iluminacionPara: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar + aumentoAlNivelDeIluminacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:00'!
temperaturaDeClimatizacionInferiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar - expansionALaTemperaturaDeClimatizacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:15'!
temperaturaDeClimatizacionSuperiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar + expansionALaTemperaturaDeClimatizacion! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:35'!
umbralInferiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar! !

!ConfiguracionDeEnergiaConfort methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:44'!
umbralSuperiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar! !


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

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:00:08'!
iluminacionPara: nivelDeIluminacionAAjustar

	^nivelDeIluminacionAAjustar! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:00'!
temperaturaDeClimatizacionInferiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:15'!
temperaturaDeClimatizacionSuperiorPara: unaTemperaturaAAjustar

	^unaTemperaturaAAjustar! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:35'!
umbralInferiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar! !

!ConfiguracionDeEnergiaNormal methodsFor: 'ajustes' stamp: 'LL 4/26/2026 17:01:44'!
umbralSuperiorDeClimatizacionPara: umbralDeClimatizacionAAjustar

	^umbralDeClimatizacionAAjustar! !


!classDefinition: #EventoDeHabitacionInteligente category: #'1c2026-1erParcial'!
Object subclass: #EventoDeHabitacionInteligente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeHabitacionInteligente methodsFor: 'criticidad' stamp: 'JS 4/25/2026 17:45:42'!
esCriticoPara: casaDondeOcurreElEvento

	self subclassResponsibility! !


!EventoDeHabitacionInteligente methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	self subclassResponsibility! !


!classDefinition: #EventoDeCambioDeTemperatura category: #'1c2026-1erParcial'!
EventoDeHabitacionInteligente subclass: #EventoDeCambioDeTemperatura
	instanceVariableNames: 'temperaturaDetectada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeCambioDeTemperatura methodsFor: 'initialization' stamp: 'JS 4/25/2026 16:12:05'!
initializeConTemperatura: nuevaTemperaturaDetectada

	temperaturaDetectada := nuevaTemperaturaDetectada! !


!EventoDeCambioDeTemperatura methodsFor: 'criticidad' stamp: 'LL 4/26/2026 16:37:09'!
esCriticoPara: casaDondeOcurreElEvento

	^temperaturaDetectada > (self umbralSuperiorCritico) or: [ temperaturaDetectada < (self umbralInferiorCritico) ]
	! !


!EventoDeCambioDeTemperatura methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeCambioDeTemperatura: self.! !


!EventoDeCambioDeTemperatura methodsFor: 'accessing' stamp: 'JS 4/25/2026 16:12:05'!
temperaturaDetectada

	^temperaturaDetectada! !


!EventoDeCambioDeTemperatura methodsFor: 'private' stamp: 'LL 4/26/2026 16:37:02'!
umbralInferiorCritico

	^ 0 * celsius! !

!EventoDeCambioDeTemperatura methodsFor: 'private' stamp: 'LL 4/26/2026 16:37:09'!
umbralSuperiorCritico

	^ 40 * celsius! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoDeCambioDeTemperatura class' category: #'1c2026-1erParcial'!
EventoDeCambioDeTemperatura class
	instanceVariableNames: ''!

!EventoDeCambioDeTemperatura class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 16:10:42'!
conTemperatura: nuevaTemperaturaDetectada
	^self new initializeConTemperatura: nuevaTemperaturaDetectada! !


!classDefinition: #EventoDeDeteccionDeHumo category: #'1c2026-1erParcial'!
EventoDeHabitacionInteligente subclass: #EventoDeDeteccionDeHumo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeDeteccionDeHumo methodsFor: 'criticidad' stamp: 'JS 4/25/2026 17:45:53'!
esCriticoPara: casaDondeOcurreElEvento

	^true 
	! !


!EventoDeDeteccionDeHumo methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeDeteccionDeHumo.! !


!classDefinition: #EventoDeDeteccionDeMovimiento category: #'1c2026-1erParcial'!
EventoDeHabitacionInteligente subclass: #EventoDeDeteccionDeMovimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeDeteccionDeMovimiento methodsFor: 'criticidad' stamp: 'LL 4/26/2026 16:40:32'!
esCriticoPara: casaDondeOcurreElEvento

	^casaDondeOcurreElEvento esCriticaLaDeteccionDeMovimiento
	! !


!EventoDeDeteccionDeMovimiento methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeDeteccionDeMovimiento.! !


!classDefinition: #EventoDeFinDeDeteccionDeMovimiento category: #'1c2026-1erParcial'!
EventoDeHabitacionInteligente subclass: #EventoDeFinDeDeteccionDeMovimiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!EventoDeFinDeDeteccionDeMovimiento methodsFor: 'criticidad' stamp: 'JS 4/25/2026 17:46:02'!
esCriticoPara: casaDondeOcurreElEvento

	^false
	! !


!EventoDeFinDeDeteccionDeMovimiento methodsFor: 'procesamiento' stamp: 'JS 4/25/2026 14:50:05'!
serProcesadoPara: habitacionDondeOcurreElEvento

	habitacionDondeOcurreElEvento procesarEventoDeFinDeDeteccionDeMovimiento.! !


!classDefinition: #HabitacionInteligente category: #'1c2026-1erParcial'!
Object subclass: #HabitacionInteligente
	instanceVariableNames: 'casaInteligente nivelDeIluminacion gradoDeAperturaDeLaPersiana temperaturaRegistrada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!HabitacionInteligente methodsFor: 'initialization' stamp: 'LL 4/26/2026 17:24:18'!
initializePara: unaCasaInteligente 

	casaInteligente := unaCasaInteligente.
	casaInteligente agregarHabitacion: self.
	self cerrarPersiana.
	nivelDeIluminacion := self nivelDeluzApagada.
	temperaturaRegistrada := nil. "Ojo: estamos modelado la falta de registro con nil"
	! !


!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:24'!
nivelDeIluminacionEs: unPosibleNivelDeIluminacion

	^unPosibleNivelDeIluminacion = nivelDeIluminacion! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'LL 4/26/2026 16:43:48'!
persianaAbierta

	^gradoDeAperturaDeLaPersiana = #Abierta! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'LL 4/26/2026 16:43:48'!
persianaCerrada

	^gradoDeAperturaDeLaPersiana = #Cerrada! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'LL 4/26/2026 16:43:48'!
persianaMedioAbierta

	^gradoDeAperturaDeLaPersiana = #MedioAbierta! !

!HabitacionInteligente methodsFor: 'testing' stamp: 'JS 4/19/2026 22:04:54'!
tieneTemperaturaRegistrada

	^temperaturaRegistrada notNil! !


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


!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:48'!
afectarPorEventoDeDeteccionDeMovimientoEnModoAusente

	self ajustarIluminacion: self nivelDeluzApagada.
	self abrirPersianaHastaLaMitad! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:18'!
afectarPorEventoDeDeteccionDeMovimientoEnModoEnCasa

	self ajustarIluminacion: self nivelDeluzPrendida.
	self cerrarPersiana! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:28'!
afectarPorEventoDeDeteccionDeMovimientoEnModoNoche

	self ajustarIluminacion: self nivelDeluzDeNoche.
	self abrirPersiana! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:48'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoAusente

	self ajustarIluminacion: self nivelDeluzApagada.
	self abrirPersianaHastaLaMitad! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:48'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoEnCasa

	self ajustarIluminacion: self nivelDeluzAtenuada.
	self abrirPersianaHastaLaMitad! !

!HabitacionInteligente methodsFor: 'dd - private' stamp: 'LL 4/26/2026 17:24:18'!
afectarPorEventoDeFinDeDeteccionDeMovimientoEnModoNoche

	self ajustarIluminacion: self nivelDeluzApagada.
	self cerrarPersiana! !


!HabitacionInteligente methodsFor: 'private' stamp: 'LL 4/26/2026 17:24:28'!
abrirPersiana

	^ gradoDeAperturaDeLaPersiana := #Abierta! !

!HabitacionInteligente methodsFor: 'private' stamp: 'LL 4/26/2026 17:24:48'!
abrirPersianaHastaLaMitad

	^ gradoDeAperturaDeLaPersiana := #MedioAbierta! !

!HabitacionInteligente methodsFor: 'private' stamp: 'LL 4/26/2026 16:59:20'!
ajustarIluminacion: nivelDeIluminacionAAjustar
	
	^nivelDeIluminacion := (casaInteligente iluminacionSegunConfiguracionPara: nivelDeIluminacionAAjustar) min: self nivelDeluzPrendida max: self nivelDeluzApagada! !

!HabitacionInteligente methodsFor: 'private' stamp: 'LL 4/26/2026 17:24:18'!
cerrarPersiana

	^ gradoDeAperturaDeLaPersiana := #Cerrada! !

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


!ModoDeCasaInteligente methodsFor: 'initialization' stamp: 'JS 4/25/2026 15:25:50'!
initializePara: unaCasaInteligente

	casaInteligente := unaCasaInteligente! !


!ModoDeCasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:16:20'!
afectarPorDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	self subclassResponsibility! !

!ModoDeCasaInteligente methodsFor: 'dd - private' stamp: 'JS 4/25/2026 15:22:27'!
afectarPorFinDeDeteccionDeMovimiento: habitacionAfectadaPorElEvento

	self subclassResponsibility! !


!ModoDeCasaInteligente methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 16:40:10'!
esCriticaLaDeteccionDeMovimiento

	self subclassResponsibility! !

!ModoDeCasaInteligente methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 17:09:03'!
sincronizarClimatizacionCentral: sistemaDeClimatizacionCentral

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



!ModoAusente methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 16:39:44'!
esCriticaLaDeteccionDeMovimiento

	^true! !

!ModoAusente methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 17:09:14'!
sincronizarClimatizacionCentral: sistemaDeClimatizacionCentral! !


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


!ModoEnCasa methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 16:39:53'!
esCriticaLaDeteccionDeMovimiento

	^false! !

!ModoEnCasa methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 17:09:28'!
sincronizarClimatizacionCentral: sistemaDeClimatizacionCentral

	^sistemaDeClimatizacionCentral sincronizar! !


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


!ModoNoche methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 16:39:58'!
esCriticaLaDeteccionDeMovimiento

	^false! !

!ModoNoche methodsFor: 'as yet unclassified' stamp: 'LL 4/26/2026 17:09:36'!
sincronizarClimatizacionCentral: sistemaDeClimatizacionCentral

	^sistemaDeClimatizacionCentral sincronizar! !


!classDefinition: #SistemaDeClimatizacionCentral category: #'1c2026-1erParcial'!
Object subclass: #SistemaDeClimatizacionCentral
	instanceVariableNames: 'casaInteligente climatizacionEncendida temperaturaClimatizacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-1erParcial'!

!SistemaDeClimatizacionCentral methodsFor: 'initialization' stamp: 'JS 4/25/2026 18:01:19'!
initializePara: unaCasaInteligente

	casaInteligente := unaCasaInteligente.
	climatizacionEncendida := false.
	temperaturaClimatizacion := casaInteligente temperaturaParaRefrigeracion.
! !


!SistemaDeClimatizacionCentral methodsFor: 'sincronizar' stamp: 'JS 4/25/2026 18:06:26'!
sincronizar
	
	casaInteligente seDebeRefrigerarLaCasa ifTrue: [
		self encenderLaClimatizacionConTemperatura: casaInteligente temperaturaParaRefrigeracion.
		^self
	].
	
	casaInteligente seDebeCalefaccionarLaCasa ifTrue: [
		self encenderLaClimatizacionConTemperatura:  casaInteligente temperaturaParaCalefaccion.
		^self
	].

	self apagarLaClimatizacion! !


!SistemaDeClimatizacionCentral methodsFor: 'testing' stamp: 'JS 4/25/2026 17:59:23'!
climatizacionApagada

	^climatizacionEncendida not! !

!SistemaDeClimatizacionCentral methodsFor: 'testing' stamp: 'JS 4/25/2026 17:59:06'!
climatizacionEncendidaEn: unaPosibleTemperatura 

	^climatizacionEncendida and: [ temperaturaClimatizacion = unaPosibleTemperatura ]! !


!SistemaDeClimatizacionCentral methodsFor: 'private' stamp: 'JS 4/25/2026 18:10:11'!
apagarLaClimatizacion

	^climatizacionEncendida := false! !

!SistemaDeClimatizacionCentral methodsFor: 'private' stamp: 'JS 4/25/2026 17:59:11'!
encenderLaClimatizacionConTemperatura: temperaturaDeClimatizacion
	
	climatizacionEncendida := true.
	temperaturaClimatizacion := temperaturaDeClimatizacion.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeClimatizacionCentral class' category: #'1c2026-1erParcial'!
SistemaDeClimatizacionCentral class
	instanceVariableNames: ''!

!SistemaDeClimatizacionCentral class methodsFor: 'instance creation' stamp: 'JS 4/25/2026 18:01:31'!
para: unaCasaInteligente
	^self new initializePara: unaCasaInteligente! !


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
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 61 53 56 64 53 56 57 52 57 55 55 53 109 106 59 58 53 127 63 61 102 61 59 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 8 31 17 56 64 57 53 56 61 63 53 56 53 57 59 17 109 108 107 118 121 104 17 109 108 107 118 121 104 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 55 91 56 61 65 56 60 65 57 63 53 60 57 61 61 60 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 53 122 123 17 58 58 55 56 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 55 91 57 58 65 58 55 65 56 60 53 59 59 63 64 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 53 122 123 17 58 58 55 56 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 55 91 57 58 65 60 57 65 59 58 53 64 63 62 64 57 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 84 108 113 118 121 104 122 83 124 106 111 118 53 122 123 17 58 59 61 60 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 55 65 55 63 65 56 63 53 58 62 59 59 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 56 52 111 104 110 118 52 119 104 122 104 121 52 115 118 122 52 123 108 122 123 122 53 122 123 17 58 60 56 57 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 55 65 58 60 65 58 60 53 61 55 62 61 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 57 104 52 104 106 118 116 118 107 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 60 62 63 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 55 65 58 61 65 60 59 53 56 60 56 55 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 57 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 108 125 108 117 123 118 52 106 121 112 123 112 106 118 53 122 123 17 58 62 62 58 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 55 65 58 62 65 60 61 53 64 64 62 64 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 58 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 107 108 123 108 106 106 112 118 117 52 107 108 52 108 125 108 117 123 118 53 122 123 17 58 64 56 58 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 56 62 65 55 60 53 64 56 61 58 57 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 58 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 107 108 123 108 106 106 112 118 117 52 107 108 52 108 125 108 117 123 118 53 122 123 17 59 55 58 56 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 56 63 65 55 57 53 56 55 58 57 55 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 58 106 52 108 115 112 116 112 117 118 52 123 112 119 118 52 128 52 125 104 115 118 121 52 107 108 52 108 125 108 117 123 118 53 122 123 17 59 55 58 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 56 64 65 58 55 53 60 63 58 63 59 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 59 104 52 108 127 123 121 104 106 123 52 116 108 123 111 118 107 52 106 124 108 121 119 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 59 59 55 57 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 57 56 65 57 58 53 61 58 62 55 55 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 59 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 59 61 57 64 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 57 57 65 56 59 53 62 56 59 56 59 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 59 106 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 109 112 117 52 107 108 52 116 118 125 112 116 112 108 117 123 118 53 122 123 17 59 62 59 59 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 57 58 65 58 55 53 61 55 58 56 64 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 59 107 52 106 121 108 118 52 108 115 52 116 118 107 118 52 106 118 116 119 115 108 123 118 53 122 123 17 59 63 63 60 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 57 61 65 58 62 53 57 59 60 64 62 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 59 108 52 120 124 112 123 118 52 112 109 52 123 108 116 119 108 121 104 123 124 121 104 52 116 118 107 118 52 104 124 122 108 117 123 108 53 122 123 17 59 64 63 62 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 57 63 65 59 56 53 58 62 64 64 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 60 104 52 121 108 109 104 106 123 118 121 52 104 113 124 122 123 104 121 52 112 115 124 116 112 117 104 106 112 118 117 53 122 123 17 60 55 60 64 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 60 91 57 56 65 58 56 65 59 64 53 60 62 57 57 62 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 60 105 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 104 113 124 122 123 104 121 52 112 115 124 116 112 117 104 106 112 118 117 53 122 123 17 60 58 63 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 55 63 65 59 59 53 61 64 63 58 59 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 61 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 115 52 121 104 117 110 118 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 60 62 57 57 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 55 65 60 60 53 61 56 59 58 61 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 62 52 120 124 112 123 118 52 115 118 122 52 112 109 122 52 107 108 52 115 104 52 123 108 116 119 108 121 104 123 124 121 104 52 107 108 52 106 115 112 116 104 123 112 129 104 106 112 118 117 53 122 123 17 60 64 58 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 56 65 57 60 53 62 58 56 57 59 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 63 52 121 108 109 104 106 123 118 121 52 123 108 116 119 108 121 104 123 124 121 104 52 119 121 118 116 108 107 112 118 53 122 123 17 61 55 58 62 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 57 65 56 64 53 55 60 59 55 63 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 64 104 52 118 105 113 108 123 118 52 106 118 116 119 115 108 123 118 52 106 104 116 105 112 118 52 107 108 52 123 108 116 119 108 121 104 123 124 121 104 53 122 123 17 61 56 60 61 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 58 65 59 64 53 63 55 57 58 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 55 64 105 52 118 105 113 108 123 118 122 52 106 118 116 119 115 108 123 118 122 52 106 104 122 104 52 128 52 111 104 105 112 123 104 106 112 118 117 53 122 123 17 61 57 59 59 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 60 65 56 63 53 64 63 56 62 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 55 104 52 108 117 106 104 119 122 124 115 104 116 112 108 117 123 118 52 107 108 52 116 118 107 118 53 122 123 17 61 58 59 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 61 65 57 55 53 60 57 64 60 56 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 55 105 52 121 108 122 119 118 117 122 104 105 112 115 112 107 104 107 108 122 52 106 104 122 104 52 116 118 107 118 52 111 104 105 112 123 104 106 112 118 117 53 122 123 17 61 60 55 57 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 62 65 60 59 53 64 64 55 55 57 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 56 52 106 118 116 119 118 122 112 106 112 118 117 52 107 108 52 106 118 117 109 112 110 124 121 104 106 112 118 117 108 122 53 122 123 17 61 62 57 61 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 63 65 56 58 53 55 61 55 57 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 57 104 52 106 104 123 108 110 118 121 112 129 118 53 122 123 17 61 62 61 63 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 56 64 65 59 57 53 63 55 55 61 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 57 105 52 116 108 113 118 121 118 52 117 118 116 105 121 108 122 52 107 108 52 106 118 115 104 105 118 121 104 107 118 121 108 122 53 122 123 17 61 63 63 60 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 57 56 65 58 58 53 60 60 58 62 62 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 57 106 52 116 118 107 108 115 118 52 106 115 112 116 104 123 112 129 104 106 112 118 117 52 128 52 121 108 117 118 116 105 121 118 52 108 125 108 117 123 118 53 122 123 17 62 56 61 62 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 58 57 65 57 58 53 57 56 56 64 61 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 52 57 55 57 61 55 59 57 60 91 57 58 55 61 59 63 97 52 58 52 55 55 56 54 87 104 122 118 72 87 104 122 118 39 52 39 94 80 87 54 119 104 122 118 56 57 106 52 116 118 107 108 115 118 52 106 115 112 116 104 123 112 129 104 106 112 118 117 52 128 52 121 108 117 118 116 105 121 118 52 108 125 108 117 123 118 53 122 123 17 62 56 61 62 56 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 55 91 57 56 65 55 61 65 58 58 53 58 58 62 55 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 84 108 113 118 121 104 122 83 124 106 111 118 53 122 123 17 58 55 63 60 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 61 65 59 64 65 60 57 53 57 59 61 64 62 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 104 113 124 122 123 108 122 77 112 117 104 115 108 122 53 122 123 17 59 63 59 60 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 62 65 55 62 65 55 63 53 58 57 57 58 57 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 104 113 124 122 123 108 122 77 112 117 104 115 108 122 57 53 122 123 17 59 63 57 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 59 52 57 61 91 56 62 65 57 61 65 55 63 53 58 60 58 61 57 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 56 108 121 87 104 121 106 112 104 115 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 56 108 121 87 104 121 106 112 104 115 52 104 113 124 122 123 108 122 77 112 117 104 115 108 122 58 53 122 123 17 59 63 63 61 63 17 52 52 52 52 52 52 52 52 52 52 17 17))!