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


!classDefinition: #Calendario category: #Calendarios!
Object subclass: #Calendario
	instanceVariableNames: 'fecha horarioInicial horarioFinal evento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:39:37'!
agregarEventoEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	evento := EventoDeCalendario paraEl: unaFecha de: unHorarioInicial a: unHorarioFinal.
! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/25/2024 00:42:22'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ evento isNil or: [ evento estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal ]! !


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
