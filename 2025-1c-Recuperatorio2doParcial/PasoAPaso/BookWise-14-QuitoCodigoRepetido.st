!classDefinition: #TestBookWise category: #BookWise!
TestCase subclass: #TestBookWise
	instanceVariableNames: 'calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:05'!
test01UsuarioPuedePedirPrestadoUnLibro

	| unUsuario  unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.
	unLibro := self unLibroCualquiera.
	sistema pedirPrestado: unLibro por: unUsuario.
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:19'!
test02UnUsuarioEstudianteNoPuedePedirMasDeUnLibroSimultáneamente

	| unUsuario unLibro un2doLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioEstudiante.	
	unLibro := self unLibroCualquiera.
	un2doLibro := self un2doLibroCualquiera.	
	sistema pedirPrestado: unLibro por: unUsuario.
	self 
		should: [ 	sistema pedirPrestado: un2doLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un2doLibro).
		].
	! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:25'!
test03UnUsuarioBibliotecarioNoPuedePedirMasDe2LibrosSimultáneamente

	| unUsuario un3erLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioBibliotecario.	
	sistema pedirPrestado: self unLibroCualquiera por: unUsuario.
	sistema pedirPrestado: self un2doLibroCualquiera por: unUsuario.
	un3erLibro := self un3erLibroCualquiera.			
	self 
		should: [ sistema pedirPrestado: un3erLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un3erLibro).
		].
	! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:52'!
test04UnUsuarioProfesorNoPuedePedirMasDe4LibrosSimultáneamente

	| unUsuario  un5toLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioProfesor.	
	sistema pedirPrestado: self unLibroCualquiera por: unUsuario.
	sistema pedirPrestado: self un2doLibroCualquiera por: unUsuario.
	sistema pedirPrestado: self un3erLibroCualquiera por: unUsuario.
	sistema pedirPrestado: self un4toLibroCualquiera por: unUsuario.
	un5toLibro := self un5toLibroCualquiera.			
	self 
		should: [ sistema pedirPrestado: un5toLibro por: unUsuario ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: sistema maximaCantidadDeLibrosAlcanzadaMensajeDeError.
			self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: un5toLibro).
		].
	! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:19'!
test05UnUsuarioPuedePedirMasLibrosHabiendoAlcanzadoElMaximoSiDevuelveUnoDeEllos

	| unUsuario  un2doLibro unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.	
	unLibro := self unLibroCualquiera.
	un2doLibro := self un2doLibroCualquiera.		
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema retornarLibro: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro).
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: un2doLibro).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:05'!
test06UnLibroRegularTiene14DiasDePeriodoDePrestamo

	| unUsuario  unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.	
	unLibro := self unLibroCualquiera.
	sistema pedirPrestado: unLibro por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:05'!
test07UnLibroDeReferenciaTiene7DiasDePeriodoDePrestamo

	| unUsuario  unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.	
	unLibro := self unLibroDeReferencia.
	sistema pedirPrestado: unLibro por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (7 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:56:05'!
test08UnLibroNuevoTiene10DiasDePeriodoDePrestamo

	| unUsuario  unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.	
	unLibro := self unLibroNuevo.
	sistema pedirPrestado: unLibro por: unUsuario.
	self deny: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).
	
	calendario avanzarDias: (10 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: 1 * day).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:53:18'!
test09UnProfesorPaga5PesosPorUnDiaDeAtrasoDeUnLibroRegular

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioProfesor.	
	libro := self unLibroRegular.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 5 * peso).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:53:18'!
test10UnProfesorPaga5PesosPorCADADiaDeAtrasoDeUnLibroRegular

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioProfesor.	
	libro := self unLibroRegular.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (14 * day + (2 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 10 * peso).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:53:18'!
test11UnProfesorPaga10PesosPorCadaDiaDeAtrasoDeUnLibroDeReferencia

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioProfesor.	
	libro := self unLibroDeReferencia.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (7 * day + (2 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 20 * peso).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:53:18'!
test12UnProfesorPaga8PesosPorCadaDiaDeAtrasoDeUnLibroNuevo

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioProfesor.	
	libro := self unLibroNuevo.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (10 * day + (2 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: 16 * peso).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:55:56'!
test13UnEstudiantePaga50PorCientoDeLaMultaBaseDelLibro

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioEstudiante.	
	libro := self unLibroCualquiera.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: (5 * peso * 0.5)).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:55:07'!
test14UnBibliotecarioPaga25PorCientoDeLaMultaBaseDelLibro

	| unUsuario  libro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioBibliotecario.	
	libro := self unLibroRegular.
	sistema pedirPrestado: libro por: unUsuario.
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: (5 * peso * 0.25)).! !

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 12:55:26'!
test15LasMultasPorAtrasoSonAcumulativas

	| unUsuario unLibro un2doLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioBibliotecario.	
	unLibro := self unLibroRegular.
	un2doLibro := self un2doLibroRegular.
	sistema pedirPrestado: unLibro por: unUsuario.
	sistema pedirPrestado: un2doLibro por: unUsuario.
	
	calendario avanzarDias: (14 * day + (1 * day)).
	
	self assert: (sistema elUsuario: unUsuario tieneMultasPor: (5 * peso * 0.25 * 2)).! !


!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/28/2025 20:53:44'!
sistemaDePrueba

	calendario := CalendarioManual new.
	^SistemaBookWise registrandoFechasCon: calendario.
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:19'!
un2doLibroCualquiera

	^ self un2doLibroRegular! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:37:16'!
un2doLibroRegular

	^ Libro regularTitulado: 'TDD by Example'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:25'!
un3erLibroCualquiera

	^ Libro regularTitulado: 'Object Thinking'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:46'!
un4toLibroCualquiera

	^ Libro regularTitulado: 'Smalltalk, Objects and Design'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:52'!
un5toLibroCualquiera

	^ Libro regularTitulado: 'Planning Extreme Programming'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:55:56'!
unLibroCualquiera

	^self unLibroRegular
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:43:52'!
unLibroDeReferencia

	^ Libro deReferenciaTitulado: 'Design Patterns'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:44:02'!
unLibroNuevo

	^ Libro nuevoTitulado: 'Modern Software Engineering'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:28:24'!
unLibroRegular

	^Libro regularTitulado: 'Extreme Programming Explained'.
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:53:05'!
unUsuarioBibliotecario

	^ Usuario bibliotecarioLlamado: 'Ramón'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:05'!
unUsuarioCualquiera

	^ self unUsuarioEstudiante! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:52:51'!
unUsuarioEstudiante

	^ Usuario estudianteLlamado: 'Juan'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:53:18'!
unUsuarioProfesor

	^ Usuario profesorLlamado: 'Pedro'! !


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
	instanceVariableNames: 'libro fecha usuario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Prestamo methodsFor: 'initialization' stamp: 'LL 6/28/2025 22:04:36'!
initializeDe: unLibro enLaFecha: unaFecha paraUsuario: unUsuario  
	libro := unLibro.
	fecha := unaFecha.
	usuario := unUsuario.	
	! !


!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:15:31'!
diasDeAtrasoRespectoDe: unaFechaEnParticular 
	libro tipo = #regular ifTrue: [ 	^(fecha next: 14 * day) distanceTo: unaFechaEnParticular ].
	libro tipo = #deReferencia ifTrue: [ 	^(fecha next: 7 * day) distanceTo: unaFechaEnParticular ].
	libro tipo = #nuevo ifTrue: [ 	^(fecha next: 10 * day) distanceTo: unaFechaEnParticular ].! !

!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 19:48:26'!
esDe: unLibro 
	^libro = unLibro! !

!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 21:53:38'!
libro
	^libro! !

!Prestamo methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 22:08:47'!
usuario
	^usuario! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Prestamo class' category: #BookWise!
Prestamo class
	instanceVariableNames: ''!

!Prestamo class methodsFor: 'instance creation' stamp: 'LL 6/28/2025 22:04:18'!
de: unLibro enLaFecha: unaFecha por: unUsuario  
	^self new initializeDe: unLibro enLaFecha: unaFecha paraUsuario: unUsuario ! !


!classDefinition: #SistemaBookWise category: #BookWise!
Object subclass: #SistemaBookWise
	instanceVariableNames: 'prestamosPorUsuario calendario'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!SistemaBookWise methodsFor: 'initialization' stamp: 'LL 6/28/2025 20:42:43'!
initializeWith: unCalendario

	calendario := unCalendario.
	prestamosPorUsuario := Dictionary new.	! !


!SistemaBookWise methodsFor: 'prestamos' stamp: 'LL 6/29/2025 12:18:42'!
afirmarQue: unUsuario puedePedirPrestadoUnLibroConsiderando: prestamosAUsuario

	unUsuario tipo = #estudiante ifTrue: [
		prestamosAUsuario size = 1 ifTrue: [ self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #bibliotecario ifTrue: [
		prestamosAUsuario size = 2 ifTrue: [ self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	].
	unUsuario tipo = #profesor ifTrue: [
		prestamosAUsuario size = 4 ifTrue: [ self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError ].
	]! !

!SistemaBookWise methodsFor: 'prestamos' stamp: 'LL 6/29/2025 12:22:59'!
pedirPrestado: unLibro por: unUsuario 
	| prestamosAUsuario nuevoPrestamo |
	prestamosAUsuario := self prestamosDe: unUsuario.
	
	self afirmarQue: unUsuario puedePedirPrestadoUnLibroConsiderando: prestamosAUsuario.

	nuevoPrestamo := Prestamo de: unLibro enLaFecha: calendario today por: unUsuario.
	prestamosAUsuario add: nuevoPrestamo.
	
	(prestamosPorUsuario at: unUsuario put: prestamosAUsuario)! !

!SistemaBookWise methodsFor: 'prestamos' stamp: 'LL 6/29/2025 12:17:18'!
retornarLibro: unLibro por: unUsuario 
	| prestamosAUsuario |
	prestamosAUsuario := self prestamosDe: unUsuario.
	
	prestamosAUsuario := prestamosAUsuario removeAllSuchThat: [ :prestamo | prestamo esDe: unLibro ].
	
	prestamosPorUsuario at: unUsuario put: prestamosAUsuario.! !


!SistemaBookWise methodsFor: 'testing' stamp: 'LL 6/29/2025 12:14:40'!
elUsuario: unUsuario tieneLibroPrestado: unLibro 
	^(self prestamosDe: unUsuario) anySatisfy: [ :prestamo | prestamo esDe: unLibro ]! !

!SistemaBookWise methodsFor: 'testing' stamp: 'LL 6/29/2025 12:15:18'!
elUsuario: unUsuario tieneLibroPrestado: unLibro conAtrasoDe: unaCantidadDeDias 
	| prestamoDeLibro |
	prestamoDeLibro := (self prestamosDe: unUsuario) detect: [ :prestamo | prestamo esDe: unLibro ].
	^(prestamoDeLibro diasDeAtrasoRespectoDe: calendario today) = unaCantidadDeDias.! !

!SistemaBookWise methodsFor: 'testing' stamp: 'LL 6/29/2025 12:15:24'!
elUsuario: unUsuario tieneMultasPor: unaCantidadDePlata
	| totalMulta |
	totalMulta := (self prestamosDe: unUsuario) sum: [ :prestamoDelUsuario | self multaPorAtrasoEn: prestamoDelUsuario ].
	^totalMulta = unaCantidadDePlata! !


!SistemaBookWise methodsFor: 'errores' stamp: 'LL 6/28/2025 19:13:23'!
maximaCantidadDeLibrosAlcanzadaMensajeDeError

	^ 'Máxima cantidad de libros prestados alcanzada'! !


!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/28/2025 22:12:11'!
multaPorAtrasoEn: prestamo

	| valorMulta |
	prestamo libro tipo = #regular ifTrue: [ valorMulta := (prestamo diasDeAtrasoRespectoDe: calendario today) * (5 * peso/day) ].
	prestamo libro tipo = #deReferencia ifTrue: [ valorMulta := (prestamo diasDeAtrasoRespectoDe: calendario today) * (10 * peso/day) ].
	prestamo libro tipo = #nuevo ifTrue: [ valorMulta := (prestamo diasDeAtrasoRespectoDe: calendario today) * (8 * peso/day) ].
	
	prestamo usuario tipo = #profesor ifTrue: [ ^valorMulta ].
	prestamo usuario tipo = #estudiante ifTrue: [ ^valorMulta * 0.5 ].
	prestamo usuario tipo = #bibliotecario ifTrue: [ ^valorMulta * 0.25 ].
	! !

!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/29/2025 12:15:06'!
prestamosDe: unUsuario

	^ prestamosPorUsuario at: unUsuario ifAbsent: [ OrderedCollection new ]! !

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
