!classDefinition: #AtacarTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #AtacarTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/17/2022 19:20:49'!
hacerQue: combatiente1 quedeMalDebidoA: combatiente2

	[combatiente1 puntosDeVida <= 0] whileFalse: [
		combatiente2 atacarA: combatiente1]! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:20:55'!
test01CuandoUnCombatienteNoTieneEnemigosNoAtacaANadie
	| combatiente alguien |
	combatiente := Combatiente new.
	alguien := Combatiente new.
	
	combatiente atacar.
	
	self assert: (alguien tienePuntosDeVida: 20*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:21:42'!
test02CuandoUnCombatienteTieneEnemigosAtacaAUno
	| combatiente enemigo1 enemigo2 enemigo1Herido enemigo2Herido |
	combatiente := Combatiente new.
	enemigo1 := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigo1. enemigo2.}.
	
	combatiente atacar.
	
	enemigo1Herido := enemigo1 estaHerido and: [enemigo2 noEstaHerido].
	enemigo2Herido := enemigo2 estaHerido and: [enemigo1 noEstaHerido].
	self assert: (enemigo1Herido or: [enemigo2Herido]).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:22:48'!
test03UnCombatientePuedeTenerComoEstrategiaAtacarAlMasHerido
	| combatiente enemigo1 enemigo2 enemigo2HeridoDosVeces |
	combatiente := Combatiente new.
	enemigo1 := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	enemigo2HeridoDosVeces := enemigo2 tienePuntosDeVida: 16 * pv.
	self assert: enemigo2HeridoDosVeces.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:23:11'!
test04UnCombatientePuedeTenerComoEstrategiaAtacarAlMasSano
	| combatiente enemigo1 enemigo2 elEnemigo1EstaHerido |
	combatiente := Combatiente new.
	enemigo1 := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.
	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	
	elEnemigo1EstaHerido := enemigo1 tienePuntosDeVida: 18*pv.
	self assert: elEnemigo1EstaHerido.
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:23:49'!
test05ElEnemigoFocalizadoMasSanoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := Combatiente new.
	enemigo1 := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente usarEspada.	
	combatiente focalizarEnElMasSano.
	combatiente atacar.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: 12*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:23:58'!
test06ElEnemigoFocalizadoMasHeridoCambiaDinamicamente
	| combatiente enemigo1 enemigo2 |
	combatiente := Combatiente new.
	enemigo1 := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigo1. enemigo2.}.
	combatiente atacarA: enemigo2.

	combatiente usarEspada.	
	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	combatiente atacarA: enemigo1.
	combatiente atacarA: enemigo1.
	combatiente atacar.
	
	self assert: (enemigo1 tienePuntosDeVida: -4*pv).
	self assert: (enemigo2 tienePuntosDeVida: 10*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/11/2022 22:24:06'!
test07CuandoUnEnemigoEstaVencidoNoEsAtacadoMas
	| combatiente enemigoVencido enemigo2 |
	combatiente := Combatiente new.
	enemigoVencido := Combatiente new.
	enemigo2 := Combatiente new.
	combatiente enemigos: {enemigoVencido. enemigo2.}.
	combatiente usarEspada.	
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.
	combatiente atacarA: enemigoVencido.

	combatiente focalizarEnElMasHerido.
	combatiente atacar.
	
	self assert: (enemigo2 tienePuntosDeVida: 12*pv).
	
	! !

!AtacarTest methodsFor: 'tests' stamp: 'SF 10/17/2022 19:20:01'!
test08CuandoUnCombatienteEstaVencidoNoAtaca
	| combatiente enemigo |
	combatiente := Combatiente new.
	enemigo := Combatiente new.
	combatiente enemigos: {enemigo}.
	self hacerQue: combatiente quedeMalDebidoA: enemigo.
	
	combatiente atacar.
	
	self assert: (enemigo tienePuntosDeVida: 20*pv).
	
	! !


!classDefinition: #CombatientesTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #CombatientesTest
	instanceVariableNames: 'atacante atacado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:08:35'!
test01LosPuñosHacen2DeDaño
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 18*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test02MultiplesAtaquesVanBajandoMasVida
	atacante atacarA: atacado.
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:06:40'!
test03UnHachaHace10DeDaño
	atacante usarHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 10*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:06:35'!
test04UnEspadaHace8DeDaño
	atacante usarEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test05UnaArmaduraDeCueroAbsorbe2DeDaño
	atacante usarMartillo.
	atacado usarArmaduraDeCuero.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test06UnaArmaduraDeMetalAbsorbe6DeDaño
	atacante usarLanza.
	atacado usarArmaduraDeMetal.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 18*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:04:54'!
test07UnaArmaduraReduceElDañoInfligidoACero
	atacado usarArmaduraDeMetal.
	
	atacante atacarA: atacado.
	
	self assert: atacado noEstaHerido.! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:09:23'!
test08UnMartilloHace8DeDaño
	atacante usarMartillo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:11:11'!
test09UnaDagaHace4DeDaño
	atacante usarDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:12:10'!
test10UnaLanzaHace8DeDaño
	atacante usarLanza.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 12*pv).! !

!CombatientesTest methodsFor: 'tests' stamp: 'JMB 10/18/2022 21:12:54'!
test11UnPaloHace6DeDaño
	atacante usarPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !


!CombatientesTest methodsFor: 'setUp/tearDown' stamp: 'JMB 10/18/2022 21:04:54'!
setUp
	atacante := Combatiente new.
	atacado := Combatiente new.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CombatientesTest class' category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
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


!classDefinition: #CondicionDeDistraccionTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #CondicionDeDistraccionTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
arthasConHachaDejaFueraDeCombateAMankrik
	self combatienteHumanoArthas usarHacha.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik.
	self combatienteHumanoArthas atacarA: self combatienteOrcoMankrik! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
combatienteHumanoArthas
	^arthas! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
combatienteOrcoMankrik
	^mankrik! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
combatienteOrcoOlgra
	^olgra! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
comenzarUnNuevoCombate
	arthas := Combatiente conAgilidad: 1.
	mankrik := Combatiente conFuerza: 2.
	olgra := Combatiente conFuerza: 1.
! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
mankrikConHachaDejaFueraDeCombateAArthas
	self combatienteOrcoMankrik usarHacha.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas.
	self combatienteOrcoMankrik atacarA: self combatienteHumanoArthas! !

!CondicionDeDistraccionTest methodsFor: 'preparacion de combates' stamp: 'SF 10/15/2022 16:53:23'!
olgraConHachaDejaFueraDeCombateAMankrik

	self combatienteOrcoOlgra usarHacha.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik.
	self combatienteOrcoOlgra atacarA: self combatienteOrcoMankrik! !


!CondicionDeDistraccionTest methodsFor: 'tests - ataques por distraccion' stamp: 'JMB 10/18/2022 21:39:27'!
test01CuandoUnCombatienteEstaDistraidoLeHacen2MasDeDaño
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarMartillo.
	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self 
		assert: (self combatienteOrcoOlgra tienePuntosDeVida: 12*pv) 
		description: 'Olgra debe tener 12 puntos de vida: 20 (inicial) - 8 (por espada) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !

!CondicionDeDistraccionTest methodsFor: 'tests - ataques por distraccion' stamp: 'JMB 10/18/2022 21:39:18'!
test02LuegoDeDañarAUnDistraidoNoHayMasDañoExtra
	self comenzarUnNuevoCombate .
	self combatienteOrcoOlgra usarArmaduraDeCuero.	
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarMartillo.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.

	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	
	self 
		assert: (self combatienteOrcoOlgra tienePuntosDeVida: 6*pv) 
		description: 'Olgra debe tener 6 puntos de vida: 20 (inicial) - 8 (por martillo) + 2 (armadura de cuero) - 8 (por martillo) + 2 (armadura de cuero) - 2 (daño por distraido)'.! !


!classDefinition: #DañoVariableTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #DañoVariableTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 12:43:03'!
test01LaEspadaHaceMasDañoContraArmadurasDeCuero

	| atacado atacante |
	atacado := self combatienteConArmaduraDeCuero.
	atacante := self combatienteConEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 13*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:43:10'!
test02LaEspadaHaceMenosDañoContraArmadurasDeMetal

	| atacado atacante |
	atacado := self combatienteConArmaduraDeMetal.
	atacante := self combatienteConEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 19*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:43:25'!
test03ElHachaHaceMasDañoContraArmadurasDeCuero

	| atacado atacante |
	atacado := self combatienteConArmaduraDeCuero.
	atacante := self combatienteConHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 11*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 21:47:11'!
test04ElHachaHaceMenosDañoContraArmadurasDeMetal

	| atacado atacante |
	atacado := self combatienteConArmaduraDeMetal.
	atacante := self combatienteConHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 17*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:19:53'!
test05LaLanzaHaceMenosDañoContraArmadurasDeCuero

	| atacado atacante |
	atacado := self combatienteConArmaduraDeCuero.
	atacante := self combatienteConLanza.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 15*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:32:28'!
test06LaLanzaHaceMasDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConLanza.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 15*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:44:48'!
test07LaDagaHaceMenosDañoContraArmadurasDeCuero

	| atacado atacante |
	atacado := self combatienteConArmaduraDeCuero.
	atacante := self combatienteConDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 19*pv).! !

!DañoVariableTest methodsFor: 'tests a quitar codigo repetido' stamp: 'SF 10/13/2022 22:48:03'!
test08LaDagaHaceMasDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 19*pv).! !


!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'SF 10/13/2022 23:06:03'!
test09ElMartilloHaceMenosDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConMartillo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 17*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'SF 10/13/2022 23:11:28'!
test10ElMartilloHaceMasDañoContraArmadurasDeMetal

	| atacado atacante |
	atacado := self combatienteConArmaduraDeMetal.
	atacante := self combatienteConMartillo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 17*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'SF 10/14/2022 10:35:02'!
test11ElPaloHaceMenosDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 19*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'SF 10/14/2022 10:37:18'!
test12ElPaloHaceMasDañoContraArmadurasDeMetal

	| atacado atacante |
	atacado := self combatienteConArmaduraDeMetal.
	atacante := self combatienteConPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 19*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'JMB 10/18/2022 22:25:34'!
test13ElPaloHaceElMismoDañoContraArmadurasDeCuero

	| atacado atacante |
	atacado := self combatienteConArmaduraDeCuero.
	atacante := self combatienteConPalo.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'JMB 10/18/2022 22:27:02'!
test14ElHachaHaceElMismoDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConHacha.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 14*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'JMB 10/18/2022 22:29:10'!
test14LaDagaHaceElMismoDañoContraArmadurasDeMetal

	| atacado atacante |
	atacado := self combatienteConArmaduraDeMetal.
	atacante := self combatienteConDaga.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 20*pv).! !

!DañoVariableTest methodsFor: 'tests que no hace falta quitar codigo repetido' stamp: 'JMB 10/18/2022 22:28:20'!
test15LaEspadaHaceElMismoDañoContraArmadurasDeAnillos

	| atacado atacante |
	atacado := self combatienteConArmaduraDeAnillos.
	atacante := self combatienteConEspada.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 16*pv).! !


!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 22:33:10'!
combatienteConArmaduraDeAnillos
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarArmaduraDeAnillos.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 11:30:43'!
combatienteConArmaduraDeCuero
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarArmaduraDeCuero.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 21:33:07'!
combatienteConArmaduraDeMetal
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarArmaduraDeMetal.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 22:45:27'!
combatienteConDaga
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarDaga.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 11:30:33'!
combatienteConEspada
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarEspada.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 12:44:51'!
combatienteConHacha
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarHacha.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 22:20:26'!
combatienteConLanza
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarLanza.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/13/2022 22:52:07'!
combatienteConMartillo
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarMartillo.
	^combatiente.! !

!DañoVariableTest methodsFor: 'test-objects' stamp: 'SF 10/14/2022 10:35:34'!
combatienteConPalo
	| combatiente |
	combatiente := Combatiente new.
	combatiente usarPalo.
	^combatiente.! !


!classDefinition: #EstrategiasTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #EstrategiasTest
	instanceVariableNames: 'arthas mankrik olgra'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

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


!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/11/2022 22:04:36'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasHeridoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasHerido. 
	self combatienteHumanoArthas usarHacha.
	^OrquestadorDeCombates
		establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!EstrategiasTest methodsFor: 'combates' stamp: 'SF 10/11/2022 22:06:07'!
orquestadorParaArthasUsandoUnHachaYConFocoEnElMasSanoVsOrcos
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	self combatienteHumanoArthas usarHacha.
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


!classDefinition: #FuerzaYAgilidadTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #FuerzaYAgilidadTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!FuerzaYAgilidadTest methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 10/18/2022 21:22:38'!
test01CuandoUnAtacanteConFuerzaHaceMasDaño
	
	| atacado atacante |
	atacante := Combatiente conFuerza: 1.
	atacado := Combatiente new.
	
	atacante atacarA: atacado.
	
	self assert: (atacado tienePuntosDeVida: 17*pv) description: 'El atacado debe tener 17 puntos de vida (20 inicial - 2 por puños - 1 por fuerza)'.! !

!FuerzaYAgilidadTest methodsFor: 'tests - fuerza y agilidad' stamp: 'JMB 10/18/2022 21:28:12'!
test02CuandoUnAtacandoTieneAgilidadReduceElDañoQueLeInflingen
	
	| atacado atacante |
	atacante := Combatiente conFuerza: 2.
	atacado := Combatiente conAgilidad: 1.
	
	atacante atacarA: atacado.

	self 
		assert: (atacado tienePuntosDeVida: 17*pv) 
		description: 'El combatiente atacado debe tener 17 puntos de vida (20 inicial - 2 por puños - 2 por fuerza + 1 agilidad de Arthas)'.! !


!classDefinition: #OrquestadorDeCombatesTest category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
TestCase subclass: #OrquestadorDeCombatesTest
	instanceVariableNames: 'arthas olgra mankrik'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 19:37:28'!
orquestadorParaCombateArthasConFocoEnElMasSanoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas focalizarEnElMasSano. 
	^self establecerCombateEntreBando1: {self combatienteHumanoArthas } contraBando2: { self combatienteOrcoOlgra. self combatienteOrcoMankrik }.
! !

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:55:39'!
orquestadorParaCombateArthasInmuneYFocoEnElMasHeridoVsOrcos	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
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

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/10/2022 18:46:59'!
orquestadorParaCombateManoAManoConBando2Inmune	
	
	self prepararCombatientes.
	self combatienteOrcoOlgra usarEspada.
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

!OrquestadorDeCombatesTest methodsFor: 'combates' stamp: 'SF 10/11/2022 21:59:11'!
orquestadorParaCombateOrcosVsArthasInmuneYFocoEnElMasHerido	
	
	self prepararCombatientes.
	self combatienteHumanoArthas atacarA: self combatienteOrcoOlgra.
	self combatienteHumanoArthas usarArmaduraDeMetal. 
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


!classDefinition: #Arma category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Object subclass: #Arma
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Arma methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	self subclassResponsibility ! !

!Arma methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	self subclassResponsibility ! !


!classDefinition: #Daga category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Daga
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Daga methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 4! !

!Daga methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ -1].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ 1].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ 0].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Espada category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Espada methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 8! !

!Espada methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ 0].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ -1].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ 1].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Hacha category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Hacha
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Hacha methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 10! !

!Hacha methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ 0].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ -1].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ 1].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Lanza category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Lanza
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Lanza methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 8! !

!Lanza methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ -1].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ 1].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ 0].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Martillo category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Martillo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Martillo methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 8! !

!Martillo methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ 1].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ 0].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ -1].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Palo category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Palo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Palo methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 6! !

!Palo methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ 1].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ 0 ].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ -1].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Puño category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Arma subclass: #Puño
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Puño methodsFor: 'as yet unclassified' stamp: 'JMB 10/16/2022 12:18:27'!
daño
	^ 2! !

!Puño methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:22:26'!
dañoSobre: armaduraEquipada
	(armaduraEquipada isKindOf: ArmaduraDeAnillos) ifTrue: [^ 0].	
	(armaduraEquipada isKindOf: ArmaduraDeCuero) ifTrue: [^ 0 ].
	(armaduraEquipada isKindOf: ArmaduraDeMetal) ifTrue: [^ 0].
	(armaduraEquipada isKindOf: ArmaduraDeTela) ifTrue: [^ 0].
	
	self error: 'Error al calcular el daño entre una armadura y un arma'.! !


!classDefinition: #Armadura category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Object subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Armadura methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:01:45'!
afectarDaño: absorcionExtraPorArma
	self subclassResponsibility ! !


!classDefinition: #ArmaduraDeAnillos category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Armadura subclass: #ArmaduraDeAnillos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!ArmaduraDeAnillos methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:01:45'!
afectarDaño: absorcionExtraPorArma
	^ 4 + absorcionExtraPorArma
! !


!classDefinition: #ArmaduraDeCuero category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Armadura subclass: #ArmaduraDeCuero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!ArmaduraDeCuero methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:01:45'!
afectarDaño: absorcionExtraPorArma
	^ 2 + absorcionExtraPorArma
! !


!classDefinition: #ArmaduraDeMetal category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Armadura subclass: #ArmaduraDeMetal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!ArmaduraDeMetal methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:01:45'!
afectarDaño: absorcionExtraPorArma
	^ 6 + absorcionExtraPorArma
! !


!classDefinition: #ArmaduraDeTela category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Armadura subclass: #ArmaduraDeTela
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!ArmaduraDeTela methodsFor: 'as yet unclassified' stamp: 'JMB 10/19/2022 19:01:45'!
afectarDaño: absorcionExtraPorArma
	^ 0
! !


!classDefinition: #Combatiente category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Object subclass: #Combatiente
	instanceVariableNames: 'puntosDeVida enemigos estrategia bonificadorDeFuerza bonificadorDeAgilidad estaDistraido armaEquipada armaduraEquipada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 19:03:47'!
usarArmaduraDeAnillos
	armaduraEquipada := ArmaduraDeAnillos new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 19:03:57'!
usarArmaduraDeCuero
	armaduraEquipada := ArmaduraDeCuero new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 19:04:04'!
usarArmaduraDeMetal
	armaduraEquipada := ArmaduraDeMetal new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:50:25'!
usarDaga
	armaEquipada _ Daga new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:50:33'!
usarEspada
	armaEquipada := Espada new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:50:39'!
usarHacha
	armaEquipada := Hacha new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:50:46'!
usarLanza
	armaEquipada := Lanza new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:50:54'!
usarMartillo
	armaEquipada := Martillo new.! !

!Combatiente methodsFor: 'equipo' stamp: 'JMB 10/19/2022 18:51:01'!
usarPalo
	armaEquipada _ Palo new.! !


!Combatiente methodsFor: 'private' stamp: 'JMB 10/19/2022 19:30:34'!
dañoAAbsorberPorArmaduraVersusArma: arma
	| absorcionExtraPorArma |
	absorcionExtraPorArma :=  arma dañoSobre: armaduraEquipada .
	^ armaduraEquipada afectarDaño: absorcionExtraPorArma. ! !

!Combatiente methodsFor: 'private' stamp: 'JMB 10/19/2022 18:50:05'!
dañoDeArmaEquipada
	^ armaEquipada daño
	! !

!Combatiente methodsFor: 'private' stamp: 'SF 7/13/2022 22:24:44'!
puntosDeVida
	^puntosDeVida! !


!Combatiente methodsFor: 'estrategia' stamp: 'SF 10/15/2022 18:28:31'!
estrategiaACualquiera

	^ [:candidatos | candidatos anyOne]! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:33:13'!
focalizarEnElMasHerido
	estrategia := [:candidatos | candidatos detectMin: [:enemigo | enemigo puntosDeVida]].! !

!Combatiente methodsFor: 'estrategia' stamp: 'SF 8/21/2022 10:39:02'!
focalizarEnElMasSano
	estrategia := [:candidatos | candidatos detectMax: [:enemigo | enemigo puntosDeVida]].! !


!Combatiente methodsFor: 'combate' stamp: 'SF 10/10/2022 11:06:17'!
atacar
	| enemigoElegido enemigosActivos |
	self estaFueraDeCombate ifTrue: [^self].
	enemigosActivos := enemigos select: [:enemigo | enemigo estaFueraDeCombate not].
	enemigosActivos isEmpty ifTrue: [^self].
	enemigoElegido := estrategia value: enemigosActivos.
	self atacarA: enemigoElegido.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/17/2022 18:58:34'!
atacarA: alguien

	| dañoAInfligir |
	self estaFueraDeCombate ifTrue: [^self].
	dañoAInfligir := self dañoDeArmaEquipada + bonificadorDeFuerza.
	alguien recibirDaño: dañoAInfligir deArma: armaEquipada.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 8/20/2022 11:56:44'!
enemigos: unConjuntoDeEnemigos
	enemigos := unConjuntoDeEnemigos! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/10/2022 11:06:47'!
estaFueraDeCombate
	^puntosDeVida <= (0*pv).! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 19:16:27'!
estaHerido
	^puntosDeVida < (20 * pv).! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 19:18:00'!
noEstaHerido
	^self estaHerido not.! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/15/2022 18:36:10'!
recibirDaño: unaCantidadDeDaño deArma: armaAtacante 
	| dañoADescontar dañoAAbsorberPorArmadura dañoExtraPorDistraido |
	dañoAAbsorberPorArmadura := self dañoAAbsorberPorArmaduraVersusArma: armaAtacante.
	dañoExtraPorDistraido := estaDistraido ifTrue: [2] ifFalse: [0].
	dañoADescontar := (unaCantidadDeDaño + dañoExtraPorDistraido - dañoAAbsorberPorArmadura - bonificadorDeAgilidad) max: 0.
	estaDistraido := dañoADescontar = 0.
	puntosDeVida := puntosDeVida - (dañoADescontar * pv).! !

!Combatiente methodsFor: 'combate' stamp: 'SF 10/9/2022 12:56:52'!
tienePuntosDeVida: unaCantidadDePuntosDeVida
	^puntosDeVida = unaCantidadDePuntosDeVida.! !


!Combatiente methodsFor: 'initialization' stamp: 'JMB 10/19/2022 19:03:36'!
initialize
	puntosDeVida := 20*pv.
	armaEquipada := Puño new.
	bonificadorDeFuerza := 0.
	bonificadorDeAgilidad := 0.
	armaduraEquipada := ArmaduraDeTela new.
	enemigos := OrderedCollection new.
	estrategia := self estrategiaACualquiera.
	estaDistraido := false.! !

!Combatiente methodsFor: 'initialization' stamp: 'SF 10/11/2022 22:40:39'!
initializeConAgilidad: unBonificadorDeAgilidad 
	bonificadorDeAgilidad := unBonificadorDeAgilidad.! !

!Combatiente methodsFor: 'initialization' stamp: 'SF 10/11/2022 22:36:40'!
initializeConFuerza: unBonificadorDeFuerza 
	bonificadorDeFuerza := unBonificadorDeFuerza.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Combatiente class
	instanceVariableNames: ''!

!Combatiente class methodsFor: 'instance creation' stamp: 'SF 10/11/2022 22:40:25'!
conAgilidad: unBonificadorDeAgilidad
	^self new initializeConAgilidad: unBonificadorDeAgilidad.! !

!Combatiente class methodsFor: 'instance creation' stamp: 'SF 10/11/2022 22:36:12'!
conFuerza: unBonificadorDeFuerza
	^self new initializeConFuerza: unBonificadorDeFuerza! !


!classDefinition: #OrquestadorDeCombates category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Object subclass: #OrquestadorDeCombates
	instanceVariableNames: 'bando1 bando2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

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

!classDefinition: 'OrquestadorDeCombates class' category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
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


!classDefinition: #ResultadoDeCombate category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
Object subclass: #ResultadoDeCombate
	instanceVariableNames: 'numeroDeRonda ganador'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 10/11/2022 21:58:46'!
finalizoSinGanadoresRealizando: unaCantidadDeRondas
	^ganador = self elGanadorEsIndeterminado and: [numeroDeRonda = unaCantidadDeRondas].! !

!ResultadoDeCombate methodsFor: 'public' stamp: 'SF 10/10/2022 11:11:49'!
tieneDeGanadorAlBando1Realizando: unaCantidadDeRondas
	^ganador = self elBando1Ganó and: [numeroDeRonda = unaCantidadDeRondas].! !


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

!ResultadoDeCombate methodsFor: 'private' stamp: 'SF 10/10/2022 18:49:03'!
tieneDeGanadorAlBando2Realizando: unaCantidadDeRondas
	^ganador = self elBando2Ganó and: [numeroDeRonda = unaCantidadDeRondas].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ResultadoDeCombate class' category: 'AlgoIII-2022-2C-1Parcial-AtaquesFantasticos-P3'!
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