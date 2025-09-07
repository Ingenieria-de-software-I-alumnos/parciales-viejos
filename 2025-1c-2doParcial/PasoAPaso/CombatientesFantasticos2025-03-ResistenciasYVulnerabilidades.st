!classDefinition: #TestCombatientesFantasticos category: #CombatientesFantasticos2025!
TestCase subclass: #TestCombatientesFantasticos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:23'!
test01GuerreroComienzaCon120HP

	| combatiente |
	combatiente := Guerrero new.
	
	self assert: (combatiente tieneVida: 120)

	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:17'!
test02MagoComienzaCon80HP

	| combatiente |
	combatiente := Mago new.
	
	self assert: (combatiente tieneVida: 80)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:08'!
test03PaladinComienzaCon100HP

	| combatiente |
	combatiente := Paladin new.
	
	self assert: (combatiente tieneVida: 100)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:51:32'!
test04ElGuerreroPuedeAtacarFisicamenteCausando25PuntosDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 25)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:23'!
test05UnCombatienteNoPuedeQuedarConUnaCantidadNegativaDePuntosDeVida

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	5 timesRepeat: [ combatiente atacarFisicamenteA: otroCombatiente ].
	
	self assert: (otroCombatiente tieneVida: 0)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:01'!
test06ElGuerreroNoPuedeLanzarHechizosDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [combatiente lanzarHechizoA: otroCombatiente ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
			self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:05'!
test07ElGuerreroPuedeDefenderse

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	otroCombatiente posturaDeDefensa.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*0.5))
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:08'!
test08ElMagoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	combatiente lanzarHechizoA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:11'!
test09ElMagoNoPuedeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Mago new.
	
	self should: [combatiente atacarFisicamenteA: otroCombatiente ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeAtacarFisicamenteMensajeDeError.
			self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:17'!
test10ElMagoNoPuedeDefenderse

	| combatiente |
	combatiente := Mago new.
	
	self should: [ combatiente posturaDeDefensa ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeDefenderseMensajeDeError.
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:45'!
test11ElMagoPuedeCurarAOtroCombatiente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	combatiente lanzarHechizoA: otroCombatiente.
	
	combatiente curarA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 + 20)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:19'!
test12NoSePuedeCurarMasQueLaVidaMaxima

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Mago new.
	
	combatiente curarA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:23'!
test13ElGuerreroNoPuedeCurar

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [ combatiente curarA: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeCurarMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:46:23'!
test14ElPaladinNoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self should: [ combatiente lanzarHechizoA: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:28'!
test15LaDefensaSoloDuraUnTurno

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	otroCombatiente posturaDeDefensa.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*0.5) - 25)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:52:31'!
test16ElMagoEsVulnerableAAtaqueFisicoRecibiendo20PorCientoMasDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Mago new.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*1.2))
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:00:22'!
test17ElGuerreroEsResistenteAAtaqueMagicoRecibiendo30PorCientoMenosDeDaño

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	combatiente lanzarHechizoA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (30*0.7))
	! !


!classDefinition: #Combatiente category: #CombatientesFantasticos2025!
Object subclass: #Combatiente
	instanceVariableNames: 'cantidadDeVida estado vidaMaxima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Combatiente methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:45:32'!
initialize 
	cantidadDeVida := vidaMaxima.
	estado := #normal! !


!Combatiente methodsFor: 'acciones' stamp: 'LL 6/11/2025 22:38:54'!
atacarFisicamenteA: otroCombatiente
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones' stamp: 'LL 6/11/2025 22:39:25'!
curarA: otroCombatiente
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones' stamp: 'LL 6/11/2025 22:40:07'!
lanzarHechizoA: otroCombatiente
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones' stamp: 'LL 6/11/2025 22:41:01'!
posturaDeDefensa
	self subclassResponsibility! !


!Combatiente methodsFor: 'testing' stamp: 'LL 6/11/2025 20:40:27'!
tieneVida: unaCantidadDeVidaEsperada
	^cantidadDeVida = unaCantidadDeVidaEsperada! !


!Combatiente methodsFor: 'mensajes de error' stamp: 'LL 6/11/2025 21:27:31'!
noPuedeAtacarFisicamenteMensajeDeError
	^'No puede atacar fisicamente'! !

!Combatiente methodsFor: 'mensajes de error' stamp: 'LL 6/11/2025 22:22:25'!
noPuedeCurarMensajeDeError
	^'No puede curar'! !

!Combatiente methodsFor: 'mensajes de error' stamp: 'LL 6/11/2025 21:29:30'!
noPuedeDefenderseMensajeDeError
	^'No puede defenderse'! !

!Combatiente methodsFor: 'mensajes de error' stamp: 'LL 6/11/2025 21:02:30'!
noPuedeLanzarHechizoMensajeDeError
	^'No puede lanzar hechizo'! !


!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 22:58:18'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	self subclassResponsibility! !

!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 23:04:01'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	self subclassResponsibility! !

!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 23:04:49'!
recibirDaño: puntosDeDaño 
	
	| dañoARealizar |
	dañoARealizar := puntosDeDaño.
	estado = #defensa ifTrue: [
		dañoARealizar := dañoARealizar * 0.5.
		estado := #normal.
	].
	cantidadDeVida := cantidadDeVida - dañoARealizar	 max: 0! !

!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 23:05:07'!
recibirDañoPorAtaqueFisico: puntosDeDaño 
	
	| dañoARecibir |
	dañoARecibir := self dañoARecibirPorAtaqueFisico: puntosDeDaño.
	self recibirDaño: dañoARecibir! !

!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 23:05:23'!
recibirDañoPorHechizo: puntosDeDaño 
	
	| dañoARecibir |
	dañoARecibir := self dañoARecibirPorHechizo: puntosDeDaño.
	self recibirDaño: dañoARecibir! !

!Combatiente methodsFor: 'private' stamp: 'LL 6/11/2025 22:18:53'!
restaurarPuntosDeVida: unaCantidadDePuntosDeVida 
	cantidadDeVida := cantidadDeVida + unaCantidadDePuntosDeVida min: vidaMaxima! !


!Combatiente methodsFor: 'accessing' stamp: 'LL 6/11/2025 22:51:51'!
vidaMaxima
	^vidaMaxima! !


!classDefinition: #Guerrero category: #CombatientesFantasticos2025!
Combatiente subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:53:45'!
atacarFisicamenteA: otroCombatiente
	otroCombatiente recibirDañoPorAtaqueFisico: 25! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:39:05'!
curarA: otroCombatiente
	self error: self noPuedeCurarMensajeDeError! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:03:23'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño * 0.7! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:44:55'!
initialize
	vidaMaxima := 120.
	super initialize! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:39:45'!
lanzarHechizoA: otroCombatiente
	self error: self noPuedeLanzarHechizoMensajeDeError! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:40:42'!
posturaDeDefensa
	estado := #defensa! !


!classDefinition: #Mago category: #CombatientesFantasticos2025!
Combatiente subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:35:35'!
atacarFisicamenteA: otroCombatiente
	self error: self noPuedeAtacarFisicamenteMensajeDeError! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:39:14'!
curarA: otroCombatiente
	otroCombatiente restaurarPuntosDeVida: 20! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño * 1.2! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:03:37'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:45:04'!
initialize
	vidaMaxima := 80.
	super initialize! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:54:30'!
lanzarHechizoA: otroCombatiente
	otroCombatiente recibirDañoPorHechizo: 30! !

!Mago methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:40:26'!
posturaDeDefensa
	self error: self noPuedeDefenderseMensajeDeError! !


!classDefinition: #Paladin category: #CombatientesFantasticos2025!
Combatiente subclass: #Paladin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:53:56'!
atacarFisicamenteA: otroCombatiente
	otroCombatiente recibirDañoPorAtaqueFisico: 25! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:39:20'!
curarA: otroCombatiente
	otroCombatiente restaurarPuntosDeVida: 20! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:03:41'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:45:09'!
initialize
	vidaMaxima := 100.
	super initialize! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:39:52'!
lanzarHechizoA: otroCombatiente
	self error: self noPuedeLanzarHechizoMensajeDeError! !

!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:40:55'!
posturaDeDefensa
	estado := #defensa! !
