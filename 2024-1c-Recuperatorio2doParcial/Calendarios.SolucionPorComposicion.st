!classDefinition: #CalendariosTest category: #Calendarios!
TestCase subclass: #CalendariosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendariosTest methodsFor: 'assertions' stamp: 'JMB 5/29/2024 20:21:40'!
assertUnCalendarioIndividualCon: eventos estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	eventos do: [ : unEvento | calendario agregarEvento: unEvento ].
	
	self assert: (calendario estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal) ! !

!CalendariosTest methodsFor: 'assertions' stamp: 'JMB 5/29/2024 20:25:58'!
assertUnCalendarioIndividualCon: eventos estaOcupadoEl: unaFecha de: unHorarioInicial a: unHorarioFinal
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	eventos do: [ : unEvento | calendario agregarEvento: unEvento ].
	
	self deny: (calendario estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal) ! !


!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/29/2024 20:23:16'!
test01CalendariosIndividualesSinEventosEstanLibresEnCualquierMomento
	
	self assertUnCalendarioIndividualCon: {} estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00
	! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:34:35'!
test02CalendariosIndividualesNoEstanLibresEnLosLapsosDeSusEventosPorUnDia
	
	self 
		assertUnCalendarioIndividualCon: {(EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00)} 		estaOcupadoEl: March / 15 /2024 de: 10:00 a: 11:00! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:43:08'!
test03CalendariosIndividualesEstanLibresEnLosDiasDiferentesALosDeSusEventosPorUnDia
	
	self 
		assertUnCalendarioIndividualCon: {(EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00)} 
		estaLibreEl: March / 14 /2024 de: 10:00 a: 11:00! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:34:58'!
test04CalendariosIndividualesEstanLibresEnHorariosAnterioresALosDeSusEventosPorUnDia
	
	self 
		assertUnCalendarioIndividualCon: { (EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00) }
	  	estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00 ! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:35:10'!
test05CalendariosIndividualesEstanLibresEnHorariosPosterioresALosDeSusEventosPorUnDia
	
	self 
		assertUnCalendarioIndividualCon: {	(EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a: 11:00)}
		estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:35:33'!
test06CalendariosIndividualesPuedenSerOcupadosPorMultiplesEventos
	
	self 
		assertUnCalendarioIndividualCon:  {
			(EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00).
			(EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 11:00 a:  12:00)
		} estaOcupadoEl:  March / 15 /2024 de: 10:00 a: 11:00 ! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:33:53'!
test07CalendariosIndividualesNoEstanLibresEnLasPrimerasOcurrenciasDeSusEventosRecurrentes
	
	self 
		assertUnCalendarioIndividualCon: { 
			EventoDeCalendario recurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 
		} estaOcupadoEl: March / 15 /2024 de: 10:00 a: 11:00! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:33:53'!
test08CalendariosIndividualesNoEstanLibresEnLasSucesivasOcurrenciasDeSusEventosRecurrentes
	
	self 
		assertUnCalendarioIndividualCon: {
			(EventoDeCalendario recurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024 )
		}  estaOcupadoEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00 ! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:33:53'!
test09CalendariosIndividualesEstanLibresEnLasOcurrenciasPosterioresALaFinalizacionDeSusEventosRecurrentes
	
	self 
		assertUnCalendarioIndividualCon:  {
			EventoDeCalendario recurrenteDesde: (March / 15 /2024) de: 10:00 a: 11:00  cada: 1*week hasta: March / 21 /2024 
		} estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00 ! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:33:53'!
test10CalendariosIndividualesEstanLibresEnHorariosAnterioresALosDeSusDeSusEventosRecurrentes
	
	self 
		assertUnCalendarioIndividualCon: {
			EventoDeCalendario recurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024
		} estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00! !

!CalendariosTest methodsFor: 'testing - individuales' stamp: 'JMB 5/31/2024 20:33:53'!
test11CalendariosIndividualesEstanLibresEnHorariosPosterioresALosDeSusDeSusEventosRecurrentes
	
	self 
		assertUnCalendarioIndividualCon: {
			EventoDeCalendario recurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00  cada: 1*week hasta: April / 15 /2024
		} estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00! !


!CalendariosTest methodsFor: 'testing - grupales' stamp: 'JMB 5/26/2024 01:49:17'!
test12CalendariosGrupalesSinEventosEstanLibresEnCualquierMomento
	
	| calendario |
	calendario := CalendarioGrupal new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'testing - grupales' stamp: 'JMB 5/31/2024 20:36:33'!
test13CalendariosGrupalesConformadoPorUnCalendarioNoEstanLibresSiSuCalendarioNoLoEsta
	
	| calendario calendarioIndividual |
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	calendarioIndividual agregarEvento: (EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00).
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00)! !

!CalendariosTest methodsFor: 'testing - grupales' stamp: 'JMB 5/31/2024 20:36:55'!
test14CalendariosGrupalesConformadosPorVariosCalendariosNoEstanLibresCuandoAlMenosUnoDeEllosNoLoEsta
	
	| calendario calendarioIndividual otroCalendarioIndividual|
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	calendarioIndividual agregarEvento: (EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00).
	otroCalendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: otroCalendarioIndividual.
	otroCalendarioIndividual agregarEvento: (EventoDeCalendario porUnDiaPara: March / 20 /2024 de: 10:00 a:  11:00).
	
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00).
	self deny: (calendario estaLibreEl: March / 20 /2024 de: 10:00 a: 11:00)	! !

!CalendariosTest methodsFor: 'testing - grupales' stamp: 'JMB 5/31/2024 20:37:08'!
test15LosEventosAgregadosAlCalendarioGrupalSonAgregadosASusCalendarios
	
	| calendario calendarioIndividual |
	calendario := CalendarioGrupal new.
	calendarioIndividual := CalendarioIndividual new.
	calendario agregarCalendario: calendarioIndividual.
	
	calendario agregarEvento: (EventoDeCalendario porUnDiaPara: March / 15 /2024 de: 10:00 a:  11:00).
	
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
	instanceVariableNames: 'horarioInicial horarioFinal fechas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoDeCalendario methodsFor: 'initialization' stamp: 'JMB 5/31/2024 20:06:30'!
initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	fechas := unaFechaInicial to: unaFechaFinal by: unaFrecuencia. 
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal.! !


!EventoDeCalendario methodsFor: 'testing' stamp: 'JMB 5/25/2024 22:20:07'!
seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ (fechas includes: unaFecha) and: [ horarioInicial < unHorarioFinal ] and: [ horarioFinal > unHorarioInicial ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoDeCalendario class' category: #Calendarios!
EventoDeCalendario class
	instanceVariableNames: ''!

!EventoDeCalendario class methodsFor: 'instance creation' stamp: 'JMB 5/31/2024 20:33:53'!
porUnDiaPara: unaFecha de: unHorarioInicial a: unHorarioFinal  
	^self recurrenteDesde: unaFecha de: unHorarioInicial a: unHorarioFinal cada: 1*day hasta: unaFecha! !

!EventoDeCalendario class methodsFor: 'instance creation' stamp: 'JMB 5/31/2024 20:33:53'!
recurrenteDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	^self new initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal ! !
