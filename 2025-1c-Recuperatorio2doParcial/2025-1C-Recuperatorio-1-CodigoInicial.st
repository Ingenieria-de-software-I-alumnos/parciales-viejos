!classDefinition: #TestBookWise category: #'2025-1C-Recuperatorio-1'!
TestCase subclass: #TestBookWise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Recuperatorio-1'!

!TestBookWise methodsFor: 'tests' stamp: 'LL 6/29/2025 23:43:56'!
test01UnUsuarioPuedePedirPrestadoUnLibro

	| unUsuario  unSistema unLibro |
	unSistema := self sistemaDePrueba.
	unUsuario := self unUsuarioCualquiera.
	unLibro := self unLibroCualquiera.
	
	unSistema pedirPrestado: unLibro por: unUsuario.
	
	self assert: (unSistema elUsuario: unUsuario tieneLibroPrestado: unLibro).! !


!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:32:50'!
sistemaDePrueba

	^SistemaBookWise new
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:19'!
un2doLibroCualquiera

	^ self un2doLibroRegular! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:32:57'!
un2doLibroRegular

	^'TDD by Example'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:02'!
un3erLibroCualquiera

	^'Object Thinking'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:06'!
un4toLibroCualquiera

	^'Smalltalk, Objects and Design'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:10'!
un5toLibroCualquiera

	^'Planning Extreme Programming'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:55:56'!
unLibroCualquiera

	^self unLibroRegular
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:17'!
unLibroDeReferencia

	^'Design Patterns'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:21'!
unLibroNuevo

	^'Modern Software Engineering'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:24'!
unLibroRegular

	^'Extreme Programming Explained'.
! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:29'!
unUsuarioBibliotecario

	^'Ramón'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 12:56:05'!
unUsuarioCualquiera

	^ self unUsuarioEstudiante! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:34'!
unUsuarioEstudiante

	^'Juan'! !

!TestBookWise methodsFor: 'test objects' stamp: 'LL 6/29/2025 23:33:38'!
unUsuarioProfesor

	^'Pedro'! !


!classDefinition: #SistemaBookWise category: #'2025-1C-Recuperatorio-1'!
Object subclass: #SistemaBookWise
	instanceVariableNames: 'prestamosPorUsuario'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2025-1C-Recuperatorio-1'!

!SistemaBookWise methodsFor: 'initialization' stamp: 'LL 6/29/2025 23:43:01'!
initialize

	prestamosPorUsuario := Dictionary new.! !


!SistemaBookWise methodsFor: 'prestamos' stamp: 'LL 6/29/2025 23:43:30'!
pedirPrestado: unLibro por: unUsuario

	| prestamosAUsuario |
	prestamosAUsuario := prestamosPorUsuario at: unUsuario ifAbsent: [ OrderedCollection new ].
	prestamosAUsuario add: unLibro.
	prestamosPorUsuario at: unUsuario put: prestamosAUsuario.! !


!SistemaBookWise methodsFor: 'testing' stamp: 'LL 6/29/2025 23:42:38'!
elUsuario: unUsuario tieneLibroPrestado: unLibro

	^(prestamosPorUsuario at: unUsuario) includes: unLibro! !
