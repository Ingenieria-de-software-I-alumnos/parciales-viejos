!classDefinition: #TestCombatientesFantasticos category: #CombatientesFantasticos2025!
TestCase subclass: #TestCombatientesFantasticos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:39:34'!
test01GuerreroComienzaCon120HP

	| combatiente |
	combatiente := Combatiente guerrero.
	
	self assert: (combatiente tieneVida: 120)

	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:39:28'!
test02MagoComienzaCon80HP

	| combatiente |
	combatiente := Combatiente mago.
	
	self assert: (combatiente tieneVida: 80)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:39:21'!
test03PaladinComienzaCon100HP

	| combatiente |
	combatiente := Combatiente paladin.
	
	self assert: (combatiente tieneVida: 100)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:50:18'!
test04ElGuerreroPuedeAtacarFisicamenteCausando25PuntosDeDaño

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 120 - 25)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:56:17'!
test05UnCombatienteNoPuedeQuedarConUnaCantidadNegativaDePuntosDeVida

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	5 timesRepeat: [ combatiente atacarFisicamenteA: otroCombatiente ].
	
	self assert: (otroCombatiente tieneVida: 0)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:02:55'!
test06ElGuerreroNoPuedeLanzarHechizosDeDaño

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	self should: [combatiente lanzarHechizoA: otroCombatiente ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
			self assert: (otroCombatiente tieneVida: 120)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:23:13'!
test07ElGuerreroPuedeDefenderse

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	otroCombatiente posturaDeDefensa.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 120 - (25*0.5))
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:24:35'!
test08ElMagoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Combatiente mago.
	otroCombatiente := Combatiente mago.
	
	combatiente lanzarHechizoA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 80 - 30)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:26:29'!
test09ElMagoNoPuedeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Combatiente mago.
	otroCombatiente := Combatiente mago.
	
	self should: [combatiente atacarFisicamenteA: otroCombatiente ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeAtacarFisicamenteMensajeDeError.
			self assert: (otroCombatiente tieneVida: 80)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:28:34'!
test10ElMagoNoPuedeDefenderse

	| combatiente |
	combatiente := Combatiente mago.
	
	self should: [ combatiente posturaDeDefensa ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeDefenderseMensajeDeError.
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:16:00'!
test11ElMagoPuedeCurarAOtroCombatiente

	| combatiente otroCombatiente |
	combatiente := Combatiente mago.
	otroCombatiente := Combatiente mago.
	combatiente lanzarHechizoA: otroCombatiente.
	
	combatiente curarA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 80 - 30 + 20)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:17:34'!
test12NoSePuedeCurarMasQueLaVidaMaxima

	| combatiente otroCombatiente |
	combatiente := Combatiente mago.
	otroCombatiente := Combatiente mago.
	
	combatiente curarA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 80)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:21:23'!
test13ElGuerreroNoPuedeCurar

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	self should: [ combatiente curarA: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeCurarMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:23:26'!
test14ElPaladinNoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Combatiente paladin.
	otroCombatiente := Combatiente guerrero.
	
	self should: [ combatiente lanzarHechizoA: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:28:21'!
test15LaDefensaSoloDuraUnTurno

	| combatiente otroCombatiente |
	combatiente := Combatiente guerrero.
	otroCombatiente := Combatiente guerrero.
	
	otroCombatiente posturaDeDefensa.
	
	combatiente atacarFisicamenteA: otroCombatiente.
	combatiente atacarFisicamenteA: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: 120 - (25*0.5) - 25)
	
	! !


!classDefinition: #Combatiente category: #CombatientesFantasticos2025!
Object subclass: #Combatiente
	instanceVariableNames: 'cantidadDeVida tipo estado vidaMaxima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:27:17'!
atacarFisicamenteA: otroCombatiente
	tipo = #mago ifTrue: [ self error: self noPuedeAtacarFisicamenteMensajeDeError ].
	otroCombatiente recibirDañoPor: 25! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:22:11'!
curarA: otroCombatiente
	tipo = #guerrero ifTrue: [ self error: self noPuedeCurarMensajeDeError].
	otroCombatiente restaurarPuntosDeVida: 20! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:18:13'!
inicializarDeTipo: unTipoDeCombatiente conVida: unaCantidadDeVida 
	tipo := unTipoDeCombatiente.
	vidaMaxima := unaCantidadDeVida.
	cantidadDeVida := vidaMaxima.
	estado := #normal! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:26:54'!
lanzarHechizoA: otroCombatiente
	tipo = #guerrero ifTrue: [ 	^self error: self noPuedeLanzarHechizoMensajeDeError ].
	tipo = #paladin ifTrue: [ 	^self error: self noPuedeLanzarHechizoMensajeDeError ].
	otroCombatiente recibirDañoPor: 30! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 21:29:18'!
posturaDeDefensa
	tipo = #mago ifTrue: [ self error: self noPuedeDefenderseMensajeDeError ].
	estado := #defensa! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:28:44'!
recibirDañoPor: puntosDeDaño 
	
	| dañoARealizar |
	dañoARealizar := puntosDeDaño.
	estado = #defensa ifTrue: [ 
		dañoARealizar := dañoARealizar * 0.5.
		estado := #normal.
	].
	cantidadDeVida := cantidadDeVida - dañoARealizar	 max: 0! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 22:18:53'!
restaurarPuntosDeVida: unaCantidadDePuntosDeVida 
	cantidadDeVida := cantidadDeVida + unaCantidadDePuntosDeVida min: vidaMaxima! !

!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:40:27'!
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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Combatiente class' category: #CombatientesFantasticos2025!
Combatiente class
	instanceVariableNames: ''!

!Combatiente class methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:38:23'!
guerrero

	^self new inicializarDeTipo: #guerrero conVida: 120! !

!Combatiente class methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 20:36:52'!
mago

	^self new inicializarDeTipo: #mago conVida: 80! !


!Combatiente class methodsFor: 'instance creation' stamp: 'LL 6/11/2025 20:39:52'!
paladin
	^self new inicializarDeTipo: #paladin conVida: 100! !
