!classDefinition: #CombateTest category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
TestCase subclass: #CombateTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!CombateTest methodsFor: 'tests' stamp: 'SF 3/25/2024 19:46:42'!
test01AlMenosUnMiembroDeCadaBandoEsDañado

	| bando1 bando2 combate |
	bando1 := {Combatiente humano.}.
	bando2 := {Combatiente humano.}.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	combate desarrollar.
	
	self assert: bando1 first estaSano not.
	self assert: bando2 first estaSano not.
	! !

!CombateTest methodsFor: 'tests' stamp: 'SF 3/25/2024 19:48:53'!
test02TodosLosMiembrosAtacan

	| bando1 bando2 combate |
	bando1 := {Combatiente humano. Combatiente humano.}.
	bando2 := {Combatiente humano. Combatiente humano.}.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	combate desarrollar.
	
	self assert: (bando1 allSatisfy: [:combatiente | combatiente estaSano not]).
	self assert: (bando2 allSatisfy: [:combatiente | combatiente estaSano not]).
	! !

!CombateTest methodsFor: 'tests' stamp: 'JMB 5/6/2024 21:21:00'!
test03PuedeGanarElBando1

	| bando1 bando2 combate resultado |
	bando1 := {Combatiente humano.}.
	bando2 := {Combatiente humano.}.
	bando2 first recibirDaño: 16*pv.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	resultado := combate desarrollar.
	
	self assert: 'bando1' equals: (resultado at: 'ganador').
	! !

!CombateTest methodsFor: 'tests' stamp: 'JMB 5/6/2024 21:21:07'!
test04PuedeGanarElBando2

	| bando1 bando2 combate resultado |
	bando1 := {Combatiente humano.}.
	bando2 := {Combatiente humano.}.
	bando1 first recibirDaño: 16*pv.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	resultado := combate desarrollar.
	
	self assert: 'bando2' equals: (resultado at: 'ganador').
	! !

!CombateTest methodsFor: 'tests' stamp: 'SF 4/5/2024 17:31:57'!
test05TodosLosMiembrosAtacan

	| bando1 bando2 combate resultado |
	bando1 := {Combatiente humano. Combatiente humano.}.
	bando2 := {Combatiente humano. Combatiente humano.}.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	resultado := combate desarrollar.
	
	self assert: 'bando1' equals: (resultado at: 'ganador').
	! !

!CombateTest methodsFor: 'tests' stamp: 'SF 4/5/2024 17:32:07'!
test06TodosLosMiembrosAtacan

	| bando1 bando2 combate resultado |
	bando1 := {Combatiente humano. Combatiente humano.}.
	bando2 := {Combatiente humano. Combatiente humano. Combatiente humano.}.
	combate := Combate enfrentarBando1: bando1 vsBando2: bando2.
	
	resultado := combate desarrollar.
	
	self assert: 'bando2' equals: (resultado at: 'ganador').
	! !


!classDefinition: #CombatienteTest category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
TestCase subclass: #CombatienteTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:22:53'!
test01GoliatEmpiezaSano

	| goliat |
	goliat := Combatiente humano.
		
	self assert: goliat estaSano.
	self assert: (goliat estaDañadoPor: 0*pv).
	self assert: goliat puntosDeVida equals: 20*pv.
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:23:05'!
test02GoliatNoEstaSanoSiRecibeDaño

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 2*pv.

	self deny: goliat estaSano.
	self assert: (goliat estaDañadoPor: 2*pv).
	self assert: goliat puntosDeVida equals: 18*pv.
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:23:50'!
test03CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 4*pv.
	
	self assert: (goliat estaDañadoPor: 4*pv).
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:24:10'!
test04CuandoSeDañaAAlguienEsPorUnaCantidadDeDaño

	| goliat |
	goliat := Combatiente humano.
	goliat recibirDaño: 4*pv.
	
	self deny: (goliat estaDañadoPor: 8*pv).
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:24:21'!
test05GoliatPuedeRecibirDañoMultiplesVeces

	| goliat |
	goliat := Combatiente humano.

	goliat recibirDaño: 4*pv.
	goliat recibirDaño: 4*pv.
	
	self assert: (goliat estaDañadoPor: 8*pv).
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:43:14'!
test06DavidPuedeAtacarAAlguien

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	
	david atacarA: goliat.
	
	self assertElCombatienteHaSidoDañado: goliat.
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:43:22'!
test07DavidPuedeAtacarEnemigosAsignados

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
		
	david enemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assertElCombatienteHaSidoDañado: goliat.
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'SF 4/1/2024 19:14:04'!
test08DavidNoAtacaAUnEnemigoNoAsignado

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
		
	david atacar.
	
	self assert: goliat estaSano.
! !

!CombatienteTest methodsFor: 'tests-combatir' stamp: 'JMB 5/6/2024 21:24:42'!
test09DavidNoAtacaAUnEnemigoSiEstaFueraDeCombate

	| david goliat |
	david := Combatiente humano.
	goliat := Combatiente humano.
	david enemigos: {goliat}.
	david recibirDaño: 20*pv.
		
	david atacar.
	
	self assert: goliat estaSano.
! !


!CombatienteTest methodsFor: 'tests-estrategia' stamp: 'JMB 5/6/2024 21:42:27'!
test01PuedoDefinirleUnaEstrategiaADavid

	| goliat david |
	goliat := Combatiente humano.
	david := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david enemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assertElCombatienteHaSidoDañado: goliat.! !

!CombatienteTest methodsFor: 'tests-estrategia' stamp: 'JMB 5/6/2024 21:40:18'!
test02EnfocarseEnElMasSanoAtacaAlMenosDañado

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2*pv.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david enemigos: {goliat. isaac.}.
	david atacar.
	
	self assertElCombatienteHaSidoDañado: isaac.! !

!CombatienteTest methodsFor: 'tests-estrategia' stamp: 'JMB 5/6/2024 21:40:18'!
test03EnfocarseEnElMasSanoAtacaAlMenosDañadoNoImportaElOrden

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2*pv.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasSano.
	david enemigos: {isaac. goliat.}.
	david atacar.
	
	self assertElCombatienteHaSidoDañado: isaac.! !

!CombatienteTest methodsFor: 'tests-estrategia' stamp: 'JMB 5/13/2024 20:57:22'!
test04EnfocarseEnElMasHeridoAtacaAlMasDañado

	| david goliat isaac |
	david := Combatiente humano.
	goliat := Combatiente humano.
	goliat recibirDaño: 2*pv.
	isaac := Combatiente humano.
	
	david enfocarseEnElMasHerido.
	david enemigos: {goliat. isaac.}.
	david atacar.
	
	self assert: (goliat estaDañadoPor: 6*pv).! !

!CombatienteTest methodsFor: 'tests-estrategia' stamp: 'JMB 5/6/2024 21:43:00'!
test05PorDefectoUnCombatienteAtacaAlMasSano

	| goliat david |
	goliat := Combatiente humano.
	david := Combatiente humano.
	
	david enemigos: {goliat}.
	david atacar.
	
	self deny: goliat estaSano.
	self assertElCombatienteHaSidoDañado: goliat.! !


!CombatienteTest methodsFor: 'assertions' stamp: 'JMB 5/13/2024 20:57:11'!
assertElCombatienteHaSidoDañado: unCombatiente

	^ self assert: (unCombatiente estaDañadoPor: 4*pv)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatienteTest class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
CombatienteTest class
	instanceVariableNames: ''!

!CombatienteTest class methodsFor: 'initialization' stamp: 'JMB 5/6/2024 21:20:09'!
initialize

	"Este método está para crear unidades. No se debe tocar"

	| puntosDeVida |
	super initialize.
	puntosDeVida := BaseUnit named: 'puntosDeVida' sign: 'pv'.

	Smalltalk at: #pv put: puntosDeVida.
	Smalltalk at: #puntosDeVida put: puntosDeVida.! !


!classDefinition: #OgroTest category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
TestCase subclass: #OgroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!OgroTest methodsFor: 'tests' stamp: 'SF 3/25/2024 17:52:03'!
test01UnOgroRecienCreadoEstaSano
	| ogro |
	ogro := Combatiente ogro.
	
	self assert: ogro estaSano.
! !

!OgroTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 20:55:26'!
test02UnOgroAguantaAlMenos39PuntosDeDaño
	| ogro otroOgro |
	ogro := Combatiente ogro.
	otroOgro := Combatiente ogro.
	ogro enemigos: {otroOgro}.
	
	ogro recibirDaño: 39*pv.
	ogro atacar.
	
	self assert: otroOgro estaSano not.
	
! !

!OgroTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 20:55:33'!
test03UnOgroQuedaFueraDeCombateAlRecibir40PuntosDeDaño
	| ogro otroOgro |
	ogro := Combatiente ogro.
	otroOgro := Combatiente ogro.
	ogro enemigos: {otroOgro}.

	ogro recibirDaño: 40*pv.
	
	ogro atacar.
	self assert: otroOgro estaSano.
! !

!OgroTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 20:56:05'!
test04UnOgroHace8PuntosDeDañoCuandoAtaca
	| ogro otroOgro |
	ogro := Combatiente ogro.
	otroOgro := Combatiente ogro.
	ogro enemigos: {otroOgro}.
	
	ogro atacar.
	
	self assert: (otroOgro estaDañadoPor: 8*pv).
! !


!classDefinition: #PenalizadoresDeAtaquesTest category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
TestCase subclass: #PenalizadoresDeAtaquesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 10/16/2023 22:29:42'!
test01AtaquesSinPenalizadoresNoModificaElDañoInfligido
	self assertUnAtaqueCon: #() reduceElDañoEn: 0*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:26:13'!
test02AtaquesEstandoMareadoReducenEnUnoElDañoInfligido
	self assertUnAtaqueCon: {self penalizacionPorEstarMareado} reduceElDañoEn: 1*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:26:36'!
test03AtaquesEstandoEmbarradoReducenEnDosElDañoInfligido
	self assertUnAtaqueCon: {self penalizacionPorEstarEmbarrado} reduceElDañoEn: 2*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:26:56'!
test04AtaquesEstandoEnredadoReducenEnDosElDañoInfligido
	self assertUnAtaqueCon: {self penalizacionPorEstarEnredado} reduceElDañoEn: 2*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:27:20'!
test05AtaquesEstandoDesmotivadoReducenEnDosElDañoInfligido
	self assertUnAtaqueCon: {self penalizacionPorEstarDesmotivado} reduceElDañoEn: 2*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:27:51'!
test06AtaquesEstandoDesesperanzadoReducenEnCuatroElDañoInfligido
	self assertUnAtaqueCon: {self penalizacionPorEstarDesesperanzado} reduceElDañoEn: 4*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:28:50'!
test07AtaquesConPenalizadoresSobreAspectosDiferentesSeSuman
	self 
		assertUnAtaqueCon: {self penalizacionPorEstarMareado. self penalizacionPorEstarEmbarrado}
		reduceElDañoEn: (1*pv) + (2*pv).! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:30:44'!
test08AtaquesConPenalizadoresDelMismoAspectoConElMismoEfectoSoloSeAplicaUno
	self 
		assertUnAtaqueCon: {self penalizacionPorEstarEmbarrado. self penalizacionPorEstarEnredado}
		reduceElDañoEn: 2*pv! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:30:38'!
test08_1_AtaquesConPenalizadoresDelMismoAspectoConElMismoEfectoSoloSeAplicaUnoSinImportarElOrden_DATO_DE_PRUEBA_DE_8

	self 
		assertUnAtaqueCon: {self penalizacionPorEstarEnredado. self penalizacionPorEstarEmbarrado}
		reduceElDañoEn: 2*pv.! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:30:30'!
test09AtaquesConPenalizadoresDelMismoAspectoSoloSeAplicaElPeor

	self 
		assertUnAtaqueCon: {self penalizacionPorEstarDesmotivado. self penalizacionPorEstarDesesperanzado}
		reduceElDañoEn: 4*pv.! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:31:21'!
test09_1_AtaquesConPenalizadoresDelMismoAspectoSoloSeAplicaElPeorSinImportarElOrden_DATO_DE_PRUEBA_DE_9
	
	self 
		assertUnAtaqueCon: {self penalizacionPorEstarDesesperanzado. self penalizacionPorEstarDesmotivado}
		reduceElDañoEn: 4*pv.! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:31:52'!
test10AtaquesConPenalizadoresRepetidosSoloSeAplicaUno_DATO_DE_PRUEBA_DE_8

	self 
		assertUnAtaqueCon: {self penalizacionPorEstarMareado. self penalizacionPorEstarMareado}
		reduceElDañoEn: 1*pv.! !

!PenalizadoresDeAtaquesTest methodsFor: 'tests' stamp: 'JMB 5/13/2024 23:39:09'!
test11AtaquesConPenalizadoresComoMaximoPuedenReducirElDañoHastaQueElAtaqueQuedeSinEfecto
	
	self 
		assertUnAtaqueDe: Combatiente humano 
		conDañoOriginalDe: 4*pv 
		con: {self penalizacionPorEstarMareado. self penalizacionPorEstarEmbarrado. self penalizacionPorEstarDesesperanzado} 
		reduceElDañoEn: 4*pv! !


!PenalizadoresDeAtaquesTest methodsFor: 'assertions' stamp: 'JMB 5/13/2024 23:37:28'!
assertUnAtaqueCon: unosPenalizadores reduceElDañoEn: unaCantidadDeDañoAReducir

	self 
		assertUnAtaqueDe: Combatiente ogro 
		conDañoOriginalDe: 8*pv 
		con: unosPenalizadores 
		reduceElDañoEn: unaCantidadDeDañoAReducir! !

!PenalizadoresDeAtaquesTest methodsFor: 'assertions' stamp: 'JMB 5/13/2024 23:36:31'!
assertUnAtaqueDe: unAtacante conDañoOriginalDe: unDañoOriginal con: unosPenalizadores reduceElDañoEn: unaCantidadDeDañoAReducir
	| victima |
	victima := Combatiente humano.
	unAtacante enemigos: {victima}.
		
	unAtacante atacarConPenalizadores: unosPenalizadores.
	
	self assert: (victima estaDañadoPor: unDañoOriginal - unaCantidadDeDañoAReducir).! !


!PenalizadoresDeAtaquesTest methodsFor: 'penalizadores' stamp: 'JMB 5/13/2024 22:27:03'!
penalizacionPorEstarDesesperanzado

	^ PenalizadorPorMoral desesperanzado ! !

!PenalizadoresDeAtaquesTest methodsFor: 'penalizadores' stamp: 'JMB 5/13/2024 22:25:51'!
penalizacionPorEstarDesmotivado

	^ PenalizadorPorMoral desmotivado! !

!PenalizadoresDeAtaquesTest methodsFor: 'penalizadores' stamp: 'JMB 5/13/2024 22:25:08'!
penalizacionPorEstarEmbarrado

	^ PenalizadorPorInmovilidad embarrado! !

!PenalizadoresDeAtaquesTest methodsFor: 'penalizadores' stamp: 'JMB 5/13/2024 22:24:57'!
penalizacionPorEstarEnredado

	^ PenalizadorPorInmovilidad enredado! !

!PenalizadoresDeAtaquesTest methodsFor: 'penalizadores' stamp: 'JMB 5/13/2024 22:23:27'!
penalizacionPorEstarMareado

	^ PenalizadorMental mareado! !


!classDefinition: #Combate category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Object subclass: #Combate
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!Combate methodsFor: 'initialization' stamp: 'SF 3/25/2024 16:12:51'!
initializeBando1: unosCombatientes bando2: otrosCombatientes
	bando1 := unosCombatientes.
	bando2 := otrosCombatientes.! !


!Combate methodsFor: 'private' stamp: 'SF 3/25/2024 17:35:30'!
desarollarUnaRonda

	bando1 do: [:combatiente | combatiente atacar].
	bando2 do: [:combatiente | combatiente atacar]! !

!Combate methodsFor: 'private' stamp: 'SF 3/25/2024 17:34:47'!
estaFueraDeCombateBando1

	^ bando1 allSatisfy: [:each | each estaFueraDeCombate]! !

!Combate methodsFor: 'private' stamp: 'SF 3/25/2024 17:35:03'!
estaFueraDeCombateBando2

	^ bando2 allSatisfy: [:each | each estaFueraDeCombate]! !

!Combate methodsFor: 'private' stamp: 'SF 3/25/2024 21:23:57'!
hayAlgunBandoFueraDeCombate

	^ self estaFueraDeCombateBando1 or: [self estaFueraDeCombateBando2 ]! !


!Combate methodsFor: 'public' stamp: 'SF 4/4/2024 12:24:27'!
desarrollar
	
	| ganador rondasDesarrolladas |
	rondasDesarrolladas := 0.
	bando1 do: [:combatiente | combatiente enemigos: bando2].
	bando2 do: [:combatiente | combatiente enemigos: bando1].
	
	[self hayAlgunBandoFueraDeCombate] whileFalse: [
		self desarollarUnaRonda.
		rondasDesarrolladas := rondasDesarrolladas + 1].

	self estaFueraDeCombateBando1 ifTrue: [ganador := 'bando2'].
	self estaFueraDeCombateBando2 ifTrue: [ganador := 'bando1'].
	^Dictionary
		with: 'ganador' -> ganador
		with: 'duracionEnRondas' -> rondasDesarrolladas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combate class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Combate class
	instanceVariableNames: ''!

!Combate class methodsFor: 'public' stamp: 'SF 3/25/2024 16:10:29'!
enfrentarBando1: bando1 vsBando2: bando2
	^self new initializeBando1: bando1 bando2: bando2.! !


!classDefinition: #Combatiente category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Object subclass: #Combatiente
	instanceVariableNames: 'enemigos dañoRecibido puntosDeVidaMaximo dañoPorAtaque estrategia'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!Combatiente methodsFor: 'public' stamp: 'JMB 5/13/2024 23:59:21'!
atacar
	self atacarConPenalizadores: #()! !

!Combatiente methodsFor: 'public' stamp: 'JMB 5/13/2024 23:48:03'!
atacarA: unCombatienteAAtacar
	self atacarA: unCombatienteAAtacar conPenalizadores: #()! !

!Combatiente methodsFor: 'public' stamp: 'JMB 5/14/2024 00:07:15'!
atacarA: unaCombatienteAAtacar conPenalizadores: unosPenalizadores 
	| dañoAInfligir |
	dañoAInfligir := self dañoAInfligirPenalizadoCon: unosPenalizadores.
	unaCombatienteAAtacar recibirDaño: (dañoAInfligir max: 0*pv).
	! !

!Combatiente methodsFor: 'public' stamp: 'JMB 5/13/2024 23:54:12'!
atacarConPenalizadores: unosPenalizadores 

	self siPuedeAtacarHace: [ self atacarA: self elegirVictima conPenalizadores: unosPenalizadores ].! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:29:48'!
dañoRecibido
	^dañoRecibido! !

!Combatiente methodsFor: 'public' stamp: 'SF 4/4/2024 12:24:27'!
enemigos: unConjuntoDeCombatientes 
	enemigos := unConjuntoDeCombatientes.! !

!Combatiente methodsFor: 'public' stamp: 'JMB 5/14/2024 00:11:58'!
enfocarseEnElMasHerido
	estrategia := self estrategiaEnfocarseEnElMasHerido.
! !

!Combatiente methodsFor: 'public' stamp: 'JMB 5/14/2024 00:12:03'!
enfocarseEnElMasSano
	estrategia := self estrategiaEnfocarseEnElMasSano.
! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:07'!
estaDañadoPor: unaCantidadDeDaño
	^dañoRecibido = unaCantidadDeDaño.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/25/2024 17:59:13'!
estaFueraDeCombate
	^ dañoRecibido >= puntosDeVidaMaximo! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:36'!
estaSano
	^dañoRecibido = 0.! !

!Combatiente methodsFor: 'public' stamp: 'SF 4/5/2024 17:40:10'!
puntosDeVida
	^puntosDeVidaMaximo - dañoRecibido.! !

!Combatiente methodsFor: 'public' stamp: 'SF 3/20/2024 19:30:46'!
recibirDaño: unaCantidadDeDaño
	dañoRecibido := dañoRecibido + unaCantidadDeDaño.! !


!Combatiente methodsFor: 'private' stamp: 'JMB 5/17/2024 01:10:45'!
dañoAInfligirPenalizadoCon: unosPenalizadores
	^(PenalizacionDeAtaque para: unosPenalizadores) penalizarAtaque: dañoPorAtaque! !

!Combatiente methodsFor: 'private' stamp: 'JMB 5/14/2024 00:12:42'!
elegirVictima
	^estrategia value: enemigos.
! !

!Combatiente methodsFor: 'private' stamp: 'SF 4/5/2024 18:38:31'!
estrategiaEnfocarseEnElMasHerido
	^[:candidatos | candidatos detectMin: [:combatiente | combatiente puntosDeVida]] ! !

!Combatiente methodsFor: 'private' stamp: 'SF 4/5/2024 18:38:44'!
estrategiaEnfocarseEnElMasSano
	^[:candidatos | candidatos detectMax: [:combatiente | combatiente puntosDeVida]] ! !

!Combatiente methodsFor: 'private' stamp: 'SF 4/4/2024 12:23:41'!
siPuedeAtacarHace: hacerMiAtaque

	enemigos isEmpty ifTrue: [^self].
	self estaFueraDeCombate ifTrue: [^self].
	hacerMiAtaque value.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 5/14/2024 00:13:04'!
initialize
	enemigos := #().
	dañoRecibido := 0*pv.
	dañoPorAtaque := 4*pv.
	puntosDeVidaMaximo := 20*pv.
	self enfocarseEnElMasSano.
! !

!Combatiente methodsFor: 'initialization' stamp: 'SF 3/25/2024 18:09:23'!
initializeWithPuntosDeVidaMaximo: maximosPuntosDeVida dañoPorAtaque: unaCantidadDeDaño 
	puntosDeVidaMaximo := maximosPuntosDeVida.
	dañoPorAtaque := unaCantidadDeDaño.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Combatiente class
	instanceVariableNames: ''!

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 5/14/2024 00:13:10'!
humano
	^self new initializeWithPuntosDeVidaMaximo: 20*pv dañoPorAtaque: 4*pv.! !

!Combatiente class methodsFor: 'instance creation' stamp: 'JMB 5/14/2024 00:13:14'!
ogro
	^self new initializeWithPuntosDeVidaMaximo: 40*pv dañoPorAtaque: 8*pv.! !


!classDefinition: #PenalizacionDeAtaque category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Object subclass: #PenalizacionDeAtaque
	instanceVariableNames: 'penalizadores valorAPenalizarPorAspecto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizacionDeAtaque methodsFor: 'evaluating' stamp: 'JMB 5/17/2024 01:08:30'!
penalizarAtaque: unaCantidadDeDaniAInfligir

	valorAPenalizarPorAspecto := Dictionary new.
	penalizadores do: [ :unPenalizadorDeAtaque | unPenalizadorDeAtaque afectar: self ].
	^unaCantidadDeDaniAInfligir - self penalizacionTotal! !


!PenalizacionDeAtaque methodsFor: 'private' stamp: 'LL 10/29/2023 17:27:18'!
penalizacionTotal

	| valoresAPenalizar |
	valoresAPenalizar := valorAPenalizarPorAspecto values.
	
	^ valoresAPenalizar sum: [ :unValorAPenalizar | unValorAPenalizar ] ifEmpty: [ 0*pv ]
	! !

!PenalizacionDeAtaque methodsFor: 'private' stamp: 'LL 10/29/2023 17:15:15'!
peorValorDePenalizacionPor: unAspecto considerando: valorDeUnNuevoPenalizador

	^ (self valorAPenalizarHastaAhoraPor: unAspecto) max: valorDeUnNuevoPenalizador! !

!PenalizacionDeAtaque methodsFor: 'private' stamp: 'LL 10/29/2023 17:16:41'!
registrar: valorAPenalizar por: unAspecto

	^ valorAPenalizarPorAspecto at: unAspecto put: valorAPenalizar! !

!PenalizacionDeAtaque methodsFor: 'private' stamp: 'LL 10/29/2023 17:27:11'!
valorAPenalizarHastaAhoraPor: unAspecto

	^ valorAPenalizarPorAspecto at: unAspecto ifAbsent: [0*pv]! !


!PenalizacionDeAtaque methodsFor: 'afectar penalizaciones - privado DD' stamp: 'JMB 5/17/2024 00:46:56'!
afectarPenalizacionPor: unAspecto con: valorDelPenalizador
	| valorAPenalizar |
	valorAPenalizar := self peorValorDePenalizacionPor: unAspecto considerando: valorDelPenalizador.
	self registrar: valorAPenalizar por: unAspecto.! !


!PenalizacionDeAtaque methodsFor: 'initialization' stamp: 'JMB 5/13/2024 21:41:49'!
initializePara: unosPenalizadores
	penalizadores := unosPenalizadores.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PenalizacionDeAtaque class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizacionDeAtaque class
	instanceVariableNames: ''!

!PenalizacionDeAtaque class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 21:41:49'!
para: unosPenalizadores
	^self new initializePara: unosPenalizadores! !


!classDefinition: #PenalizadorDeAtaque category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
Object subclass: #PenalizadorDeAtaque
	instanceVariableNames: 'valor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizadorDeAtaque methodsFor: 'as yet unclassified' stamp: 'JMB 5/13/2024 22:14:05'!
afectar: unaPenalizacionDeAtaque  
	self subclassResponsibility ! !


!PenalizadorDeAtaque methodsFor: 'initialization' stamp: 'JMB 10/16/2023 21:29:31'!
initializeCon: unValor
	valor := unValor ! !


!classDefinition: #PenalizadorMental category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorDeAtaque subclass: #PenalizadorMental
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizadorMental methodsFor: 'as yet unclassified' stamp: 'JMB 5/13/2024 22:44:45'!
afectar: unaPenalizacionDeAtaque  
	unaPenalizacionDeAtaque afectarPenalizacionPor: #Mental con: valor ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PenalizadorMental class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorMental class
	instanceVariableNames: ''!

!PenalizadorMental class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 22:23:11'!
mareado
	^ self new initializeCon: 1*pv! !


!classDefinition: #PenalizadorPorInmovilidad category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorDeAtaque subclass: #PenalizadorPorInmovilidad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizadorPorInmovilidad methodsFor: 'as yet unclassified' stamp: 'JMB 5/13/2024 22:44:55'!
afectar: unaPenalizacionDeAtaque  
	unaPenalizacionDeAtaque afectarPenalizacionPor: #Inmovilidad con: valor ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PenalizadorPorInmovilidad class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorPorInmovilidad class
	instanceVariableNames: ''!

!PenalizadorPorInmovilidad class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 22:24:35'!
embarrado
	^ self new initializeCon: 2*pv! !

!PenalizadorPorInmovilidad class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 22:24:41'!
enredado
	^ self new initializeCon: 2*pv! !


!classDefinition: #PenalizadorPorMoral category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorDeAtaque subclass: #PenalizadorPorMoral
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!

!PenalizadorPorMoral methodsFor: 'as yet unclassified' stamp: 'JMB 5/13/2024 22:45:03'!
afectar: unaPenalizacionDeAtaque  
	unaPenalizacionDeAtaque afectarPenalizacionPor: #Moral con: valor ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PenalizadorPorMoral class' category: #'IngSoftI-2024-1C-Parcial-CombatientesFantasticos'!
PenalizadorPorMoral class
	instanceVariableNames: ''!

!PenalizadorPorMoral class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 22:26:43'!
desesperanzado
	^ self new initializeCon: 4*pv! !

!PenalizadorPorMoral class methodsFor: 'instance creation' stamp: 'JMB 5/13/2024 22:26:31'!
desmotivado
	^ self new initializeCon: 2*pv! !

CombatienteTest initialize!