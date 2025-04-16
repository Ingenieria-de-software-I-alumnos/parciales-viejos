!classDefinition: #SeparadorDeMenasTest category: 'AlgoIII-2021-1C-2doParcial-Separador'!
TestCase subclass: #SeparadorDeMenasTest
	instanceVariableNames: 'cajaDestinoPrimario cajaDestinoSecundario separador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:14:26'!
test01UnSeparadorSinMenasNoTransportaNadaASusDestinos
	
	self inicializarSeparadorNeutroCon: #().

	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 0 yAlSecundario: 0.! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:14:26'!
test02UnSeparadorEnModoNeutroTransportaTodoASuDestinoPrimario
	
	self inicializarSeparadorNeutroCon: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 0! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:13'!
test03UnSeparadorEnModoFiltradoTransportaLasMenasQueCumplenLaCondicionDeFiltradoASuDestinoSecundario
	
	self inicializarSeparadorFiltrandoPor: MenaDeCarbon con: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 0 yAlSecundario: 1.! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:12'!
test04UnSeparadorEnModoFiltradoTransportaLasMenasQueNoCumplenLaCondicionDeFiltradoASuDestinoPrimario
	
	self inicializarSeparadorFiltrandoPor: MenaDeHierro con: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 0.! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:13'!
test05UnSeparadorEnModoBalanceadoTransportaLaPrimerMenaASuDestinoPrimario
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 0! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:36:58'!
test06UnSeparadorEnModoBalanceadoTransportaEquitativamenteUnaCantidadParDeMenas
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 1.! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:12'!
test07UnSeparadorEnModoBalanceadoTransportaEquitativamenteLasMenasComenzandoPorElDestinoPrimario
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new with: MenaDeCarbon new with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 2 yAlSecundario: 1! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:13'!
test08UnSeparadorEnModoBalanceadoTransportaEquitativamenteLasMenasEntreTransportes
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new).
	separador transportar.
	separador agregarMenas: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 1. ! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:13'!
test09UnSeparadorPuedeCambiarAModoNeutroDesdeCualquierOtroModo
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new).
	
	separador cambiarAModoNeutro.
	 
	self assert: separador estaEnModoNeutro.! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:12'!
test10UnSeparadorNoPuedeCambiarAModoFiltradoEstandoEnModoBalanceado
	
	self inicializarSeparadorBalanceadoCon: 	#().
	
	self should: [ separador cambiarAModoFiltradoPor: MenaDeCarbon ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [: unError		 |
		self assert: SeparadorDeMenas mensajeDeErrorCambioDeModoInvalido equals: unError messageText.
		self assert: separador estaEnModoBalanceado.
	].! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:12'!
test11UnSeparadorNoPuedeCambiarAModoBalanceadoEstandoEnModoFiltrado
	
	self inicializarSeparadorFiltrandoPor: MenaDeCarbon con: #().
	
	self should: [ separador cambiarAModoBalanceado ] 
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [: unError		 |
		self assert: SeparadorDeMenas mensajeDeErrorCambioDeModoInvalido equals: unError messageText.
		self deny: separador estaEnModoBalanceado.
		self assert: separador estaEnModoFiltrado.
	].! !

!SeparadorDeMenasTest methodsFor: 'tests' stamp: 'JMB 7/19/2021 22:10:12'!
test12UnSeparadorAlCambiarAModoBalanaceadoEstandoEnModoBalanceadoNoModificaElProximoDestino
	
	self inicializarSeparadorBalanceadoCon: (OrderedCollection with: MenaDeCarbon new).
	separador transportar.
	
	separador cambiarAModoBalanceado.
	separador agregarMenas: (OrderedCollection with: MenaDeCarbon new).
	
	separador transportar.
	
	self assertSeTransportaronAlDestinoPrimario: 1 yAlSecundario: 1.! !


!SeparadorDeMenasTest methodsFor: 'setUp/tearDown' stamp: 'JMB 7/19/2021 22:13:39'!
setUp
	super setUp.
	separador := nil.
	cajaDestinoPrimario := Caja new.
	cajaDestinoSecundario := Caja new! !


!SeparadorDeMenasTest methodsFor: 'separadores' stamp: 'JMB 7/19/2021 22:14:26'!
inicializarSeparadorBalanceadoCon: unasMenas
	
	self inicializarSeparadorNeutroCon: unasMenas.
	separador cambiarAModoBalanceado.
	^ separador! !

!SeparadorDeMenasTest methodsFor: 'separadores' stamp: 'JMB 7/19/2021 22:14:26'!
inicializarSeparadorFiltrandoPor: unTipoDeMateria con: unasMenas
	
	self inicializarSeparadorNeutroCon: unasMenas.
	separador cambiarAModoFiltradoPor: unTipoDeMateria.
	^ separador! !

!SeparadorDeMenasTest methodsFor: 'separadores' stamp: 'JMB 7/19/2021 22:14:26'!
inicializarSeparadorNeutroCon: unasMenas
	
	separador := SeparadorDeMenas destinoPrimario: cajaDestinoPrimario secundario: 	cajaDestinoSecundario.
	separador agregarMenas: unasMenas.
	^ separador! !


!SeparadorDeMenasTest methodsFor: 'assertions' stamp: 'JMB 7/19/2021 22:10:12'!
assertSeTransportaronAlDestinoPrimario: unaCantidadDeMenasAlDestinoPrimario yAlSecundario: unaCantidadDeMenasAlDestinoSecundario  
	self assert: unaCantidadDeMenasAlDestinoPrimario equals: cajaDestinoPrimario cantidadDeMenas. 
	self assert: unaCantidadDeMenasAlDestinoSecundario equals: cajaDestinoSecundario cantidadDeMenas. 
	self assert: separador estaVacio.! !


!classDefinition: #ModoDeSeparadoDeMenas category: 'AlgoIII-2021-1C-2doParcial-Separador'!
Object subclass: #ModoDeSeparadoDeMenas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!ModoDeSeparadoDeMenas methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 21:48:08'!
cambiarAModoBalanceado: unSeparadorDeMenas
	unSeparadorDeMenas configurarModoBalanceado! !

!ModoDeSeparadoDeMenas methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 21:47:37'!
cambiarAModoFiltrado: unSeparadorDeMenas filtrandoPor: unTipoDeMenaAFiltrar
	unSeparadorDeMenas configurarModoFiltradoPor: unTipoDeMenaAFiltrar! !

!ModoDeSeparadoDeMenas methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 21:47:13'!
cambiarAModoNeutro: unSeparadorDeMenas
	unSeparadorDeMenas configurarModoNeutro! !


!ModoDeSeparadoDeMenas methodsFor: 'funcionamiento' stamp: 'JMB 7/18/2021 15:48:35'!
aplicarPara: unSeparadorDeMenas
	self subclassResponsibility! !


!ModoDeSeparadoDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:43:55'!
esBalanceado
	^ false! !

!ModoDeSeparadoDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:44:54'!
esFiltrado
	^ false! !

!ModoDeSeparadoDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:43:49'!
esNeutro
	^ false! !


!classDefinition: #ModoBalanceado category: 'AlgoIII-2021-1C-2doParcial-Separador'!
ModoDeSeparadoDeMenas subclass: #ModoBalanceado
	instanceVariableNames: 'proximoDestino'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!ModoBalanceado methodsFor: 'initialization' stamp: 'JMB 7/14/2021 01:07:08'!
initialize
	super initialize.
	proximoDestino := 'primario'! !


!ModoBalanceado methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:15:10'!
depachar: unaMena porDestinoPrimarioDe: unSeparadorDeMenas

	unSeparadorDeMenas despacharPorDestinoPrimario: (OrderedCollection with: unaMena).
			proximoDestino := 'secundario'! !

!ModoBalanceado methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:16:17'!
despachar: unaMena porDestinoSecundarioDe: unSeparadorDeMenas

	unSeparadorDeMenas despacharPorDestinoSecundario: (OrderedCollection with: unaMena).
			proximoDestino := 'primario'! !

!ModoBalanceado methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:17:10'!
despachar: unaMena via: unSeparadorDeMenas

	^ self tieneComoSiguienteDestinoElPrimario
		ifTrue: [ self depachar: unaMena porDestinoPrimarioDe: unSeparadorDeMenas ]
		ifFalse: [  self despachar: unaMena porDestinoSecundarioDe: unSeparadorDeMenas ]! !

!ModoBalanceado methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:17:10'!
tieneComoSiguienteDestinoElPrimario

	^ proximoDestino = 'primario'! !


!ModoBalanceado methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 18:14:52'!
cambiarAModoBalanceado: unSeparadorDeMenas
	"Ya esta en modo balanceado "! !

!ModoBalanceado methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 18:11:48'!
cambiarAModoFiltrado: unSeparadorDeMenas filtrandoPor: unTipoDeMenaAFiltrar
	unSeparadorDeMenas lanzarErrorCambioDeModoInvalido
! !


!ModoBalanceado methodsFor: 'funcionamiento' stamp: 'JMB 7/18/2021 15:52:05'!
aplicarPara: unSeparadorDeMenas
	unSeparadorDeMenas contenidoDo: [ : unaMena |  self despachar: unaMena via: unSeparadorDeMenas ].
	unSeparadorDeMenas vaciar.! !


!ModoBalanceado methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:45:10'!
esBalanceado
	^ true! !


!classDefinition: #ModoFiltradoPorMaterial category: 'AlgoIII-2021-1C-2doParcial-Separador'!
ModoDeSeparadoDeMenas subclass: #ModoFiltradoPorMaterial
	instanceVariableNames: 'tipoDeMenaAFiltrar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!ModoFiltradoPorMaterial methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:24:03'!
despacharMenasPorDestinoPrimarioDe: unSeparadorDeMenas

	^ unSeparadorDeMenas despacharPorDestinoPrimario: (self menasADespacharPorDestinoPrimarioDe: unSeparadorDeMenas)! !

!ModoFiltradoPorMaterial methodsFor: 'privado' stamp: 'JMB 7/14/2021 02:24:22'!
despacharMenasPorDestinoSecundarioDe: unSeparadorDeMenas

	^ unSeparadorDeMenas despacharPorDestinoSecundario: (self menasADespacharPorDestinoSecundarioDe: unSeparadorDeMenas)! !

!ModoFiltradoPorMaterial methodsFor: 'privado' stamp: 'JMB 7/18/2021 15:55:34'!
menasADespacharPorDestinoPrimarioDe: unSeparadorDeMenas

	^ unSeparadorDeMenas contenidoSelect: [ :each | (each esDeMaterial: tipoDeMenaAFiltrar) not ]! !

!ModoFiltradoPorMaterial methodsFor: 'privado' stamp: 'JMB 7/18/2021 15:54:09'!
menasADespacharPorDestinoSecundarioDe: unSeparadorDeMenas

	^ unSeparadorDeMenas contenidoSelect: [ :each | each esDeMaterial: tipoDeMenaAFiltrar ]! !


!ModoFiltradoPorMaterial methodsFor: 'funcionamiento' stamp: 'JMB 7/18/2021 15:48:35'!
aplicarPara: unSeparadorDeMenas 
	self despacharMenasPorDestinoPrimarioDe: unSeparadorDeMenas.
	self despacharMenasPorDestinoSecundarioDe: unSeparadorDeMenas.
	unSeparadorDeMenas vaciar.! !


!ModoFiltradoPorMaterial methodsFor: 'initialization' stamp: 'JMB 7/14/2021 01:22:38'!
initializeDe: unTipoDeMenaAFiltrar
	tipoDeMenaAFiltrar := unTipoDeMenaAFiltrar.! !


!ModoFiltradoPorMaterial methodsFor: 'cambio de modo' stamp: 'JMB 7/18/2021 18:13:33'!
cambiarAModoBalanceado: unSeparadorDeMenas
	unSeparadorDeMenas lanzarErrorCambioDeModoInvalido ! !


!ModoFiltradoPorMaterial methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:46:11'!
esFiltrado
	^ true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ModoFiltradoPorMaterial class' category: 'AlgoIII-2021-1C-2doParcial-Separador'!
ModoFiltradoPorMaterial class
	instanceVariableNames: ''!

!ModoFiltradoPorMaterial class methodsFor: 'instance creation' stamp: 'JMB 7/14/2021 01:23:05'!
de: unTipoDeMenaAFiltrar 
	^self new initializeDe: unTipoDeMenaAFiltrar ! !


!classDefinition: #ModoNeutro category: 'AlgoIII-2021-1C-2doParcial-Separador'!
ModoDeSeparadoDeMenas subclass: #ModoNeutro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!ModoNeutro methodsFor: 'funcionamiento' stamp: 'JMB 7/18/2021 15:48:35'!
aplicarPara: unSeparadorDeMenas
	unSeparadorDeMenas despacharPorDestinoPrimario: unSeparadorDeMenas contenido.
	unSeparadorDeMenas vaciar.! !


!ModoNeutro methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:46:26'!
esNeutro
	^ true! !


!classDefinition: #SeparadorDeMenas category: 'AlgoIII-2021-1C-2doParcial-Separador'!
Object subclass: #SeparadorDeMenas
	instanceVariableNames: 'destinoPrimario destinoSecundario contenido modo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-2doParcial-Separador'!

!SeparadorDeMenas methodsFor: 'initialization' stamp: 'JMB 7/18/2021 15:39:00'!
initializeDestinoPrimario: unDestinoPrimario secundario: unDestinioSecundario 
	destinoPrimario := unDestinoPrimario.
	destinoSecundario := unDestinioSecundario.
	contenido := OrderedCollection new.
	modo := ModoNeutro new! !


!SeparadorDeMenas methodsFor: 'privado' stamp: 'JMB 7/14/2021 01:02:41'!
contenido
	^contenido! !

!SeparadorDeMenas methodsFor: 'privado' stamp: 'JMB 7/14/2021 00:48:18'!
despacharPorDestinoPrimario: menasADespachar

	^ destinoPrimario agregarMenas: menasADespachar! !

!SeparadorDeMenas methodsFor: 'privado' stamp: 'JMB 7/14/2021 00:47:56'!
despacharPorDestinoSecundario: menasADespachar

	^ destinoSecundario agregarMenas: menasADespachar! !


!SeparadorDeMenas methodsFor: 'contenido' stamp: 'JMB 7/13/2021 22:07:55'!
agregarMenas: unasMenas
	contenido addAll: unasMenas ! !

!SeparadorDeMenas methodsFor: 'contenido' stamp: 'JMB 7/13/2021 22:11:53'!
vaciar

	^ contenido := OrderedCollection new! !


!SeparadorDeMenas methodsFor: 'modo de funcionamiento' stamp: 'JMB 7/18/2021 18:15:15'!
cambiarAModoBalanceado
	modo cambiarAModoBalanceado: self! !

!SeparadorDeMenas methodsFor: 'modo de funcionamiento' stamp: 'JMB 7/18/2021 18:11:48'!
cambiarAModoFiltradoPor: unTipoDeMenaAFiltrar
	modo cambiarAModoFiltrado: self filtrandoPor: unTipoDeMenaAFiltrar ! !

!SeparadorDeMenas methodsFor: 'modo de funcionamiento' stamp: 'JMB 7/18/2021 19:27:44'!
cambiarAModoNeutro
	modo cambiarAModoNeutro: self! !


!SeparadorDeMenas methodsFor: 'transportar' stamp: 'JMB 7/18/2021 15:48:35'!
transportar
	modo aplicarPara: self! !


!SeparadorDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:43:28'!
estaEnModoBalanceado
	^ modo esBalanceado ! !

!SeparadorDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:43:19'!
estaEnModoFiltrado
	^ modo esFiltrado! !

!SeparadorDeMenas methodsFor: 'testing' stamp: 'JMB 7/18/2021 21:43:10'!
estaEnModoNeutro
	^ modo esNeutro! !

!SeparadorDeMenas methodsFor: 'testing' stamp: 'JMB 7/13/2021 23:17:50'!
estaVacio
	^ contenido isEmpty! !


!SeparadorDeMenas methodsFor: 'privado modo de funcionamiento' stamp: 'JMB 7/18/2021 18:08:58'!
configurarModoBalanceado
	modo := ModoBalanceado new! !

!SeparadorDeMenas methodsFor: 'privado modo de funcionamiento' stamp: 'JMB 7/18/2021 18:08:32'!
configurarModoFiltradoPor: unTipoDeMenaAFiltrar
	modo := ModoFiltradoPorMaterial de: unTipoDeMenaAFiltrar ! !

!SeparadorDeMenas methodsFor: 'privado modo de funcionamiento' stamp: 'JMB 7/18/2021 18:17:02'!
configurarModoNeutro
	modo := ModoNeutro new! !

!SeparadorDeMenas methodsFor: 'privado modo de funcionamiento' stamp: 'JMB 7/18/2021 15:51:46'!
contenidoDo: aBlock
	contenido do: aBlock! !

!SeparadorDeMenas methodsFor: 'privado modo de funcionamiento' stamp: 'JMB 7/18/2021 15:54:29'!
contenidoSelect: aBlock
	^ contenido select: aBlock! !


!SeparadorDeMenas methodsFor: 'errors' stamp: 'JMB 7/18/2021 17:10:48'!
lanzarErrorCambioDeModoInvalido
	self error: self class mensajeDeErrorCambioDeModoInvalido! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SeparadorDeMenas class' category: 'AlgoIII-2021-1C-2doParcial-Separador'!
SeparadorDeMenas class
	instanceVariableNames: ''!

!SeparadorDeMenas class methodsFor: 'instance creation' stamp: 'JMB 7/13/2021 22:04:51'!
destinoPrimario: unDestinoPrimario secundario: unDestinioSecundario 
	^self new initializeDestinoPrimario: unDestinoPrimario secundario: unDestinioSecundario ! !


!SeparadorDeMenas class methodsFor: 'as yet unclassified' stamp: 'JMB 7/18/2021 17:12:23'!
mensajeDeErrorCambioDeModoInvalido
	^ 'Cambio de modo invalido'! !
