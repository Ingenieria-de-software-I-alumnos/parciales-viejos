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


!TestMyA methodsFor: 'tests - bonus' stamp: 'LL 9/29/2024 16:32:56'!
test13PersonajeMyANoPuedeQuedarConVidaNegativa

	| guerrero goblin |
	
	guerrero := self crearGuerrero.
	goblin := self crearGoblin.
	
	goblin atacarA: guerrero.
	goblin atacarA: guerrero.
	goblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 0 * pv)! !

!TestMyA methodsFor: 'tests - bonus' stamp: 'LL 9/29/2024 19:31:00'!
test14GuerreroNoPuedeAtacarSiFueDerrotado

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	ogro atacarA: guerrero.
	ogro atacarA: guerrero.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	
	self should: [
		guerrero atacarA: ogro con: itemDeAtaque.
	] raise: Error-MessageNotUnderstood withExceptionDo: [ :anException |
		self assert: anException messageText equals: guerrero personajeDerrotadoNoPuedeAtacarMensajeDeError.
		self assert: (ogro tienePuntosDeVida: 15 * pv)
	].! !

!TestMyA methodsFor: 'tests - bonus' stamp: 'LL 9/29/2024 19:39:49'!
test15MagoNoPuedeAtacarSiFueDerrotado

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	mago atacarA: ogro con: itemDeAtaque.
	
	self should: [
		mago atacarA: ogro con: itemDeAtaque.
	] raise: Error-MessageNotUnderstood withExceptionDo: [ :anException |
		self assert: anException messageText equals: mago personajeDerrotadoNoPuedeAtacarMensajeDeError.
		self assert: (ogro tienePuntosDeVida: 15 * pv)
	].! !

!TestMyA methodsFor: 'tests - bonus' stamp: 'LL 9/29/2024 19:31:50'!
test16MonstruoNoPuedeAtacarSiFueDerrotado

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	4 timesRepeat: [ guerrero atacarA: ogro con: itemDeAtaque ].
	
	self should: [
		ogro atacarA: guerrero.
	] raise: Error-MessageNotUnderstood withExceptionDo: [ :anException |
		self assert: anException messageText equals: ogro personajeDerrotadoNoPuedeAtacarMensajeDeError.
		self assert: (guerrero tienePuntosDeVida: 10 * pv)
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #EstadoDePersonaje category: #'2024-2C-Parcial-1'!
Object subclass: #EstadoDePersonaje
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EstadoDePersonaje methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:15:01'!
atacarCon: unItemDeAtaque siendoGuerrero: unGuerrero aMonstruo: unMonstruo

	self subclassResponsibility! !

!EstadoDePersonaje methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:13:55'!
atacarCon: unItemDeAtaque siendoMago: unMago aMonstruo: unMonstruo

	self subclassResponsibility! !

!EstadoDePersonaje methodsFor: 'atacar' stamp: 'LL 9/29/2024 18:49:58'!
atacarSiendoMonstruo: unMonstruo aAventurero: unAventurero

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoDePersonaje class' category: #'2024-2C-Parcial-1'!
EstadoDePersonaje class
	instanceVariableNames: ''!

!EstadoDePersonaje class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 19:00:02'!
segun: unaCantidadDePuntosDeVida 
	^(self subclasses detect: [ :unaClaseDeEstadoDePersonaje | unaClaseDeEstadoDePersonaje esPara: unaCantidadDePuntosDeVida ]) new! !


!classDefinition: #PersonajeDerrotado category: #'2024-2C-Parcial-1'!
EstadoDePersonaje subclass: #PersonajeDerrotado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!PersonajeDerrotado methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:26:23'!
atacarCon: unItemDeAtaque siendoGuerrero: unGuerrero aMonstruo: unMonstruo

	self errorDePersonajeDerrotado: unGuerrero! !

!PersonajeDerrotado methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:26:12'!
atacarCon: unItemDeAtaque siendoMago: unMago aMonstruo: unMonstruo

	self errorDePersonajeDerrotado: unMago! !

!PersonajeDerrotado methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:25:56'!
atacarSiendoMonstruo: unMonstruo aAventurero: unAventurero

	self errorDePersonajeDerrotado: unMonstruo! !


!PersonajeDerrotado methodsFor: 'private' stamp: 'LL 9/29/2024 19:25:56'!
errorDePersonajeDerrotado: unPersonajeDerrotado

	^ self error: unPersonajeDerrotado personajeDerrotadoNoPuedeAtacarMensajeDeError! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PersonajeDerrotado class' category: #'2024-2C-Parcial-1'!
PersonajeDerrotado class
	instanceVariableNames: ''!

!PersonajeDerrotado class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 19:02:55'!
esPara: unaCantidadDePuntosDeVida 
	^unaCantidadDePuntosDeVida = 0! !


!classDefinition: #PersonajeEnCombate category: #'2024-2C-Parcial-1'!
EstadoDePersonaje subclass: #PersonajeEnCombate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!PersonajeEnCombate methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:10:30'!
atacarCon: unItemDeAtaque siendoGuerrero: unGuerrero aMonstruo: unMonstruo

	unItemDeAtaque atacarSiendoGuerrero: unGuerrero a: unMonstruo.! !

!PersonajeEnCombate methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:16:17'!
atacarCon: unItemDeAtaque siendoMago: unMago aMonstruo: unMonstruo

	unItemDeAtaque atacarSiendoMago: unMago a: unMonstruo.! !

!PersonajeEnCombate methodsFor: 'atacar' stamp: 'LL 9/29/2024 18:49:58'!
atacarSiendoMonstruo: unMonstruo aAventurero: unAventurero

	unAventurero recibirDaño: unMonstruo puntosDeVida! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PersonajeEnCombate class' category: #'2024-2C-Parcial-1'!
PersonajeEnCombate class
	instanceVariableNames: ''!

!PersonajeEnCombate class methodsFor: 'as yet unclassified' stamp: 'LL 9/29/2024 19:03:10'!
esPara: unaCantidadDePuntosDeVida 
	^unaCantidadDePuntosDeVida > 0! !


!classDefinition: #ItemDeAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeAtaque
	instanceVariableNames: 'monstruoObjetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeAtaque methodsFor: 'atacar' stamp: 'LL 9/29/2024 15:09:27'!
atacarSiendoGuerrero: unGuerrero a: unMonstruo

	self subclassResponsibility! !

!ItemDeAtaque methodsFor: 'atacar' stamp: 'LL 9/29/2024 14:07:40'!
atacarSiendoMago: unMago a: unMonstruo

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeAtaque class' category: #'2024-2C-Parcial-1'!
ItemDeAtaque class
	instanceVariableNames: ''!

!ItemDeAtaque class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:05:51'!
baculo
	^Baculo new! !

!ItemDeAtaque class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 15:28:32'!
espadaPara: unMonstruoObjetivo
	^Espada conObjetivo: unMonstruoObjetivo! !


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Baculo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'atacar' stamp: 'LL 9/29/2024 15:15:26'!
atacarSiendoGuerrero: unGuerrero a: unMonstruo

	unMonstruo serAtacadoPorGuerreroPor: unGuerrero conBaculo: self! !

!Baculo methodsFor: 'atacar' stamp: 'LL 9/29/2024 15:15:30'!
atacarSiendoMago: unMago a: unMonstruo

	unMonstruo serAtacadoPorMagoPor: unMago conBaculo: self! !


!Baculo methodsFor: 'atacar - dd' stamp: 'LL 9/29/2024 15:23:57'!
atacarSiendo: unAventurero aOgro: unOgro

	unAventurero atacarUsandoFuerzaA: unOgro

	! !

!Baculo methodsFor: 'atacar - dd' stamp: 'LL 9/29/2024 15:01:28'!
atacarSiendoGuerreroAGoblin: unGoblin

	unGoblin duplicarPuntosDeVida! !

!Baculo methodsFor: 'atacar - dd' stamp: 'LL 9/29/2024 15:02:46'!
atacarSiendoMagoAGoblin: unGoblin

	unGoblin perderTodosLosPuntosDeVida! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemDeAtaque subclass: #Espada
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'initialization' stamp: 'LL 9/29/2024 15:26:53'!
initializeConObjetivo: unMonstruoObjetivo 
	monstruoObjetivo := unMonstruoObjetivo.! !


!Espada methodsFor: 'atacar' stamp: 'LL 9/29/2024 15:24:17'!
atacarSiendoGuerrero: unGuerrero a: unMonstruo

	(self tieneComoObjetivoA: unMonstruo) ifTrue: [ unGuerrero atacarUsandoFuerzaA: unMonstruo ]! !

!Espada methodsFor: 'atacar' stamp: 'LL 9/29/2024 14:08:02'!
atacarSiendoMago: unMago a: unMonstruo

	unMago perderTodosLosPuntosDeVida! !


!Espada methodsFor: 'private' stamp: 'LL 9/29/2024 15:27:03'!
tieneComoObjetivoA: unMonstruo 
	^monstruoObjetivo = unMonstruo! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 15:29:21'!
conObjetivo: unMonstruoObjetivo
	self assertMonstruoConAlturaSuficiente: unMonstruoObjetivo.
	
	^self new initializeConObjetivo: unMonstruoObjetivo! !


!Espada class methodsFor: 'asserts' stamp: 'LL 9/29/2024 15:29:16'!
assertMonstruoConAlturaSuficiente: unMonstruoObjetivo

	(unMonstruoObjetivo tieneAlturaMenorA: 1 * meter) ifTrue: [ self error: self noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError ]! !


!Espada class methodsFor: 'mensajes de error' stamp: 'LL 9/29/2024 13:38:10'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	^'No se puede atacar a monstruo menor a un metro'! !


!classDefinition: #ItemDeDefensa category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDeDefensa
	instanceVariableNames: 'puntosDeDefensa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDeDefensa methodsFor: 'initialization' stamp: 'LL 9/29/2024 12:45:51'!
initializeProtegiendoPor: unosPuntosDeDefensa 
	puntosDeDefensa := unosPuntosDeDefensa.! !


!ItemDeDefensa methodsFor: 'accessing' stamp: 'LL 9/29/2024 12:48:21'!
puntosDeDefensa
	^puntosDeDefensa! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ItemDeDefensa class' category: #'2024-2C-Parcial-1'!
ItemDeDefensa class
	instanceVariableNames: ''!

!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 12:46:08'!
armadura
	^self protegiendoPor: 5 * pv.! !

!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 12:45:10'!
escudoMagico
	^self protegiendoPor: 3 * pv! !

!ItemDeDefensa class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 12:45:37'!
protegiendoPor: unosPuntosDeDefensa 
	^self new initializeProtegiendoPor: unosPuntosDeDefensa ! !


!classDefinition: #PersonajeMyA category: #'2024-2C-Parcial-1'!
Object subclass: #PersonajeMyA
	instanceVariableNames: 'puntosDeVida estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!PersonajeMyA methodsFor: 'initialization' stamp: 'LL 9/29/2024 19:45:24'!
initializeConPuntosDeVida: unosPuntosDeVida
	self establecerPuntosDeVida: unosPuntosDeVida! !


!PersonajeMyA methodsFor: 'recibir daño' stamp: 'LL 9/29/2024 19:45:40'!
perderTodosLosPuntosDeVida

	self establecerPuntosDeVida: 0.! !

!PersonajeMyA methodsFor: 'recibir daño' stamp: 'LL 9/29/2024 19:46:01'!
recibirDaño: puntosDeDaño
	| puntosARestar |
	puntosARestar := (puntosDeDaño - self puntosDeDefensa) max: 0.
	self establecerPuntosDeVida: ((puntosDeVida - puntosARestar) max: 0 * pv)! !


!PersonajeMyA methodsFor: 'testing' stamp: 'LL 9/29/2024 15:58:03'!
tienePuntosDeVida: unosPuntosDeVida

	^puntosDeVida = unosPuntosDeVida! !


!PersonajeMyA methodsFor: 'private' stamp: 'LL 9/29/2024 19:45:10'!
establecerPuntosDeVida: unosPuntosDeVida

	puntosDeVida := unosPuntosDeVida.
	estado := EstadoDePersonaje segun: puntosDeVida.! !

!PersonajeMyA methodsFor: 'private' stamp: 'LL 9/29/2024 15:58:13'!
puntosDeDefensa

	self subclassResponsibility! !


!PersonajeMyA methodsFor: 'atacar' stamp: 'LL 9/29/2024 16:28:47'!
personajeDerrotadoNoPuedeAtacarMensajeDeError

	^ 'Un personaje derrotado no puede atacar'! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
PersonajeMyA subclass: #Aventurero
	instanceVariableNames: 'itemsDeDefensa itemsDeAtaque fuerza'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'initialization' stamp: 'LL 9/29/2024 19:20:10'!
initializeConPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza   
	self initializeConPuntosDeVida: unosPuntosDeVida.
	itemsDeDefensa := Set new.
	itemsDeAtaque := Set new.
	fuerza := unaFuerza.! !


!Aventurero methodsFor: 'equipar items' stamp: 'LL 9/29/2024 12:57:57'!
equiparItemDeAtaque: unItemDeAtaque

	itemsDeAtaque add: unItemDeAtaque! !

!Aventurero methodsFor: 'equipar items' stamp: 'LL 9/29/2024 12:44:08'!
equiparItemDeDefensa: unItemDeDefensa

	itemsDeDefensa add: unItemDeDefensa! !


!Aventurero methodsFor: 'atacar' stamp: 'LL 9/29/2024 14:11:52'!
atacarA: unMonstruo con: unItemDeAtaque

	self subclassResponsibility
! !


!Aventurero methodsFor: 'mensajes de error' stamp: 'LL 9/29/2024 12:56:38'!
itemNoDisponibleMensajeDeError
	^'Item no disponible'! !


!Aventurero methodsFor: 'private' stamp: 'LL 9/29/2024 15:45:02'!
assertTengoItemEquipado: unItemDeAtaque

	^(itemsDeAtaque includes: unItemDeAtaque) ifFalse: [ self error: self itemNoDisponibleMensajeDeError ]! !

!Aventurero methodsFor: 'private' stamp: 'LL 9/29/2024 15:23:41'!
atacarUsandoFuerzaA: unMonstruo

	unMonstruo recibirDaño: fuerza
! !

!Aventurero methodsFor: 'private' stamp: 'LL 9/29/2024 15:44:42'!
puntosDeDefensa

	^ itemsDeDefensa sum: [ :itemDeDefensa | itemDeDefensa puntosDeDefensa ] ifEmpty: [ 0 ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Aventurero class' category: #'2024-2C-Parcial-1'!
Aventurero class
	instanceVariableNames: ''!

!Aventurero class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:14:44'!
conPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza   
	^self new initializeConPuntosDeVida: unosPuntosDeVida conFuerza: unaFuerza ! !

!Aventurero class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:14:44'!
guerrero
	^Guerrero conPuntosDeVida: 10 * pv conFuerza: 4 * pv .! !

!Aventurero class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:14:44'!
mago
	^Mago conPuntosDeVida: 15 * pv conFuerza: 2 * pv ! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:21:31'!
atacarA: unMonstruo con: unItemDeAtaque

	self assertTengoItemEquipado: unItemDeAtaque.

	estado atacarCon: unItemDeAtaque siendoGuerrero: self aMonstruo: unMonstruo.
! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:21:31'!
atacarA: unMonstruo con: unItemDeAtaque

	self assertTengoItemEquipado: unItemDeAtaque.
	
	estado atacarCon: unItemDeAtaque siendoMago: self aMonstruo: unMonstruo.
! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
PersonajeMyA subclass: #Monstruo
	instanceVariableNames: 'altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'initialization' stamp: 'LL 9/29/2024 19:20:26'!
initializeConPuntosDeVida: unosPuntosDeVida conAltura: unaAltura   
	self initializeConPuntosDeVida: unosPuntosDeVida.
	altura := unaAltura.! !


!Monstruo methodsFor: 'atacar' stamp: 'LL 9/29/2024 19:04:59'!
atacarA: unAventurero
	
	estado atacarSiendoMonstruo: self aAventurero: unAventurero.! !


!Monstruo methodsFor: 'testing' stamp: 'LL 9/29/2024 13:36:25'!
tieneAlturaMenorA: unaAlturaEsperada 
	^altura < unaAlturaEsperada! !


!Monstruo methodsFor: 'dd' stamp: 'LL 9/29/2024 19:47:03'!
duplicarPuntosDeVida
	
	self establecerPuntosDeVida: puntosDeVida * 2! !

!Monstruo methodsFor: 'dd' stamp: 'LL 9/29/2024 15:11:27'!
serAtacadoPorGuerreroPor: puntosDeDaño conBaculo: unBaculo 

	self subclassResponsibility! !

!Monstruo methodsFor: 'dd' stamp: 'LL 9/29/2024 15:11:35'!
serAtacadoPorMagoPor: puntosDeDaño conBaculo: unBaculo 

	self subclassResponsibility! !


!Monstruo methodsFor: 'private' stamp: 'LL 9/29/2024 15:58:21'!
puntosDeDefensa

	^0! !


!Monstruo methodsFor: 'estado - private' stamp: 'LL 9/29/2024 19:22:44'!
puntosDeVida
	^puntosDeVida! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Monstruo class' category: #'2024-2C-Parcial-1'!
Monstruo class
	instanceVariableNames: ''!

!Monstruo class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:17:36'!
conPuntosDeVida: unosPuntosDeVida conAltura: unaAltura   
	^self new initializeConPuntosDeVida: unosPuntosDeVida conAltura: unaAltura ! !

!Monstruo class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:17:36'!
goblin
	^Goblin conPuntosDeVida: 5 * pv conAltura: 90 * centimeter ! !

!Monstruo class methodsFor: 'instance creation' stamp: 'LL 9/29/2024 14:17:36'!
ogro
	^Ogro conPuntosDeVida: 15 * pv conAltura: 220 * centimeter ! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'dd' stamp: 'LL 9/29/2024 15:15:42'!
serAtacadoPorGuerreroPor: unGuerrero conBaculo: unBaculo 

	unBaculo atacarSiendoGuerreroAGoblin: self! !

!Goblin methodsFor: 'dd' stamp: 'LL 9/29/2024 15:15:47'!
serAtacadoPorMagoPor: unMago conBaculo: unBaculo 

	unBaculo atacarSiendoMagoAGoblin: self! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'dd' stamp: 'LL 9/29/2024 15:19:02'!
serAtacadoPorGuerreroPor: unGuerrero conBaculo: unBaculo 

	unBaculo atacarSiendo: unGuerrero aOgro: self.! !

!Ogro methodsFor: 'dd' stamp: 'LL 9/29/2024 15:19:00'!
serAtacadoPorMagoPor: unMago conBaculo: unBaculo 

	unBaculo atacarSiendo: unMago aOgro: self.! !

TestMyA initialize!