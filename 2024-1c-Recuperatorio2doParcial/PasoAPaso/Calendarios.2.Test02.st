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


!classDefinition: #Calendario category: #Calendarios!
Object subclass: #Calendario
	instanceVariableNames: 'fecha'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Calendarios'!

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:14:59'!
agregarEventoEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	fecha := unaFecha! !

!Calendario methodsFor: 'as yet unclassified' stamp: 'JMB 5/24/2024 23:15:16'!
estaLibreEl: unaFecha de: unHorarioInicial a: unHorarioFinal 
	^ fecha isNil! !
