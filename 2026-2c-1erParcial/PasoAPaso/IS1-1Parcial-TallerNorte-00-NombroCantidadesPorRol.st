!classDefinition: #IndicacionDeMantenimientoDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #IndicacionDeMantenimientoDelTaller
	instanceVariableNames: 'intervencion cantidadDeVisitas duracionDeVisita'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!IndicacionDeMantenimientoDelTaller methodsFor: 'acceso' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas

	^cantidadDeVisitas! !


!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:53 pm (UTC)'!
!methodProperties: {}!
cantidadDeVisitas: unaCantidadDeVisitas

	cantidadDeVisitas := unaCantidadDeVisitas! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:30:57 pm (UTC)'!
!methodProperties: {}!
duracionDeVisita

	^duracionDeVisita! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 20/Sep/2026, 5:30:59 pm (UTC)'!
!methodProperties: {}!
duracionDeVisita: unaDuracion

	duracionDeVisita := unaDuracion! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:50 pm (UTC)'!
!methodProperties: {}!
intervencion

	^intervencion! !

!IndicacionDeMantenimientoDelTaller methodsFor: 'as yet unclassified' stamp: 'LL 19/Sep/2026, 7:06:52 pm (UTC)'!
!methodProperties: {}!
intervencion: unaIntervencion

	intervencion := unaIntervencion! !


!classDefinition: #MaquinaDelTaller category: #'IS1-1Parcial-TallerNorte'!
Object subclass: #MaquinaDelTaller
	instanceVariableNames: 'nombre tipo cantidadDePiezas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-1Parcial-TallerNorte'!

!MaquinaDelTaller methodsFor: 'acceso' stamp: 'IS1 19/Sep/2026, 8:00:00 pm (UTC)'!
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MaquinaDelTaller class' category: #'IS1-1Parcial-TallerNorte'!
MaquinaDelTaller class
	instanceVariableNames: ''!

!MaquinaDelTaller class methodsFor: 'creacion de instancias' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
conNombre: unNombre deTipo: unTipo conCantidadDePiezas: unaCantidadDePiezas

	^self new inicializarConNombre: unNombre deTipo: unTipo conCantidadDePiezas: unaCantidadDePiezas! !


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


!RegistroDeMantenimientoDelTaller methodsFor: 'desgaste' stamp: 'LL 19/Sep/2026, 6:58:00 pm (UTC)'!
!methodProperties: {}!
desgasteDe: unaMaquina

	| operaciones desgasteTotal indice |

	operaciones := self operacionesDe: unaMaquina.
	desgasteTotal := 0.
	indice := 1.

	[ indice <= operaciones size ] whileTrue: [
		desgasteTotal := desgasteTotal + (self desgasteProducidoPor: (operaciones at: indice)).
		indice := indice + 1 ].

	^desgasteTotal! !

!RegistroDeMantenimientoDelTaller methodsFor: 'desgaste' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
desgasteProducidoPor: unaOperacion

	unaOperacion = #Estandar ifTrue: [ ^15 ].
	unaOperacion = #Intensiva ifTrue: [ ^40 ].

	self error: 'Tipo de operación inválido'! !


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

!ReglaDeMantenimientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
crearIndicacionPara: unaMaquina

	self subclassResponsibility! !

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

!ReglaDeInspeccionDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'LL 20/Sep/2026, 5:37:34 pm (UTC)'!
!methodProperties: {}!
crearIndicacionPara: unaMaquina

	| minutos indicacion |

	unaMaquina tipo = #CintaTransportadora ifTrue: [ minutos := self minutosDeReferencia ].
	unaMaquina tipo = #Torno ifTrue: [ minutos := self minutosDeReferencia * 3 / 2 ].
	unaMaquina tipo = #Prensa ifTrue: [ minutos := self minutosDeReferencia * 2 ].

	indicacion := IndicacionDeMantenimientoDelTaller new.
	indicacion intervencion: self intervencion.
	indicacion cantidadDeVisitas: self cantidadDeVisitas.
	indicacion duracionDeVisita: minutos * minute.

	^indicacion! !

!ReglaDeInspeccionDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
intervencion

	^#Inspeccion! !


!ReglaDeInspeccionDelTaller methodsFor: 'duracion' stamp: 'LL 20/Sep/2026, 5:37:34 pm (UTC)'!
!methodProperties: {}!
minutosDeReferencia

	^40! !

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

!ReglaDeReacondicionamientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'LL 20/Sep/2026, 5:31:04 pm (UTC)'!
!methodProperties: {}!
crearIndicacionPara: unaMaquina

	| duracion indicacion |

	unaMaquina tipo = #CintaTransportadora ifTrue: [ duracion := unaMaquina cantidadDePiezas * (15 * minute) ].
	unaMaquina tipo = #Torno ifTrue: [ duracion := unaMaquina cantidadDePiezas * (30 * minute) ].
	unaMaquina tipo = #Prensa ifTrue: [ duracion := unaMaquina cantidadDePiezas * (50 * minute) ].

	indicacion := IndicacionDeMantenimientoDelTaller new.
	indicacion intervencion: self intervencion.
	indicacion cantidadDeVisitas: self cantidadDeVisitas.
	indicacion duracionDeVisita: duracion.

	^indicacion! !

!ReglaDeReacondicionamientoDelTaller methodsFor: 'indicacion de mantenimiento' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
intervencion

	^#Reacondicionamiento! !

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

!TestMantenimientoDelTaller methodsFor: 'preparacion/limpieza' stamp: 'LL 20/Sep/2026, 3:22:21 pm (UTC)'!
!methodProperties: {}!
setUp

	cintaTransportadora := MaquinaDelTaller conNombre: 'Cinta transportadora de despacho' deTipo: #CintaTransportadora conCantidadDePiezas: 1.
	torno := MaquinaDelTaller conNombre: 'Torno principal' deTipo: #Torno conCantidadDePiezas: 1.
	prensa := MaquinaDelTaller conNombre: 'Prensa hidráulica' deTipo: #Prensa conCantidadDePiezas: 1! !


!TestMantenimientoDelTaller methodsFor: 'objetos de prueba' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
operacionEstandar

	^#Estandar! !

!TestMantenimientoDelTaller methodsFor: 'objetos de prueba' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
operacionIntensiva

	^#Intensiva! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
test01ElRegistroNuevoNoTieneOperaciones

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.

	self assert: (registroDeMantenimiento operacionesDe: cintaTransportadora) isEmpty! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'IS1 19/Sep/2026, 3:00:00 pm (UTC)'!
!methodProperties: {}!
test02SePuedenConsultarLasOperacionesDeUnaMaquina

	| operaciones |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.

	operaciones := registroDeMantenimiento operacionesDe: cintaTransportadora.
	self assert: 1 equals: operaciones size.
	self assert: 1 equals: (operaciones count: [ :unaOperacion | unaOperacion = self operacionIntensiva ])! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - registro' stamp: 'LL 20/Sep/2026, 3:26:19 pm (UTC)'!
!methodProperties: {}!
test03LasOperacionesSeDistinguenPorMaquinaInclusoSiSonDelMismoTipo

	| operacionesDeLaCintaTransportadora |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.

	operacionesDeLaCintaTransportadora := registroDeMantenimiento operacionesDe: cintaTransportadora.
	
	self assert: 2 equals: operacionesDeLaCintaTransportadora size.
	self assert: 2 equals: (operacionesDeLaCintaTransportadora count: [ :unaOperacion | unaOperacion = self operacionIntensiva ]).! !


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

!TestMantenimientoDelTaller methodsFor: 'pruebas - desgaste' stamp: 'LL 20/Sep/2026, 3:30:15 pm (UTC)'!
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

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:21:10 pm (UTC)'!
!methodProperties: {}!
test10Exactamente60PuntosDeDesgasteRequierenInspeccion

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	4 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaInspeccionPara: cintaTransportadora! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:21:20 pm (UTC)'!
!methodProperties: {}!
test11Exactamente100PuntosDeDesgasteTodaviaRequierenInspeccion

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	4 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaInspeccionPara: cintaTransportadora! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - limites de mantenimiento' stamp: 'LL 20/Sep/2026, 4:21:37 pm (UTC)'!
!methodProperties: {}!
test12MasDe100PuntosDeDesgasteRequierenReacondicionamientoSinCambiarElRegistro

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	7 timesRepeat: [ registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora ].

	self assertMantenimientoIndicaReacondicionamientoPara: cintaTransportadora! !


!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 3:43:31 pm (UTC)'!
!methodProperties: {}!
test13LaInspeccionRequiere1Visita

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	indicacion := registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ self fail ].

	self assert: 1 equals: indicacion cantidadDeVisitas! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:36:15 pm (UTC)'!
!methodProperties: {}!
test14LaVisitaDeInspeccionDeUnaCintaTransportadoraDura40Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	indicacion := registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ self fail ].

	self assert: 40 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:36:11 pm (UTC)'!
!methodProperties: {}!
test15LaVisitaDeInspeccionDeUnTornoDura60Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: torno.
	registroDeMantenimiento registrar: self operacionEstandar para: torno.
	registroDeMantenimiento registrar: self operacionEstandar para: torno.

	indicacion := registroDeMantenimiento mantenimientoDe: torno siNoHay: [ self fail ].

	self assert: 60 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:36:03 pm (UTC)'!
!methodProperties: {}!
test16LaVisitaDeInspeccionDeUnaPrensaDura80Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: prensa.
	registroDeMantenimiento registrar: self operacionEstandar para: prensa.
	registroDeMantenimiento registrar: self operacionEstandar para: prensa.

	indicacion := registroDeMantenimiento mantenimientoDe: prensa siNoHay: [ self fail ].

	self assert: 80 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 3:43:26 pm (UTC)'!
!methodProperties: {}!
test17ElReacondicionamientoRequiere2Visitas

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	indicacion := registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ self fail ].

	self assert: 2 equals: indicacion cantidadDeVisitas! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:31:10 pm (UTC)'!
!methodProperties: {}!
test18LaVisitaDeReacondicionamientoDeUnaCintaTransportadoraDeUnaPiezaDura15Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadora.

	indicacion := registroDeMantenimiento mantenimientoDe: cintaTransportadora siNoHay: [ self fail ].

	self assert: 15 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:31:10 pm (UTC)'!
!methodProperties: {}!
test19LaVisitaDeReacondicionamientoDeUnTornoDeUnaPiezaDura30Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: torno.
	registroDeMantenimiento registrar: self operacionIntensiva para: torno.
	registroDeMantenimiento registrar: self operacionEstandar para: torno.
	registroDeMantenimiento registrar: self operacionEstandar para: torno.

	indicacion := registroDeMantenimiento mantenimientoDe: torno siNoHay: [ self fail ].

	self assert: 30 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:31:10 pm (UTC)'!
!methodProperties: {}!
test20LaVisitaDeReacondicionamientoDeUnaPrensaDeUnaPiezaDura50Minutos

	| indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	registroDeMantenimiento registrar: self operacionIntensiva para: prensa.
	registroDeMantenimiento registrar: self operacionIntensiva para: prensa.
	registroDeMantenimiento registrar: self operacionEstandar para: prensa.
	registroDeMantenimiento registrar: self operacionEstandar para: prensa.

	indicacion := registroDeMantenimiento mantenimientoDe: prensa siNoHay: [ self fail ].

	self assert: 50 * minute equals: indicacion duracionDeVisita! !

!TestMantenimientoDelTaller methodsFor: 'pruebas - indicaciones de mantenimiento' stamp: 'LL 20/Sep/2026, 5:31:10 pm (UTC)'!
!methodProperties: {}!
test21LaVisitaDeReacondicionamientoDuraSegunLaCantidadDePiezas

	| cintaTransportadoraDeDosPiezas indicacion |

	registroDeMantenimiento := RegistroDeMantenimientoDelTaller new.
	cintaTransportadoraDeDosPiezas := MaquinaDelTaller conNombre: 'Cinta transportadora auxiliar' deTipo: #CintaTransportadora conCantidadDePiezas: 2.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadoraDeDosPiezas.
	registroDeMantenimiento registrar: self operacionIntensiva para: cintaTransportadoraDeDosPiezas.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadoraDeDosPiezas.
	registroDeMantenimiento registrar: self operacionEstandar para: cintaTransportadoraDeDosPiezas.

	indicacion := registroDeMantenimiento mantenimientoDe: cintaTransportadoraDeDosPiezas siNoHay: [ self fail ].

	self assert: 15 * minute * 2 equals: indicacion duracionDeVisita! !


!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'LL 20/Sep/2026, 4:20:33 pm (UTC)'!
!methodProperties: {}!
assertMantenimientoIndicaInspeccionPara: unaMaquina

	| indicacion |
	indicacion := registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ].

	self assert: #Inspeccion equals: indicacion intervencion.
	! !

!TestMantenimientoDelTaller methodsFor: 'assertions' stamp: 'LL 20/Sep/2026, 4:20:44 pm (UTC)'!
!methodProperties: {}!
assertMantenimientoIndicaReacondicionamientoPara: unaMaquina

	| indicacion |
	indicacion := registroDeMantenimiento mantenimientoDe: unaMaquina siNoHay: [ self fail ].

	self assert: #Reacondicionamiento equals: indicacion intervencion.
	! !
