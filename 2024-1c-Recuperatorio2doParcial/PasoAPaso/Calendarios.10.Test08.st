!classDefinition: #CalendariosTest category: #Calendarios!
TestCase subclass: #CalendariosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:09:00'!
test01
	
	| calendario |
	calendario := Calendario new.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:14:09'!
test02
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:16:39'!
test03
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 14 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:22:16'!
test04
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 09:00 a: 10:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:31:55'!
test05
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	
	self assert: (calendario estaLibreEl: March / 15 /2024 de: 11:00 a: 12:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 01:01:43'!
test06
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoEl: March / 15 /2024 de: 10:00 a: 11:00.
	calendario agregarEventoEl: March / 15 /2024 de: 11:00 a: 12:00.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 01:49:46'!
test07
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self deny: (calendario estaLibreEl: March / 15 /2024 de: 10:00 a: 11:00) ! !

!CalendariosTest methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 02:14:24'!
test08
	
	| calendario |
	calendario := Calendario new.
	
	calendario agregarEventoRecurrenteDesde: March / 15 /2024 de: 10:00 a: 11:00 cada: 1*week hasta: April / 15 /2024.
	
	self deny: (calendario estaLibreEl: ((March / 15 /2024) next: 1*week) de: 10:00 a: 11:00) ! !


!classDefinition: #Calendario category: #Calendarios!
Object subclass: #Calendario
	instanceVariableNames: 'eventos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:44:58'!
agregarEventoEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	eventos add: (EventoDeCalendario paraEl: unaFecha de: unHorarioInicial a: unHorarioFinal).
! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 02:12:29'!
agregarEventoRecurrenteDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal  cada: unaFrecuencia hasta: unaFechaFinal 
	eventos add: (EventoRecurrente desde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal  cada: unaFrecuencia hasta: unaFechaFinal ).! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:50:18'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ eventos allSatisfy: [ : unEvento | unEvento estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal ]! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:44:58'!
initialize
	super initialize.
	eventos := OrderedCollection new.! !


!classDefinition: #EventoDeCalendario category: #Calendarios!
Object subclass: #EventoDeCalendario
	instanceVariableNames: 'fecha horarioInicial horarioFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoDeCalendario methodsFor: 'initialization' stamp: 'JMB 5/24/2024 23:53:45'!
initializeParaEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	fecha := unaFecha.
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal.! !


!EventoDeCalendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:39:05'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ fecha ~= unaFecha or: [ horarioInicial >= unHorarioFinal ]  or: [ horarioFinal <= unHorarioInicial ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoDeCalendario class' category: #Calendarios!
EventoDeCalendario class
	instanceVariableNames: ''!

!EventoDeCalendario class methodsFor: 'instance creation' stamp: 'JMB 5/24/2024 23:52:10'!
paraEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^self new initializeParaEl: unaFecha de: unHorarioInicial a: unHorarioFinal ! !


!classDefinition: #EventoRecurrente category: #Calendarios!
Object subclass: #EventoRecurrente
	instanceVariableNames: 'fechaInicial horarioInicial horarioFinal frecuencia fechaFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!EventoRecurrente methodsFor: 'initialization' stamp: 'JMB 5/25/2024 02:13:09'!
initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	fechaInicial := unaFechaInicial.
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal.
	frecuencia := unaFrecuencia.
	fechaFinal := unaFechaFinal.! !


!EventoRecurrente methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 02:37:58'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ (fechaInicial ~= unaFecha) and: [ (fechaInicial next: frecuencia) ~= unaFecha ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EventoRecurrente class' category: #Calendarios!
EventoRecurrente class
	instanceVariableNames: ''!

!EventoRecurrente class methodsFor: 'instance creation' stamp: 'JMB 5/25/2024 02:12:53'!
desde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal 
	^self new initializeDesde: unaFechaInicial de: unHorarioInicial a: unHorarioFinal cada: unaFrecuencia hasta: unaFechaFinal ! !
