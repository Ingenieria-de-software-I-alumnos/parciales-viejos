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
	instanceVariableNames: 'fecha horarioInicial horarioFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:24:39'!
agregarEventoEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	fecha := unaFecha.
	horarioInicial := unHorarioInicial.
	horarioFinal := unHorarioFinal. ! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:32:37'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ fecha isNil or: [ fecha ~= unaFecha or: [ horarioInicial >= unHorarioFinal ]  or: [ horarioFinal <= unHorarioInicial ] ]! !
