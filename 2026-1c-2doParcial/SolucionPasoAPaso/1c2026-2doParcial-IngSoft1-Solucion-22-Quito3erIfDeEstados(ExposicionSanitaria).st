!classDefinition: #AtencionSanitaria category: #'1c2026-2doParcial-IngSoft1'!
Object subclass: #AtencionSanitaria
	instanceVariableNames: 'tipoDeTratamiento insumosNecesarios'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!AtencionSanitaria methodsFor: 'initialization' stamp: 'LL 6/10/2026 22:40:25'!
initializeDeTipo: unTipoDeTratamiento insumos: unaCantidadDeInsumos 
	tipoDeTratamiento := unTipoDeTratamiento.
	insumosNecesarios := unaCantidadDeInsumos.! !


!AtencionSanitaria methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:35:58'!
insumosNecesarios
	^insumosNecesarios! !

!AtencionSanitaria methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 21:54:29'!
tipoDeTratamiento
	^tipoDeTratamiento! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AtencionSanitaria class' category: #'1c2026-2doParcial-IngSoft1'!
AtencionSanitaria class
	instanceVariableNames: ''!

!AtencionSanitaria class methodsFor: 'instance creation' stamp: 'LL 6/10/2026 22:40:20'!
deCuracionUsandoMaterialSanitario: unaCantidadDeMaterialSanitario 
	^self new initializeDeTipo: #Curacion insumos: unaCantidadDeMaterialSanitario! !

!AtencionSanitaria class methodsFor: 'instance creation' stamp: 'LL 6/10/2026 22:40:20'!
deVacunacionUsandoDosis: unaCantidadDeDosis 
	^self new initializeDeTipo: #Vacunacion insumos: unaCantidadDeDosis! !


!classDefinition: #Brigada category: #'1c2026-2doParcial-IngSoft1'!
Object subclass: #Brigada
	instanceVariableNames: 'atencionesRealizadas estado dosisDeVacunas materialEsteril maletin exposicionSanitaria maximoDeExposicionSanitaria'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!Brigada methodsFor: 'initialization' stamp: 'LL 6/11/2026 22:47:30'!
initializeConMaletin: unMaletin conMaximoExposicionSanitaria: unMaximoDeExposicionSanitaria 
	maletin := unMaletin.
	atencionesRealizadas := OrderedCollection new.
	estado := EstadoOperativa de: self.
	exposicionSanitaria := 0.
	maximoDeExposicionSanitaria := unMaximoDeExposicionSanitaria.! !


!Brigada methodsFor: 'atenciones' stamp: 'LL 6/11/2026 22:46:06'!
realizarAtencion: atencionSanitaria

	^estado realizarAtencion: atencionSanitaria! !

!Brigada methodsFor: 'atenciones' stamp: 'LL 6/11/2026 23:03:23'!
rendirAtencionesEn: baseSanitaria
	
	^estado rendirAtencionesEn: baseSanitaria
	! !


!Brigada methodsFor: 'testing' stamp: 'LL 6/11/2026 22:52:21'!
estaEnCuarentena
	^estado estaCuarentena! !

!Brigada methodsFor: 'testing' stamp: 'LL 6/11/2026 19:35:41'!
tieneAtencionesRealizadas
	^atencionesRealizadas isEmpty not! !

!Brigada methodsFor: 'testing' stamp: 'LL 6/10/2026 23:51:19'!
tieneDosisDeVacunasEnMaletin: unaCantidadEsperadaDeDosis 
	^maletin tieneDosisDeVacunas: unaCantidadEsperadaDeDosis! !

!Brigada methodsFor: 'testing' stamp: 'LL 6/10/2026 23:09:07'!
tieneExposicionSanitaria: unaExposicionSanitariaEsperada 
	^exposicionSanitaria = unaExposicionSanitariaEsperada! !

!Brigada methodsFor: 'testing' stamp: 'LL 6/10/2026 20:22:57'!
tieneRegistrada: atencionSanitaria 
	^atencionesRealizadas includes: atencionSanitaria! !


!Brigada methodsFor: 'mensaje de error' stamp: 'LL 6/10/2026 23:45:47'!
maximoDeExposicionSanitariaAlcanzadoMensajeDeError
	^'Maximo de exposicion sanitaria alcanzado'! !

!Brigada methodsFor: 'mensaje de error' stamp: 'LL 6/10/2026 22:56:32'!
noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError
	^maletin noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError! !

!Brigada methodsFor: 'mensaje de error' stamp: 'LL 6/10/2026 20:34:11'!
noSePuedeRealizarAtencionEnCuarentenaMensajeDeError

	^ 'No se puede realizar atenciones en cuarentena'! !

!Brigada methodsFor: 'mensaje de error' stamp: 'LL 6/11/2026 19:41:01'!
noSePuedeRendirAtencionesSinConexionMensajeDeError
	^'No se puede rendir atenciones sin conexión'.! !


!Brigada methodsFor: 'cambios de estado' stamp: 'LL 6/11/2026 22:46:59'!
pasaATenerElInstrumentalComprometido
	estado := EstadoConInstrumentalComprometido de: self! !

!Brigada methodsFor: 'cambios de estado' stamp: 'LL 6/11/2026 22:47:06'!
pasarACuarentena
	estado := EstadoEnCuarentena de: self! !

!Brigada methodsFor: 'cambios de estado' stamp: 'LL 6/11/2026 22:47:13'!
pasarASinConexion
	estado := EstadoSinConexion de: self! !

!Brigada methodsFor: 'cambios de estado' stamp: 'LL 6/11/2026 22:47:19'!
pasarATenerIntrumentalComprometido
	estado := EstadoConInstrumentalComprometido de: self! !


!Brigada methodsFor: 'private' stamp: 'LL 6/11/2026 23:12:23'!
evaluarExposicionSanitariaDe: atencionSanitaria
	
	| exposicionSanitariaAGenerar |
	
	exposicionSanitariaAGenerar := estado exposicionSanitariaAGenerarRealizando: atencionSanitaria.

	(exposicionSanitaria + exposicionSanitariaAGenerar > maximoDeExposicionSanitaria) ifTrue: [
		self pasarACuarentena.
		self error: self maximoDeExposicionSanitariaAlcanzadoMensajeDeError.
	].

	exposicionSanitaria := exposicionSanitaria + exposicionSanitariaAGenerar.! !


!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 23:11:19'!
exposicionSanitariaEstandoConInstrumentalComprometidoRealizando: atencionSanitaria 
	^(self exposicionSanitariaEstandoOperativaRealizando: atencionSanitaria) * 3! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 23:10:38'!
exposicionSanitariaEstandoOperativaRealizando: atencionSanitaria 
	(atencionSanitaria tipoDeTratamiento = #Vacunacion) ifTrue: [
		^atencionSanitaria insumosNecesarios.
	].

	(atencionSanitaria tipoDeTratamiento = #Curacion) ifTrue: [
		^atencionSanitaria insumosNecesarios * 2.
	]! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 23:11:48'!
exposicionSanitariaEstandoSinConexionRealizando: atencionSanitaria 
	
	^self exposicionSanitariaEstandoOperativaRealizando: atencionSanitaria! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 23:00:00'!
realizarAtencionEstandoConInstrumentalComprometido: atencionSanitaria 
	
	self realizarAtencionEstandoOperativa: atencionSanitaria! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 22:46:32'!
realizarAtencionEstandoEnCuarentena: atencionSanitaria

	self error: self noSePuedeRealizarAtencionEnCuarentenaMensajeDeError! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 22:45:43'!
realizarAtencionEstandoOperativa: atencionSanitaria

	self evaluarExposicionSanitariaDe: atencionSanitaria.
	
	(atencionSanitaria tipoDeTratamiento = #Vacunacion) ifTrue: [
		maletin retirarDosisDeVacunasPara: atencionSanitaria.
	].

	(atencionSanitaria tipoDeTratamiento = #Curacion) ifTrue: [
		maletin retirarMaterialEsterilPara: atencionSanitaria.
	].

	atencionesRealizadas add: atencionSanitaria.! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 23:00:12'!
realizarAtencionEstandoSinConexion: atencionSanitaria 
	self realizarAtencionEstandoOperativa: atencionSanitaria! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 22:58:39'!
rendirAtencionesEstandoConInstrumentalComprometidoEn: baseSanitaria 
	self pasarACuarentena.
	
	self rendirAtencionesEstandoOperativaEn: baseSanitaria! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 22:56:52'!
rendirAtencionesEstandoOperativaEn: baseSanitaria

	baseSanitaria addAll: atencionesRealizadas.
	atencionesRealizadas removeAll.! !

!Brigada methodsFor: 'dd - estados' stamp: 'LL 6/11/2026 22:57:37'!
rendirAtencionesEstandoSinConexionEn: baseSanitaria

	self error: self noSePuedeRendirAtencionesSinConexionMensajeDeError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Brigada class' category: #'1c2026-2doParcial-IngSoft1'!
Brigada class
	instanceVariableNames: ''!

!Brigada class methodsFor: 'instance creation' stamp: 'LL 6/10/2026 23:42:39'!
con: unMaletin yUnMaximoDeExposicionSanitaria: unMaximoDeExposicionSanitaria 
	^self new initializeConMaletin: unMaletin conMaximoExposicionSanitaria: unMaximoDeExposicionSanitaria! !


!classDefinition: #EstadoDeBrigada category: #'1c2026-2doParcial-IngSoft1'!
Object subclass: #EstadoDeBrigada
	instanceVariableNames: 'brigada'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!EstadoDeBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:52:29'!
estaCuarentena

	^false! !

!EstadoDeBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:09:19'!
exposicionSanitariaAGenerarRealizando: atencionSanitaria
	
	self subclassResponsibility! !

!EstadoDeBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:44:32'!
initializeWith: unaBrigada

	brigada := unaBrigada! !

!EstadoDeBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:43:19'!
realizarAtencion: atencionSanitaria

	self subclassResponsibility! !

!EstadoDeBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:54:38'!
rendirAtencionesEn: baseSanitaria

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDeBrigada class' category: #'1c2026-2doParcial-IngSoft1'!
EstadoDeBrigada class
	instanceVariableNames: ''!

!EstadoDeBrigada class methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:44:22'!
de: unaBrigada
	^self new initializeWith: unaBrigada! !


!classDefinition: #EstadoConInstrumentalComprometido category: #'1c2026-2doParcial-IngSoft1'!
EstadoDeBrigada subclass: #EstadoConInstrumentalComprometido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!EstadoConInstrumentalComprometido methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:08:27'!
exposicionSanitariaAGenerarRealizando: atencionSanitaria
	
	^brigada exposicionSanitariaEstandoConInstrumentalComprometidoRealizando: atencionSanitaria! !

!EstadoConInstrumentalComprometido methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:59:30'!
realizarAtencion: atencionSanitaria

	^brigada realizarAtencionEstandoConInstrumentalComprometido: atencionSanitaria! !

!EstadoConInstrumentalComprometido methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:55:24'!
rendirAtencionesEn: baseSanitaria

	^brigada rendirAtencionesEstandoConInstrumentalComprometidoEn: baseSanitaria! !


!classDefinition: #EstadoEnCuarentena category: #'1c2026-2doParcial-IngSoft1'!
EstadoDeBrigada subclass: #EstadoEnCuarentena
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!EstadoEnCuarentena methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:52:38'!
estaCuarentena

	^true! !

!EstadoEnCuarentena methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:08:40'!
exposicionSanitariaAGenerarRealizando: atencionSanitaria! !

!EstadoEnCuarentena methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:44:54'!
realizarAtencion: atencionSanitaria

	^brigada realizarAtencionEstandoEnCuarentena: atencionSanitaria! !

!EstadoEnCuarentena methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:00:29'!
rendirAtencionesEn: baseSanitaria! !


!classDefinition: #EstadoOperativa category: #'1c2026-2doParcial-IngSoft1'!
EstadoDeBrigada subclass: #EstadoOperativa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!EstadoOperativa methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:08:51'!
exposicionSanitariaAGenerarRealizando: atencionSanitaria
	
	^brigada exposicionSanitariaEstandoOperativaRealizando: atencionSanitaria ! !

!EstadoOperativa methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:45:07'!
realizarAtencion: atencionSanitaria

	^brigada realizarAtencionEstandoOperativa: atencionSanitaria! !

!EstadoOperativa methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:55:55'!
rendirAtencionesEn: baseSanitaria

	^brigada rendirAtencionesEstandoOperativaEn: baseSanitaria! !


!classDefinition: #EstadoSinConexion category: #'1c2026-2doParcial-IngSoft1'!
EstadoDeBrigada subclass: #EstadoSinConexion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!EstadoSinConexion methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 23:09:11'!
exposicionSanitariaAGenerarRealizando: atencionSanitaria
	
	^brigada exposicionSanitariaEstandoSinConexionRealizando: atencionSanitaria ! !

!EstadoSinConexion methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:59:42'!
realizarAtencion: atencionSanitaria

	^brigada realizarAtencionEstandoSinConexion: atencionSanitaria! !

!EstadoSinConexion methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 22:56:06'!
rendirAtencionesEn: baseSanitaria

	^brigada rendirAtencionesEstandoSinConexionEn: baseSanitaria! !


!classDefinition: #Maletin category: #'1c2026-2doParcial-IngSoft1'!
Object subclass: #Maletin
	instanceVariableNames: 'dosisDeVacunas materialEsteril'
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!Maletin methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:43:46'!
initializeConDosisDeVacunas: unaCantidadDeDosis conMaterialEsteril: unaCantidadDeMaterialEsteril
	dosisDeVacunas := unaCantidadDeDosis.
	materialEsteril := unaCantidadDeMaterialEsteril.! !

!Maletin methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:56:32'!
noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError
	^'No hay insumos suficientes para realizar el tratamiento'! !

!Maletin methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:56:32'!
retirarDosisDeVacunasPara: unaAtencionSanitaria

	(dosisDeVacunas < unaAtencionSanitaria insumosNecesarios) ifTrue: [ 
		self error: self noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError
	].
	
	dosisDeVacunas := dosisDeVacunas - unaAtencionSanitaria insumosNecesarios.! !

!Maletin methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:56:32'!
retirarMaterialEsterilPara: unaAtencionSanitaria

	(materialEsteril < unaAtencionSanitaria insumosNecesarios) ifTrue: [ 
		self error: self noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError
	].

	materialEsteril := materialEsteril - unaAtencionSanitaria insumosNecesarios.! !

!Maletin methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:51:29'!
tieneDosisDeVacunas: unaCantidadEsperadaDeDosis 
	^dosisDeVacunas = unaCantidadEsperadaDeDosis! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Maletin class' category: #'1c2026-2doParcial-IngSoft1'!
Maletin class
	instanceVariableNames: ''!

!Maletin class methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:44:28'!
conDosisDeVacunas: unaCantidadDeDosis conMaterialEsteril: unaCantidadDeMaterialEsteril

	^self new initializeConDosisDeVacunas: unaCantidadDeDosis conMaterialEsteril: unaCantidadDeMaterialEsteril! !

!Maletin class methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 22:46:00'!
vacio

	^self conDosisDeVacunas: 0 conMaterialEsteril: 0! !


!classDefinition: #TestBrigada category: #'1c2026-2doParcial-IngSoft1'!
TestCase subclass: #TestBrigada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '1c2026-2doParcial-IngSoft1'!

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 20:33:26'!
test01UnaBrigadaPuedeRealizarUnaAtencionSanitariaYLaRegistra

	| atencionSanitaria unaBrigada |
	unaBrigada := self unaBrigada.
	
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	unaBrigada realizarAtencion: atencionSanitaria.
	
	self assert: (unaBrigada tieneRegistrada: atencionSanitaria).
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 20:33:26'!
test02UnaBrigadaNoTieneRegistradaAtencionesQueNoRealizó

	| atencionSanitaria unaBrigada |
	unaBrigada := self unaBrigada.
	
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	self deny: (unaBrigada tieneRegistrada: atencionSanitaria).
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 20:34:40'!
test03UnaBrigadaNoPuedeAtenderSiEstáEnCuarentena

	| atencionSanitaria unaBrigada |
	unaBrigada := self unaBrigada.
	unaBrigada pasarACuarentena.
	
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	self should: [ unaBrigada realizarAtencion: atencionSanitaria. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noSePuedeRealizarAtencionEnCuarentenaMensajeDeError.
			self deny: (unaBrigada tieneRegistrada: atencionSanitaria).
		]
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:41:39'!
test04UnaBrigadaNoPuedeVacunarSiNoTieneDosisSuficientes

	| atencionSanitaria unaBrigada |
	unaBrigada := Brigada con: Maletin vacio yUnMaximoDeExposicionSanitaria: 10.
		
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	self should: [ unaBrigada realizarAtencion: atencionSanitaria. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError.
			self deny: (unaBrigada tieneRegistrada: atencionSanitaria).
		]
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:01:51'!
test05RealizarUnaVacunacionConsumeDosisDeVacunasSegunNecesidad

	| atencionSanitaria unaBrigada otraAtencionSanitaria |
	unaBrigada := self unaBrigada.
		
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: atencionSanitaria.
	
	otraAtencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	self should: [ unaBrigada realizarAtencion: otraAtencionSanitaria. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError.
			self assert: (unaBrigada tieneRegistrada: atencionSanitaria).
			self deny: (unaBrigada tieneRegistrada: otraAtencionSanitaria).
		]
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:01:58'!
test06RealizarUnaCuracionConsumeMaterialEsterilSegunNecesidad

	| atencionSanitaria unaBrigada otraAtencionSanitaria |
	unaBrigada := self unaBrigada.
		
	atencionSanitaria := (AtencionSanitaria deCuracionUsandoMaterialSanitario: 1).
	unaBrigada realizarAtencion: atencionSanitaria.
	
	otraAtencionSanitaria := (AtencionSanitaria deCuracionUsandoMaterialSanitario: 1).
	
	self should: [ unaBrigada realizarAtencion: otraAtencionSanitaria. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noHayInsumosSuficientesParaRealizarElTratamientoMensajeDeError.
			self assert: (unaBrigada tieneRegistrada: atencionSanitaria).
			self deny: (unaBrigada tieneRegistrada: otraAtencionSanitaria).
		]
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:06:57'!
test07RealizarUnaVacunacionGeneraUnaUnidadDeExposicionSanitaria

	| atencionSanitaria unaBrigada |
	unaBrigada := self unaBrigada.
		
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: atencionSanitaria.
	
	self assert: (unaBrigada tieneExposicionSanitaria: 1).
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:41:39'!
test08LaVacunacionGeneraUnaUnidadDeExposicionPorCadaDosisUtilizada

	| atencionSanitaria unaBrigada |
	unaBrigada :=  Brigada con: (Maletin conDosisDeVacunas: 2 conMaterialEsteril: 1) yUnMaximoDeExposicionSanitaria: 10.
		
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 2).
	unaBrigada realizarAtencion: atencionSanitaria.
	
	self deny: (unaBrigada tieneExposicionSanitaria: 1).
	self assert: (unaBrigada tieneExposicionSanitaria: 2).
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:41:39'!
test09LaCuracionGeneraDosUnidadesDeExposicionPorCadaInsumoUtilizado

	| atencionSanitaria unaBrigada |
	unaBrigada :=  Brigada con: (Maletin conDosisDeVacunas: 1 conMaterialEsteril: 3) yUnMaximoDeExposicionSanitaria: 10.
		
	atencionSanitaria := (AtencionSanitaria deCuracionUsandoMaterialSanitario: 3).
	unaBrigada realizarAtencion: atencionSanitaria.
	
	self assert: (unaBrigada tieneExposicionSanitaria: 6).
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:50:48'!
test10NoSePuedeRealizarUnaAtencionSanitariaSiLaMismaImplicaPasarElMaximoDeExposicion

	| atencionSanitaria unaBrigada |
	unaBrigada :=  Brigada con: (Maletin conDosisDeVacunas: 1 conMaterialEsteril: 1) yUnMaximoDeExposicionSanitaria: 0.
		
	atencionSanitaria := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	
	self should: [ unaBrigada realizarAtencion: atencionSanitaria. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada maximoDeExposicionSanitariaAlcanzadoMensajeDeError.
			self deny: (unaBrigada tieneRegistrada: atencionSanitaria).
			self assert: (unaBrigada tieneDosisDeVacunasEnMaletin: 1).
			self assert: (unaBrigada tieneExposicionSanitaria: 0).
		]
	
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 00:01:11'!
test11SiSeEstaPorPasarLaExposicionSanitariaSePasaACuarentenaYNoSePuedeSeguirAtendiendo

	| unaVacunacion unaBrigada unaCuracion unaNuevaVacunacion |
	unaBrigada :=  Brigada con: (Maletin conDosisDeVacunas: 1 conMaterialEsteril: 1) yUnMaximoDeExposicionSanitaria: 2.
	unaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: unaVacunacion.
	
	unaCuracion := (AtencionSanitaria deCuracionUsandoMaterialSanitario: 1).
	self should: [ unaBrigada realizarAtencion: unaCuracion. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: unaBrigada estaEnCuarentena.
			self assert: (unaBrigada tieneExposicionSanitaria: 1)
		].
	
	unaNuevaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	self should: [ unaBrigada realizarAtencion: unaNuevaVacunacion. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noSePuedeRealizarAtencionEnCuarentenaMensajeDeError.
			self assert: (unaBrigada tieneExposicionSanitaria: 1)
		]
	! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 00:12:48'!
test12SiLaBrigadaTieneInstrumentalComprometidoLaExposicionSanitariaSeTriplica

	| unaBrigada unaVacunacion |
	unaBrigada :=  self unaBrigada.
	unaBrigada pasaATenerElInstrumentalComprometido.
	
	unaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: unaVacunacion.
	
	self assert: (unaBrigada tieneExposicionSanitaria: 3)! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 19:32:54'!
test13UnaBrigadaPuedeRendirSusAtencionesEnUnaBaseSanitaria

	| unaBrigada unaVacunacion baseSanitaria |
	unaBrigada :=  self unaBrigada.
	unaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: unaVacunacion.
	
	self assert: (unaBrigada tieneAtencionesRealizadas).
	
	baseSanitaria := OrderedCollection new.
	unaBrigada rendirAtencionesEn: baseSanitaria.
	
	self deny: (unaBrigada tieneAtencionesRealizadas).
	self assert: baseSanitaria includes: (unaVacunacion)! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 19:43:47'!
test14UnaBrigadaNoPuedeRendirSusAtencionesSiEstaSinConexion

	| unaBrigada unaVacunacion baseSanitaria |
	unaBrigada :=  self unaBrigada.
	
	unaBrigada pasarASinConexion.
	unaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: unaVacunacion.
		
	baseSanitaria := OrderedCollection new.
	self should: [ unaBrigada rendirAtencionesEn: baseSanitaria. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: unaBrigada noSePuedeRendirAtencionesSinConexionMensajeDeError.
			self assert: (unaBrigada tieneAtencionesRealizadas).
			self deny: (baseSanitaria includes: unaVacunacion)
		]! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2026 19:44:03'!
test15UnaBrigadaQueRindeSusAtencionesConInstrumentalComprometidoPasaAEstarEnCuarentena

	| unaBrigada unaVacunacion baseSanitaria |
	unaBrigada :=  self unaBrigada.
	
	unaBrigada pasarATenerIntrumentalComprometido.
	unaVacunacion := (AtencionSanitaria deVacunacionUsandoDosis: 1).
	unaBrigada realizarAtencion: unaVacunacion.
	
	baseSanitaria := OrderedCollection new.
	unaBrigada rendirAtencionesEn: baseSanitaria.

	self deny: (unaBrigada tieneAtencionesRealizadas).
	self assert: (baseSanitaria includes: unaVacunacion).
	self assert: (unaBrigada estaEnCuarentena)! !

!TestBrigada methodsFor: 'as yet unclassified' stamp: 'LL 6/10/2026 23:41:39'!
unaBrigada

	^ Brigada con: (Maletin conDosisDeVacunas: 1 conMaterialEsteril: 1) yUnMaximoDeExposicionSanitaria: 10! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 62 53 55 53 56 56 52 56 55 55 53 109 106 59 58 53 127 63 61 102 61 59 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 86 106 123 39 39 62 39 57 55 57 60 39 56 59 65 55 63 65 57 62 39 74 118 116 119 112 115 108 121 65 39 60 53 59 53 55 39 57 55 56 61 55 61 55 64 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 108 108 116 53 58 61 61 57 39 124 124 112 107 65 39 57 61 104 55 55 106 105 106 52 58 56 60 107 52 59 106 108 107 52 104 108 60 105 52 61 60 55 58 60 56 56 61 58 106 58 62 39 86 106 123 39 39 62 39 57 55 57 60 17 93 84 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 39 75 104 123 108 65 39 84 118 117 39 86 106 123 39 61 39 56 57 65 58 59 65 57 56 39 57 55 57 60 39 74 118 116 116 112 123 79 104 122 111 65 39 108 107 58 60 59 63 61 39 87 115 124 110 112 117 122 65 39 57 55 57 60 56 55 55 61 56 64 58 59 39 111 108 121 117 104 117 71 84 104 106 73 118 118 114 52 87 121 118 52 107 108 52 79 108 121 117 104 117 52 57 53 115 118 106 104 115 65 75 118 106 124 116 108 117 123 122 54 93 84 54 118 119 108 117 122 116 104 115 115 123 104 115 114 52 125 116 17 199 175 8 31 17 56 64 57 53 56 61 63 53 56 53 57 59 17 109 108 107 118 121 104 17 109 108 107 118 121 104 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 55 64 65 58 59 53 62 59 64 62 63 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 58 52 123 108 122 123 56 57 53 122 123 17 57 61 62 57 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 55 64 65 60 64 53 64 64 57 62 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 57 52 123 108 122 123 56 56 53 122 123 17 57 56 64 61 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 55 65 56 62 53 57 58 57 61 59 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 59 52 123 108 122 123 56 58 53 122 123 17 57 61 56 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 55 65 59 64 53 62 60 57 58 61 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 60 52 123 108 122 123 56 59 53 122 123 17 57 64 61 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 56 65 55 55 53 61 56 56 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 57 52 123 108 122 123 56 56 53 122 123 17 57 56 64 61 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 56 65 56 58 53 58 55 59 58 63 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 59 52 123 108 122 123 56 58 53 122 123 17 57 61 56 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 57 65 59 59 53 59 64 63 55 57 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 59 52 123 108 122 123 56 58 53 122 123 17 57 62 63 63 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 59 65 59 61 53 56 61 60 61 58 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 60 52 123 108 122 123 56 59 53 122 123 17 57 64 61 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 64 65 60 57 65 58 60 53 55 60 61 64 60 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 75 108 122 106 104 121 110 104 122 54 74 118 116 105 104 123 112 108 117 123 108 122 77 104 117 123 104 122 123 112 106 118 122 57 55 57 60 52 90 118 115 124 106 112 118 117 93 57 53 122 123 17 57 64 55 60 56 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 55 65 59 57 65 58 63 53 57 58 58 61 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 123 108 122 123 55 56 53 122 123 17 56 61 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 55 65 60 61 65 56 60 53 64 59 64 56 62 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 123 108 122 123 55 57 53 122 123 17 57 61 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 56 65 55 58 65 60 57 53 57 61 59 64 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 123 108 122 123 55 58 53 122 123 17 58 58 63 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 56 65 56 59 65 55 56 53 62 55 61 57 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 123 108 122 123 55 60 53 122 123 17 60 57 62 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 56 65 57 63 65 57 64 53 62 58 63 63 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 89 108 112 109 112 106 118 84 104 115 108 123 112 117 53 122 123 17 61 62 60 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 56 65 59 58 65 55 57 53 61 60 61 56 62 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 60 52 89 108 112 109 112 106 118 84 104 115 108 123 112 117 53 122 123 17 61 62 60 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 56 65 60 55 65 58 58 53 62 61 57 55 58 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 55 61 52 123 108 122 123 55 61 53 122 123 17 62 57 56 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 57 65 55 63 65 56 55 53 57 55 63 56 59 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 62 52 123 108 122 123 55 62 53 122 123 17 62 62 63 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 57 65 57 62 65 56 55 53 55 57 59 63 55 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 63 52 123 108 122 123 55 63 53 122 123 17 64 55 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 61 91 57 57 65 57 64 65 60 61 53 60 64 58 56 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 64 52 123 108 122 123 55 64 53 122 123 17 64 63 55 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 55 65 58 62 65 60 62 53 58 61 57 63 56 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 55 52 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 64 64 59 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 55 65 59 63 65 57 58 53 59 64 55 55 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 56 52 123 108 122 123 56 55 53 122 123 17 56 55 62 61 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 55 65 60 56 65 60 61 53 57 63 64 58 58 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 57 52 123 108 122 123 56 56 53 122 123 17 56 56 57 63 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 56 65 57 60 65 55 60 53 64 63 62 55 56 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 58 52 123 108 122 123 56 57 53 122 123 17 56 58 60 63 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 56 65 58 60 65 60 62 53 58 59 60 59 61 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 53 52 56 59 52 123 108 122 123 56 58 53 122 123 17 56 59 57 62 57 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 56 65 58 62 65 59 64 53 63 64 63 61 63 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 58 52 123 108 122 123 56 57 17 56 59 57 62 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 55 61 65 59 55 53 64 63 63 61 56 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 56 60 52 123 108 122 123 56 59 53 122 123 17 56 61 61 60 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 55 64 65 57 59 53 58 61 55 63 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 59 52 123 108 122 123 56 58 105 53 122 123 17 56 59 57 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 56 59 65 56 61 53 62 63 57 58 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 58 52 123 108 122 123 56 57 53 122 123 17 56 58 60 62 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 57 60 65 57 55 53 58 60 56 64 60 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 61 52 84 118 125 108 121 93 104 106 124 117 104 106 112 118 117 75 108 73 121 112 110 104 107 104 72 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 56 63 56 61 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 58 58 65 59 61 53 59 57 63 64 56 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 56 62 52 84 118 125 108 121 84 104 122 75 108 93 104 106 124 117 104 106 112 118 117 75 108 122 107 108 73 121 112 110 104 107 104 72 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 56 63 58 55 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 59 59 65 57 62 53 63 62 57 64 56 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 56 63 52 84 124 108 125 118 74 124 121 104 106 112 118 117 75 108 122 107 108 73 121 112 110 104 107 104 72 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 56 62 63 56 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 57 65 60 60 65 58 64 53 56 61 62 58 59 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 53 56 64 52 84 124 108 125 118 89 108 122 119 118 117 122 104 105 112 115 112 107 104 107 75 108 76 127 119 118 122 112 106 112 118 117 84 104 127 112 116 104 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 72 73 121 112 110 104 107 104 87 104 121 104 85 118 89 118 116 119 108 121 76 117 106 104 119 122 124 115 104 116 112 108 117 123 118 53 122 123 17 56 62 62 60 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 58 65 55 59 65 55 64 53 61 61 58 61 60 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 55 52 89 108 104 115 112 129 118 83 104 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 72 115 74 121 108 104 121 115 104 53 122 123 17 56 62 56 64 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 58 65 55 61 65 55 56 53 55 63 58 59 60 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 56 52 123 108 122 123 56 60 53 122 123 17 56 62 62 57 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 62 91 55 58 65 56 57 65 55 63 53 60 60 62 56 58 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 57 52 80 117 115 112 117 108 75 108 93 104 106 124 117 104 106 112 118 117 96 74 124 121 104 106 112 118 117 96 73 118 121 121 118 91 108 122 123 56 60 53 122 123 17 56 63 55 55 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 58 58 65 60 57 53 56 58 61 63 64 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 58 52 123 108 122 123 56 60 53 122 123 17 56 64 55 57 60 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 58 64 65 57 60 53 55 57 55 64 58 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 59 52 123 108 122 123 56 61 53 122 123 17 56 64 61 61 64 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 59 62 65 59 57 53 57 59 55 60 58 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 60 52 88 124 112 123 104 121 80 109 122 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 57 55 57 64 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 60 61 65 56 57 53 55 55 59 63 58 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 61 52 88 124 112 123 118 80 109 122 89 108 122 123 104 117 123 108 122 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 57 55 62 55 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 60 62 65 57 59 53 62 62 63 56 60 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 61 52 88 124 112 123 118 80 109 122 89 108 122 123 104 117 123 108 122 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 17 57 55 61 60 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 55 64 91 57 57 65 60 62 65 60 60 53 61 55 60 59 59 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 61 52 88 124 112 123 118 80 109 122 89 108 122 123 104 117 123 108 122 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 57 55 61 60 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 56 64 65 60 61 65 57 64 53 60 58 59 59 59 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 62 52 88 124 112 123 118 80 109 122 75 108 76 122 123 104 107 118 75 108 73 121 112 110 104 107 104 53 122 123 17 57 61 62 57 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 55 55 65 57 57 53 64 63 61 56 62 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 53 57 63 52 76 125 112 123 118 89 118 116 119 108 121 76 117 106 104 119 122 124 115 104 116 112 108 117 123 118 75 108 84 104 115 108 123 112 117 75 108 73 121 112 110 104 107 104 53 122 123 17 57 61 64 64 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 55 62 65 60 55 53 60 62 62 60 61 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 57 63 52 90 112 116 119 115 112 109 112 106 118 75 75 75 108 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 57 60 61 61 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 57 56 65 60 64 53 63 64 55 63 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 56 52 123 108 122 123 55 56 53 122 123 17 56 64 60 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 57 59 65 55 58 53 56 55 63 62 57 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 57 52 123 108 122 123 55 57 53 122 123 17 57 60 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 58 56 65 55 62 53 59 64 60 57 58 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 58 52 123 108 122 123 55 58 53 122 123 17 58 59 57 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 58 60 65 60 64 53 55 62 56 56 55 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 59 52 89 108 117 104 116 108 89 108 110 112 122 123 121 104 121 52 69 89 108 104 115 112 129 104 121 96 88 124 112 123 118 74 118 107 112 110 118 89 108 119 108 123 112 107 118 84 108 117 122 104 113 108 75 108 76 121 121 118 121 53 122 123 17 58 62 60 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 59 61 65 58 59 53 55 59 63 60 61 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 60 52 123 108 122 123 55 59 53 122 123 17 60 57 64 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 55 65 59 63 65 60 55 53 59 61 64 60 60 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 61 52 123 108 122 123 55 60 53 122 123 17 61 56 62 56 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 57 65 58 60 65 56 59 53 58 56 56 62 64 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 62 52 123 108 122 123 55 61 53 122 123 17 63 56 63 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 57 65 59 55 65 55 61 53 64 63 56 63 56 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 53 55 63 52 78 108 117 108 121 104 115 112 129 118 80 117 122 124 116 118 122 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 62 64 63 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 57 65 59 55 65 59 60 53 64 62 60 63 58 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 63 52 78 108 117 108 121 104 115 112 129 118 80 117 122 124 116 118 122 75 108 72 123 108 117 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 62 64 64 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 57 65 60 55 65 59 56 53 63 59 63 62 59 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 55 64 52 89 108 112 109 112 106 118 84 104 115 108 123 112 117 53 122 123 17 56 55 55 61 63 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 57 65 60 62 65 60 57 53 61 63 58 55 63 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 56 55 52 76 125 112 123 118 89 118 116 119 108 121 76 117 106 104 119 122 124 115 104 116 112 108 117 123 118 76 117 84 104 115 108 123 112 117 96 84 124 108 125 118 89 108 122 119 118 117 122 104 105 112 115 112 107 104 107 108 122 53 122 123 17 56 55 56 58 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 58 65 55 60 65 58 59 53 60 64 62 56 63 60 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 56 52 123 108 122 123 55 62 80 117 112 106 112 118 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 56 55 62 58 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 58 65 58 59 65 56 64 53 62 57 61 55 55 58 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 57 52 123 108 122 123 55 62 128 55 63 53 122 123 17 56 56 64 58 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 55 91 57 58 65 60 58 65 57 61 53 60 60 59 63 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 58 52 123 108 122 123 56 55 84 104 127 112 116 118 75 108 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 53 122 123 17 56 58 60 55 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 55 55 65 55 59 65 60 63 53 55 56 62 64 60 56 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 59 52 123 108 122 123 56 56 84 104 127 112 116 118 75 108 76 127 119 118 122 112 106 112 118 117 87 104 122 104 72 74 124 104 121 108 117 123 108 117 104 53 122 123 17 56 59 63 57 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 55 55 65 55 63 65 58 62 53 61 60 62 62 62 59 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 60 52 76 127 123 121 104 112 110 118 83 118 110 112 106 104 75 108 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 72 92 117 84 108 123 118 107 118 53 122 123 17 56 60 55 56 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 55 55 65 56 58 65 59 60 53 63 63 63 56 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 61 52 123 108 122 123 56 57 91 121 112 119 115 112 106 104 74 118 117 80 117 122 123 121 124 116 108 117 123 104 115 74 118 116 119 121 118 116 108 123 112 107 118 53 122 123 17 56 60 62 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 64 65 58 61 65 60 63 53 64 56 58 61 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 62 52 123 108 122 123 56 58 80 117 112 106 112 118 89 108 117 107 112 106 112 118 117 75 108 72 123 108 117 106 112 118 117 108 122 53 122 123 17 56 61 60 62 59 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 64 65 59 56 65 58 62 53 56 62 59 60 62 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 63 52 123 108 122 123 56 59 53 122 123 17 56 62 63 56 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 56 64 65 59 61 65 57 63 53 60 63 57 61 64 64 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 56 64 52 123 108 122 123 56 60 53 122 123 17 56 63 61 59 62 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 57 57 65 60 57 65 55 58 53 61 56 57 60 64 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 55 52 88 124 112 123 118 87 121 112 116 108 121 80 109 75 108 76 122 123 104 107 118 122 53 122 123 17 57 56 61 55 55 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 57 58 65 55 57 65 56 61 53 63 63 64 62 55 63 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 57 56 52 88 124 112 123 118 57 107 118 80 109 75 108 76 122 123 104 107 118 122 47 89 108 107 112 121 72 123 108 117 106 112 118 117 108 122 48 53 122 123 17 57 58 62 59 58 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 57 58 65 55 58 65 59 62 53 56 58 60 62 57 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 56 52 88 124 112 123 118 57 107 118 80 109 75 108 76 122 123 104 107 118 122 47 89 108 107 112 121 72 123 108 117 106 112 118 117 108 122 48 53 122 123 17 57 58 59 59 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 55 61 52 56 56 91 57 58 65 56 58 65 56 64 53 60 56 64 61 57 61 52 55 58 65 55 55 17 54 111 118 116 108 54 115 124 106 112 104 117 118 54 109 112 124 105 104 54 112 117 110 122 118 109 123 56 54 106 124 112 122 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 52 62 61 59 56 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 56 106 57 55 57 61 52 57 107 118 87 104 121 106 112 104 115 52 80 117 110 90 118 109 123 56 52 90 118 115 124 106 112 118 117 52 57 57 52 88 124 112 123 118 58 108 121 80 109 75 108 76 122 123 104 107 118 122 47 76 127 119 118 122 112 106 112 118 117 90 104 117 112 123 104 121 112 104 48 53 122 123 17 57 59 64 61 55 17 52 52 52 52 52 52 52 52 52 52 17 17))!