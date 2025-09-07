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

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 13:25:59'!
test06UnLibroRegularTiene14DiasDePeriodoDePrestamo

	| unUsuario  unLibro sistema |
	sistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.	
	unLibro := self unLibroRegular.
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
	instanceVariableNames: 'titulo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Libro methodsFor: 'initialization' stamp: 'LL 6/29/2025 13:21:40'!
initializeConTitulo: unTitulo 
	titulo := unTitulo.! !


!Libro methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 15:17:03'!
duracionDePrestamo: unPrestamo

	self subclassResponsibility! !

!Libro methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:53:31'!
multaPorAtraso: unPrestamo respectoDe: unaFechaParticular 

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Libro class' category: #BookWise!
Libro class
	instanceVariableNames: ''!

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:21:58'!
deReferenciaTitulado: unTitulo 
	^LibroDeReferencia new initializeConTitulo: unTitulo! !

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:22:17'!
nuevoTitulado: unTitulo 
	^LibroNuevo new initializeConTitulo: unTitulo! !

!Libro class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:22:30'!
regularTitulado: unTitulo 
	^LibroRegular new initializeConTitulo: unTitulo! !


!classDefinition: #LibroDeReferencia category: #BookWise!
Libro subclass: #LibroDeReferencia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!LibroDeReferencia methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 15:19:38'!
duracionDePrestamo: unPrestamo

	^ unPrestamo duracionParaLibroDeReferencia! !

!LibroDeReferencia methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:54:00'!
multaPorAtraso: unPrestamo respectoDe: unaFechaParticular 

	^unPrestamo multaDeLibroDeReferenciaPorAtrasoRespectoDe: unaFechaParticular! !


!classDefinition: #LibroNuevo category: #BookWise!
Libro subclass: #LibroNuevo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!LibroNuevo methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 15:19:46'!
duracionDePrestamo: unPrestamo

	^ unPrestamo duracionParaLibroNuevo! !

!LibroNuevo methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:54:13'!
multaPorAtraso: unPrestamo respectoDe: unaFechaParticular 

	^unPrestamo multaDeLibroNuevoPorAtrasoRespectoDe: unaFechaParticular! !


!classDefinition: #LibroRegular category: #BookWise!
Libro subclass: #LibroRegular
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!LibroRegular methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 15:19:53'!
duracionDePrestamo: unPrestamo

	^ unPrestamo duracionParaLibroRegular! !

!LibroRegular methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:54:34'!
multaPorAtraso: unPrestamo respectoDe: unaFechaParticular 

	^unPrestamo multaDeLibroRegularPorAtrasoRespectoDe: unaFechaParticular! !


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


!Prestamo methodsFor: 'accessing' stamp: 'LL 6/29/2025 21:07:04'!
diasDeAtrasoRespectoDe: unaFechaEnParticular

	^(fecha next: (libro duracionDePrestamo: self)) distanceTo: unaFechaEnParticular! !

!Prestamo methodsFor: 'accessing' stamp: 'LL 6/29/2025 21:02:01'!
multaPorAtrasoRespectoDe: unaFechaParticular
	
	^usuario multaPor: self conAtrasoRepectoDe: unaFechaParticular.! !


!Prestamo methodsFor: 'testing' stamp: 'LL 6/28/2025 19:48:26'!
esDe: unLibro 
	^libro = unLibro! !


!Prestamo methodsFor: 'dd - duracion segun libro' stamp: 'LL 6/29/2025 15:19:38'!
duracionParaLibroDeReferencia

	^7 * day! !

!Prestamo methodsFor: 'dd - duracion segun libro' stamp: 'LL 6/29/2025 15:19:46'!
duracionParaLibroNuevo

	^10 * day! !

!Prestamo methodsFor: 'dd - duracion segun libro' stamp: 'LL 6/29/2025 15:19:53'!
duracionParaLibroRegular

	^14 * day! !


!Prestamo methodsFor: 'dd - multa segun libro' stamp: 'LL 6/29/2025 20:50:03'!
multaDeLibroDeReferenciaPorAtrasoRespectoDe: unaFechaParticular

	^(self diasDeAtrasoRespectoDe: unaFechaParticular) * 10 * peso/day! !

!Prestamo methodsFor: 'dd - multa segun libro' stamp: 'LL 6/29/2025 20:55:21'!
multaDeLibroNuevoPorAtrasoRespectoDe: unaFechaParticular

	^(self diasDeAtrasoRespectoDe: unaFechaParticular) * 8 * peso/day! !

!Prestamo methodsFor: 'dd - multa segun libro' stamp: 'LL 6/29/2025 20:55:32'!
multaDeLibroRegularPorAtrasoRespectoDe: unaFechaParticular

	^(self diasDeAtrasoRespectoDe: unaFechaParticular) * 5 * peso/day! !


!Prestamo methodsFor: 'dd - multa segun usuario' stamp: 'LL 6/29/2025 21:01:15'!
multaParaBibliotecarioPorAtrasoRespectoDe: unaFechaParticular

	^(libro multaPorAtraso: self respectoDe: unaFechaParticular) * 0.25! !

!Prestamo methodsFor: 'dd - multa segun usuario' stamp: 'LL 6/29/2025 21:01:23'!
multaParaEstudiantePorAtrasoRespectoDe: unaFechaParticular

	^(libro multaPorAtraso: self respectoDe: unaFechaParticular) * 0.5! !

!Prestamo methodsFor: 'dd - multa segun usuario' stamp: 'LL 6/29/2025 21:01:34'!
multaParaProfesorPorAtrasoRespectoDe: unaFechaParticular

	^(libro multaPorAtraso: self respectoDe: unaFechaParticular)! !

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


!SistemaBookWise methodsFor: 'prestamos' stamp: 'LL 6/29/2025 20:15:33'!
pedirPrestado: unLibro por: unUsuario 
	
	unUsuario pedirPrestado: unLibro utilizando: self.! !

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


!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/29/2025 20:21:30'!
cantidadDePrestamosActivosDe: unUsuario

	^ (self prestamosDe: unUsuario) size! !

!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/29/2025 13:37:50'!
multaPorAtrasoEn: prestamo

	^prestamo multaPorAtrasoRespectoDe: calendario today.
	! !

!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/29/2025 12:15:06'!
prestamosDe: unUsuario

	^ prestamosPorUsuario at: unUsuario ifAbsent: [ OrderedCollection new ]! !

!SistemaBookWise methodsFor: 'private' stamp: 'LL 6/29/2025 21:09:47'!
registrarPrestamoDe: unLibro por: unUsuario

	| nuevoPrestamo prestamosAUsuario |
	prestamosAUsuario := self prestamosDe: unUsuario.
	nuevoPrestamo := Prestamo de: unLibro enLaFecha: calendario today por: unUsuario.
	prestamosAUsuario add: nuevoPrestamo.
	prestamosPorUsuario at: unUsuario put: prestamosAUsuario.! !


!SistemaBookWise methodsFor: 'dd - prestamo segun usuario' stamp: 'LL 6/29/2025 20:39:27'!
pedirPrestado: unLibro siendoBibliotecario: unBibliotecario
	
	(self bibliotecarioAlcanzoLimiteDePrestamos: unBibliotecario) ifTrue: [ 
		self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError 
	].

	self registrarPrestamoDe: unLibro por: unBibliotecario! !

!SistemaBookWise methodsFor: 'dd - prestamo segun usuario' stamp: 'LL 6/29/2025 20:40:02'!
pedirPrestado: unLibro siendoEstudiante: unEstudiante
	
	(self estudianteAlcanzoLimiteDePrestamos: unEstudiante) ifTrue: [ 
		self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError 
	].

	self registrarPrestamoDe: unLibro por: unEstudiante! !

!SistemaBookWise methodsFor: 'dd - prestamo segun usuario' stamp: 'LL 6/29/2025 20:40:30'!
pedirPrestado: unLibro siendoProfesor: unProfesor
	
	(self profesorAlcanzoLimiteDePrestamos: unProfesor) ifTrue: [ 
		self error: self maximaCantidadDeLibrosAlcanzadaMensajeDeError 
	].

	self registrarPrestamoDe: unLibro por: unProfesor! !


!SistemaBookWise methodsFor: 'private - limite por usuario' stamp: 'LL 6/29/2025 20:21:56'!
bibliotecarioAlcanzoLimiteDePrestamos: unBibliotecario

	^ (self cantidadDePrestamosActivosDe: unBibliotecario) = 2! !

!SistemaBookWise methodsFor: 'private - limite por usuario' stamp: 'LL 6/29/2025 20:44:37'!
estudianteAlcanzoLimiteDePrestamos: unEstudiante

	^ (self cantidadDePrestamosActivosDe: unEstudiante) = 1! !

!SistemaBookWise methodsFor: 'private - limite por usuario' stamp: 'LL 6/29/2025 20:40:53'!
profesorAlcanzoLimiteDePrestamos: unProfesor

	^ (self cantidadDePrestamosActivosDe: unProfesor) = 4! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaBookWise class' category: #BookWise!
SistemaBookWise class
	instanceVariableNames: ''!

!SistemaBookWise class methodsFor: 'as yet unclassified' stamp: 'LL 6/28/2025 20:29:34'!
registrandoFechasCon: unCalendario

	^self new initializeWith: unCalendario.! !


!classDefinition: #Usuario category: #BookWise!
Object subclass: #Usuario
	instanceVariableNames: 'nombre'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!Usuario methodsFor: 'initialization' stamp: 'LL 6/29/2025 13:47:40'!
initializeConNombre: unNombre 
	nombre := unNombre.! !


!Usuario methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:15:22'!
pedirPrestado: unLibro utilizando: elSistemaBookWise

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Usuario class' category: #BookWise!
Usuario class
	instanceVariableNames: ''!

!Usuario class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:47:54'!
bibliotecarioLlamado: unNombre 
	^UsuarioBibliotecario new initializeConNombre: unNombre! !

!Usuario class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:48:31'!
estudianteLlamado: unNombre

	^UsuarioEstudiante new initializeConNombre: unNombre.! !

!Usuario class methodsFor: 'instance creation' stamp: 'LL 6/29/2025 13:48:15'!
profesorLlamado: unNombre 
	^UsuarioProfesor new initializeConNombre: unNombre! !


!classDefinition: #UsuarioBibliotecario category: #BookWise!
Usuario subclass: #UsuarioBibliotecario
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!UsuarioBibliotecario methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 21:08:06'!
multaPor: unPrestamo conAtrasoRepectoDe: unaFechaParticular

	^unPrestamo multaParaBibliotecarioPorAtrasoRespectoDe: unaFechaParticular! !

!UsuarioBibliotecario methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:42:32'!
pedirPrestado: unLibro utilizando: elSistemaBookWise

	elSistemaBookWise pedirPrestado: unLibro siendoBibliotecario: self	! !


!classDefinition: #UsuarioEstudiante category: #BookWise!
Usuario subclass: #UsuarioEstudiante
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!UsuarioEstudiante methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 21:08:15'!
multaPor: unPrestamo conAtrasoRepectoDe: unaFechaParticular

	^unPrestamo multaParaEstudiantePorAtrasoRespectoDe: unaFechaParticular! !

!UsuarioEstudiante methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:42:46'!
pedirPrestado: unLibro utilizando: elSistemaBookWise

	elSistemaBookWise pedirPrestado: unLibro siendoEstudiante: self	! !


!classDefinition: #UsuarioProfesor category: #BookWise!
Usuario subclass: #UsuarioProfesor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'BookWise'!

!UsuarioProfesor methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 21:08:18'!
multaPor: unPrestamo conAtrasoRepectoDe: unaFechaParticular

	^unPrestamo multaParaProfesorPorAtrasoRespectoDe: unaFechaParticular! !

!UsuarioProfesor methodsFor: 'as yet unclassified' stamp: 'LL 6/29/2025 20:42:56'!
pedirPrestado: unLibro utilizando: elSistemaBookWise

	elSistemaBookWise pedirPrestado: unLibro siendoProfesor: self	! !
