!classDefinition: #CalendariosTest category: #Calendarios!
TestCase subclass: #CalendariosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test01
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test02
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test03
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 14 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test04
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test05
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test06
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	calendario agregarEventoEl: March / 15 /2024 de: 11:00 a: 12:00.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test07
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test08
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self deny: (calendario estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test09
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: March / 21 /2024.
	
	self assert: (calendario estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test10
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test11
	
	| calendario |
	calendario := CalendarioIndividual new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:16:44'!
test12
	
	| calendario |
	calendario := TeamCalendario new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test13
	
	| calendario calendarioIndividual |
	calendario := TeamCalendario new.
	calendarioIndividual := CalendarioIndividual new.
	calendario add: calendarioIndividual.
	calendarioIndividual agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00)! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:34:12'!
test14
	
	| calendario calendarioIndividual otroCalendarioIndividual|
	calendario := TeamCalendario new.
	calendarioIndividual := CalendarioIndividual new.
	calendario add: calendarioIndividual.
	calendarioIndividual agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	otroCalendarioIndividual := CalendarioIndividual new.
	calendario add: otroCalendarioIndividual.
	otroCalendarioIndividual agregarEventoEl: March / 20 /2024 de: 10:00 a: 11:00.
	
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00).
	self deny: (calendario estaLibreEl: March / 20 /2024 de: 10:00 a: 11:00)	! !


!classDefinition: #CalendarioIndividual category: #Calendarios!
Object subclass: #CalendarioIndividual
	instanceVariableNames: 'eventos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendarioIndividual methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 19:44:04'!
agregarEventoEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	eventos add: (EventoPorUnDia paraEl: unaFecha de: unHorarioInicial a: unHorarioFinal).
! !

!CalendarioIndividual methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 02:12:29'!
agregarEventoRecurrenteDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal  cada: unaFrecuencia hasta: unaFechaFinal 
	eventos add: (EventoRecurrente desde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal  cada: unaFrecuencia hasta: unaFechaFinal ).! !

!CalendarioIndividual methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 19:56:37'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ eventos allSatisfy: [ : unEvento | 
		(unEvento seSuperponeCon: unaFecha de: unHorarioInicial a: unHorarioFinal) not 
	]! !

!CalendarioIndividual methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:44:58'!
initialize
	super initialize.
	eventos := OrderedCollection new.! !


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


!classDefinition: #TeamCalendario category: #Calendarios!
Object subclass: #TeamCalendario
	instanceVariableNames: 'calendarios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!TeamCalendario methodsFor: 'initialization' stamp: 'JMB 5/25/2024 23:31:35'!
initialize
	super initialize.
	calendarios := Set new.! !


!TeamCalendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:30:57'!
add: unCalendario 
	calendarios add: unCalendario! !

!TeamCalendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 23:32:38'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ calendarios allSatisfy: [ : unCalendario |  unCalendario estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal  ]! !
