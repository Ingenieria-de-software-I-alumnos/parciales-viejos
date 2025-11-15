!classDefinition: #CalendariosTest category: #Calendarios!
TestCase subclass: #CalendariosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:27:38'!
test01CalendariosIndividualesSinEventosEstanLibresEnCualquierMomento
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:31:24'!
test02CalendariosIndividualesNoEstanLibresEnLosLapsosDeSusEventosPorUnDia
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:33:16'!
test03CalendariosIndividualesEstanLibresEnLosDiasDeferentesALosDeSusEventosPorUnDia
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self assert: (calendario estaLibreEl: March / 14 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:34:31'!
test04CalendariosIndividualesEstanLibresEnHorariosAnterioresALosDeSusEventosPorUnDia
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:34:57'!
test05CalendariosIndividualesEstanLibresEnHorariosPosterioresALosDeSusEventosPorUnDia
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 00:35:50'!
test06CalendariosIndividualesPuedenSerOcupadosPorMultiplesEventos
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 11:00 a: 12:00).
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:17:22'!
test07CalendariosIndividualesNoEstanLibresEnLasPrimerasOcurrenciasDeSusEventosRecurrentes
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoRecurrente desde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 ).
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:18:57'!
test08CalendariosIndividualesNoEstanLibresEnLasSucesivasOcurrenciasDeSusEventosRecurrentes
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoRecurrente desde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 ).
	
	self deny: (calendario estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:22:17'!
test09CalendariosIndividualesEstanLibresEnLasOcurrenciasPosterioresALaFinalizacionDeSusEventosRecurrentes
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoRecurrente desde: (March / 15 /2024) de: 10:00 a: 11:00  cada: 1*week hasta: March / 21 /2024 ).
	
	self assert: (calendario estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:43:46'!
test10CalendariosIndividualesEstanLibresEnHorariosAnterioresALosDeSusDeSusEventosRecurrentes
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoRecurrente desde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 ).
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:44:13'!
test11CalendariosIndividualesEstanLibresEnHorariosPosterioresALosDeSusDeSusEventosRecurrentes
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEvento: (EventoRecurrente desde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 ).
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:49:17'!
test12CalendariosGrupalesSinEventosEstanLibresEnCualquierMomento
	
	| calendario |
	calendario := CalendarioGrupal new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/29/2024 20:11:31'!
test13CalendariosGrupalesConformadoPorUnCalendarioNoEstanLibresSiSuCalendarioNoLoEsta
	
	| calendario calendarioIndividual |
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	calendarioIndividual agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00)! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/29/2024 20:12:09'!
test14CalendariosGrupalesConformadosPorVariosCalendariosNoEstanLibresCuandoAlMenosUnoDeEllosNoLoEsta
	
	| calendario calendarioIndividual otroCalendarioIndividual|
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	calendarioIndividual agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	otroCalendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: otroCalendarioIndividual.
	otroCalendarioIndividual agregarEvento: (EventoPorUnDia paraEl: March / 20 /2024 de: 10:00 a: 11:00).
	
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00).
	self deny: (calendario estaLibreEl: March / 20 /2024 de: 10:00 a: 11:00)	! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/26/2024 01:56:39'!
test15LosEventosAgregadosAlCalendarioGrupalSonAgregadosASusCalendarios
	
	| calendario calendarioIndividual |
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	
	calendario agregarEvento: (EventoPorUnDia paraEl: March / 15 /2024 de: 10:00 a: 11:00).
	
	self deny: (calendarioIndividual estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00).
	! !


!classDefinition: #Calendario category: #Calendarios!
Object subclass: #Calendario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!Calendario methodsFor: 'testing' stamp: 'JMB 5/26/2024 00:08:40'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal

	self subclassResponsibility! !


!Calendario methodsFor: 'eventos' stamp: 'JMB 5/26/2024 00:08:33'!
agregarEvento: unEventoDeCalendario

	self subclassResponsibility! !


!classDefinition: #CalendarioGrupal category: #Calendarios!
Calendario subclass: #CalendarioGrupal
	instanceVariableNames: 'calendarios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendarioGrupal methodsFor: 'initialization' stamp: 'JMB 5/25/2024 23:31:35'!
initialize
	super initialize.
	calendarios := Set new.! !


!CalendarioGrupal methodsFor: 'calendarios' stamp: 'JMB 5/26/2024 00:10:50'!
agregarCalendario: unCalendario 
	calendarios add: unCalendario! !


!CalendarioGrupal methodsFor: 'eventos' stamp: 'JMB 5/26/2024 00:04:18'!
agregarEvento: unEventoDeCalendario 
	calendarios do: [ : unCalendario | unCalendario agregarEvento:  unEventoDeCalendario ]! !


!CalendarioGrupal methodsFor: 'testing' stamp: 'JMB 5/25/2024 23:32:38'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ calendarios allSatisfy: [ : unCalendario |  unCalendario estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal  ]! !


!classDefinition: #CalendarioIndividual category: #Calendarios!
Calendario subclass: #CalendarioIndividual
	instanceVariableNames: 'eventos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendarioIndividual methodsFor: 'initialization' stamp: 'JMB 5/25/2024 00:44:58'!
initialize
	super initialize.
	eventos := OrderedCollection new.! !


!CalendarioIndividual methodsFor: 'eventos' stamp: 'JMB 5/26/2024 00:10:59'!
agregarEvento: unEventoDeCalendario
	eventos add: unEventoDeCalendario ! !


!CalendarioIndividual methodsFor: 'testing' stamp: 'JMB 5/25/2024 19:56:37'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ eventos allSatisfy: [ : unEvento | 
		(unEvento seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal) not 
	]! !


!classDefinition: #EventoDeCalendario category: #Calendarios!
Object subclass: #EventoDeCalendario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoDeCalendario methodsFor: 'testing' stamp: 'JMB 5/25/2024 19:48:48'!
seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal 
	self subclassResponsibility ! !


!classDefinition: #EventoPorUnDia category: #Calendarios!
EventoDeCalendario subclass: #EventoPorUnDia
	instanceVariableNames: 'fecha horarioInicial horarioFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoPorUnDia methodsFor: 'initialization' stamp: 'JMB 5/24/2024 23:53:45'!
initializeParaEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	fecha := unaFecha.
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal.! !


!EventoPorUnDia methodsFor: 'testing' stamp: 'JMB 5/25/2024 22:18:04'!
seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ fecha = unaFecha and: [ horarioInicial < unHorarioFinal ] and: [ horarioFinal > unHorarioInicial ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoPorUnDia class' category: #Calendarios!
EventoPorUnDia class
	instanceVariableNames: ''!

!EventoPorUnDia class methodsFor: 'instance creation' stamp: 'JMB 5/24/2024 23:52:10'!
paraEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^self new initializeParaEl: unaFecha de: unHorarioInicial a: unHorarioFinal ! !


!classDefinition: #EventoRecurrente category: #Calendarios!
EventoDeCalendario subclass: #EventoRecurrente
	instanceVariableNames: 'horarioInicial horarioFinal fechas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoRecurrente methodsFor: 'initialization' stamp: 'JMB 5/25/2024 02:47:10'!
initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	
	fechas := unaFechaInicial to: unaFechaFinal by: unaFrecuencia. 
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal.! !


!EventoRecurrente methodsFor: 'testing' stamp: 'JMB 5/25/2024 22:20:07'!
seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ (fechas includes: unaFecha) and: [ horarioInicial < unHorarioFinal ] and: [ horarioFinal > unHorarioInicial ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoRecurrente class' category: #Calendarios!
EventoRecurrente class
	instanceVariableNames: ''!

!EventoRecurrente class methodsFor: 'instance creation' stamp: 'JMB 5/25/2024 02:12:53'!
desde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	^self new initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal ! !
