!classDefinition: #AtacarTest category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
TestCase subclass: #AtacarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test01CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	| combatiente alguien |
	combatiente := self unCombatiente.
	alguien := self unCombatiente.
	
	combatiente atacar.
	
	self assert: (alguien noEstaHerido).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test02CuandoUnCombatienteTieneEnemigosAtacaAUno
	| combatiente enemigo1 enemigo2 enemigo1Herido enemigo2Herido |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	
	combatiente atacar.
	
	enemigo1Herido := enemigo1 estaHerido and: [enemigo2 noEstaHerido].
	enemigo2Herido := enemigo2 estaHerido and: [enemigo1 noEstaHerido].
	self assert: (enemigo1Herido or: [enemigo2Herido]).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test03UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	| combatiente enemigo1 enemigo2 enemigo2HeridoDosVeces |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	enemigo2HeridoDosVeces := enemigo2 tienePuntosDeVida: 16 * pv.
	self assert: enemigo2HeridoDosVeces.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test04UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	| combatiente enemigo1 enemigo2 elEnemigo1EstaHerido |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	
	elEnemigo1EstaHerido := enemigo1 tienePuntosDeVida: 18*pv.
	self assert: elEnemigo1EstaHerido.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test05ElEnemigoFocalizadoMasSanoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: 12*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test06ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente equiparConUnaEspada.	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	combatiente atacarA: enemigo1.
	combatiente atacarA: enemigo1.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: -4*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test07CuandoUnEnemigoEstaVencidoNoEsAtacadoMas
	| combatiente enemigoVencido enemigo2 |
	combatiente := self unCombatiente.
	enemigoVencido := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigoVencido. enemigo2.}.
	combatiente equiparConUnaEspada.	
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.

	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	self assert: (enemigo2 tienePuntosDeVida: 12*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test08CuandoUnCombatienteEstaVencidoNoAtaca
	| combatiente enemigo |
	combatiente := self unCombatiente.
	enemigo := self unCombatiente.
	combatiente enemigos: {enemigo}.
	self hacerQue: combatiente quedeMalDebidoA: enemigo.
	
	combatiente atacar.
	
	self assert: (enemigo tienePuntosDeVida: 20*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test09UnCombatientePuedeTenerComoEstrategiaRepartirAtaques
	| combatiente enemigo1 enemigo2 |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.

	combatiente focalizarEnRepartirAtaques.
	combatiente atacar.
	combatiente atacar.
	
	self assert: enemigo1 estaHerido.
	self assert: enemigo2 estaHerido.
! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test10AlRepartirAtaquesSeEmpiezaDeNuevoLuegoDeAtacarATodos
	| combatiente enemigo1 enemigo2 |
	combatiente := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente focalizarEnRepartirAtaques.
	combatiente atacar.
	combatiente atacar.
	enemigo1 initialize.
	enemigo2 initialize.

	combatiente atacar.
	
	self assert: enemigo1 estaHerido.
	self assert: enemigo2 estaHerido not.
! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test11UnCombatientePuedeTenerComoEstrategiaAtacarAEnemigosPreseleccionados
	| atacante enemigo1 |
	atacante := self unCombatiente.
	enemigo1 := self unCombatiente.
	atacante enemigos: {enemigo1.}.

	atacante focalizarEn: {enemigo1.}.
	
	atacante atacar.
	
	self assert: enemigo1 estaHerido.
! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test12UnCombatienteConEstrategiaAtacarAEnemigosPreseleccionadosEnCadaAtaqueSigueElOrdenDeSuPreseleccionDeVictimas
	| atacante enemigo1 enemigo2 |
	atacante := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	atacante enemigos: {enemigo1. enemigo2}.

	atacante focalizarEn: {enemigo1. enemigo2.}.
	
	atacante atacar.
	atacante atacar.
	
	self assert: enemigo1 estaHerido.
	self assert: enemigo2 estaHerido. 
! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test13UnCombatienteConEstrategiaAtacarAEnemigosPreseleccionadosCuandoYaAtacoATodosVuelveAComenzarSuPreseleccionDeVictimas
	| atacante enemigo1 enemigo2 |
	atacante := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	atacante enemigos: {enemigo1. enemigo2}.

	atacante focalizarEn: {enemigo1. enemigo2.}.
	
	atacante atacar.
	atacante atacar.
	atacante atacar.
	
	self assert: (enemigo1 haSidoDañadoEn: 4*pv).
	self assert: (enemigo2 haSidoDañadoEn: 2*pv).
! !

!AtacarTest methodsFor: 'tests' stamp: 'JMB 10/29/2023 15:13:42'!
test14UnCombatienteConEstrategiaAtacarAEnemigosPreseleccionadosNoAtacaALosEnemigosQueNoPreselecciono
	| atacante enemigo1 enemigo2 |
	atacante := self unCombatiente.
	enemigo1 := self unCombatiente.
	enemigo2 := self unCombatiente.
	atacante enemigos: {enemigo1. enemigo2}.

	atacante focalizarEn: {enemigo2.}.
	
	atacante atacar.
	atacante atacar.
	
	self assert: enemigo1 noEstaHerido.
	self assert: (enemigo2 haSidoDañadoEn: 4*pv).
! !


!AtacarTest methodsFor: 'privado' stamp: 'SF 10/17/2022 19:20:49'!
hacerQue: combatiente1 quedeMalDebidoA: combatiente2

	[combatiente1 puntosDeVida <= 0] whileFalse: [
		combatiente2 atacarA: combatiente1]! !

!AtacarTest methodsFor: 'privado' stamp: 'JMB 10/29/2023 15:13:42'!
unCombatiente

	^ Combatiente new! !


!classDefinition: #CombatientesTest category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
TestCase subclass: #CombatientesTest
	instanceVariableNames: 'atacante atacado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:08:35'!
test01LosPuñosHacen2DeDaño
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 18*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test02MultiplesAtaquesVanBajandoMasVida
	atacante atacarA: atacado.
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test03UnHachaHace10DeDaño
	atacante equiparConUnHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 10*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:57:31'!
test04UnEspadaHace8DeDaño
	atacante equiparConUnaEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:33'!
test05UnMartilloHace8DeDaño
	atacante equiparConUnMartillo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:57:20'!
test06UnaDagaHace4DeDaño
	atacante equiparConUnaDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:21'!
test07UnaLanzaHace8DeDaño
	atacante equiparConUnaLanza.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:48'!
test08UnPaloHace6DeDaño
	atacante equiparConUnPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test09LaArmaduraDeMetalAbsorve6DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeMetal.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test10LaArmaduraDeAnillosAbsorve4DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeAnillos.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 3/4/2023 12:58:02'!
test11LaArmaduraDeCueroAbsorve2DeDaño 
	atacante equiparConUnHacha.
	atacado equiparConUnaArmaduraDeCuero.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !


!CombatientesTest methodsFor: 'setUp/tearDown' stamp: 'JMB 10/18/2022 21:04:54'!
setUp
	atacante := Combatiente new.
	atacado := Combatiente new.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
CombatientesTest class
	instanceVariableNames: ''!

!CombatientesTest class methodsFor: 'class initialization' stamp: 'JMB 10/16/2022 11:11:15'!
initialize

	"Este método está para crear unidades. No se debe tocar"

	| puntosDeVida |
	super initialize.
	puntosDeVida := BaseUnit named: 'puntosDeVida' sign: 'pv'.

	Smalltalk at: #pv put: puntosDeVida.
	Smalltalk at: #puntosDeVida put: puntosDeVida.! !


!classDefinition: #CuracionTest category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
TestCase subclass: #CuracionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!CuracionTest methodsFor: 'testing' stamp: 'JMB 10/29/2023 12:48:42'!
test01LasCuracionesDeCeroNoModificanLosPuntosDeVida
	self assertUnCombatienteDañadoEn: 0*pv quedaConLosPuntosDeVidaInicialesLuegoDeSerCuradoCon: 0*pv
	! !

!CuracionTest methodsFor: 'testing' stamp: 'JMB 10/29/2023 12:48:42'!
test02LasCuracionesMayoresACeroIIncrementanEnEsaCantidadLosPuntosDeVida
	self assertUnCombatienteDañadoEn: 5*pv quedaConLosPuntosDeVidaInicialesLuegoDeSerCuradoCon: 5*pv! !

!CuracionTest methodsFor: 'testing' stamp: 'JMB 10/29/2023 12:48:42'!
test03LasCuracionesNoIncrementanLosPuntosDeVidaPorSobreLosPuntosIniciales
	self assertUnCombatienteDañadoEn: 5*pv quedaConLosPuntosDeVidaInicialesLuegoDeSerCuradoCon: 10*pv
	! !

!CuracionTest methodsFor: 'testing' stamp: 'JMB 10/29/2023 15:36:25'!
test04LasCuracionesNoDecrementanLosPuntosDeVida
	| combatienteASerCurado puntosDeVidaIniciales |
	combatienteASerCurado := Combatiente new.
	puntosDeVidaIniciales := combatienteASerCurado puntosDeVida. 
	combatienteASerCurado recibirDaño: 5*pv.
	
	self
		should: [ combatienteASerCurado recibirCuracion: -5*pv ] 
		raise:  Error - MessageNotUnderstood 
		withExceptionDo: [ : anError | 
			anError messageText = Combatiente mensajeDeErrorCantidadACurarInvalida.
			self assert: (combatienteASerCurado tienePuntosDeVida: puntosDeVidaIniciales - (5*pv)) 
		]
	! !


!CuracionTest methodsFor: 'assertions' stamp: 'JMB 10/29/2023 16:50:42'!
assertUnCombatienteDañadoEn: unosPuntosDeVidaDeDaño quedaConLosPuntosDeVidaInicialesLuegoDeSerCuradoCon: unosPuntosDeVidaACurar
	| combatienteASerCurado |
	combatienteASerCurado := Combatiente new.
	combatienteASerCurado recibirDaño: unosPuntosDeVidaDeDaño.
	
	combatienteASerCurado recibirCuracion: unosPuntosDeVidaACurar.
	
	self assert: (combatienteASerCurado haSidoDañadoEn: 0*pv)
	! !


!classDefinition: #EstrategiasTest category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
TestCase subclass: #EstrategiasTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:03:48'!
combatienteHumanoArthas
	^arthas! !

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:04:48'!
combatienteOrcoMankrik
	^mankrik! !

!EstrategiasTest methodsFor: 'combatientes' stamp: 'SF 10/11/2022 22:04:54'!
combatienteOrcoOlgra
	^olgra! !


!EstrategiasTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:34:26'!
test01FocalizarEnElMasHeridoEsMejorQueEnElMasSano
	
	self assert: self puntosDeVidaDelGanadorFocalizandoEnElMasHerido > self puntosDeVidaDelGanadorFocalizandoEnElMasSano.! !


!EstrategiasTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:58:02'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self combatienteHumanoArthas equiparConUnHacha.
	^OrquestadorDeCombates
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!EstrategiasTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:58:02'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self combatienteHumanoArthas equiparConUnHacha.
	^OrquestadorDeCombates
			establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/10/2022 18:32:49'!
puntosDeVidaDelGanadorFocalizandoEnElMasHerido
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !

!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/10/2022 18:32:49'!
puntosDeVidaDelGanadorFocalizandoEnElMasSano
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos.
	orquestadorDeCombates desarrollarDuranteRondas: 100.
	^ self combatienteHumanoArthas puntosDeVida! !


!EstrategiasTest methodsFor: 'private' stamp: 'SF 10/11/2022 22:05:44'!
prepararCombatientes
	arthas := Combatiente new.
	olgra := Combatiente new.
	mankrik := Combatiente new.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
TestCase subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: 'arthas olgra mankrik'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:37:28'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:56:47'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas equiparConUnaArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	^self establecerCombateEntreBando1:  {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/9/2022 12:55:39'!
orquestadorParaCombateArthasVsOlgra	
	
	self prepararCombatientes. 
	^OrquestadorDeCombates establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:54:06'!
orquestadorParaCombateArthasVsOrcos
	self prepararCombatientes.
	^self establecerCombateEntreBando1: { self combatienteHumanoArthas } contraBando2: {self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:57:31'!
orquestadorParaCombateManoAManoConBando2Inmune	
	
	self prepararCombatientes.
	self combatienteOrcoOlgra equiparConUnaEspada.
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:46:34'!
orquestadorParaCombateOrcosVsArthas
	self prepararCombatientes.
	^self establecerCombateEntreBando1: {self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: { self combatienteHumanoArthas }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:53:53'!
orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }. 
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'JMB 3/4/2023 12:56:47'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas equiparConUnaArmaduraDeMetal. 
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	^self establecerCombateEntreBando1: { self combatienteOrcoOlgra. self combatienteOrcoMankrik } contraBando2: {self combatienteHumanoArthas }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/9/2022 12:37:36'!
prepararCombatientes

	arthas := Combatiente new. 
	olgra := Combatiente new. 
	mankrik := Combatiente new. ! !


!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:14'!
test01AlDesarrollarUnCombateSinRondasLosCombatientesNoSeAtacan
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assert: self combatienteHumanoArthas noEstaHerido.
	self assert: self combatienteOrcoOlgra noEstaHerido.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:32'!
test02AlDesarrollarUnCombateManoAManoDeUnaRondaLosBandosSeAtacanUnaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 1.
	
	self assert: (self combatienteHumanoArthas tienePuntosDeVida: 18*pv) description: 'Arthas debe recibir un puñetazo (2 de daño)'.
	self assert: (self combatienteOrcoOlgra tienePuntosDeVida: 18*pv) description: 'Olgra debe recibir un puñetazo (2 de daño)'.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'JMB 10/18/2022 21:35:47'!
test03AlDesarrollarUnCombateManoAManoConMasDeUnaRondaLosBandosSeAtacanCadaVez
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: (self combatienteHumanoArthas tienePuntosDeVida: 16*pv) description: 'Arthas debe recibir dos puñetazos (4 de daño)'.
	self assert: (self combatienteOrcoOlgra tienePuntosDeVida: 16*pv) description: 'Olgra debe recibir dos puñetazos (4 de daño)'.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:46'!
test04AlDesarrollarUnCombateManoAManoSinGanadoresElResultadoEsIndeterminado
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 0.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 0.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:45'!
test05AlDesarrollarUnCombateManoAManoGanaElBando1CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:45'!
test06AlDesarrollarUnCombateCuandoHayUnGanadorFinalizaEnLaRondaQueElPerdedorQuedoFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOlgra.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 11.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - mano a mano' stamp: 'SF 10/9/2022 12:33:46'!
test07AlDesarrollarUnCombateManoAManoGanaElBando2CuandoDejaFueraDeCombateASuRival
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateManoAManoConBando2Inmune.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 100.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 3.! !


!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'JMB 10/18/2022 21:36:08'!
test08AlDesarrollarUnCombateLosDelBando1PuedenAtacarACualquieraDelBando2
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: self combatienteOrcoOlgra estaHerido. 
	self assert: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/11/2022 21:53:23'!
test09AlDesarrollarUnCombateAtacanTodesLosDelBando1EnCadaRonda
	"
		En cada ronda cada combatiente daña al que esta solo por 2 de daño cada uno
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthas.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 5.
	
	self assertElResultadoIndicaQueGanoElBando1: resultado alcanzadaLaRonda: 5.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'JMB 10/18/2022 21:36:18'!
test10AlDesarrollarUnCombateLosDelBando2PuedenAtacarACualquieraDelBando1
	
	| orquestadorDeCombates |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasConFocoEnElMasSano.
	
	orquestadorDeCombates desarrollarDuranteRondas: 2.
	
	self assert: self combatienteOrcoOlgra estaHerido. 
	self assert: self combatienteOrcoMankrik estaHerido. ! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/11/2022 21:55:18'!
test11AlDesarrollarUnCombateAtacanTodesLosDelBando2EnCadaRonda
	"
		En cada ronda cada combatiente daña en 2 al del otro bando. 4 de daño en total por turno.
	"
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 5.
	
	self assertElResultadoIndicaQueGanoElBando2: resultado alcanzadaLaRonda: 5.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/9/2022 12:33:46'!
test12AlDesarrollarUnCombateLosDelBando1NoGananSiTodosLosDelBando2NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !

!OrquestadorDeCombatesTest methodsFor: 'tests - muches vs muches' stamp: 'SF 10/9/2022 12:33:46'!
test13AlDesarrollarUnCombateLosDelBando2NoGananSiTodosLosDelBando1NoEstanFueraDeCombate
	
	| orquestadorDeCombates resultado |
	orquestadorDeCombates := self orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido.
	
	resultado := orquestadorDeCombates desarrollarDuranteRondas: 10.
	
	self assertElResultadoIndicaQueNoHayGanador: resultado alcanzadaLaRonda: 10.! !


!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:30'!
assertElResultadoIndicaQueGanoElBando1: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert: (resultadoDeUnCombate tieneDeGanadorAlBando1Realizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:36'!
assertElResultadoIndicaQueGanoElBando2: resultadoDeUnCombate alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert: (resultadoDeUnCombate tieneDeGanadorAlBando2Realizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'JMB 10/18/2022 21:36:41'!
assertElResultadoIndicaQueNoHayGanador: resultadoDeUnCombate  alcanzadaLaRonda: unNumeroDeRondaEsperado

	self assert:  (resultadoDeUnCombate finalizoSinGanadoresRealizando: unNumeroDeRondaEsperado)! !

!OrquestadorDeCombatesTest methodsFor: 'para completar' stamp: 'SF 10/10/2022 18:42:57'!
establecerCombateEntreBando1: unBando1 contraBando2: unBando2

	^OrquestadorDeCombates establecerCombateEntreBando1: unBando1 contraBando2: unBando2.! !


!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:44'!
combatienteHumanoArthas

	^arthas.! !

!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:34'!
combatienteOrcoMankrik

	^mankrik.! !

!OrquestadorDeCombatesTest methodsFor: 'combatientes' stamp: 'SF 10/10/2022 19:26:39'!
combatienteOrcoOlgra

	^olgra.! !


!classDefinition: #Combatiente category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida enemigos estrategia dañoAAbsorber dañoAInflingir'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:58:02'!
equiparConUnHacha
	dañoAInflingir := 10 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:58:33'!
equiparConUnMartillo
	dañoAInflingir := 8 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:58:48'!
equiparConUnPalo
	dañoAInflingir _ 6 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:21'!
equiparConUnaArmaduraDeAnillos
	dañoAAbsorber _ 4 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:34'!
equiparConUnaArmaduraDeCuero
	dañoAAbsorber _ 2 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:56:47'!
equiparConUnaArmaduraDeMetal
	dañoAAbsorber := 6 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:57:20'!
equiparConUnaDaga
	dañoAInflingir _ 4 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:57:31'!
equiparConUnaEspada
	dañoAInflingir := 8 * pv.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 3/4/2023 12:58:21'!
equiparConUnaLanza
	dañoAInflingir := 8 * pv.! !


!Combatiente methodsFor: 'private' stamp: 'JMB 10/29/2023 15:37:20'!
assertLaCantidadACurarEsValida: unaCantidadDeP̈untosDeVidaACurar

	^ unaCantidadDeP̈untosDeVidaACurar < (0*pv) ifTrue: [ self error: self class mensajeDeErrorCantidadACurarInvalida ]! !

!Combatiente methodsFor: 'private' stamp: 'SF 7/13/2022 22:24:44'!
puntosDeVida
	^puntosDeVida! !

!Combatiente methodsFor: 'private' stamp: 'JMB 3/4/2023 13:39:46'!
puntosDeVidaIniciales

	^ 20* pv! !


!Combatiente methodsFor: 'estrategia' stamp: 'SF 10/15/2022 18:28:31'!
estrategiaACualquiera

	^ [:candidatos | candidatos anyOne]! !

!Combatiente methodsFor: 'estrategia' stamp: 'JMB 9/8/2023 16:28:08'!
focalizarEn: unosEnemigosEnMiraDeAtaque 
	estrategia := EstrategiaEnemigosPreseleccionados con: unosEnemigosEnMiraDeAtaque. 
	! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:33:13'!
focalizarEnElMasHerido
	estrategia := [:candidatos | candidatos detectMin: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:39:02'!
focalizarEnElMasSano
	estrategia := [:candidatos | candidatos detectMax: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 9/8/2023 15:38:00'!
focalizarEnRepartirAtaques
	estrategia := EstrategiaRepartirAtaques new.! !


!Combatiente methodsFor: 'combate' stamp: 'SF 10/10/2022 11:06:17'!
atacar
	| enemigoElegido enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	enemigoElegido := estrategia value: enemigosActivos.
	self atacarA: enemigoElegido.! !

!Combatiente methodsFor: 'combate' stamp: 'FL 2/12/2023 17:58:04'!
atacarA: alguien

	self estaFueraDeCombate ifTrue: [^self].
	alguien recibirDaño: dañoAInflingir.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 8/20/2022 11:56:44'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 10/29/2023 15:37:20'!
recibirCuracion: unaCantidadDeP̈untosDeVidaACurar 

	self assertLaCantidadACurarEsValida: unaCantidadDeP̈untosDeVidaACurar.
	puntosDeVida := (puntosDeVida + unaCantidadDeP̈untosDeVidaACurar) min: self puntosDeVidaIniciales ! !

!Combatiente methodsFor: 'combate' stamp: 'JMB 3/4/2023 13:36:33'!
recibirDaño: unaCantidadDeDaño  
	| dañoADescontar |
	dañoADescontar := (unaCantidadDeDaño - dañoAAbsorber) max: 0 * pv.
	puntosDeVida := puntosDeVida - dañoADescontar.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 3/4/2023 13:39:46'!
initialize
	puntosDeVida := self puntosDeVidaIniciales.
	enemigos := OrderedCollection new.
	estrategia := self estrategiaACualquiera.
	dañoAInflingir _ 2  * pv.
	dañoAAbsorber _ 0  * pv.! !


!Combatiente methodsFor: 'vida' stamp: 'SF 10/10/2022 11:06:47'!
estaFueraDeCombate
	^puntosDeVida <= (0*pv).! !

!Combatiente methodsFor: 'vida' stamp: 'FL 2/12/2023 16:57:27'!
estaHerido
	^puntosDeVida < (20 * pv).! !

!Combatiente methodsFor: 'vida' stamp: 'JMB 9/8/2023 16:24:20'!
haSidoDañadoEn: unosPuntosDeVida
	^ self tienePuntosDeVida: self puntosDeVidaIniciales - unosPuntosDeVida ! !

!Combatiente methodsFor: 'vida' stamp: 'SF 10/9/2022 19:18:00'!
noEstaHerido
	^self estaHerido not.! !

!Combatiente methodsFor: 'vida' stamp: 'SF 10/9/2022 12:56:52'!
tienePuntosDeVida: unaCantidadDePuntosDeVida
	^puntosDeVida = unaCantidadDePuntosDeVida.! !


!Combatiente methodsFor: 'printing' stamp: 'JMB 3/4/2023 13:42:41'!
printOn: aStream
	aStream 
		nextPutAll: 'un'; 
		space;
		nextPutAll: self class name;
		nextPutAll: ' ('.
	
	puntosDeVida printOn: aStream.
	aStream nextPut: $/.
	self puntosDeVidaIniciales printOn: aStream.
	aStream nextPut: $).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Combatiente class
	instanceVariableNames: ''!

!Combatiente class methodsFor: 'as yet unclassified' stamp: 'JMB 10/29/2023 12:38:09'!
mensajeDeErrorCantidadACurarInvalida
	^ 'La cantidad a curar debe ser mayor a cero'! !


!classDefinition: #EstrategiaEnemigosPreseleccionados category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Object subclass: #EstrategiaEnemigosPreseleccionados
	instanceVariableNames: 'enemigosPreseleccionados cantidadDeSeleccionesRealizadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!EstrategiaEnemigosPreseleccionados methodsFor: 'initialization' stamp: 'JMB 9/8/2023 16:31:35'!
initializeCon: unosEnemigosPreseleccionados 
	enemigosPreseleccionados := unosEnemigosPreseleccionados.
	cantidadDeSeleccionesRealizadas := 0! !


!EstrategiaEnemigosPreseleccionados methodsFor: 'as yet unclassified' stamp: 'JMB 9/8/2023 16:34:24'!
value: enemigosActivos
	
	
	cantidadDeSeleccionesRealizadas := (cantidadDeSeleccionesRealizadas + 1).
	cantidadDeSeleccionesRealizadas > enemigosPreseleccionados size ifTrue: [ cantidadDeSeleccionesRealizadas := 1 ].
	^ enemigosPreseleccionados at: cantidadDeSeleccionesRealizadas.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaEnemigosPreseleccionados class' category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
EstrategiaEnemigosPreseleccionados class
	instanceVariableNames: ''!

!EstrategiaEnemigosPreseleccionados class methodsFor: 'instance creation' stamp: 'JMB 9/8/2023 16:28:38'!
con: unosEnemigosPreseleccionados 
	^self new initializeCon: unosEnemigosPreseleccionados ! !


!classDefinition: #EstrategiaRepartirAtaques category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Object subclass: #EstrategiaRepartirAtaques
	instanceVariableNames: 'enemigosAtacados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!EstrategiaRepartirAtaques methodsFor: 'initialization' stamp: 'SF 9/8/2023 15:53:57'!
initialize
	self initializeEnemigosAtacados.! !

!EstrategiaRepartirAtaques methodsFor: 'initialization' stamp: 'SF 9/8/2023 15:53:57'!
initializeEnemigosAtacados

	^ enemigosAtacados := OrderedCollection new! !


!EstrategiaRepartirAtaques methodsFor: 'public' stamp: 'SF 9/8/2023 15:53:15'!
value: enemigosActivos
	| enemigosQueFaltaAtacar enemigoSeleccionado |
	enemigosQueFaltaAtacar := enemigosActivos difference: enemigosAtacados.
	enemigosQueFaltaAtacar isEmpty ifTrue: [
		enemigosQueFaltaAtacar := enemigosActivos.
		self initializeEnemigosAtacados].
	enemigoSeleccionado := enemigosQueFaltaAtacar first.
	enemigosAtacados add: enemigoSeleccionado.
	^enemigoSeleccionado.
	! !


!classDefinition: #OrquestadorDeCombates category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Object subclass: #OrquestadorDeCombates
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!OrquestadorDeCombates methodsFor: 'initializing' stamp: 'SF 10/9/2022 12:50:01'!
initializeEstablecerCombateEntreBando1: unConjuntoDeCombatientes contraBando2: otroConjuntoDeCombatientes
	bando1 := unConjuntoDeCombatientes.
	bando2 := otroConjuntoDeCombatientes.! !


!OrquestadorDeCombates methodsFor: 'public' stamp: 'SF 10/10/2022 18:51:38'!
desarrollarDuranteRondas: maximoDeRondas
	| rondaActual |
	rondaActual := 1.
	[rondaActual <= maximoDeRondas and: [self noHayGanador]] whileTrue: [
		bando1 do: [ :combatiente | combatiente atacar].
		bando2 do: [ :combatiente | combatiente atacar].
		rondaActual := rondaActual + 1.
	].
	rondaActual := rondaActual - 1.
	self esBando1Ganador ifTrue: [^ResultadoDeCombate conGanadorBando1EnRonda: rondaActual].
	self esBando2Ganador ifTrue: [^ResultadoDeCombate conGanadorBando2EnRonda: rondaActual].
	^ResultadoDeCombate indeterminadoEnRonda: rondaActual.! !


!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:02:11'!
esBando1Ganador
	^(self hayAlMenosUnCombatienteEnCombateEn: bando1) and: [self todosEstanFueraDeCombateEn: bando2].
	! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:19:32'!
esBando2Ganador
	^(self hayAlMenosUnCombatienteEnCombateEn: bando2) and: [self todosEstanFueraDeCombateEn: bando1].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:03:52'!
hayAlMenosUnCombatienteEnCombateEn: unConjuntoDeCombatientes
	^unConjuntoDeCombatientes anySatisfy: [:combatiente | combatiente estaFueraDeCombate not].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:18:59'!
noHayGanador
	^self esBando1Ganador not and: [self esBando2Ganador not].! !

!OrquestadorDeCombates methodsFor: 'private' stamp: 'SF 10/10/2022 11:07:32'!
todosEstanFueraDeCombateEn: unConjuntoDeCombatientes
	^unConjuntoDeCombatientes allSatisfy: [:combatiente | combatiente estaFueraDeCombate].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OrquestadorDeCombates class' category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
OrquestadorDeCombates class
	instanceVariableNames: ''!

!OrquestadorDeCombates class methodsFor: 'instance creation' stamp: 'SF 10/9/2022 19:27:35'!
establecerCombateEntreBando1: bando1 contraBando2: bando2
	self enemistar: bando1 con: bando2.
	^self new initializeEstablecerCombateEntreBando1: bando1 contraBando2: bando2 ! !


!OrquestadorDeCombates class methodsFor: 'as yet unclassified' stamp: 'SF 10/9/2022 19:29:24'!
enemistar: unBandoDeCombatientes con: otroBandoDeCombatientes
	unBandoDeCombatientes do: [ :combatiente | combatiente enemigos: otroBandoDeCombatientes ].
	otroBandoDeCombatientes do: [ :combatiente | combatiente enemigos: unBandoDeCombatientes ].! !


!classDefinition: #ResultadoDeCombate category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
Object subclass: #ResultadoDeCombate
	instanceVariableNames: 'numeroDeRonda ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!

!ResultadoDeCombate methodsFor: 'public' stamp: 'JMB 3/4/2023 13:03:59'!
finalizoSinGanadores

	^ ganador = self elGanadorEsIndeterminado! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'JMB 3/4/2023 13:03:59'!
finalizoSinGanadoresRealizando: unaCantidadDeRondas
	^self finalizoSinGanadores and: [numeroDeRonda = unaCantidadDeRondas].! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 13:51:09'!
tieneDeGanadorAlBando1
	^self elBando1Ganó = ganador.! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 13:51:45'!
tieneDeGanadorAlBando1Realizando: unaCantidadDeRondas
	^self tieneDeGanadorAlBando1 and: [numeroDeRonda = unaCantidadDeRondas].! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 14:49:32'!
tieneDeGanadorAlBando2
	^self elBando2Ganó = ganador.! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 2/21/2023 14:50:12'!
tieneDeGanadorAlBando2Realizando: unaCantidadDeRondas
	^self tieneDeGanadorAlBando2 and: [numeroDeRonda = unaCantidadDeRondas].! !


!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 11:10:22'!
initializeConGanadorBando1EnRonda: unNumeroDeRonda 
	ganador := self elBando1Ganó.
	numeroDeRonda := unNumeroDeRonda.! !

!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 19:02:08'!
initializeConGanadorBando2EnRonda: unNumeroDeRonda 
	ganador := self elBando2Ganó.
	numeroDeRonda := unNumeroDeRonda.! !

!ResultadoDeCombate methodsFor: 'initialization' stamp: 'SF 10/10/2022 11:15:24'!
initializeIndeterminadoEnRonda: unaCantidadDeRondas
	ganador := self elGanadorEsIndeterminado.
	numeroDeRonda := unaCantidadDeRondas.! !


!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 11:10:22'!
elBando1Ganó

	^ 'bando1'! !

!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 18:50:09'!
elBando2Ganó

	^ 'bando2'! !

!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 11:13:38'!
elGanadorEsIndeterminado
	^'indeterminado'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ResultadoDeCombate class' category: 'IngSoftI-2023-2C-Recuperatorio-CombatientesFantasticos'!
ResultadoDeCombate class
	instanceVariableNames: ''!

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 11:08:18'!
conGanadorBando1EnRonda: unNumeroDeRonda
	^self new initializeConGanadorBando1EnRonda: unNumeroDeRonda! !

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 18:57:31'!
conGanadorBando2EnRonda: aSmallInteger 
	^self new initializeConGanadorBando2EnRonda: aSmallInteger ! !

!ResultadoDeCombate class methodsFor: 'instance creation' stamp: 'SF 10/10/2022 11:12:29'!
indeterminadoEnRonda: unaCantidadDeRondas
	^self new initializeIndeterminadoEnRonda: unaCantidadDeRondas! !

CombatientesTest initialize!