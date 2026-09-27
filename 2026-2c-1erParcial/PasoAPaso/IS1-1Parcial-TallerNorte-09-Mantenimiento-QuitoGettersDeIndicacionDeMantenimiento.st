!classDefinition: #IndicacionDeMantenimientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #IndicacionDeMantenimientoDelTaller
	instanceVariableNames: 'intervencion cantidadDeVisitas duracionDeVisita'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:53 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas: unaCantidadDeVisitas

	cantidadDeVisitas := unaCantidadDeVisitas! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:52 pm (UTC)'!
!methodProperties: {}!
intervencion: unaIntervencion

	intervencion := unaIntervencion! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:54 pm (UTC)'!
!methodProperties: {}!
duracionDeVisita: unaDuracion

	duracionDeVisita := unaDuracion! !


!IndicacionDeMantenimientoDelTaller methodsFor: 'testing' stamp: 'LL 19/Sep/2026, 9:52:09 pm (UTC)'!
!methodProperties: {}!
duracionDeLaVisitaEs: unaDuracionEsperada

	^duracionDeVisita = unaDuracionEsperada! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'testing' stamp: 'LL 19/Sep/2026, 9:50:35 pm (UTC)'!
!methodProperties: {}!
esInspeccion

	^intervencion isKindOf: Inspeccion! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'testing' stamp: 'LL 19/Sep/2026, 9:50:43 pm (UTC)'!
!methodProperties: {}!
esReacondicionamiento

	^intervencion isKindOf: Reacondicionamiento! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'testing' stamp: 'LL 19/Sep/2026, 9:51:51 pm (UTC)'!
!methodProperties: {}!
visitasIndicadasEs: unaCantidadEsperadaDeVisitas

	^cantidadDeVisitas = unaCantidadEsperadaDeVisitas! !


!classDefinition: #Intervencion category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #Intervencion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!Intervencion methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionParaCintaTransportadora: unaCintaTransportadora

	self subclassResponsibility! !

!Intervencion methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionParaPrensa: unaPrensa

	self subclassResponsibility! !

!Intervencion methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionParaTorno: unTorno

	self subclassResponsibility! !


!classDefinition: #Inspeccion category: #'IS1-1Parcial-TallerNorte'!
Intervencion subclass: #Inspeccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!Inspeccion methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:48:48 pm (UTC)'!
!methodProperties: {}!
duracionParaCintaTransportadora: unaCintaTransportadora

	^self duracionDeReferencia! !

!Inspeccion methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:48:48 pm (UTC)'!
!methodProperties: {}!
duracionParaPrensa: unaPrensa

	^self duracionDeReferencia * 2! !

!Inspeccion methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:48:48 pm (UTC)'!
!methodProperties: {}!
duracionParaTorno: unTorno

	^self duracionDeReferencia * (3 / 2)! !

!Inspeccion methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 5:00:00 pm (UTC)'!
!methodProperties: {}!
duracionDeReferencia

	^40 * minute! !


!classDefinition: #Reacondicionamiento category: #'IS1-1Parcial-TallerNorte'!
Intervencion subclass: #Reacondicionamiento
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!Reacondicionamiento methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:40:42 pm (UTC)'!
!methodProperties: {}!
duracionParaCintaTransportadora: unaCintaTransportadora

	^unaCintaTransportadora cantidadDePiezas * (15 * minute)! !

!Reacondicionamiento methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:40:44 pm (UTC)'!
!methodProperties: {}!
duracionParaPrensa: unaPrensa

	^unaPrensa cantidadDePiezas * (50 * minute)! !

!Reacondicionamiento methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:40:43 pm (UTC)'!
!methodProperties: {}!
duracionParaTorno: unTorno

	^unTorno cantidadDePiezas * (30 * minute)! !


!classDefinition: #MaquinaDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #MaquinaDelTaller
	instanceVariableNames: 'nombre tipo cantidadDePiezas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!MaquinaDelTaller methodsFor: 'duracion' stamp: 'LL 20/Sep/2026, 4:05:13 pm (UTC)'!
!methodProperties: {}!
cantidadDePiezas

	^cantidadDePiezas! !

!MaquinaDelTaller methodsFor: 'acceso' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
tipo

	^tipo! !


!MaquinaDelTaller methodsFor: 'inicializacion' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
inicializarConNombre: unNombre deTipo: unTipo conCantidadDePiezas: unaCantidadDePiezas

	nombre := unNombre.
	tipo := unTipo.
	cantidadDePiezas := unaCantidadDePiezas! !


!MaquinaDelTaller methodsFor: 'impresion' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
printOn: unFlujo

	unFlujo nextPutAll: 'Máquina llamada '; nextPutAll: nombre! !


!MaquinaDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 8:54:53 pm (UTC)'!
!methodProperties: {}!
duracionDe: unaIntervencion

	self subclassResponsibility! !

!MaquinaDelTaller methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 5:00:00 pm (UTC)'!
!methodProperties: {}!
duracionDeReferencia

	^40 * minute! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MaquinaDelTaller class' category: #'IS1-1Parcial-TallerNorte'!
MaquinaDelTaller class
	instanceVariableNames: ''!

!MaquinaDelTaller class methodsFor: 'creacion de instancias' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
conNombre: unNombre deTipo: unTipo conCantidadDePiezas: unaCantidadDePiezas

	^self new inicializarConNombre: unNombre deTipo: unTipo conCantidadDePiezas: unaCantidadDePiezas! !


!classDefinition: #CintaTransportadora category: #'IS1-1Parcial-TallerNorte'!
MaquinaDelTaller subclass: #CintaTransportadora
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!CintaTransportadora methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionDe: unaIntervencion

	^unaIntervencion duracionParaCintaTransportadora: self! !


!classDefinition: #Prensa category: #'IS1-1Parcial-TallerNorte'!
MaquinaDelTaller subclass: #Prensa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!Prensa methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionDe: unaIntervencion

	^unaIntervencion duracionParaPrensa: self! !


!classDefinition: #Torno category: #'IS1-1Parcial-TallerNorte'!
MaquinaDelTaller subclass: #Torno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!Torno methodsFor: 'as yet unclassified' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
duracionDe: unaIntervencion

	^unaIntervencion duracionParaTorno: self! !


!classDefinition: #OperacionDeMaquina category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #OperacionDeMaquina
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!OperacionDeMaquina methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 8:41:08 pm (UTC)'!
!methodProperties: {}!
= otraOperacion

	^self class = otraOperacion class! !


!classDefinition: #OperacionEstandar category: #'IS1-1Parcial-TallerNorte'!
OperacionDeMaquina subclass: #OperacionEstandar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!OperacionEstandar methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 8:37:47 pm (UTC)'!
!methodProperties: {}!
desgasteProducido

	^15! !


!classDefinition: #OperacionIntensiva category: #'IS1-1Parcial-TallerNorte'!
OperacionDeMaquina subclass: #OperacionIntensiva
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!OperacionIntensiva methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 8:37:53 pm (UTC)'!
!methodProperties: {}!
desgasteProducido

	^40! !


!classDefinition: #RegistroDeMantenimientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #RegistroDeMantenimientoDelTaller
	instanceVariableNames: 'operacionesPorMaquina'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!RegistroDeMantenimientoDelTaller methodsFor: 'inicializacion' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
initialize

	super initialize.
	operacionesPorMaquina := Dictionary new! !


!RegistroDeMantenimientoDelTaller methodsFor: 'registro' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
operacionesDe: unaMaquina

	^operacionesPorMaquina at: unaMaquina ifAbsent: [ #() ]! !

!RegistroDeMantenimientoDelTaller methodsFor: 'registro' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
registrar: unaOperacion para: unaMaquina

	| operaciones |

	operaciones := operacionesPorMaquina at: unaMaquina ifAbsentPut: [ OrderedCollection new ].
	operaciones add: unaOperacion! !


!RegistroDeMantenimientoDelTaller methodsFor: 'desgaste' stamp: 'LL 19/Sep/2026, 8:35:26 pm (UTC)'!
!methodProperties: {}!
desgasteDe: unaMaquina

	| operaciones |

	operaciones := self operacionesDe: unaMaquina.
	
	^operaciones sum: [ :unaOperacion | self desgasteProducidoPor: unaOperacion ] ifEmpty: [ 0 ].! !

!RegistroDeMantenimientoDelTaller methodsFor: 'desgaste' stamp: 'LL 19/Sep/2026, 8:38:10 pm (UTC)'!
!methodProperties: {}!
desgasteProducidoPor: unaOperacion

	^unaOperacion desgasteProducido! !


!RegistroDeMantenimientoDelTaller methodsFor: 'mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
mantenimientoDe: unaMaquina siNoHay: unBloqueSiNoHay

	| desgasteAcumulado regla |

	desgasteAcumulado := self desgasteDe: unaMaquina.
	regla := ReglaDeMantenimientoDelTaller para: desgasteAcumulado siNoHay: [ ^unBloqueSiNoHay value ].
	^regla crearIndicacionPara: unaMaquina! !


!classDefinition: #ReglaDeMantenimientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #ReglaDeMantenimientoDelTaller
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!ReglaDeMantenimientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas

	self subclassResponsibility! !

!ReglaDeMantenimientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'LL 19/Sep/2026, 9:08:16 pm (UTC)'!
!methodProperties: {}!
crearIndicacionPara: unaMaquina

	| duracion indicacion |

	duracion := unaMaquina duracionDe: self intervencion.

	indicacion := IndicacionDeMantenimientoDelTaller new.
	indicacion intervencion: self intervencion.
	indicacion cantidadDeVisitas: self cantidadDeVisitas.
	indicacion duracionDeVisita: duracion.

	^indicacion! !

!ReglaDeMantenimientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
intervencion

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReglaDeMantenimientoDelTaller class' category: #'IS1-1Parcial-TallerNorte'!
ReglaDeMantenimientoDelTaller class
	instanceVariableNames: ''!

!ReglaDeMantenimientoDelTaller class methodsFor: 'consultas' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
esPara: desgasteAcumulado

	self subclassResponsibility! !


!ReglaDeMantenimientoDelTaller class methodsFor: 'creacion de instancias' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
para: desgasteAcumulado siNoHay: unBloqueSiNoHay

	^self subclasses
		detect: [ :unaClaseDeRegla | unaClaseDeRegla esPara: desgasteAcumulado ]
		ifFound: [ :unaClaseDeRegla | unaClaseDeRegla new ]
		ifNone: unBloqueSiNoHay! !


!classDefinition: #ReglaDeInspeccionDelTaller category: #'IS1-1Parcial-TallerNorte'!
ReglaDeMantenimientoDelTaller subclass: #ReglaDeInspeccionDelTaller
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!ReglaDeInspeccionDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas

	^1! !

!ReglaDeInspeccionDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'LL 19/Sep/2026, 9:15:27 pm (UTC)'!
!methodProperties: {}!
intervencion

	^Inspeccion new! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReglaDeInspeccionDelTaller class' category: #'IS1-1Parcial-TallerNorte'!
ReglaDeInspeccionDelTaller class
	instanceVariableNames: ''!

!ReglaDeInspeccionDelTaller class methodsFor: 'consultas' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
esPara: desgasteAcumulado

	^desgasteAcumulado between: 60 and: 100! !


!classDefinition: #ReglaDeReacondicionamientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
ReglaDeMantenimientoDelTaller subclass: #ReglaDeReacondicionamientoDelTaller
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!ReglaDeReacondicionamientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas

	^2! !

!ReglaDeReacondicionamientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'LL 19/Sep/2026, 9:15:33 pm (UTC)'!
!methodProperties: {}!
intervencion

	^Reacondicionamiento new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReglaDeReacondicionamientoDelTaller class' category: #'IS1-1Parcial-TallerNorte'!
ReglaDeReacondicionamientoDelTaller class
	instanceVariableNames: ''!

!ReglaDeReacondicionamientoDelTaller class methodsFor: 'consultas' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
esPara: desgasteAcumulado

	^desgasteAcumulado > 100! !


!classDefinition: #TestMantenimientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
TestCase subclass: #TestMantenimientoDelTaller
	instanceVariableNames: 'cintaTransportadora torno prensa registroDeMantenimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!TestMantenimientoDelTaller methodsFor: 'preparacion/limpieza' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
setUp

	cintaTransportadora := CintaTransportadora conNombre: 'Cinta transportadora de despacho' deTipo: #CintaTransportadora conCantidadDePiezas: 1.
	torno := Torno conNombre: 'Torno principal' deTipo: #Torno conCantidadDePiezas: 1.
	prensa := Prensa conNombre: 'Prensa hidráulica' deTipo: #Prensa conCantidadDePiezas: 1! !


!TestMantenimientoDelTaller methodsFor: 'objetos de prueba' stamp: 'LL 19/Sep/2026, 8:40:10 pm (UTC)'!
!methodProperties: {}!
operacionEstandar

	^OperacionEstandar new! !

!TestMantenimientoDelTaller methodsFor: 'objetos de prueba' stamp: 'LL 19/Sep/2026, 8:40:23 pm (UTC)'!
!methodProperties: {}!
operacionIntensiva

	^OperacionIntensiva new! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'LL 19/Sep/2026, 8:31:05 pm (UTC)'!
!methodProperties: {}!
test01ElRegistroNuevoNoTieneOperaciones

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.

	self assert: 0 operacionesRegistradasEn: cintaTransportadora de: self operacionIntensiva.! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'LL 19/Sep/2026, 8:31:05 pm (UTC)'!
!methodProperties: {}!
test02SePuedenConsultarLasOperacionesDeUnaMaquina

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	
	self assert: 1 operacionesRegistradasEn: cintaTransportadora de: self operacionIntensiva.! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'LL 19/Sep/2026, 8:31:05 pm (UTC)'!
!methodProperties: {}!
test03LasOperacionesSeDistinguenPorMaquinaInclusoSiSonDelMismoTipo

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.

	self assert: 2 operacionesRegistradasEn: cintaTransportadora de: self operacionIntensiva.! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - desgaste' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
test04ElDesgasteEsCeroParaUnaMaquinaSinOperaciones

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.

	self assert: 0 equals: (registroDeMantenimiento desgasteDe: cintaTransportadora)! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - desgaste' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
test05UnaOperacionEstandarAgrega15PuntosDeDesgaste

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	self assert: 15 equals: (registroDeMantenimiento desgasteDe: cintaTransportadora)! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - desgaste' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
test06UnaOperacionIntensivaAgrega40PuntosDeDesgaste

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.

	self assert: 40 equals: (registroDeMantenimiento desgasteDe: cintaTransportadora)! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - desgaste' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
test07ElDesgasteEsLaSumaDeTodasLasOperacionesRegistradas

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	self assert: 40+15 equals: (registroDeMantenimiento desgasteDe: cintaTransportadora)! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 19/Sep/2026, 3:47:42 pm (UTC)'!
!methodProperties: {}!
test08NoSeIndicaMantenimientoSinOperaciones

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.

	registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ ^self ].

	self fail.! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 19/Sep/2026, 3:47:19 pm (UTC)'!
!methodProperties: {}!
test09PorDebajoDe60PuntosDeDesgasteNoCorrespondeMantenimiento	

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ ^self ].

	self fail.! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:14:51 pm (UTC)'!
!methodProperties: {}!
test10Exactamente60PuntosDeDesgasteRequierenInspeccion

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	4 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaInspeccionPara: cintaTransportadora! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:15:03 pm (UTC)'!
!methodProperties: {}!
test11Exactamente100PuntosDeDesgasteTodaviaRequierenInspeccion

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	4 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaInspeccionPara: cintaTransportadora! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:15:25 pm (UTC)'!
!methodProperties: {}!
test12MasDe100PuntosDeDesgasteRequierenReacondicionamientoSinCambiarElRegistro

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	7 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaReacondicionamientoPara: cintaTransportadora! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
test13LaInspeccionRequiere1Visita

	| indicacion |

	indicacion := self indicacionDeInspeccionPara: cintaTransportadora.

	self assert: (indicacion visitasIndicadasEs: 1)! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:28:37 pm (UTC)'!
!methodProperties: {}!
test14LaVisitaDeInspeccionDeUnaCintaTransportadoraDura40Minutos

	self assertVisitaDeInspeccionDe: cintaTransportadora dura: 40 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:29:29 pm (UTC)'!
!methodProperties: {}!
test15LaVisitaDeInspeccionDeUnTornoDura60Minutos

	self assertVisitaDeInspeccionDe: torno dura: 60 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:29:41 pm (UTC)'!
!methodProperties: {}!
test16LaVisitaDeInspeccionDeUnaPrensaDura80Minutos

	self assertVisitaDeInspeccionDe: prensa dura: 80 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'IS1 20/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
test17ElReacondicionamientoRequiere2Visitas

	| indicacion |

	indicacion := self indicacionDeReacondicionamientoPara: cintaTransportadora.

	self assert: (indicacion visitasIndicadasEs: 2)! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:30:07 pm (UTC)'!
!methodProperties: {}!
test18LaVisitaDeReacondicionamientoDeUnaCintaTransportadoraDeUnaPiezaDura15Minutos

	self assertVisitaDeReacondicionamientoDe: cintaTransportadora dura: 15 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:30:17 pm (UTC)'!
!methodProperties: {}!
test19LaVisitaDeReacondicionamientoDeUnTornoDeUnaPiezaDura30Minutos

	self assertVisitaDeReacondicionamientoDe: torno dura: 30 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:30:26 pm (UTC)'!
!methodProperties: {}!
test20LaVisitaDeReacondicionamientoDeUnaPrensaDeUnaPiezaDura50Minutos

	self assertVisitaDeReacondicionamientoDe: prensa dura: 50 * minute! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 27/Sep/2026, 3:31:02 pm (UTC)'!
!methodProperties: {}!
test21LaVisitaDeReacondicionamientoDuraSegunLaCantidadDePiezas

	| cintaTransportadoraDeDosPiezas |

	cintaTransportadoraDeDosPiezas := CintaTransportadora conNombre: 'Cinta transportadora auxiliar' deTipo: #CintaTransportadora conCantidadDePiezas: 2.

	self assertVisitaDeReacondicionamientoDe: cintaTransportadoraDeDosPiezas dura: 15 * minute * 2! !


!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'LL 19/Sep/2026, 8:31:05 pm (UTC)'!
!methodProperties: {}!
assert: unaCantidadDeOperaciones operacionesRegistradasEn: unaMaquina de: operacionEsperada

	| operaciones |
	operaciones := registroDeMantenimiento operacionesDe: unaMaquina.
	self assert: unaCantidadDeOperaciones equals: operaciones size.
	self assert: unaCantidadDeOperaciones equals: (operaciones count: [ :unaOperacion | unaOperacion = operacionEsperada]).! !

!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'LL 20/Sep/2026, 4:13:59 pm (UTC)'!
!methodProperties: {}!
assertMantenimientoIndicaInspeccionPara: unaMaquina

	| indicacion |
	indicacion := registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ].

	self assert: indicacion esInspeccion.
	! !

!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'LL 20/Sep/2026, 4:14:12 pm (UTC)'!
!methodProperties: {}!
assertMantenimientoIndicaReacondicionamientoPara: unaMaquina

	| indicacion |
	indicacion := registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ].

	self assert: indicacion esReacondicionamiento.
	! !


!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'IS1 27/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
assertVisitaDeInspeccionDe: unaMaquina dura: unaDuracionEsperada

	| indicacion |

	indicacion := self indicacionDeInspeccionPara: unaMaquina.

	self assert: (indicacion duracionDeLaVisitaEs: unaDuracionEsperada)! !

!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'IS1 27/Sep/2026, 4:00:00 pm (UTC)'!
!methodProperties: {}!
assertVisitaDeReacondicionamientoDe: unaMaquina dura: unaDuracionEsperada

	| indicacion |

	indicacion := self indicacionDeReacondicionamientoPara: unaMaquina.

	self assert: (indicacion duracionDeLaVisitaEs: unaDuracionEsperada)! !


!TestMantenimientoDelTaller methodsFor: 'preparacion de indicaciones' stamp: 'LL 20/Sep/2026, 4:10:07 pm (UTC)'!
!methodProperties: {}!
indicacionDeInspeccionPara: unaMaquina

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: unaMaquina.
	2 timesRepeat: [	registroDeMantenimiento registrar: self operacionEstandar para: unaMaquina ].

	^registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ]! !

!TestMantenimientoDelTaller methodsFor: 'preparacion de indicaciones' stamp: 'LL 20/Sep/2026, 4:10:11 pm (UTC)'!
!methodProperties: {}!
indicacionDeReacondicionamientoPara: unaMaquina

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	2 timesRepeat: [ registroDeMantenimiento registrar: self operacionIntensiva para: unaMaquina ].
	2 timesRepeat: [	registroDeMantenimiento registrar: self operacionEstandar para: unaMaquina ].

	^registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ]! !
