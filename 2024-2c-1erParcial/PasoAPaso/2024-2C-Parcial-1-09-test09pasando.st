!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'LL 9/29/2024 12:43:08'!
crearArmadura

	^ItemDeDefensa armadura ! !

!TestMyA methodsFor: 'crear items' stamp: 'LL 9/29/2024 13:15:10'!
crearBaculo
	
	^ItemDeAtaque baculo! !

!TestMyA methodsFor: 'crear items' stamp: 'LL 9/29/2024 12:43:24'!
crearEscudoMagico

	^ItemDeDefensa escudoMagico 
! !

!TestMyA methodsFor: 'crear items' stamp: 'LL 9/29/2024 12:52:44'!
crearEspadaPara: monstruo

	^ItemDeAtaque espadaPara: monstruo.
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'LL 9/29/2024 12:37:25'!
crearGoblin

	^Monstruo goblin
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'LL 9/29/2024 12:37:13'!
crearGuerrero
	
	^Aventurero guerrero! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'LL 9/29/2024 13:08:52'!
crearMago

	^Aventurero mago
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'LL 9/29/2024 12:43:46'!
crearOgro

	^Monstruo ogro! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'puntosDeVida itemsDeDefensa itemsDeAtaque fuerza tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:25:00'!
atacarA: unMonstruo con: unItemDeAtaque

	itemsDeAtaque ifEmpty: [ self error: self itemNoDisponibleMensajeDeError ].
	tipo = #Guerrero ifTrue: [
		(unItemDeAtaque tieneComoObjetivoA: unMonstruo) ifTrue: [ 	unMonstruo recibirDaño: fuerza ]
	].
	tipo = #Mago ifTrue: [
		unItemDeAtaque tipo = #Espada ifTrue: [
			self perderTodosLosPuntosDeVida
		].
		unItemDeAtaque tipo = #Baculo ifTrue: [
			unMonstruo tipo = #Goblin ifTrue: [ 
				unMonstruo perderTodosLosPuntosDeVida
			].
			unMonstruo tipo = #Ogro ifTrue: [ 
				unMonstruo recibirDaño: fuerza.
			]
		].
	]
! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:57:57'!
equiparItemDeAtaque: unItemDeAtaque

	itemsDeAtaque add: unItemDeAtaque! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:44:08'!
equiparItemDeDefensa: unItemDeDefensa

	itemsDeDefensa add: unItemDeDefensa! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:56:38'!
itemNoDisponibleMensajeDeError
	^'Item no disponible'! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:14:30'!
perderTodosLosPuntosDeVida

	^ puntosDeVida := 0! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:50:36'!
recibirDaño: puntosDeDaño
	| puntosDeDefensa puntosARestar |
	puntosDeDefensa := itemsDeDefensa sum: [ :itemDeDefensa | itemDeDefensa puntosDeDefensa ] ifEmpty: [ 0 ].
	puntosARestar := (puntosDeDaño - puntosDeDefensa) max: 0.
	puntosDeVida := puntosDeVida - puntosARestar.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:38:16'!
tienePuntosDeVida: unosPuntosDeVida

	^puntosDeVida = unosPuntosDeVida! !


!Aventurero methodsFor: 'initialization' stamp: 'LL 9/29/2024 13:27:02'!
initializeConPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza deTipo: unTipoDeAventurero  
	puntosDeVida := unosPuntosDeVida.
	itemsDeDefensa := Set new.
	itemsDeAtaque := Set new.
	fuerza := unaFuerza.
	tipo := unTipoDeAventurero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:26:17'!
guerrero
	^self conPuntosDeVida: 10 * pv conFuerza: 4 * pv deTipo: #Guerrero.! !

!Aventurero class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:26:29'!
mago
	^self conPuntosDeVida: 15 * pv conFuerza: 2 * pv deTipo: #Mago! !


!Aventurero class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 13:26:57'!
conPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza deTipo: unTipoDeAventurero  
	^self new initializeConPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza deTipo: unTipoDeAventurero! !


!classDefinition: #ItemDeAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeAtaque
	instanceVariableNames: 'monstruoObjetivo tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeAtaque methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:06:47'!
tieneComoObjetivoA: unMonstruo 
	^monstruoObjetivo = unMonstruo! !

!ItemDeAtaque methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:19:44'!
tipo
	^tipo! !


!ItemDeAtaque methodsFor: 'initialization' stamp: 'LL 9/29/2024 13:17:57'!
initialize

	tipo := #Baculo! !

!ItemDeAtaque methodsFor: 'initialization' stamp: 'LL 9/29/2024 13:17:45'!
initializeConObjetivo: unMonstruoObjetivo 
	monstruoObjetivo := unMonstruoObjetivo.
	tipo := #Espada! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeAtaque class' category: #'2024-2C-Parcial-1'!
ItemDeAtaque class
	instanceVariableNames: ''!

!ItemDeAtaque class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:16:50'!
baculo
	^self new! !

!ItemDeAtaque class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:07:41'!
espadaPara: unMonstruoObjetivo

	^self new initializeConObjetivo: unMonstruoObjetivo! !


!classDefinition: #ItemDeDefensa category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeDefensa
	instanceVariableNames: 'puntosDeDefensa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeDefensa methodsFor: 'initialization' stamp: 'LL 9/29/2024 12:45:51'!
initializeProtegiendoPor: unosPuntosDeDefensa 
	puntosDeDefensa := unosPuntosDeDefensa.! !


!ItemDeDefensa methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:48:21'!
puntosDeDefensa
	^puntosDeDefensa! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeDefensa class' category: #'2024-2C-Parcial-1'!
ItemDeDefensa class
	instanceVariableNames: ''!

!ItemDeDefensa class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:46:08'!
armadura
	^self protegiendoPor: 5 * pv.! !

!ItemDeDefensa class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:45:10'!
escudoMagico
	^self protegiendoPor: 3 * pv! !


!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 12:45:37'!
protegiendoPor: unosPuntosDeDefensa 
	^self new initializeProtegiendoPor: unosPuntosDeDefensa ! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'puntosDeVida tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:46:53'!
atacarA: unAventurero

	unAventurero recibirDaño: puntosDeVida! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:19:56'!
perderTodosLosPuntosDeVida
	puntosDeVida := 0! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:01:28'!
recibirDaño: puntosDeDaño 
	puntosDeVida := puntosDeVida - puntosDeDaño! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 12:56:56'!
tienePuntosDeVida: unosPuntosDeVidaEsperados 
	^puntosDeVida = unosPuntosDeVidaEsperados! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:22:48'!
tipo
	^tipo! !


!Monstruo methodsFor: 'initialization' stamp: 'LL 9/29/2024 13:24:05'!
initializeConPuntosDeVida: unosPuntosDeVida deTipo: unTipoDeMonstruo  
	puntosDeVida := unosPuntosDeVida.
	tipo := unTipoDeMonstruo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:23:25'!
goblin
	^self conPuntosDeVida: 5 * pv deTipo: #Goblin ! !

!Monstruo class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 13:23:32'!
ogro
	^self conPuntosDeVida: 15 * pv deTipo: #Ogro! !


!Monstruo class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 13:23:58'!
conPuntosDeVida: unosPuntosDeVida deTipo: unTipoDeMonstruo  
	^self new initializeConPuntosDeVida: unosPuntosDeVida deTipo: unTipoDeMonstruo! !

TestMyA initialize!