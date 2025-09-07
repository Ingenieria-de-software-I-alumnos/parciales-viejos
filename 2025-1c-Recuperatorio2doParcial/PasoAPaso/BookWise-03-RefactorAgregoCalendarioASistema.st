!classDefinition: #TestBookWise category: #BookWise!
TestCase subclass: #TestBookWise
	instanceVariableNames: 'unLibro un2doLibro un3erLibro un5toLibro un4toLibro sistema calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:28:55'!
setUp

	calendario := CalendarioManual new.
	sistema := SistemaBookWise registrandoFechasCon: calendario.
	unLibro := 'Modern Software Engieering'.
	un2doLibro := 'TDD by Example'.
	un3erLibro := 'Object Thinking'.
	un4toLibro := 'Extreme Programming Explained'.
	un5toLibro := 'Planning Extreme Programming'.	
! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:46:02'!
test01UsuarioPuedePedirPrestadoUnLibro

	| unUsuario  |
	unUsuario := Usuario estudianteLlamado: 'Juan'.
	sistema pedirPrestado: unLibro por: unUsuario.
	self assert: (sistema tieneUnLibroPrestado: unUsuario).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:46:02'!
test02UnUsuarioEstudianteNoPuedePedirMasDeUnLibroSimultáneamente

	| unUsuario |
	unUsuario := Usuario estudianteLlamado: 'Juan'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	self 
		should: [ sistema pedirPrestado: un2doLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un2doLibro).
		].
	! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:46:02'!
test03UnUsuarioBibliotecarioNoPuedePedirMasDe2LibrosSimultáneamente

	| unUsuario |
	unUsuario := Usuario bibliotecarioLlamado: 'Ramón'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	self 
		should: [ sistema pedirPrestado: un3erLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un3erLibro).
		].
	! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:46:02'!
test04UnUsuarioProfesorNoPuedePedirMasDe4LibrosSimultáneamente

	| unUsuario  |
	unUsuario := Usuario profesorLlamado: 'Pedro'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	sistema pedirPrestado: un3erLibro por: unUsuario.
	sistema pedirPrestado: un4toLibro por: unUsuario.
	self 
		should: [ sistema pedirPrestado: un5toLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un5toLibro).
		].
	! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:13:32'!
test05UnUsuarioPuedePedirMasLibrosHabiendoAlcanzadoElMaximoSiDevuelveUnoDeEllos

	| unUsuario  |
	unUsuario := Usuario estudianteLlamado: 'Pedro'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema retornarLibro: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: un2doLibro).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:28:08'!
_test06UnLibroRegularTiene14DiasDePeriodoDePrestamo

	| unUsuario  |
	unUsuario := Usuario estudianteLlamado: 'Pedro'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).
	
	calendario avanzarDias: 14 * day.
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).! !


!classDefinition: #CalendarioManual category: #BookWise!
Object subclass: #CalendarioManual
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!


!classDefinition: #SistemaBookWise category: #BookWise!
Object subclass: #SistemaBookWise
	instanceVariableNames: 'librosPrestados calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:12:38'!
elUsuario: unUsuario tieneLibroPrestado: unLibro 
	^(librosPrestados at: unUsuario) includes: unLibro.! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:30:00'!
initializeWith: unCalendario

	calendario := unCalendario.
	librosPrestados := Dictionary new.	! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:13:23'!
maximaCantidadDeLibrosAlcanzadaMensajeDeError

	^ 'Máxima cantidad de libros prestados alcanzada'! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:26:41'!
pedirPrestado: unLibro por: unUsuario 
	| prestadosAUsuario |
	prestadosAUsuario := (librosPrestados at: unUsuario ifAbsent: [ OrderedCollection new ]).
	
	unUsuario tipo = #estudiante ifTrue: [
		prestadosAUsuario size = 1 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #bibliotecario ifTrue: [
		prestadosAUsuario size = 2 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #profesor ifTrue: [
		prestadosAUsuario size = 4 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].

	prestadosAUsuario add: unLibro.
	(librosPrestados at: unUsuario put: prestadosAUsuario)! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:15:11'!
retornarLibro: unLibro por: unUsuario 
	| prestadosAUsuario |
	prestadosAUsuario := librosPrestados at: unUsuario.
	prestadosAUsuario remove: unLibro.
	librosPrestados at: unUsuario put: prestadosAUsuario.! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 18:53:18'!
tieneUnLibroPrestado: unUsuario 
	| prestadosAUsuario |
	prestadosAUsuario := librosPrestados at: unUsuario ifAbsent: [ OrderedCollection new ].
	^prestadosAUsuario isEmpty not.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaBookWise class' category: #BookWise!
SistemaBookWise class
	instanceVariableNames: ''!

!SistemaBookWise class methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:29:34'!
registrandoFechasCon: unCalendario

	^self new initializeWith: unCalendario.! !


!classDefinition: #Usuario category: #BookWise!
Object subclass: #Usuario
	instanceVariableNames: 'tipo nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Usuario methodsFor: 'initialization' stamp: 'LL 6/28/2025 19:16:01'!
initializeDeTipo: unTipo conNombre: unNombre 
	tipo := unTipo.
	nombre := unNombre.! !


!Usuario methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:23:29'!
tipo
	^tipo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Usuario class' category: #BookWise!
Usuario class
	instanceVariableNames: ''!

!Usuario class methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:14:51'!
estudianteLlamado: unNombre

	^self new initializeDeTipo: #estudiante conNombre: unNombre.! !


!Usuario class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 19:21:54'!
bibliotecarioLlamado: unNombre 
	^self new initializeDeTipo: #bibliotecario conNombre: unNombre! !

!Usuario class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 19:26:14'!
profesorLlamado: unNombre 
	^self new initializeDeTipo: #profesor conNombre: unNombre! !
