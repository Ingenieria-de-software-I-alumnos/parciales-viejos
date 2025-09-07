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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 13:10:14'!
test23UnPaladinBendiceAlCurarSiElNumeroAleatorioEsMenorA04

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self assert: otroCombatiente estaBendecido.

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 13:10:17'!
test24UnPaladinNoBendiceAlCurarSiElNumeroAleatorioEsMayorA04

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente.
	
	self deny: otroCombatiente estaBendecido.

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 13:10:21'!
test25UnCombatienteBendecidoRealizaCuracionesUn50MasEfectivas

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Mago new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente. "otroCombatiente pasa a estar bendecido "
	
	self lanzarHechizoSinEnvenenamientoSiendo: otroCombatiente hacia: combatiente. "daño al combatiente"
	
	self curarSinBendicionSiendo: otroCombatiente hacia: combatiente. "curo al combatiente con el otroCombatiente que esta bendecido"
	
	self assert: (combatiente tieneVida: combatiente vidaMaxima - 30 + (20*1.5)).

	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 13:10:25'!
test26UnCombatienteBendecidoRecibeCuracionesUn50MasEfectivas

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Mago new.
	
	self curarConBendicionSiendo: combatiente hacia: otroCombatiente. "otroCombatiente pasa a estar bendecido "
	
	combatiente realizarAccion: (AtaqueFisico nuevaHacia: otroCombatiente). "daño a otroCombatiente"
	
	self curarSinBendicionSiendo: combatiente hacia: otroCombatiente. "curo a otroCombatiente bendecido"
	
	self assert: (otroCombatiente tieneVida: (otroCombatiente vidaMaxima - 25 + (20*1.5) min: otroCombatiente vidaMaxima)).

	
	! !


!classDefinition: #AccionDeCombatiente category: #CombatientesFantasticos2025!
Object subclass: #AccionDeCombatiente
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!AccionDeCombatiente methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:13:34'!
efectosPostAccionEn: combatienteQueRealizaLaAccion
	combatienteQueRealizaLaAccion efectosPostAccion! !


!classDefinition: #AtaqueFisico category: #CombatientesFantasticos2025!
AccionDeCombatiente subclass: #AtaqueFisico
	instanceVariableNames: 'objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!AtaqueFisico methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:40:03'!
initializeConObjetivo: unCombatienteObjetivo

	objetivo := unCombatienteObjetivo! !

!AtaqueFisico methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:50:27'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarAtaqueFisico ifFalse: [ self error: unCombatiente noPuedeAtacarFisicamenteMensajeDeError ].
	
	objetivo recibirDaño: (objetivo modificadorDeDañoPorAtaqueFisico: 25).
	
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
AccionDeCombatiente subclass: #Curacion
	instanceVariableNames: 'objetivo generadorDeNumerosAleatorios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:50:54'!
initializeConObjetivo: unCombatienteObjetivo conGenerador: unGeneradorDeNumerosAleatorios 

	objetivo := unCombatienteObjetivo.
	generadorDeNumerosAleatorios := unGeneradorDeNumerosAleatorios ! !

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:43:06'!
leTocoBendecirAlObjetivo

	^ generadorDeNumerosAleatorios value > 0.6! !

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:43:06'!
realizarSiendo: unCombatiente
	
	unCombatiente puedeRealizarCuracion ifFalse: [ self error: unCombatiente noPuedeCurarMensajeDeError ].
	
	self leTocoBendecirAlObjetivo ifTrue: [ unCombatiente bendecirSiPuedeA: objetivo ].

	objetivo restaurarPuntosDeVida: 20 siendo: unCombatiente.
	
	self efectosPostAccionEn: unCombatiente.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Curacion class' category: #CombatientesFantasticos2025!
Curacion class
	instanceVariableNames: ''!

!Curacion class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:51:06'!
nuevaHacia: otroCombatiente usando: unGeneradorDeNumerosAleatorios 

	^self new initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios! !


!classDefinition: #HechizoDeDaño category: #CombatientesFantasticos2025!
AccionDeCombatiente subclass: #HechizoDeDaño
	instanceVariableNames: 'objetivo generadorDeNumerosAleatorios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!HechizoDeDaño methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:03:06'!
initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios

	objetivo := otroCombatiente.
	generadorDeNumerosAleatorios := unGeneradorDeNumerosAleatorios! !

!HechizoDeDaño methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:43:30'!
leTocoEnvenenarAlObjetivo

	^ generadorDeNumerosAleatorios value > 0.7! !

!HechizoDeDaño methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:50:41'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarHechizo ifFalse: [ self error: unCombatiente noPuedeLanzarHechizoMensajeDeError ].
	
	self leTocoEnvenenarAlObjetivo ifTrue: [ 		objetivo envenenar 	].
	
	objetivo recibirDaño: (objetivo modificadorDeDañoPorHechizo: 30).
	
	self efectosPostAccionEn: unCombatiente.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HechizoDeDaño class' category: #CombatientesFantasticos2025!
HechizoDeDaño class
	instanceVariableNames: ''!

!HechizoDeDaño class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:02:40'!
nuevaHacia: otroCombatiente usando: unGeneradorDeNumerosAleatorios

	^self new initializeConObjetivo: otroCombatiente conGenerador: unGeneradorDeNumerosAleatorios! !


!classDefinition: #PosturaDeDefensa category: #CombatientesFantasticos2025!
AccionDeCombatiente subclass: #PosturaDeDefensa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!PosturaDeDefensa methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:01:27'!
realizarSiendo: unCombatiente
	unCombatiente puedeDefenderse ifFalse: [ self error: unCombatiente noPuedeDefenderseMensajeDeError ].
	
	unCombatiente defenderse.
	
	self efectosPostAccionEn: unCombatiente.	! !


!classDefinition: #Combatiente category: #CombatientesFantasticos2025!
Object subclass: #Combatiente
	instanceVariableNames: 'cantidadDeVida estado vidaMaxima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Combatiente methodsFor: 'initialization' stamp: 'LL 6/12/2025 11:57:30'!
initialize 
	cantidadDeVida := vidaMaxima.
	self estarNormal! !


!Combatiente methodsFor: 'realizar accion' stamp: 'LL 6/12/2025 01:32:49'!
realizarAccion: unaAccion
	unaAccion realizarSiendo: self.! !


!Combatiente methodsFor: 'testing' stamp: 'LL 6/12/2025 11:53:21'!
estaBendecido
	^estado isKindOf: Bendecido! !

!Combatiente methodsFor: 'testing' stamp: 'LL 6/12/2025 11:53:10'!
estaEnvenenado
	^estado isKindOf: Envenenado! !

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

!Combatiente methodsFor: 'private' stamp: 'LL 6/12/2025 12:38:42'!
puntosACurar: puntosACurarDeBase

	^estado puntosACurar: puntosACurarDeBase.
! !


!Combatiente methodsFor: 'accessing' stamp: 'LL 6/11/2025 22:51:51'!
vidaMaxima
	^vidaMaxima! !


!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 13:05:25'!
puedeDefenderse

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 13:05:33'!
puedeRealizarAtaqueFisico

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 13:05:35'!
puedeRealizarCuracion

	^true! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 13:05:37'!
puedeRealizarHechizo

	^true! !


!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:27'!
modificadorDeDañoPorAtaqueFisico: puntosDeDaño 
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:41'!
modificadorDeDañoPorHechizo: puntosDeDaño 
	
	self subclassResponsibility! !

!Combatiente methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:49:43'!
recibirDaño: puntosDeDaño 
	
	estado recibirDaño: puntosDeDaño.! !


!Combatiente methodsFor: 'acciones - curacion' stamp: 'LL 6/12/2025 12:39:12'!
restaurarPuntosDeVida: unaCantidadDePuntosDeVida siendo: elCombatienteQueCura

	| puntosACurar |
	puntosACurar := elCombatienteQueCura puntosACurar: unaCantidadDePuntosDeVida.
	puntosACurar := self puntosACurar: puntosACurar.

	cantidadDeVida := cantidadDeVida + puntosACurar min: vidaMaxima.! !


!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:13:11'!
bendecir

	estado := Bendecido para: self! !

!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:40:58'!
bendecirSiPuedeA: unCombatiente! !

!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:13:11'!
defenderse
	estado := Defendiendose para: self! !

!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:10:18'!
efectosPostAccion

	estado efectosPostAccion! !

!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:13:11'!
envenenar
	estado := Envenenado para: self! !

!Combatiente methodsFor: 'estados' stamp: 'LL 6/12/2025 12:13:11'!
estarNormal

	estado := Normal para: self! !


!classDefinition: #Guerrero category: #CombatientesFantasticos2025!
Combatiente subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Guerrero methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:27'!
modificadorDeDañoPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Guerrero methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:41'!
modificadorDeDañoPorHechizo: puntosDeDaño 
	
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

!Mago methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:27'!
modificadorDeDañoPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño * 1.2! !

!Mago methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:41'!
modificadorDeDañoPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !


!Mago methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:45:04'!
initialize
	vidaMaxima := 80.
	super initialize! !


!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 12:01:27'!
puedeDefenderse

	^false! !

!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:55:48'!
puedeRealizarAtaqueFisico

	^false! !


!classDefinition: #Paladin category: #CombatientesFantasticos2025!
Combatiente subclass: #Paladin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Paladin methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:27'!
modificadorDeDañoPorAtaqueFisico: puntosDeDaño 
	
	^puntosDeDaño.! !

!Paladin methodsFor: 'acciones - recibir daño' stamp: 'LL 6/12/2025 12:50:41'!
modificadorDeDañoPorHechizo: puntosDeDaño 
	
	^puntosDeDaño! !


!Paladin methodsFor: 'initialization' stamp: 'LL 6/11/2025 22:45:09'!
initialize
	vidaMaxima := 100.
	super initialize! !


!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:05:04'!
puedeRealizarHechizo

	^false! !


!Paladin methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:41:12'!
bendecirSiPuedeA: unCombatiente

	unCombatiente bendecir! !


!classDefinition: #EstadoCombatiente category: #CombatientesFantasticos2025!
Object subclass: #EstadoCombatiente
	instanceVariableNames: 'combatiente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!EstadoCombatiente methodsFor: 'initialization' stamp: 'LL 6/12/2025 12:13:21'!
initializePara: unCombatiente

	combatiente := unCombatiente! !



!EstadoCombatiente methodsFor: 'recibir daño' stamp: 'LL 6/12/2025 12:56:05'!
recibirDaño: puntosDeDaño

	self subclassResponsibility! !


!EstadoCombatiente methodsFor: 'curacion' stamp: 'LL 6/12/2025 12:19:31'!
puntosACurar: puntosDeCuracionBase

	^puntosDeCuracionBase! !


!EstadoCombatiente methodsFor: 'efectos' stamp: 'LL 6/12/2025 12:10:29'!
efectosPostAccion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstadoCombatiente class' category: #CombatientesFantasticos2025!
EstadoCombatiente class
	instanceVariableNames: ''!

!EstadoCombatiente class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:13:21'!
para: unCombatiente

	^self new initializePara: unCombatiente! !


!classDefinition: #Bendecido category: #CombatientesFantasticos2025!
EstadoCombatiente subclass: #Bendecido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!


!Bendecido methodsFor: 'curacion' stamp: 'LL 6/12/2025 12:19:38'!
puntosACurar: puntosDeCuracionBase

	^puntosDeCuracionBase * 1.5! !


!Bendecido methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:56:19'!
recibirDaño: puntosDeDaño 
	
	^combatiente aplicarDaño: puntosDeDaño! !


!classDefinition: #Defendiendose category: #CombatientesFantasticos2025!
EstadoCombatiente subclass: #Defendiendose
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!


!Defendiendose methodsFor: 'recibir daño' stamp: 'LL 6/12/2025 12:49:19'!
recibirDaño: puntosDeDaño 
	
	| dañoARealizar |
	dañoARealizar := puntosDeDaño * 0.5.
	combatiente estarNormal.
	combatiente aplicarDaño: dañoARealizar! !


!classDefinition: #Envenenado category: #CombatientesFantasticos2025!
EstadoCombatiente subclass: #Envenenado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Envenenado methodsFor: 'efectos' stamp: 'LL 6/12/2025 12:11:08'!
efectosPostAccion

	combatiente recibirDaño: 2! !



!Envenenado methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 12:56:16'!
recibirDaño: puntosDeDaño 
	
	^combatiente aplicarDaño: puntosDeDaño! !


!classDefinition: #Normal category: #CombatientesFantasticos2025!
EstadoCombatiente subclass: #Normal
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!


!Normal methodsFor: 'recibir daño' stamp: 'LL 6/12/2025 12:55:45'!
recibirDaño: puntosDeDaño 
	
	^combatiente aplicarDaño: puntosDeDaño! !
