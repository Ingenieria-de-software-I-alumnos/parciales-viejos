!classDefinition: #ExtractorTest category: 'AlgoIII-2021-1C-1erParcial'!
TestCase subclass: #ExtractorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-1C-1erParcial'!

!ExtractorTest methodsFor: 'assertions' stamp: 'JMB 6/19/2021 16:54:44'!
assertExtracionDe: menasExtraidas por: unExtractor tuvoUnRendimientoDe: unaCantidadDeEnergia
	
	self assert: unaCantidadDeEnergia // self costoDeExtraccionPorMena equals: menasExtraidas size.
	self assert: unaCantidadDeEnergia \\ self costoDeExtraccionPorMena equals: unExtractor energiaDisponible.
! !


!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:45'!
test01UnExtractorSinCombustibleNoExtraeMenasNiLeSobraEnergia
	| extractor menasExtraidas |
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: #().
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 0*joule.! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:45'!
test02UnExtractorConUnTrozoDeMaderaExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas |
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: (OrderedCollection with: self unaUnidadDeMadera).
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 13*joule

! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:44'!
test03UnExtractorConUnaMenaDeCarbonExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas |
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: (OrderedCollection with: self unaUnidadDeCarbon).
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 26*joule
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:44'!
test04UnExtractorConUnLitroDeGasoilExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas |
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: (OrderedCollection with: self unaUnidadDeGasoil).
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 100*joule
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:45'!
test05UnExtractorMasDeUnaUnidadDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	combustible := OrderedCollection 	with: self unaUnidadDeMadera 	with: self unaUnidadDeMadera.
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.

	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 2*13*joule.
! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:45'!
test06UnExtractorConDiferentesTiposDeCombustibleExtraeMenasSegunLaEnergiaGenerada
	| extractor menasExtraidas combustible |
	combustible := OrderedCollection with: self unaUnidadDeCarbon with: self unaUnidadDeGasoil.
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.

	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 26*joule + (100*joule)	! !

!ExtractorTest methodsFor: 'tests con motor universal' stamp: 'JMB 6/19/2021 16:54:44'!
test10UnExtractorDeCarbonPuedeUsarSuProductoComoCombustible
	| extractor menasDeCarbonExtraidas combustible |
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor := self extractorCon: MotorUniversal conDesgaste: 0 alimentadoCon: combustible.
	menasDeCarbonExtraidas _ extractor extraer.
	extractor alimentarEnergiaCon: (menasDeCarbonExtraidas first: 1).
	
	menasDeCarbonExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasDeCarbonExtraidas por: extractor tuvoUnRendimientoDe: 29*joule.! !


!ExtractorTest methodsFor: 'extractores' stamp: 'LL 6/12/2021 00:39:03'!
costoDeExtraccionPorMena
	"Este código está repetido tambien en Extractor pero NO va a sumar puntos si lo quitan"
	^5 * joule
! !

!ExtractorTest methodsFor: 'extractores' stamp: 'JMB 6/19/2021 16:28:21'!
extractorCon: unTipoDeMotor conDesgaste: unNivelDeDesgaste alimentadoCon: unidadesDeCombustible
	| unExtractor unMotor |
	unMotor := unTipoDeMotor conDesgaste: unNivelDeDesgaste. 
	unExtractor := Extractor deCarbonConMotor: unMotor.
	unExtractor alimentarEnergiaCon: unidadesDeCombustible.
	^ unExtractor
! !


!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/17/2021 20:44:51'!
unaUnidadDeCarbon
	^ MenaDeCarbon new! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/17/2021 20:45:02'!
unaUnidadDeGasoil
	^ LitroDeGasoil new! !

!ExtractorTest methodsFor: 'combustibles' stamp: 'JMB 6/17/2021 20:45:14'!
unaUnidadDeMadera
	^ TrozoDeMadera new! !


!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/19/2021 16:54:44'!
test07UnExtractorConMotorDeSolidosOptimizaElRendimientoDeLaMadera
	| extractor combustible menasExtraidas |
	combustible := OrderedCollection with: self unaUnidadDeMadera.
	extractor := self extractorCon: MotorDeSolidos conDesgaste: 0 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 26*joule.! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/19/2021 16:54:44'!
test08UnExtractorConMotorDeSolidosOptimizaElRendimientoDelCarbon
	| extractor combustible menasExtraidas |
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor := self extractorCon: MotorDeSolidos conDesgaste: 0 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 52*joule! !

!ExtractorTest methodsFor: 'tests con motor de solidos' stamp: 'JMB 6/19/2021 16:54:44'!
test09UnExtractorConMotorDeSolidosDegradaElRendimientoDelGasoil
	| extractor combustible menasExtraidas |
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor := self extractorCon: MotorDeSolidos conDesgaste: 0 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: 25*joule! !


!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'JMB 6/19/2021 16:54:44'!
test11UnExtractorConMotorUniversalDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	combustible := OrderedCollection with: self unaUnidadDeGasoil.
	extractor := self extractorCon: MotorUniversal conDesgaste: 0.5 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: (1 - 0.5)*100*joule.! !

!ExtractorTest methodsFor: 'tests con motor con desgaste' stamp: 'JMB 6/19/2021 16:54:44'!
test12UnExtractorConMotorDeSolidosDesgastadoTieneUnPeorRendimiento
	| extractor menasExtraidas combustible |
	combustible := OrderedCollection with: self unaUnidadDeCarbon.
	extractor := self extractorCon: MotorDeSolidos conDesgaste: 0.5 alimentadoCon: combustible.
	
	menasExtraidas _ extractor extraer.
	
	self assertExtracionDe: menasExtraidas por: extractor tuvoUnRendimientoDe: (1 - 0.5)*52*joule.
! !


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
