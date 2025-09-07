!classDefinition: #TestCombatientesFantasticos category: #CombatientesFantasticos2025!
TestCase subclass: #TestCombatientesFantasticos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:07:35'!
lanzarHechizoConEnvenenamientoDe: combatiente hacia: otroCombatiente

	^ combatiente realizarAccion: (HechizoDeDaño nuevaHacia: otroCombatiente usando: [ 1 ])! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:07:35'!
lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente

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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:48:39'!
test06ElGuerreroNoPuedeLanzarHechizosDeDaño

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente ] 
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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:48:39'!
test08ElMagoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:01:06'!
test11ElMagoPuedeCurarAOtroCombatiente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	combatiente realizarAccion: (Curacion nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 + 20)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:01:06'!
test12NoSePuedeCurarMasQueLaVidaMaxima

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Mago new.
	
	combatiente realizarAccion: (Curacion nuevaHacia: otroCombatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima)
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:01:06'!
test13ElGuerreroNoPuedeCurar

	| combatiente otroCombatiente |
	combatiente := Guerrero new.
	otroCombatiente := Guerrero new.
	
	self should: [ combatiente realizarAccion: (Curacion nuevaHacia: otroCombatiente) ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException | 
			self assert: anException messageText equals: combatiente noPuedeCurarMensajeDeError.
	].
! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:48:39'!
test14ElPaladinNoPuedeLanzarHechizos

	| combatiente otroCombatiente |
	combatiente := Paladin new.
	otroCombatiente := Guerrero new.
	
	self should: [ self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente ]
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

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:48:39'!
test17ElGuerreroEsResistenteAAtaqueMagicoRecibiendo30PorCientoMenosDeDaño

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (30*0.7))
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:57:52'!
test18ElHechizoEnvenenaAlObjetivoSiElNumeroAleatorioEsMayorA07

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoConEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	self assert: (otroCombatiente estaEnvenenado)
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/11/2025 23:57:30'!
test19ElHechizoNoEnvenenaAlObjetivoSiElNumeroAleatorioEsMenorA07

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoSinEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	self deny: (otroCombatiente estaEnvenenado)
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test20ElPaladinEnvenenadoPierde2PuntosDeVidaLuegoDeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoConEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (AtaqueFisico nuevaHacia: combatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 - 2)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:42:01'!
test21ElGuerreroEnvenenadoPierde2PuntosDeVidaLuegoDeAtacarFisicamente

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Guerrero new.
	
	self lanzarHechizoConEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (AtaqueFisico nuevaHacia: combatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - (30*0.7) - 2)
	
	! !

!TestCombatientesFantasticos methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:27:57'!
test22UnCombatienteEnvenenadoPierde2PuntosDeVidaLuegoDeRealizarUnaAccion

	| combatiente otroCombatiente |
	combatiente := Mago new.
	otroCombatiente := Paladin new.
	
	self lanzarHechizoConEnvenenamientoDe: combatiente hacia: otroCombatiente.
	
	otroCombatiente realizarAccion: (Curacion nuevaHacia: combatiente).
	
	self assert: (otroCombatiente tieneVida: otroCombatiente vidaMaxima - 30 - 2)
	
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
	instanceVariableNames: 'objetivo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CombatientesFantasticos2025'!

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:59:25'!
initializeConObjetivo: unCombatienteObjetivo

	objetivo := unCombatienteObjetivo! !

!Curacion methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 01:32:49'!
realizarSiendo: unCombatiente
	unCombatiente puedeRealizarCuracion ifFalse: [ self error: unCombatiente noPuedeCurarMensajeDeError ].
	
	objetivo restaurarPuntosDeVida: 20.
	
	self efectosPostAccionEn: unCombatiente.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Curacion class' category: #CombatientesFantasticos2025!
Curacion class
	instanceVariableNames: ''!

!Curacion class methodsFor: 'as yet unclassified' stamp: 'LL 6/12/2025 00:59:18'!
nuevaHacia: otroCombatiente

	^self new initializeConObjetivo: otroCombatiente! !


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


!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:57:04'!
puedeRealizarAtaqueFisico

	self subclassResponsibility! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:04:35'!
puedeRealizarCuracion

	self subclassResponsibility! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:31:25'!
puedeRealizarHechizo

	self subclassResponsibility! !

!Combatiente methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:31:28'!
puedeRealizarPosturaDeDefensa

	self subclassResponsibility! !


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


!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:55:06'!
puedeRealizarAtaqueFisico

	^true! !

!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:57:25'!
puedeRealizarCuracion

	^false! !

!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:04:53'!
puedeRealizarHechizo

	^false! !

!Guerrero methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:09:09'!
puedeRealizarPosturaDeDefensa

	^true! !


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

!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:57:32'!
puedeRealizarCuracion

	^true! !

!Mago methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:04:59'!
puedeRealizarHechizo

	^true! !

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


!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:55:54'!
puedeRealizarAtaqueFisico

	^true! !

!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 00:57:36'!
puedeRealizarCuracion

	^true! !

!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:05:04'!
puedeRealizarHechizo

	^false! !

!Paladin methodsFor: 'testing - acciones' stamp: 'LL 6/12/2025 01:08:58'!
puedeRealizarPosturaDeDefensa

	^true! !
