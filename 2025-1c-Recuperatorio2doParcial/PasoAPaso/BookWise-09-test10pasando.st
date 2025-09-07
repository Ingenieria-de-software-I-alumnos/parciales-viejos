!classDefinition: #TestBookWise category: #BookWise!
TestCase subclass: #TestBookWise
	instanceVariableNames: 'unLibro un2doLibro un3erLibro un5toLibro un4toLibro sistema calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:10:45'!
setUp

	sistema := self sistemaDePrueba.
	unLibro := Libro regularTitulado: 'Modern Software Engieering'.
	un2doLibro := Libro regularTitulado: 'TDD by Example'.
	un3erLibro := Libro regularTitulado: 'Object Thinking'.
	un4toLibro := Libro regularTitulado: 'Extreme Programming Explained'.
	un5toLibro := Libro regularTitulado: 'Planning Extreme Programming'.	
! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:53:44'!
sistemaDePrueba

	calendario := CalendarioManual new.
	^SistemaBookWise registrandoFechasCon: calendario.
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

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:23:27'!
test05UnUsuarioPuedePedirMasLibrosHabiendoAlcanzadoElMaximoSiDevuelveUnoDeEllos

	| unUsuario  |
	unUsuario := Usuario estudianteLlamado: 'Juan'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema retornarLibro: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: un2doLibro).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:23:30'!
test06UnLibroRegularTiene14DiasDePeriodoDePrestamo

	| unUsuario  |
	sistema := self sistemaDePrueba.
	unUsuario := Usuario estudianteLlamado: 'Juan'.	
	sistema pedirPrestado: unLibro por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:23:32'!
test07UnLibroDeReferenciaTiene7DiasDePeriodoDePrestamo

	| unUsuario  libroDeReferencia |
	sistema := self sistemaDePrueba.
	unUsuario := Usuario estudianteLlamado: 'Juan'.	
	libroDeReferencia := Libro deReferenciaTitulado: 'Design Patterns'.
	sistema pedirPrestado: libroDeReferencia por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: libroDeReferencia conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (7 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: libroDeReferencia conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:23:34'!
test08UnLibroNuevoTiene10DiasDePeriodoDePrestamo

	| unUsuario  libroNuevo |
	sistema := self sistemaDePrueba.
	unUsuario := Usuario estudianteLlamado: 'Juan'.	
	libroNuevo := Libro nuevoTitulado: 'TCR is the new TDD'.
	sistema pedirPrestado: libroNuevo por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: libroNuevo conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (10 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: libroNuevo conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:25:36'!
test09UnProfesorPaga5PesosPorUnDiaDeAtrasoDeUnLibroRegular

	| unUsuario  libroRegular |
	sistema := self sistemaDePrueba.
	unUsuario := Usuario profesorLlamado: 'Pedro'.	
	libroRegular := Libro regularTitulado: 'TDD by Example'.
	sistema pedirPrestado: libroRegular por: unUsuario.
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 5 * peso).! !

!TestBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:29:21'!
test10UnProfesorPaga5PesosPorCADADiaDeAtrasoDeUnLibroRegular

	| unUsuario  libroRegular |
	sistema := self sistemaDePrueba.
	unUsuario := Usuario profesorLlamado: 'Pedro'.	
	libroRegular := Libro regularTitulado: 'TDD by Example'.
	sistema pedirPrestado: libroRegular por: unUsuario.
	
	calendario avanzarDias: (14 * day + (2 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 10 * peso).! !


!classDefinition: #CalendarioManual category: #BookWise!
Object subclass: #CalendarioManual
	instanceVariableNames: 'hoy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!CalendarioManual methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:49:09'!
avanzarDias: unaCantidadDeDias 
	hoy := hoy next: unaCantidadDeDias! !

!CalendarioManual methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:47:48'!
initialize

	hoy := FixedGregorianDate today.! !

!CalendarioManual methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:38:32'!
today
	^hoy! !


!classDefinition: #Libro category: #BookWise!
Object subclass: #Libro
	instanceVariableNames: 'tipo titulo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Libro methodsFor: 'initialization' stamp: 'LL 6/28/2025 19:58:06'!
initializeDeTipo: unTipo conTitulo: unTitulo 
	tipo := unTipo.
	titulo := unTitulo.! !


!Libro methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:02:04'!
tipo
	^tipo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Libro class' category: #BookWise!
Libro class
	instanceVariableNames: ''!

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 20:00:39'!
deReferenciaTitulado: unTitulo 
	^self new initializeDeTipo: #deReferencia conTitulo: unTitulo! !

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 20:03:30'!
nuevoTitulado: unTitulo 
	^self new initializeDeTipo: #nuevo conTitulo: unTitulo! !

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 19:57:51'!
regularTitulado: unTitulo 
	^self new initializeDeTipo: #regular conTitulo: unTitulo! !


!classDefinition: #Prestamo category: #BookWise!
Object subclass: #Prestamo
	instanceVariableNames: 'libro fecha'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Prestamo methodsFor: 'initialization' stamp: 'LL 6/28/2025 19:46:42'!
initializeDe: unLibro enLaFecha: unaFecha 
	libro := unLibro.
	fecha := unaFecha.! !


!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:15:31'!
diasDeAtrasoRespectoDe: unaFechaEnParticular 
	libro tipo = #regular ifTrue: [ 	^(fecha next: 14 * day) distanceTo: unaFechaEnParticular ].
	libro tipo = #deReferencia ifTrue: [ 	^(fecha next: 7 * day) distanceTo: unaFechaEnParticular ].
	libro tipo = #nuevo ifTrue: [ 	^(fecha next: 10 * day) distanceTo: unaFechaEnParticular ].! !

!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:48:26'!
esDe: unLibro 
	^libro = unLibro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #BookWise!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 19:46:34'!
de: unLibro enLaFecha: unaFecha 
	^self new initializeDe: unLibro enLaFecha: unaFecha ! !


!classDefinition: #SistemaBookWise category: #BookWise!
Object subclass: #SistemaBookWise
	instanceVariableNames: 'prestamosPorUsuario calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:42:43'!
elUsuario: unUsuario tieneLibroPrestado: unLibro 
	^(prestamosPorUsuario at: unUsuario) anySatisfy: [ :prestamo | prestamo esDe: unLibro ]! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:48:48'!
elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: unaCantidadDeDias 
	| prestadosAUsuario prestamoDeLibro |
	prestadosAUsuario := prestamosPorUsuario at: unUsuario.
	prestamoDeLibro := prestadosAUsuario detect: [ :prestamo | prestamo esDe: unLibro ].
	^(prestamoDeLibro diasDeAtrasoRespectoDe: calendario today) = unaCantidadDeDias.! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 11:48:26'!
elUsuario: unUsuario tieneMultasPor: unaCantidadDePlata
	| prestamoDelUsuario valorMulta |
	prestamoDelUsuario := (prestamosPorUsuario at: unUsuario) first.
	valorMulta := (prestamoDelUsuario diasDeAtrasoRespectoDe: calendario today) * (5 * peso/day).
	^valorMulta = unaCantidadDePlata! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:42:43'!
initializeWith: unCalendario

	calendario := unCalendario.
	prestamosPorUsuario := Dictionary new.	! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:13:23'!
maximaCantidadDeLibrosAlcanzadaMensajeDeError

	^ 'Máxima cantidad de libros prestados alcanzada'! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:42:43'!
pedirPrestado: unLibro por: unUsuario 
	| prestadosAUsuario nuevoPrestamo |
	prestadosAUsuario := (prestamosPorUsuario at: unUsuario ifAbsent: [ OrderedCollection new ]).
	
	unUsuario tipo = #estudiante ifTrue: [
		prestadosAUsuario size = 1 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #bibliotecario ifTrue: [
		prestadosAUsuario size = 2 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #profesor ifTrue: [
		prestadosAUsuario size = 4 ifTrue: [ ^self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].

	nuevoPrestamo := Prestamo de: unLibro enLaFecha: calendario today.
	prestadosAUsuario add: nuevoPrestamo.
	(prestamosPorUsuario at: unUsuario put: prestadosAUsuario)! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:42:43'!
retornarLibro: unLibro por: unUsuario 
	| prestamosAUsuario |
	prestamosAUsuario := prestamosPorUsuario at: unUsuario.
	prestamosAUsuario := prestamosAUsuario removeAllSuchThat: [ :prestamo | prestamo esDe: unLibro ].
	prestamosPorUsuario at: unUsuario put: prestamosAUsuario.! !

!SistemaBookWise methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:42:43'!
tieneUnLibroPrestado: unUsuario 
	| prestadosAUsuario |
	prestadosAUsuario := prestamosPorUsuario at: unUsuario ifAbsent: [ OrderedCollection new ].
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
