!classDefinition: #ExtractorTest category: 'AlgoIII-2021-1C-1erParcial'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: 'desgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

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


!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/12/2021 01:49:59'!
assert: unExtractor tieneUnRendimientoDe: unaCantidadDeEnergia
	| menasExtraidas|
	menasExtraidas _ unExtractor extraer.
	
	self assert: unaCantidadDeEnergia // self costoDeExtraccionPorMena equals: menasExtraidas size.
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

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/12/2021 03:14:17'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor menasDeCarbonExtraidas unidadesDeCombustible |
	unidadesDeCombustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor := self extractorConMotorUniversalAlimentadoCon: unidadesDeCombustible.
	menasDeCarbonExtraidas _ extractor extraer.
	extractor alimentarEnergiaCon: (menasDeCarbonExtraidas first: 1).
	
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


!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 03:18:59'!
extractorConMotorDeSolidosConDesgaste: unNivelDeDesgaste
	| motor |
	motor := MotorDeSolidos conDesgaste: unNivelDeDesgaste.
	^ Extractor deCarbonConMotor: motor
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 03:11:53'!
extractorConMotorUniversalAlimentadoCon: unidadesDeCombustible
	^ self extractorConMotorUniversalConDesgaste: 0 alimentadoCon: unidadesDeCombustible ! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/12/2021 03:18:33'!
extractorConMotorUniversalConDesgaste: unNivelDeDesgaste
	| extractor motor |
	motor := MotorUniversal conDesgaste: unNivelDeDesgaste.
	extractor := Extractor deCarbonConMotor: motor.	
	^extractor! !

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


!ExtractorTest methodsFor: 'setUp/tearDown' stamp: 'JMB 6/12/2021 02:33:46'!
setUp
	super setUp.
	desgaste := 0.5! !


!classDefinition: #Extractor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Extractor
	instanceVariableNames: 'producto energiaActual motor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!Extractor methodsFor: 'combustible' stamp: 'JMB 5/28/2021 16:30:38'!
alimentarEnergiaCon: unidadesDeCombustibleACargar
	| energiaAAgregar |
	energiaAAgregar := motor transformarEnEnergia: unidadesDeCombustibleACargar.
	energiaActual := energiaActual + energiaAAgregar.! !


!Extractor methodsFor: 'extraccion' stamp: 'JMB 5/28/2021 16:21:09'!
extraer
	| cantidadDeMenas energiaConsumida |
	cantidadDeMenas := self menasAExtraerSegunEnergiaActual.
	energiaConsumida := self energiaParaExtraerTodasLasMenasPosibles.
	self consumirEnergia: energiaConsumida.
	^(self obtenerUnaCantidadDeMenas: cantidadDeMenas).! !


!Extractor methodsFor: 'initialization' stamp: 'JMB 6/12/2021 02:53:18'!
initializeWithMaterial: unMaterial conMotor: unMotor 
	self ponerEnCeroLaEnergia.	
	producto := unMaterial.
	motor := unMotor.! !


!Extractor methodsFor: 'accessing' stamp: 'SF 5/5/2021 20:50:00'!
energiaDisponible
	^energiaActual.! !


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

!Extractor methodsFor: 'private' stamp: 'JMB 5/28/2021 16:21:08'!
obtenerUnaCantidadDeMenas: cantidadDeMenas
	^(Array new: cantidadDeMenas withAll: producto) asOrderedCollection.! !

!Extractor methodsFor: 'private' stamp: 'SF 5/5/2021 20:10:18'!
ponerEnCeroLaEnergia
	energiaActual := 0 * joule.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Extractor class' category: 'AlgoIII-2021-1C-1erParcial'!
Extractor class
	instanceVariableNames: ''!

!Extractor class methodsFor: 'instance creation' stamp: 'JMB 6/12/2021 02:52:15'!
deCarbonConMotor: aMotor
	^ self new initializeWithMaterial: MenaDeCarbon new conMotor: aMotor ! !


!classDefinition: #Motor category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #Motor
	instanceVariableNames: 'nivelDeDesgaste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

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

!classDefinition: 'Motor class' category: 'AlgoIII-2021-1C-1erParcial'!
Motor class
	instanceVariableNames: ''!

!Motor class methodsFor: 'instance creation' stamp: 'JMB 6/12/2021 03:16:07'!
conDesgaste: unNivelDeDesgaste
	^ self new initializeConDesgaste: unNivelDeDesgaste ! !


!classDefinition: #MotorDeSolidos category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorDeSolidos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueSeObtieneDesdeUnaUnidadDeCarbon
	^ 52 * joule! !

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueSeObtieneDesdeUnaUnidadDeGasoil
	^ 25 * joule! !

!MotorDeSolidos methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueSeObtieneDesdeUnaUnidadDeMadera
	^ 26 * joule! !


!classDefinition: #MotorUniversal category: 'AlgoIII-2021-1C-1erParcial'!
Motor subclass: #MotorUniversal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueSeObtieneDesdeUnaUnidadDeCarbon
	^ 26 * joule! !

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueSeObtieneDesdeUnaUnidadDeGasoil
	^ 100 * joule! !

!MotorUniversal methodsFor: 'rendimientos decombustibles' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueSeObtieneDesdeUnaUnidadDeMadera
	^ 13 * joule! !


!classDefinition: #UnidadDeCombustible category: 'AlgoIII-2021-1C-1erParcial'!
Object subclass: #UnidadDeCombustible
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!UnidadDeCombustible methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:37:12'!
energiaQueBrindaEn: unMotor
	self subclassResponsibility! !


!classDefinition: #LitroDeGasoil category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #LitroDeGasoil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!LitroDeGasoil methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:26'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeGasoil! !


!classDefinition: #MenaDeCarbon category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #MenaDeCarbon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!MenaDeCarbon methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:00'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeCarbon! !


!classDefinition: #TrozoDeMadera category: 'AlgoIII-2021-1C-1erParcial'!
UnidadDeCombustible subclass: #TrozoDeMadera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!TrozoDeMadera methodsFor: 'combustion' stamp: 'JMB 6/8/2021 14:50:13'!
energiaQueBrindaEn: unMotor
	^ unMotor energiaQueSeObtieneDesdeUnaUnidadDeMadera! !
