!classDefinition: #CircuitosDeFactorioTest category: 'AlgoIII-Factorio-2021-1C'!
TestCase subclass: #CircuitosDeFactorioTest
	instanceVariableNames: 'caja extractorDeCarbon cintaA extractorDeHierro cintaB'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!CircuitosDeFactorioTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 22:05:20'!
extractorConCombustibleDe: unMaterial conectadoA: unDestino
	| combustibles extractor |
	extractor := Extractor para: unMaterial conMotor: (MotorUniversal conDesgaste: 0) conectadoA: unDestino.
	combustibles := OrderedCollection with: TrozoDeMadera new.
	extractor alimentarEnergiaCon: combustibles.
	^ extractor
! !

!CircuitosDeFactorioTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 22:06:30'!
extractorDeCarbonConCombustibleConectadoA: unDestino
	^ self extractorConCombustibleDe: MenaDeCarbon conectadoA: unDestino! !

!CircuitosDeFactorioTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 22:08:03'!
extractorDeHierroConCombustibleConectadoA: unDestino
	^ self extractorConCombustibleDe: MenaDeHierro conectadoA: unDestino! !


!CircuitosDeFactorioTest methodsFor: 'configuracion de circuitos' stamp: 'JMB 7/9/2021 22:06:51'!
configurarCircuitoExtractorCaja
	caja := Caja new.
	extractorDeCarbon := self extractorDeCarbonConCombustibleConectadoA: caja.
	
! !

!CircuitosDeFactorioTest methodsFor: 'configuracion de circuitos' stamp: 'JMB 7/9/2021 22:07:00'!
configurarCircuitoExtractorCintaCaja
	caja := Caja new.
	cintaA := CintaTransportadora conectadaA: caja.
	extractorDeCarbon := self extractorDeCarbonConCombustibleConectadoA: cintaA.
! !

!CircuitosDeFactorioTest methodsFor: 'configuracion de circuitos' stamp: 'JMB 7/9/2021 22:09:48'!
configurarCircuitoExtractorExtractorCintaCintaCaja
	caja := Caja new.
	cintaA := CintaTransportadora conectadaA: caja.
	cintaB := CintaTransportadora conectadaA: cintaA.
	
	extractorDeCarbon := self extractorDeCarbonConCombustibleConectadoA: cintaA.
	
	extractorDeHierro := self extractorDeHierroConCombustibleConectadoA: cintaB.! !


!CircuitosDeFactorioTest methodsFor: 'funcionamiento de circuitos' stamp: 'SF 7/5/2021 20:43:53'!
hacerFuncionarCircuitoExtractorCaja
	extractorDeCarbon extraer! !

!CircuitosDeFactorioTest methodsFor: 'funcionamiento de circuitos' stamp: 'SF 7/7/2021 21:34:39'!
hacerFuncionarCircuitoExtractorExtractorCintaCintaCaja
	
	extractorDeCarbon extraer.
	extractorDeHierro extraer.	
	cintaB transportar.
	cintaA transportar.! !

!CircuitosDeFactorioTest methodsFor: 'funcionamiento de circuitos' stamp: 'SF 7/7/2021 20:45:55'!
hacerFuncionarExtractorCintaCaja
		
	extractorDeCarbon extraer.
	cintaA transportar.! !


!CircuitosDeFactorioTest methodsFor: 'asserts' stamp: 'JMB 7/9/2021 22:18:41'!
assertLaCajaContieneUnaCantidadDeMenasDeCarbon: unaCantidadDeMenasDeCarbonDepositadas
	self assertLaCajaContieneUnaCantidadDeMenasDeCarbon: unaCantidadDeMenasDeCarbonDepositadas yDeHierro: 0 ! !

!CircuitosDeFactorioTest methodsFor: 'asserts' stamp: 'JMB 7/9/2021 22:21:09'!
assertLaCajaContieneUnaCantidadDeMenasDeCarbon: unaCantidadDeMenasDeCarbonDepositadas yDeHierro:  unaCantidadDeMenasDeHierroDepositadas

	self assert: unaCantidadDeMenasDeCarbonDepositadas + unaCantidadDeMenasDeHierroDepositadas equals: caja cantidadDeMenas.
	self assert: unaCantidadDeMenasDeCarbonDepositadas equals: (caja cantidadDe: MenaDeCarbon).
	self assert: unaCantidadDeMenasDeHierroDepositadas equals: (caja cantidadDe: MenaDeHierro).
! !


!CircuitosDeFactorioTest methodsFor: 'tests' stamp: 'JMB 7/9/2021 22:18:57'!
test01ExtractorCaja
	self configurarCircuitoExtractorCaja.
	
	self hacerFuncionarCircuitoExtractorCaja.
	
	self assertLaCajaContieneUnaCantidadDeMenasDeCarbon: 2.
! !

!CircuitosDeFactorioTest methodsFor: 'tests' stamp: 'JMB 7/9/2021 22:19:03'!
test02ExtractorCintaCaja
	self configurarCircuitoExtractorCintaCaja.
	
	self hacerFuncionarExtractorCintaCaja.
	
	self assertLaCajaContieneUnaCantidadDeMenasDeCarbon: 2.
	self assert: cintaA estaVacia.
! !

!CircuitosDeFactorioTest methodsFor: 'tests' stamp: 'JMB 7/9/2021 22:17:36'!
test03ExtractorExtractorCintaCintaCaja

	self configurarCircuitoExtractorExtractorCintaCintaCaja.
	
	self hacerFuncionarCircuitoExtractorExtractorCintaCintaCaja.
	
	self assertLaCajaContieneUnaCantidadDeMenasDeCarbon: 2 yDeHierro: 2.
	self assert: cintaA estaVacia.
	self assert: cintaB estaVacia.
! !


!classDefinition: #ExtractorTest category: 'AlgoIII-Factorio-2021-1C'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: 'desgaste cajaDestino'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!ExtractorTest methodsFor: 'combustibles' stamp: 'LL 6/12/2021 00:39:03'!
costoDeExtraccionPorMena
	"Este código está repetido tambien en Extractor pero NO va a sumar puntos si lo quitan"
	^5 * joule
! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/12/2021 01:26:50'!
unaUnidadDeCarbon
	^ MenaDeCarbon new! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/12/2021 01:27:21'!
unaUnidadDeGasoil
	^ LitroDeGasoil new! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/12/2021 01:27:30'!
unaUnidadDeMadera
	^ TrozoDeMadera  new! !


!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 7/9/2021 20:40:38'!
assert: unExtractor tieneUnRendimientoDe: unaCantidadDeEnergia

	unExtractor extraer.
	
	self assert: unaCantidadDeEnergia // self costoDeExtraccionPorMena equals: cajaDestino cantidadDeMenas.
	self assert: unaCantidadDeEnergia \\ self costoDeExtraccionPorMena equals: unExtractor energiaDisponible.
! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 02:46:01'!
assertExtractorConMotorDeSolidosAlimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	self assertExtractorConMotorDeSolidosConDesgaste: 0 alimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 02:45:26'!
assertExtractorConMotorDeSolidosConDesgaste: unDesgaste alimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	| extractor unidadesDeCombustible |
	extractor := self extractorConMotorDeSolidosConDesgaste: unDesgaste.
	unidadesDeCombustible := OrderedCollection with: unCombustible.
	extractor alimentarEnergiaCon: unidadesDeCombustible.	
	self assert: extractor tieneUnRendimientoDe: unaCantidadDeEnergia.	! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 02:46:45'!
assertExtractorConMotorDeSolidosDesgastadoAlimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	self assertExtractorConMotorDeSolidosConDesgaste: desgaste alimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 03:05:36'!
assertExtractorConMotorDeUniversalDesgastadoAlimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	| unidadesDeCombustible |
	unidadesDeCombustible := OrderedCollection with: unCombustible.
	self assertExtractorConMotorUniversalConDesgaste: desgaste alimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 03:08:25'!
assertExtractorConMotorUniversalAlimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	^ self assertExtractorConMotorUniversalConDesgaste: 0 alimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: unaCantidadDeEnergia! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 03:06:45'!
assertExtractorConMotorUniversalAlimentadoConUnaUnidadDe: unCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	| unidadesDeCombustible |
	unidadesDeCombustible := OrderedCollection with: unCombustible.
	self assertExtractorConMotorUniversalAlimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
! !

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 03:10:51'!
assertExtractorConMotorUniversalConDesgaste: unDesgaste alimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: unaCantidadDeEnergia
	| extractor |
	extractor := self extractorConMotorUniversalConDesgaste: unDesgaste alimentadoCon: unidadesDeCombustible.	
	self assert: extractor tieneUnRendimientoDe: unaCantidadDeEnergia.	! !


!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 01:59:18'!
test01UnExtractorSinCombustibleNoExtraeMenasNiLeSobraEnergia
	self assertExtractorConMotorUniversalAlimentadoCon: #() tieneUnRendimientoDe: 0 * joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 02:03:25'!
test02UnExtractorConUnTrozoDeMaderaExtraeMenasSegunLaEnergiaGenerada
	self assertExtractorConMotorUniversalAlimentadoConUnaUnidadDe: self unaUnidadDeMadera tieneUnRendimientoDe: 13*joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 02:03:51'!
test03UnExtractorConUnaMenaDeCarbonExtraeMenasSegunLaEnergiaGenerada
	self assertExtractorConMotorUniversalAlimentadoConUnaUnidadDe: self unaUnidadDeCarbon tieneUnRendimientoDe: 26*joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 02:05:20'!
test04UnExtractorConUnLitroDeGasoilExtraeMenasSegunLaEnergiaGenerada
	self assertExtractorConMotorUniversalAlimentadoConUnaUnidadDe: self unaUnidadDeGasoil tieneUnRendimientoDe: 100*joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 02:06:31'!
test05UnExtractorMasDeUnaUnidadDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| unidadesDeCombustible |
	unidadesDeCombustible := OrderedCollection 	with: self unaUnidadDeMadera 	with: self unaUnidadDeMadera.
	self assertExtractorConMotorUniversalAlimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: 2*13*joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 02:07:38'!
test06UnExtractorConDiferentesTiposDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| unidadesDeCombustible |
	unidadesDeCombustible := OrderedCollection with: self unaUnidadDeCarbon with: self unaUnidadDeGasoil.
	self assertExtractorConMotorUniversalAlimentadoCon: unidadesDeCombustible tieneUnRendimientoDe: (26*joule) + (100*joule ).
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 7/19/2021 22:17:44'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor unidadesDeCombustible menasExtraidas |
	unidadesDeCombustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor := self extractorConMotorUniversalAlimentadoCon: unidadesDeCombustible.
	extractor extraer.
	menasExtraidas := cajaDestino retirarContenido.
	
	extractor alimentarEnergiaCon: (menasExtraidas first: 1).
	
	self assert: extractor tieneUnRendimientoDe: 29*joule
! !


!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/12/2021 02:14:10'!
test07UnExtractorConMotorDeSolidosOptimizaElRendimientoDeLaMadera
	self assertExtractorConMotorDeSolidosAlimentadoConUnaUnidadDe: self unaUnidadDeMadera tieneUnRendimientoDe: 26*joule.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/12/2021 02:20:03'!
test08UnExtractorConMotorDeSolidosOptimizaElRendimientoDelCarbon
	self assertExtractorConMotorDeSolidosAlimentadoConUnaUnidadDe: self unaUnidadDeCarbon tieneUnRendimientoDe: 52*joule.
! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/12/2021 02:20:26'!
test09UnExtractorConMotorDeSolidosDegradaElRendimientoDelGasoil
	self assertExtractorConMotorDeSolidosAlimentadoConUnaUnidadDe: self unaUnidadDeGasoil tieneUnRendimientoDe: 25*joule.
! !


!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'JMB 6/12/2021 02:36:28'!
test11UnExtractorConMotorUniversalDesgastadoTieneUnPeorRendimiento
	self assertExtractorConMotorDeUniversalDesgastadoAlimentadoConUnaUnidadDe: self unaUnidadDeGasoil tieneUnRendimientoDe: (1 - desgaste)*100*joule.
! !

!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'JMB 6/12/2021 02:36:13'!
test12UnExtractorConMotorDeSolidosDesgastadoTieneUnPeorRendimiento
	self assertExtractorConMotorDeSolidosDesgastadoAlimentadoConUnaUnidadDe: self unaUnidadDeCarbon tieneUnRendimientoDe: (1 - desgaste)*52*joule.
! !


!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 20:40:38'!
extractorConMotorConMotor: unTipoDeMotor conDesgaste: unNivelDeDesgaste
	| motor |
	motor := unTipoDeMotor conDesgaste: unNivelDeDesgaste.
	^ Extractor deCarbonConMotor: motor conectadoA: cajaDestino
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 20:18:19'!
extractorConMotorDeSolidosConDesgaste: unNivelDeDesgaste
	^ self extractorConMotorConMotor: MotorDeSolidos conDesgaste: unNivelDeDesgaste 
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 03:11:53'!
extractorConMotorUniversalAlimentadoCon: unidadesDeCombustible
	^ self extractorConMotorUniversalConDesgaste: 0 alimentadoCon: unidadesDeCombustible ! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 7/9/2021 20:18:52'!
extractorConMotorUniversalConDesgaste: unNivelDeDesgaste
	^self extractorConMotorConMotor: MotorUniversal conDesgaste: unNivelDeDesgaste! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 03:10:11'!
extractorConMotorUniversalConDesgaste: unDesgaste alimentadoCon: unidadesDeCombustible
	| extractor |
	extractor := self extractorConMotorUniversalConDesgaste: unDesgaste .
	extractor alimentarEnergiaCon: unidadesDeCombustible.	
	^ extractor ! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 02:57:00'!
extractorConMotorUniversalSinDesgaste
	^ self extractorConMotorUniversalConDesgaste: 0
! !


!ExtractorTest methodsFor: 'setUp/tearDown' stamp: 'JMB 7/9/2021 20:40:38'!
setUp
	super setUp.
	cajaDestino := Caja new.
	desgaste := 0.5! !


!classDefinition: #Caja category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #Caja
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!Caja methodsFor: 'contenido' stamp: 'SF 7/5/2021 22:21:46'!
agregarMenas: anOrderedCollection 
	contenido addAll: anOrderedCollection.! !

!Caja methodsFor: 'contenido' stamp: 'JMB 7/9/2021 22:35:15'!
cantidadDe: unTipoDeMaterial
	^contenido count: [ : unElementoContenido | unElementoContenido esDeMaterial: unTipoDeMaterial ]! !

!Caja methodsFor: 'contenido' stamp: 'SF 7/5/2021 22:18:42'!
cantidadDeMenas
	^contenido size.! !

!Caja methodsFor: 'contenido' stamp: 'JMB 7/9/2021 20:32:04'!
retirarContenido
	| contenidoARetirar |
	contenidoARetirar := contenido.
	contenido := OrderedCollection new.
	^ contenidoARetirar ! !


!Caja methodsFor: 'inicializacion' stamp: 'JMB 7/9/2021 20:51:39'!
initialize
	self vaciar.! !


!Caja methodsFor: 'privado' stamp: 'JMB 7/9/2021 20:51:28'!
vaciar
	contenido := OrderedCollection new.! !


!Caja methodsFor: 'testing' stamp: 'JMB 7/9/2021 22:39:17'!
estaVacia
	^ contenido isEmpty! !


!classDefinition: #CintaTransportadora category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #CintaTransportadora
	instanceVariableNames: 'contenido destino'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!CintaTransportadora methodsFor: 'inicializacion' stamp: 'JMB 7/9/2021 21:37:58'!
initializeConectadoA: unDestino
	destino := unDestino.
	self vaciar.! !


!CintaTransportadora methodsFor: 'privado' stamp: 'JMB 7/9/2021 21:38:13'!
vaciar
	contenido := OrderedCollection new.! !


!CintaTransportadora methodsFor: 'contenido' stamp: 'JMB 7/9/2021 21:45:10'!
agregarMenas: unaColecccionDeMenas
	contenido addAll: unaColecccionDeMenas! !

!CintaTransportadora methodsFor: 'contenido' stamp: 'SF 7/7/2021 20:54:41'!
estaVacia
	^contenido isEmpty.! !


!CintaTransportadora methodsFor: 'transporte' stamp: 'JMB 7/9/2021 21:45:20'!
transportar
	destino agregarMenas: contenido.
	self vaciar.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CintaTransportadora class' category: 'AlgoIII-Factorio-2021-1C'!
CintaTransportadora class
	instanceVariableNames: ''!

!CintaTransportadora class methodsFor: 'instance creation' stamp: 'JMB 7/9/2021 21:13:21'!
conectadaA: unDestino
	^ self new initializeConectadoA: unDestino! !


!classDefinition: #Extractor category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #Extractor
	instanceVariableNames: 'producto energiaActual motor destino'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!Extractor methodsFor: 'combustible' stamp: 'JMB 5/28/2021 16:30:38'!
alimentarEnergiaCon: unidadesDeCombustibleACargar
	| energiaAAgregar |
	energiaAAgregar := motor transformarEnEnergia: unidadesDeCombustibleACargar.
	energiaActual := energiaActual + energiaAAgregar.! !


!Extractor methodsFor: 'extraccion' stamp: 'SF 7/5/2021 22:21:12'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self consumirEnergia: energiaConsumida.
	^destino agregarMenas: (self obtenerUnaCantidadDeMenas: cantidadDeMenas).! !


!Extractor methodsFor: 'initialization' stamp: 'JMB 7/9/2021 20:24:03'!
initializeWithMaterial: unMaterial conMotor: unMotor conectadoA: unDestino 
	producto := unMaterial.
	motor := unMotor.
	destino := unDestino.
	self ponerEnCeroLaEnergia.	! !


!Extractor methodsFor: 'accessing' stamp: 'SF 5/5/2021 20:50:00'!
energiaDisponible
	^energiaActual.! !

!Extractor methodsFor: 'accessing' stamp: 'SF 7/7/2021 20:49:47'!
producto
	^producto! !


!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:35:27'!
consumirEnergia: energiaAConsumir
	energiaActual := energiaActual - energiaAConsumir.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:48'!
costoDeExtraccionPorMena
	^5 * joule.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:40:41'!
energiaParaExtraerTodasLasMenasPosibles
	^self menasAExtraerSegunEnergiaActual * self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:39:37'!
menasAExtraerSegunEnergiaActual
	^energiaActual // self costoDeExtraccionPorMena.! !

!Extractor methodsFor: 'private' stamp: 'SF 7/7/2021 20:57:59'!
obtenerUnaCantidadDeMenas: cantidadDeMenas
	| menas |
	menas := OrderedCollection new.
	cantidadDeMenas timesRepeat: [ menas add: producto new ].
	^menas.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:10:18'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Extractor class' category: 'AlgoIII-Factorio-2021-1C'!
Extractor class
	instanceVariableNames: ''!

!Extractor class methodsFor: 'instance creation' stamp: 'JMB 7/9/2021 21:08:33'!
deCarbonConMotor: unMotor conectadoA: unDestino
	^ self para: MenaDeCarbon conMotor: unMotor conectadoA: unDestino ! !

!Extractor class methodsFor: 'instance creation' stamp: 'JMB 7/9/2021 20:43:26'!
deCarbonConectadoA: unDestino
	^ self deCarbonConMotor: (MotorUniversal conDesgaste: 0) conectadoA: unDestino ! !

!Extractor class methodsFor: 'instance creation' stamp: 'JMB 7/9/2021 21:10:02'!
deHierroConectadoA: unDestino
	^ self para: MenaDeHierro conMotor: (MotorUniversal conDesgaste: 0) conectadoA: unDestino! !

!Extractor class methodsFor: 'instance creation' stamp: 'JMB 7/9/2021 21:06:54'!
para: unMaterial conMotor: unMotor conectadoA: unDestino
	^ self new initializeWithMaterial: unMaterial conMotor: unMotor conectadoA: unDestino ! !


!classDefinition: #MenaDeHierro category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #MenaDeHierro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!MenaDeHierro methodsFor: 'testing' stamp: 'JMB 7/9/2021 22:30:42'!
esDeMaterial: unTipoDeMaterial
	^ self isMemberOf: unTipoDeMaterial! !


!classDefinition: #Motor category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #Motor
	instanceVariableNames: 'nivelDeDesgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!Motor methodsFor: 'private' stamp: 'JMB 6/12/2021 01:41:26'!
transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible
	^ (unaUnidadDeCombustible energiaQueBrindaEn: self) * (1 - nivelDeDesgaste)! !


!Motor methodsFor: 'funcionamiento' stamp: 'JMB 6/12/2021 01:12:03'!
transformarEnEnergia: unidadesDeCombustible
	^ unidadesDeCombustible sum: [ : unaUnidadDeCombustible | 
		self transformarEnEnergiaUnaUnidad: unaUnidadDeCombustible ] ifEmpty: [ ^ 0*joule ]! !


!Motor methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueSeObtieneDesdeUnaUnidadDeCarbon
	self subclassResponsibility ! !

!Motor methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueSeObtieneDesdeUnaUnidadDeGasoil
	self subclassResponsibility ! !

!Motor methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueSeObtieneDesdeUnaUnidadDeMadera
	self subclassResponsibility ! !


!Motor methodsFor: 'initialization' stamp: 'JMB 6/12/2021 03:16:47'!
initializeConDesgaste: unNivelDeDesgaste
	nivelDeDesgaste := unNivelDeDesgaste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Motor class' category: 'AlgoIII-Factorio-2021-1C'!
Motor class
	instanceVariableNames: ''!

!Motor class methodsFor: 'instance creation' stamp: 'JMB 6/12/2021 03:16:07'!
conDesgaste: unNivelDeDesgaste
	^ self new initializeConDesgaste: unNivelDeDesgaste ! !


!classDefinition: #MotorDeSolidos category: 'AlgoIII-Factorio-2021-1C'!
Motor subclass: #MotorDeSolidos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueSeObtieneDesdeUnaUnidadDeCarbon
	^ 52 * joule! !

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueSeObtieneDesdeUnaUnidadDeGasoil
	^ 25 * joule! !

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueSeObtieneDesdeUnaUnidadDeMadera
	^ 26 * joule! !


!classDefinition: #MotorUniversal category: 'AlgoIII-Factorio-2021-1C'!
Motor subclass: #MotorUniversal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueSeObtieneDesdeUnaUnidadDeCarbon
	^ 26 * joule! !

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueSeObtieneDesdeUnaUnidadDeGasoil
	^ 100 * joule! !

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueSeObtieneDesdeUnaUnidadDeMadera
	^ 13 * joule! !


!classDefinition: #UnidadDeCombustible category: 'AlgoIII-Factorio-2021-1C'!
Object subclass: #UnidadDeCombustible
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!UnidadDeCombustible methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:37:12'!
energiaQueBrindaEn: unMotor
	self subclassResponsibility! !


!classDefinition: #LitroDeGasoil category: 'AlgoIII-Factorio-2021-1C'!
UnidadDeCombustible subclass: #LitroDeGasoil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!LitroDeGasoil methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeGasoil! !


!classDefinition: #MenaDeCarbon category: 'AlgoIII-Factorio-2021-1C'!
UnidadDeCombustible subclass: #MenaDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!MenaDeCarbon methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeCarbon! !


!MenaDeCarbon methodsFor: 'testing' stamp: 'JMB 7/9/2021 22:31:24'!
esDeMaterial: unTipoDeMaterial
	^ self isMemberOf: unTipoDeMaterial! !


!classDefinition: #TrozoDeMadera category: 'AlgoIII-Factorio-2021-1C'!
UnidadDeCombustible subclass: #TrozoDeMadera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-Factorio-2021-1C'!

!TrozoDeMadera methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeMadera! !
