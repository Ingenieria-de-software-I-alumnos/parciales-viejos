!classDefinition: #TestCombatientesFantasticos category: #CombatientesFantasticos2025!
TestCase subclass: #TestCombatientesFantasticos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:58'!
curarConBendicionSiendo: combatiente hacia: otroCombatiente

	^ combatiente realizarAccion: (Curacion nuevaHacia: otroCombatiente usando: [ 1 ])! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:10'!
curarSinBendicionSiendo: combatiente hacia: otroCombatiente

	^ combatiente realizarAccion: (Curacion nuevaHacia: otroCombatiente usando: [ 0 ])! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente

	^ combatiente realizarAccion: (HechizoDeDaño nuevaHacia: otroCombatiente usando: [ 1 ])! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente

	^ combatiente realizarAccion: (HechizoDeDaño nuevaHacia: otroCombatiente usando: [ 0 ])! !

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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test04ElGuerreroPuedeAtacarFisicamenteCausando25PuntosDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 25)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test05UnCombatienteNoPuedeQuedarConUnaCantidadNegativaDePuntosDeVida

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	5 timesRepeat: [ combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente) ].
	
	self assert: (otroCombatiente tieneVida: 0)! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test06ElGuerreroNoPuedeLanzarHechizosDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
			self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:11:50'!
test07ElGuerreroPuedeDefenderse

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	otroCombatiente realizarAccion: (PosturaDeDefensa new).
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*0.5))
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test08ElMagoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test09ElMagoNoPuedeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Mago new.
	
	self should: [combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente) ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeAtacarFisicamenteMensajeDeError.
			self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:11:50'!
test10ElMagoNoPuedeDefenderse

	| combatiente |
	combatiente := Mago new.
	
	self should: [ combatiente realizarAccion: (PosturaDeDefensa new) ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeDefenderseMensajeDeError.
	].
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test11ElMagoPuedeCurarAOtroCombatiente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 + 20)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:10'!
test12NoSePuedeCurarMasQueLaVidaMaxima

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Mago new.
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:10'!
test13ElGuerreroNoPuedeCurar

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [ self curarSinBendicionSiendo: combatiente hacia: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeCurarMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test14ElPaladinNoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self should: [ self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeLanzarHechizoMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:11:50'!
test15LaDefensaSoloDuraUnTurno

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	otroCombatiente realizarAccion: (PosturaDeDefensa new).
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente).
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*0.5) - 25)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test16ElMagoEsVulnerableAAtaqueFisicoRecibiendo20PorCientoMasDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Mago new.
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (25*1.2))
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test17ElGuerreroEsResistenteAAtaqueMagicoRecibiendo30PorCientoMenosDeDaño

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (30*0.7))
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
test18ElHechizoEnvenenaAlObjetivoSiElNumeroAleatorioEsMayorA07

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente estaEnvenenado)
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:27'!
test19ElHechizoNoEnvenenaAlObjetivoSiElNumeroAleatorioEsMenorA07

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoSinEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self deny: (otroCombatiente estaEnvenenado)
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
test20ElPaladinEnvenenadoPierde2PuntosDeVidaLuegoDeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (AtaqueFisico nuevaHacia: combatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 - 2)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
test21ElGuerreroEnvenenadoPierde2PuntosDeVidaLuegoDeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (AtaqueFisico nuevaHacia: combatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (30*0.7) - 2)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
test22UnCombatienteEnvenenadoPierde2PuntosDeVidaLuegoDeRealizarUnaAccion

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (Curacion nuevaHacia: combatiente usando: [ 0 ]).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 - 2)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:20'!
test23UnCombatienteEnvenenadoNoPuedeDefenderse

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoConEnvenenamientoSiendo: combatiente hacia: otroCombatiente.
	
	self should: [ otroCombatiente realizarAccion: (PosturaDeDefensa new) ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeDefenderseMensajeDeError.
	].

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:48:47'!
test24UnPaladinBendiceAlCurarSiElNumeroAleatorioEsMenorA04

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self assert: otroCombatiente estaBendecido.

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:49:48'!
test25UnPaladinNoBendiceAlCurarSiElNumeroAleatorioEsMayorA04

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self deny: otroCombatiente estaBendecido.

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:56:17'!
test26UnCombatienteBendecidoNoPuedeDefenderse

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self should: [ otroCombatiente realizarAccion: (PosturaDeDefensa new) ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeDefenderseMensajeDeError.
	].

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 02:19:04'!
test27UnCombatienteBendecidoRealizaCuracionesUn50MasEfectivas

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Mago new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente. "otroCombatiente pasa a estar bendecido "
	
	self lanzarHechizoSinEnvenenamientoSiendo: otroCombatiente hacia: combatiente. "daño al combatiente"
	
	self curarSinBendicionSiendo: otroCombatiente hacia: combatiente. "curo al combatiente con el otroCombatiente que esta bendecido"
	
	self assert: (combatiente tieneVida: combatiente vidaMaxima - 30 + (20*1.5)).

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 02:22:19'!
test28UnCombatienteBendecidoRecibeCuracionesUn50MasEfectivas

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Mago new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente. "otroCombatiente pasa a estar bendecido "
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente). "daño a otroCombatiente"
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente. "curo a otroCombatiente bendecido"
	
	self assert: (otroCombatiente tieneVida: (otroCombatiente vidaMaxima - 25 + (20*1.5) min: otroCombatiente vidaMaxima)).

	
	! !


!classDefinition: #Accion category: #CombatientesFantasticos2025!
Object subclass: #Accion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Accion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:45:10'!
efectosPostAccionEn: combatienteQueRealizaLaAccion
	combatienteQueRealizaLaAccion estaEnvenenado ifTrue: [ 	combatienteQueRealizaLaAccion recibirDaño: 2 ].! !


!classDefinition: #AtaqueFisico category: #CombatientesFantasticos2025!
Accion subclass: #AtaqueFisico
	instanceVariableNames: 'objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!AtaqueFisico methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:40:03'!
initializeConObjetivo: unCombatienteObjetivo

	objetivo := unCombatienteObjetivo! !

!AtaqueFisico methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:32:49'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarAtaqueFisico ifFalse: [ self error: unCombatiente noPuedeAtacarFisicamenteMensajeDeError ].
	
	objetivo recibirDaño: (objetivo dañoARecibirPorAtaqueFisico: 25).
	
	self efectosPostAccionEn: unCombatiente.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AtaqueFisico class' category: #CombatientesFantasticos2025!
AtaqueFisico class
	instanceVariableNames: ''!

!AtaqueFisico class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:39:39'!
nuevaHacia: otroCombatiente

	^self new initializeConObjetivo: otroCombatiente! !


!classDefinition: #Curacion category: #CombatientesFantasticos2025!
Accion subclass: #Curacion
	instanceVariableNames: 'objetivo generadorDeNumerosAleatorios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:50:54'!
initializeConObjetivo: unCombatienteObjetivo conGenerador: unGeneradorDeNumerosAleatorios 

	objetivo := unCombatienteObjetivo.
	generadorDeNumerosAleatorios := unGeneradorDeNumerosAleatorios ! !

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 02:23:34'!
realizarSiendo: unCombatiente
	| puntosACurar |
	unCombatiente puedeRealizarCuracion ifFalse: [ self error: unCombatiente noPuedeCurarMensajeDeError ].
	
	(unCombatiente isKindOf: Paladin) ifTrue: [
		generadorDeNumerosAleatorios value > 0.6 ifTrue: [ objetivo bendecir ]
	].

	puntosACurar := 20.
	unCombatiente estaBendecido ifTrue: [
		puntosACurar := puntosACurar * 1.5.
	].
	objetivo estaBendecido ifTrue: [
		puntosACurar := puntosACurar * 1.5.
	].
	objetivo restaurarPuntosDeVida: puntosACurar.
	
	self efectosPostAccionEn: unCombatiente.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Curacion class' category: #CombatientesFantasticos2025!
Curacion class
	instanceVariableNames: ''!

!Curacion class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:51:06'!
nuevaHacia: otroCombatiente usando: unGeneradorDeNumerosAleatorios 

	^self new initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios! !


!classDefinition: #HechizoDeDaño category: #CombatientesFantasticos2025!
Accion subclass: #HechizoDeDaño
	instanceVariableNames: 'objetivo generadorDeNumerosAleatorios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!HechizoDeDaño methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:03:06'!
initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios

	objetivo := otroCombatiente.
	generadorDeNumerosAleatorios := unGeneradorDeNumerosAleatorios! !

!HechizoDeDaño methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:32:49'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarHechizo ifFalse: [ self error: unCombatiente noPuedeLanzarHechizoMensajeDeError ].
	
	generadorDeNumerosAleatorios value > 0.7 ifTrue: [ 		objetivo envenenar 	].
	objetivo recibirDaño: (objetivo dañoARecibirPorHechizo: 30).
	
	self efectosPostAccionEn: unCombatiente.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HechizoDeDaño class' category: #CombatientesFantasticos2025!
HechizoDeDaño class
	instanceVariableNames: ''!

!HechizoDeDaño class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:02:40'!
nuevaHacia: otroCombatiente usando: unGeneradorDeNumerosAleatorios

	^self new initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios! !


!classDefinition: #PosturaDeDefensa category: #CombatientesFantasticos2025!
Accion subclass: #PosturaDeDefensa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!PosturaDeDefensa methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:32:49'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarPosturaDeDefensa ifFalse: [ self error: unCombatiente noPuedeDefenderseMensajeDeError ].
	
	unCombatiente establecerPosturaDeDefensa.
	
	self efectosPostAccionEn: unCombatiente.	! !


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


!Combatiente methodsFor: 'acciones' stamp: 'LL 6/12/2025 01:32:49'!
realizarAccion: unaAccion
	unaAccion realizarSiendo: self.! !


!Combatiente methodsFor: 'testing' stamp: 'LL 6/11/2025 23:39:17'!
estaEnvenenado
	^estado = #envenenado! !

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


!Combatiente methodsFor: 'private' stamp: 'LL 6/12/2025 00:27:56'!
aplicarDaño: puntosDeDaño 
	
	cantidadDeVida := cantidadDeVida - puntosDeDaño	 max: 0! !


!Combatiente methodsFor: 'accessing' stamp: 'LL 6/11/2025 22:51:51'!
vidaMaxima
	^vidaMaxima! !


!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:53:54'!
estaBendecido
	^estado = #bendecido! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:40:59'!
puedeRealizarAtaqueFisico

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:40:44'!
puedeRealizarCuracion

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:42:41'!
puedeRealizarHechizo

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:57:12'!
puedeRealizarPosturaDeDefensa

	^self estaEnvenenado not and: [ self estaBendecido not]! !


!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 22:58:18'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 23:04:01'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 00:28:05'!
recibirDaño: puntosDeDaño 
	
	| dañoARealizar |
	dañoARealizar := puntosDeDaño.
	estado = #defensa ifTrue: [
		dañoARealizar := dañoARealizar * 0.5.
		estado := #normal.
	].
	self aplicarDaño: dañoARealizar! !


!Combatiente methodsFor: 'acciones - efectos' stamp: 'LL 6/11/2025 23:39:02'!
envenenar
	estado := #envenenado! !

!Combatiente methodsFor: 'acciones - efectos' stamp: 'LL 6/12/2025 01:08:45'!
establecerPosturaDeDefensa
	estado := #defensa! !

!Combatiente methodsFor: 'acciones - efectos' stamp: 'LL 6/11/2025 22:18:53'!
restaurarPuntosDeVida: unaCantidadDePuntosDeVida 
	cantidadDeVida := cantidadDeVida + unaCantidadDePuntosDeVida min: vidaMaxima! !


!Combatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:52:42'!
bendecir

	estado := #bendecido! !


!classDefinition: #Guerrero category: #CombatientesFantasticos2025!
Combatiente subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Guerrero methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Guerrero methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 23:03:23'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño * 0.7! !


!Guerrero methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:44:55'!
initialize
	vidaMaxima := 120.
	super initialize! !


!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:57:25'!
puedeRealizarCuracion

	^false! !

!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:04:53'!
puedeRealizarHechizo

	^false! !


!classDefinition: #Mago category: #CombatientesFantasticos2025!
Combatiente subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Mago methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño * 1.2! !

!Mago methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 23:03:37'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !


!Mago methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:45:04'!
initialize
	vidaMaxima := 80.
	super initialize! !


!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:55:48'!
puedeRealizarAtaqueFisico

	^false! !

!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:09:06'!
puedeRealizarPosturaDeDefensa

	^false! !


!classDefinition: #Paladin category: #CombatientesFantasticos2025!
Combatiente subclass: #Paladin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Paladin methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 22:58:06'!
dañoARecibirPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Paladin methodsFor: 'acciones - recibir daño' stamp: 'LL 6/11/2025 23:03:41'!
dañoARecibirPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !


!Paladin methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:45:09'!
initialize
	vidaMaxima := 100.
	super initialize! !


!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:05:04'!
puedeRealizarHechizo

	^false! !
