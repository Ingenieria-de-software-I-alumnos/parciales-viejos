!classDefinition: #DialogosConPNJsTest category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
TestCase subclass: #DialogosConPNJsTest
	instanceVariableNames: 'trebor opinionDeRiverwood carolina'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test01CuandoElConversadorInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjHamilton.
! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test02CuandoElConversadorInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	self assertElPNJConversadorTreborResponde: '¿Todo bien?' cuandoInteractua: 2 con: self pjHamilton.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/8/2021 18:48:13'!
test03CuandoElConversadorOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	
	self hacerInteractuar: 1 vecesA: self pnjConversadorTrebor con: self pjHamilton.
	self pnjConversadorTrebor olvidar.
	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjHamilton.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test04CuandoElConversadorInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	self assertElPNJConversadorTreborResponde: '¿Algún problema?' cuandoInteractua: 4 con: self pjHamilton.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test05ElConversadorMantieneInteraccionesEnParaleloConDiferentesPersonajes

	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjHamilton.
	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjTirion.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test06ElConversadorMantieneInteraccionesCompletasEnParaleloConDiferentesPersonajes
	
	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjHamilton.
	
	self assertElPNJConversadorTreborResponde: 'Hola forastero' cuandoInteractua: 1 con: self pjTirion.
	self assertElPNJConversadorTreborResponde: '¿Todo bien?' cuandoInteractua: 1 con: self pjTirion.
	self assertElPNJConversadorTreborResponde: '¿Algún problema?' cuandoInteractua: 1 con: self pjTirion.
	
	self assertElPNJConversadorTreborResponde: '¿Todo bien?' cuandoInteractua: 1 con: self pjHamilton.
	self assertElPNJConversadorTreborResponde: '¿Algún problema?' cuandoInteractua: 1 con: self pjHamilton.
! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test07CuandoElConversadorInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase

	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self assertElPNJConversadorTreborResponde: 'Bienvenido aventurero!!' cuandoInteractua: 1 con: self pjHamilton.
! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/5/2021 20:18:51'!
test08CuandoElConversadorInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self assertElPNJConversadorTreborResponde: 'Espero que tengas una buena estadia en Riverwood' cuandoInteractua: 2 con: self pjHamilton.! !


!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/8/2021 18:56:25'!
test09CuandoUnInfluyenteTerminaSuRepertorioDeFrasesConUnPersonajeNoCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorSiNoLoConocenSuficientesPNJs
	
	self saturarInteracteraccionesDelInfluyenteCon: self pjHamilton.
	self deny: (self esVistoPorElPuebloComoPrometedor: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/8/2021 18:56:04'!
test10CuandoUnInfluyenteTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorSiLoConocenSuficientesPNJs
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self saturarInteracteraccionesDelInfluyenteCon: self pjHamilton.
	self assert: (self esVistoPorElPuebloComoPrometedor: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/8/2021 18:54:57'!
test11CuandoUnInfluyenteCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self saturarInteracteraccionesDelInfluyenteCon: self pjHamilton.
	
	self assertElPNJ: self pnjInfluyenteCarolina responde: 'Salud aventurero!!' cuandoInteractua: 1 con: self pjHamilton.! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/8/2021 18:54:33'!
test12CuandoUnInfluyenteCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaLosHilosDeDialogosDelRestoDeLosPNJs
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self saturarInteracteraccionesDelInfluyenteCon: self pjHamilton.
	
	self assertElPNJ: self pnjConversadorTrebor responde: 'Bienvenido aventurero!!' cuandoInteractua: 1 con: self pjHamilton.! !


!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:27:53'!
test13SiNoHuboInteraccionesLaOpinionDeUnPuebloDiceQueQueNadieConoceANingunPJ
	
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjTirion).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:52:09'!
test14CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoLaOpinionDelPuebloDiceQueEsConocidoPorUno
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self assert: 1 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:48:13'!
test15CuandoUnPNJNoTerminaSuRepertorioConUnPJDesconocidoLaOpinionDelPuebloDiceQueEsConocidoPor0

	self hacerInteractuar: 2 vecesA: self pnjConversadorTrebor con: self pjHamilton.
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:52:25'!
test16CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoNoAfectaLaCantidadDePNJsQueConocenAUnNuevoPJ
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjTirion).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:48:13'!
test17CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoSiSigueInteractuandoNoSubeLaCantidadDePNJsQueLoConocen
	
	self hacerInteractuar: 5 vecesA: self pnjConversadorTrebor con: self pjHamilton.	
	self assert: 1 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:52:43'!
test18UnConversadorTieneCeroEgoCuandoNoInteractuóConNingunPrometedor
	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self saturarInteracteraccionesDelConversadorCon: self pjTirion.
	self assert: 0 equals: self pnjConversadorTrebor cantidadDeEgo.
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:53:05'!
test19UnConversadorTieneUnoDeEgoCuandoInteractuóConUnPrometedor

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	self saturarInteracteraccionesDelConversadorCon: self pjHamilton.
	self saturarInteracteraccionesDelConversadorCon: self pjTirion.
	self assert: 1 equals: self pnjConversadorTrebor cantidadDeEgo.
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:48:13'!
test20LaOpinionDeUnPuebloTieneCeroConfianzaConAlguienPrometedorSiNoInteractuoLoSuficienteConSusInfluyentes

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	self hacerInteractuar: 1 vecesA: self pnjInfluyenteCarolina con: self pjHamilton.
	self assert: 0 equals: (opinionDeRiverwood cantidadDeConfianzaHacia: self pjHamilton).
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/8/2021 18:55:25'!
test21UnInfluyenteAumentaLaConfianzaSobreUnPJCuandoHablaConEl

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	self saturarInteracteraccionesDelInfluyenteCon: self pjHamilton.
	self assert: 1 equals: (opinionDeRiverwood cantidadDeConfianzaHacia: self pjHamilton).
! !


!DialogosConPNJsTest methodsFor: 'personajes' stamp: 'SF 11/4/2021 15:50:15'!
pjHamilton
	^#Hamilton.! !

!DialogosConPNJsTest methodsFor: 'personajes' stamp: 'SF 11/4/2021 15:50:05'!
pjTirion
	^#Tirion.! !

!DialogosConPNJsTest methodsFor: 'personajes' stamp: 'SF 11/4/2021 15:51:07'!
pnjConversadorTrebor
	^trebor.! !

!DialogosConPNJsTest methodsFor: 'personajes' stamp: 'SF 11/4/2021 15:51:20'!
pnjInfluyenteCarolina
	^carolina.! !


!DialogosConPNJsTest methodsFor: 'soporte' stamp: 'SF 10/7/2021 21:14:38'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	^opinionDeRiverwood esVistoComoPrometedor: unPersonaje! !

!DialogosConPNJsTest methodsFor: 'soporte' stamp: 'SF 11/4/2021 15:50:16'!
hacerQueRiverwoodVeaPrometedorAHamilton
	opinionDeRiverwood verComoPrometedorA: self pjHamilton.! !

!DialogosConPNJsTest methodsFor: 'soporte' stamp: 'JMB 11/6/2021 10:04:45'!
setUp
	opinionDeRiverwood := OpinionDeUnPueblo new.
	
	trebor := PersonajeNoJugador
		queSigue: opinionDeRiverwood
		frasesParaPersonajesDesconocidos: #('Hola forastero' '¿Todo bien?' '¿Algún problema?' )
		frasesParaPersonajesPrometedores: #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ) 
		siendo: Conversador new.
	
	carolina := PersonajeNoJugador
		queSigue: opinionDeRiverwood
		frasesParaPersonajesDesconocidos: #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )
		frasesParaPersonajesPrometedores: #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme') 
		siendo: (Influyente queRequireSerConocidoPor: 2).! !


!DialogosConPNJsTest methodsFor: 'interacciones' stamp: 'JMB 11/8/2021 18:48:13'!
assertElPNJ: unPersonajeNoJugador responde: unMensajeEsperado cuandoInteractua: unaCantidadDeVeces con: unPersonajeJugador 
	| mensaje |
	mensaje := self hacerInteractuar: unaCantidadDeVeces vecesA: unPersonajeNoJugador con: unPersonajeJugador.
	self assert: unMensajeEsperado equals: mensaje.
! !

!DialogosConPNJsTest methodsFor: 'interacciones' stamp: 'JMB 11/5/2021 20:34:33'!
assertElPNJConversadorTreborResponde: unMensajeEsperado cuandoInteractua: unaCantidadDeVeces con: unPersonajeJugador 
	self 
		assertElPNJ: self pnjConversadorTrebor 
		responde: unMensajeEsperado 
		cuandoInteractua: unaCantidadDeVeces 
		con: unPersonajeJugador 
! !

!DialogosConPNJsTest methodsFor: 'interacciones' stamp: 'JMB 11/8/2021 18:48:13'!
hacerInteractuar: unaCantidadDeVeces vecesA: unPersonajeNoJugador con: unPersonajeJugador 
	| mensaje |
	unaCantidadDeVeces timesRepeat: [
		mensaje := unPersonajeNoJugador interactuarCon: unPersonajeJugador.
	].
	^ mensaje! !

!DialogosConPNJsTest methodsFor: 'interacciones' stamp: 'JMB 11/8/2021 18:51:52'!
saturarInteracteraccionesDelConversadorCon: unPersonajeJugador 
	^ self hacerInteractuar: 3 vecesA: self pnjConversadorTrebor con: unPersonajeJugador  ! !

!DialogosConPNJsTest methodsFor: 'interacciones' stamp: 'JMB 11/8/2021 18:53:38'!
saturarInteracteraccionesDelInfluyenteCon: unPersonajeJugador 
	^ self hacerInteractuar: 3 vecesA: self pnjInfluyenteCarolina con: unPersonajeJugador  ! !


!classDefinition: #HazteLaFamaTest category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
TestCase subclass: #HazteLaFamaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!HazteLaFamaTest methodsFor: 'tests - propagacion por mayoria' stamp: 'JMB 12/12/2021 15:52:39'!
test01UnaOpinionDeUnaRegionConPropagacionPorMayoriaConUnUnicoSeguidorNoCalificaComoPrometedorSiSuSeguidorNoLoHace

	| opinionDeLaRegionCentral | 
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoDesconocido.
	
	self deny: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - propagacion por mayoria' stamp: 'JMB 12/12/2021 15:47:24'!
test02UnaOpinionDeUnaRegionConPropagacionPorMayoriaConUnUnicoSeguidorCalificaComoPrometedorSiSuSeguidorLoHace

	| opinionDeLaRegionCentral |
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoPrometedor.
		
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - propagacion por mayoria' stamp: 'JMB 12/12/2021 16:29:50'!
test03UnaOpinionDeUnaRegionConPropagacionPorMayoriaConVariosSeguidoresNoCalificaComoPrometedorSiNoLoHacenMasDeLaMitadDeSusSeguidores

	| opinionDeLaRegionCentral |
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {OpinionDeUnPueblo new}  yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new}.
	
	self deny: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - propagacion por mayoria' stamp: 'JMB 12/12/2021 16:29:50'!
test04UnaOpinionDeUnaRegionConPropagacionPorMayoriaConVariosSeguidoresCalificaComoPrometedorSiMasDeLaMitadDeSusSeguidoresLoHacen

	| opinionDeLaRegionCentral |	
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {OpinionDeUnPueblo new} yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new. OpinionDeUnPueblo new}.
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - propagacion por mayoria' stamp: 'JMB 12/12/2021 16:29:50'!
test07UnaOpinionDeUnaRegionConOtrasOpinionesDeRegionesComoSeguidorasEsInfluenciadaPorEstas

	| opinionDeLaRegionCentral opinionDeLaRegionDelBajo |
	opinionDeLaRegionDelBajo := self opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoPrometedor.
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {opinionDeLaRegionDelBajo } yPorLosQueVenAHamiltonComoPrometedor: #().
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !


!HazteLaFamaTest methodsFor: 'tests - referentes' stamp: 'JMB 12/12/2021 16:29:50'!
test05UnaOpinionDePuebloCalificaComoPrometedorSiSuRegionReferenteLoHace

	| opinionDeLaRegionCentral opinionDelValleRojo |
	opinionDelValleRojo _ OpinionDeUnPueblo new.
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {opinionDelValleRojo } yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new. OpinionDeUnPueblo new}.
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).
	self assert: (opinionDelValleRojo esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - referentes' stamp: 'JMB 12/12/2021 16:29:50'!
test06UnaOpinionesDePuebloNoCalificaComoPrometedorSiSuRegionReferenteNoLoHace

	| opinionDeLaRegionCentral opinionDelValleRojo |
	opinionDelValleRojo _ OpinionDeUnPueblo new.
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor:  {opinionDelValleRojo. OpinionDeUnPueblo new } yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new.}.
	
	self deny: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).
	self deny: (opinionDelValleRojo esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - referentes' stamp: 'JMB 12/12/2021 16:29:50'!
test08UnaOpinionDeUnaRegionCalificaComoPrometedorSiSuRegionReferenteLoHace

	| opinionDeLaRegionCentral opinionDeLaRegionDelBajo |
	opinionDeLaRegionDelBajo := self opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoDesconocido.
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {opinionDeLaRegionDelBajo } yPorLosQueVenAHamiltonComoPrometedor: 
	{OpinionDeUnPueblo new. OpinionDeUnPueblo new}.
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).
	self assert: (opinionDeLaRegionDelBajo esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests - referentes' stamp: 'JMB 12/12/2021 16:29:50'!
test09UnaOpinionDeUnaRegionNoCalificaComoPrometedorSiSuRegionReferenteNoLoHace

	| opinionDeLaRegionCentral opinionDeLaRegionDelBajo |
	opinionDeLaRegionDelBajo :=  self opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoDesconocido. 
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {opinionDeLaRegionDelBajo. OpinionDeUnPueblo new} yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new. }.
	
	self deny: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).
	self deny: (opinionDeLaRegionDelBajo esVistoComoPrometedor: self pjHamilton).! !


!HazteLaFamaTest methodsFor: 'tests - restricciones' stamp: 'JMB 12/7/2021 18:04:24'!
test10UnaOpinionDeUnaRegionDebeTenerSeguidores

	self 
		should: [ OpinionDeUnaRegion conPropagacionPorMayoriaSeguidaPor: 	{} ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: OpinionDeUnaRegion mensajeDeErrorDebeTenerSeguidores! !

!HazteLaFamaTest methodsFor: 'tests - restricciones' stamp: 'JMB 12/7/2021 18:04:24'!
test11UnaOpinionPublicaSoloTieneUnReferente
	| opinionDeRiverwood |
	opinionDeRiverwood := OpinionDeUnPueblo new. 
	OpinionDeUnaRegion conPropagacionPorMayoriaSeguidaPor: 	{opinionDeRiverwood}.
	
	self 
		should: [ OpinionDeUnaRegion conPropagacionPorMayoriaSeguidaPor: 	{opinionDeRiverwood} ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: OpinionDeUnaRegion mensajeDeErrorLaOpinionPublicaYaTieneReferente! !


!HazteLaFamaTest methodsFor: 'tests propagacion centralizada' stamp: 'JMB 12/7/2021 19:02:59'!
test12UnaOpinionDeUnaRegionConPropagacionPorOpinionDominanteComoSuUnicoSeguidorNoCalificaComoPrometedorSiSuSeguidorNoLoHace

	| opinionDeLaRegionCentral opinionDeRiverwood |
	opinionDeRiverwood := OpinionDeUnPueblo new. 
	opinionDeLaRegionCentral := OpinionDeUnaRegion conPropagacionConOpinionDominante: opinionDeRiverwood seguidaPor: #().
	
	
	self deny: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests propagacion centralizada' stamp: 'JMB 12/12/2021 16:24:35'!
test13UnaOpinionDeUnaRegionConPropagacionPorOpinionDominanteComoSuUnicoSeguidorCalificaComoPrometedorSiSuSeguidorLoHace

	| opinionDeLaRegionCentral |
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionConPropagacionConOpinionDominanteQueVeAHamiltonComoPrometedorSeguidaPor: #().
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests propagacion centralizada' stamp: 'JMB 12/12/2021 16:25:13'!
test14UnaOpinionDeUnaRegionConPropagacionPorOpinionDominanteSigueSuOpinionAPesarDeLasOpinionesDeLaMayoriaDeSusSeguidores

	| opinionDeLaRegionCentral |
	opinionDeLaRegionCentral := self opinionDeUnaRegionConPropagacionConPropagacionConOpinionDominanteQueVeAHamiltonComoPrometedorSeguidaPor: {OpinionDeUnPueblo new. OpinionDeUnPueblo new}.
	
	self assert: (opinionDeLaRegionCentral esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests propagacion centralizada' stamp: 'JMB 12/12/2021 16:26:14'!
test15UnaOpinionDeUnaRegionConPropagacionPorOpinionDominanteInfluyeASusSeguidores

	| opinionDelValleRojo |
	opinionDelValleRojo := OpinionDeUnPueblo new.
	self opinionDeUnaRegionConPropagacionConPropagacionConOpinionDominanteQueVeAHamiltonComoPrometedorSeguidaPor: {OpinionDeUnPueblo new. opinionDelValleRojo}.
	
	self assert: (opinionDelValleRojo esVistoComoPrometedor: self pjHamilton).! !

!HazteLaFamaTest methodsFor: 'tests propagacion centralizada' stamp: 'JMB 12/7/2021 19:10:48'!
test16UnaOpinionDeUnaRegionNoPuedeTenerUnaOpinionDominanteQueTengaOtroReferente

	| opinionDeRiverwood |
	opinionDeRiverwood := OpinionDeUnPueblo new. 
	OpinionDeUnaRegion conPropagacionPorMayoriaSeguidaPor: {opinionDeRiverwood }.
	
	self 
		should: [ OpinionDeUnaRegion conPropagacionConOpinionDominante: opinionDeRiverwood seguidaPor: #() ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: OpinionDeUnaRegion mensajeDeErrorLaOpinionPublicaYaTieneReferente! !


!HazteLaFamaTest methodsFor: 'personajes' stamp: 'JMB 11/26/2021 21:24:02'!
pjHamilton
	^ #Hamilton! !


!HazteLaFamaTest methodsFor: 'opiniones' stamp: 'JMB 12/12/2021 16:24:07'!
opinionDeUnaRegionConPropagacionConPropagacionConOpinionDominanteQueVeAHamiltonComoPrometedorSeguidaPor: unosSeguidores
	
	| opinionDeLaRegion opinionDominante |
	opinionDominante := OpinionDeUnPueblo new.
	opinionDeLaRegion := OpinionDeUnaRegion conPropagacionConOpinionDominante: opinionDominante seguidaPor: unosSeguidores.
	opinionDominante verComoPrometedorA: self pjHamilton. 
	^ opinionDeLaRegion
	! !

!HazteLaFamaTest methodsFor: 'opiniones' stamp: 'JMB 12/12/2021 16:29:50'!
opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoDesconocido
	^ self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: {OpinionDeUnPueblo new} yPorLosQueVenAHamiltonComoPrometedor: #()! !

!HazteLaFamaTest methodsFor: 'opiniones' stamp: 'JMB 12/12/2021 16:29:50'!
opinionDeUnaRegionConPropagacionPorMayoriaConUnSeguidorQueLoVeAHamiltonComoPrometedor
	^ self opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor:  #() yPorLosQueVenAHamiltonComoPrometedor: {OpinionDeUnPueblo new}.! !

!HazteLaFamaTest methodsFor: 'opiniones' stamp: 'JMB 12/12/2021 16:29:50'!
opinionDeUnaRegionConPropagacionPorMayoriaSeguidaPor: unosSeguidores yPorLosQueVenAHamiltonComoPrometedor: unosSeguidoresQueLoVenComoPrometedor
	
	| opinionDeLaRegion seguidores |
	seguidores := unosSeguidoresQueLoVenComoPrometedor union: unosSeguidores.
	opinionDeLaRegion := OpinionDeUnaRegion conPropagacionPorMayoriaSeguidaPor: seguidores.
	
	unosSeguidoresQueLoVenComoPrometedor do: [ : cadaSeguidor | cadaSeguidor verComoPrometedorA: self pjHamilton ].
	^ opinionDeLaRegion
	! !


!classDefinition: #Opinion category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Object subclass: #Opinion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!Opinion methodsFor: 'testing' stamp: 'JMB 11/6/2021 10:42:42'!
esPrometedor
	^ false! !


!Opinion methodsFor: 'public' stamp: 'JMB 11/5/2021 22:12:18'!
actuaSiendoConversador: unPersonajeNoJugador con: unPersonajeJugador
	self subclassResponsibility ! !

!Opinion methodsFor: 'public' stamp: 'JMB 11/5/2021 22:35:53'!
actuaSiendoInfluyente: unPersonajeNoJugador con: unPersonajeJugador
	self subclassResponsibility ! !

!Opinion methodsFor: 'public' stamp: 'JMB 11/6/2021 10:37:36'!
frasesParaResponderDe: unPersonajeNoJugador
	self subclassResponsibility ! !


!classDefinition: #Desconocido category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Opinion subclass: #Desconocido
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!Desconocido methodsFor: 'public' stamp: 'JMB 11/5/2021 22:12:18'!
actuaSiendoConversador: unPersonajeNoJugador con: unPersonajeJugador
	unPersonajeNoJugador actuarSiendoConversadorConUnDesconocido: unPersonajeJugador! !

!Desconocido methodsFor: 'public' stamp: 'JMB 11/5/2021 22:36:21'!
actuaSiendoInfluyente: unPersonajeNoJugador con: unPersonajeJugador
	unPersonajeNoJugador actuarSiendoInfluyenteConUnDesconocido: unPersonajeJugador! !

!Desconocido methodsFor: 'public' stamp: 'JMB 11/6/2021 10:37:36'!
frasesParaResponderDe: unPersonajeNoJugador
	^ unPersonajeNoJugador frasesParaPersonajesDesconocidos! !


!classDefinition: #Prometedor category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Opinion subclass: #Prometedor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!Prometedor methodsFor: 'public' stamp: 'JMB 11/5/2021 22:12:18'!
actuaSiendoConversador: unPersonajeNoJugador con: unPersonajeJugador
	unPersonajeNoJugador actuarSiendoConversadorConUnPrometedor: unPersonajeJugador! !

!Prometedor methodsFor: 'public' stamp: 'JMB 11/6/2021 10:03:59'!
actuaSiendoInfluyente: unPersonajeNoJugador con: unPersonajeJugador
	unPersonajeNoJugador actuarSiendoInfluyenteConUnPrometedor: unPersonajeJugador! !

!Prometedor methodsFor: 'public' stamp: 'JMB 11/6/2021 10:37:36'!
frasesParaResponderDe: unPersonajeNoJugador
	^ unPersonajeNoJugador frasesParaPersonajesPrometedores! !


!Prometedor methodsFor: 'testing' stamp: 'JMB 11/6/2021 10:43:47'!
esPrometedor
	^ true! !


!classDefinition: #OpinionPublica category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Object subclass: #OpinionPublica
	instanceVariableNames: 'seguidores referente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!OpinionPublica methodsFor: 'testing' stamp: 'JMB 12/12/2021 16:36:42'!
esVistoComoPrometedor: unPotencialPersonajeJugadorPrometedor 
	^ (self esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPotencialPersonajeJugadorPrometedor) or: [ 
		self esVistoPorElReferenteComoPrometedor: unPotencialPersonajeJugadorPrometedor ]! !

!OpinionPublica methodsFor: 'testing' stamp: 'JMB 12/7/2021 20:02:43'!
tieneReferente
	^ self siTieneReferenteHace: [ true ] sino: [ false ] ! !


!OpinionPublica methodsFor: 'private' stamp: 'JMB 12/7/2021 20:02:09'!
esVistoPorElReferenteComoPrometedor: unPotencialPersonajeJugadorPrometedor

	^ self siTieneReferenteHace: [referente esVistoComoPrometedor: unPotencialPersonajeJugadorPrometedor ] sino: [ false ]! !

!OpinionPublica methodsFor: 'private' stamp: 'JMB 12/12/2021 16:36:42'!
esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPotencialPersonajeJugadorPrometedor

	self subclassResponsibility ! !

!OpinionPublica methodsFor: 'private' stamp: 'JMB 12/7/2021 20:03:58'!
siTieneReferenteHace: bloqueAEvaluarCuandoTieneReferente 
	^ self siTieneReferenteHace: bloqueAEvaluarCuandoTieneReferente sino: [ nil ] ! !

!OpinionPublica methodsFor: 'private' stamp: 'JMB 12/7/2021 20:01:03'!
siTieneReferenteHace: bloqueAEvaluarCuandoTieneReferente sino: bloqueAEvaluarCuandoNoTieneReferente 
	^ referente isNil ifTrue: bloqueAEvaluarCuandoNoTieneReferente ifFalse: bloqueAEvaluarCuandoTieneReferente! !

!OpinionPublica methodsFor: 'private' stamp: 'JMB 12/7/2021 20:03:29'!
tenerDeReferenteA: anOpinionDeUnaRegion 	
	self siTieneReferenteHace:  [ self error: self class mensajeDeErrorLaOpinionPublicaYaTieneReferente ]. 
	referente := anOpinionDeUnaRegion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OpinionPublica class' category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
OpinionPublica class
	instanceVariableNames: ''!

!OpinionPublica class methodsFor: 'as yet unclassified' stamp: 'JMB 11/28/2021 21:15:57'!
mensajeDeErrorLaOpinionPublicaYaTieneReferente
	^ 'La opinion publica ya tiene referente'! !


!classDefinition: #OpinionDeUnPueblo category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
OpinionPublica subclass: #OpinionDeUnPueblo
	instanceVariableNames: 'opiniones pjsDesconocidosConocidosPorPNJs prometedoresConocidosPorPNJsInfluyentes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'JMB 12/12/2021 16:36:42'!
esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPotencialPersonajeJugadorPrometedor

	^ (self opinionDe: unPotencialPersonajeJugadorPrometedor) esPrometedor! !

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'SF 10/7/2021 20:11:50'!
notificarCambioDeOpinionSobre: unPersonajeJugadorACalificar
	seguidores do: [:unSeguidor |
		unSeguidor elPuebloHaCambiadoSuOpinionDe: unPersonajeJugadorACalificar.
	]. ! !

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'JMB 11/5/2021 22:14:21'!
opinionDesconocido
	^Desconocido new! !

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'JMB 11/5/2021 22:14:39'!
opinionPrometedor
	^Prometedor new! !


!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:45:31'!
agregarSeguidor: unPersonajeNoJugador 
	seguidores add: unPersonajeNoJugador.! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:45:58'!
aumentarConfianzaCon: unPersonajeJugador porHablarCon: unPersonajeNoJugador 
	| pnjsQueInteractuaron |
	pnjsQueInteractuaron := prometedoresConocidosPorPNJsInfluyentes at: unPersonajeJugador ifAbsentPut: [Set new].
	pnjsQueInteractuaron add: unPersonajeNoJugador.! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/5/2021 20:58:13'!
cantidadDeConfianzaHacia: unPersonajeJugador
	| pnjsQueInteractuaron |
	pnjsQueInteractuaron _ prometedoresConocidosPorPNJsInfluyentes at: unPersonajeJugador ifAbsentPut: [Set new].
	^ pnjsQueInteractuaron size! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/5/2021 20:58:37'!
cantidadDePNJsQueConocenA: unPersonajeJugador
	| pnjsQueConocenAlPJ |
	pnjsQueConocenAlPJ := pjsDesconocidosConocidosPorPNJs at: unPersonajeJugador ifAbsent: [Set new].
	^ pnjsQueConocenAlPJ size! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:48:02'!
opinionDe: unPersonajeJugador
	^opiniones at: unPersonajeJugador ifAbsent: [self opinionDesconocido]
! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:50:12'!
pnj: unPersonajeNoJugador conocioA: unPersonajeJugador
	| pnjsQueConocenAlPJ |
	pnjsQueConocenAlPJ := pjsDesconocidosConocidosPorPNJs at: unPersonajeJugador ifAbsentPut: [Set new].
	pnjsQueConocenAlPJ add: unPersonajeNoJugador.! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:48:16'!
verComoPrometedorA: unPersonajeJugadorACalificar 
	opiniones at: unPersonajeJugadorACalificar put: self opinionPrometedor.
	self notificarCambioDeOpinionSobre: unPersonajeJugadorACalificar.! !


!OpinionDeUnPueblo methodsFor: 'initialization' stamp: 'JMB 11/4/2021 23:35:18'!
initialize
	opiniones := Dictionary new.
	seguidores := OrderedCollection new.
	pjsDesconocidosConocidosPorPNJs := Dictionary new.
	prometedoresConocidosPorPNJsInfluyentes := Dictionary new.! !


!classDefinition: #OpinionDeUnaRegion category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
OpinionPublica subclass: #OpinionDeUnaRegion
	instanceVariableNames: 'formaDePropagacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!OpinionDeUnaRegion methodsFor: 'initialization' stamp: 'JMB 12/7/2021 19:49:28'!
initializeConUnaFormaDePropagacion: unaFormaDePropagacion seguidaPor: unosSeguidores  
	seguidores := unosSeguidores.
	formaDePropagacion := unaFormaDePropagacion.! !


!OpinionDeUnaRegion methodsFor: 'private - propagacion' stamp: 'JMB 12/7/2021 19:31:53'!
cantidadDeSeguidoresQueCumplen: unaCondicion
	^ seguidores count: unaCondicion! !

!OpinionDeUnaRegion methodsFor: 'private - propagacion' stamp: 'JMB 12/12/2021 16:36:42'!
esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPersonajeJugador 
	^ formaDePropagacion opinionDe: self sobre: unPersonajeJugador! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OpinionDeUnaRegion class' category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
OpinionDeUnaRegion class
	instanceVariableNames: ''!

!OpinionDeUnaRegion class methodsFor: 'instance creation' stamp: 'JMB 12/7/2021 19:54:53'!
conPropagacionConOpinionDominante: unaOpinionDominante seguidaPor: unosSeguidores
	| seguidoresConElDominante |
	seguidoresConElDominante := unosSeguidores asOrderedCollection.
	seguidoresConElDominante add: unaOpinionDominante.
	^ self conUnaFormaDePropagacion: (PropagacionCentralizada sigueA: unaOpinionDominante)seguidaPor: seguidoresConElDominante ! !

!OpinionDeUnaRegion class methodsFor: 'instance creation' stamp: 'JMB 12/7/2021 19:51:24'!
conPropagacionPorMayoriaSeguidaPor: unosSeguidores
	
	self assertTieneSeguidores: unosSeguidores.
	^ self conUnaFormaDePropagacion: PropagacionPorMayoria new seguidaPor: unosSeguidores. ! !

!OpinionDeUnaRegion class methodsFor: 'instance creation' stamp: 'JMB 12/7/2021 19:50:45'!
conUnaFormaDePropagacion: unaFormaDePropagacion seguidaPor: unosSeguidores  
	| opinion |
	opinion := self new.
	unosSeguidores do: [: cadaSeguidor | cadaSeguidor tenerDeReferenteA: opinion ].
	^opinion initializeConUnaFormaDePropagacion: unaFormaDePropagacion seguidaPor: unosSeguidores  ! !


!OpinionDeUnaRegion class methodsFor: 'as yet unclassified' stamp: 'JMB 11/28/2021 20:46:22'!
assertTieneSeguidores: unosSeguidores

	^ unosSeguidores isEmpty ifTrue: [ self error: self mensajeDeErrorDebeTenerSeguidores ]! !

!OpinionDeUnaRegion class methodsFor: 'as yet unclassified' stamp: 'JMB 11/28/2021 20:44:59'!
mensajeDeErrorDebeTenerSeguidores
	^ 'Las opiniones regionales deben tener al menos un seguidor'! !


!classDefinition: #PersonajeNoJugador category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Object subclass: #PersonajeNoJugador
	instanceVariableNames: 'cantidadDeInteraccionesPorPersonaje frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos opinionDeMiPueblo rol prometedoresConocidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 11/3/2021 11:36:35'!
cantidadDeEgo
	^prometedoresConocidos size.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 10/7/2021 20:37:22'!
elPuebloHaCambiadoSuOpinionDe: unPersonajeJugador 
	self olvidarInteraccionesCon: unPersonajeJugador.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'JMB 11/6/2021 10:24:49'!
interactuarCon: unPersonajeJugador 
	| frase opinion |
	self recordarInteraccionCon: unPersonajeJugador.
	frase := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
	opinion := opinionDeMiPueblo opinionDe: unPersonajeJugador.
	(self haFinalizadoElHiloDeConversacionCon: unPersonajeJugador) 
		ifTrue: [ rol actuarLuegoDeInteraccionDe: self con: unPersonajeJugador siguiendo: opinion ].
	^ frase.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 10/7/2021 19:54:10'!
olvidar
	cantidadDeInteraccionesPorPersonaje := Dictionary new.
	! !


!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/5/2021 22:12:18'!
actuarSiendoConversadorCon: unPersonajeJugador siguiendo: unaOpinion 
	unaOpinion actuaSiendoConversador: self con: unPersonajeJugador! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:25:02'!
actuarSiendoConversadorConUnDesconocido: unPersonajeJugador  
	opinionDeMiPueblo pnj: self conocioA: unPersonajeJugador! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:30:15'!
actuarSiendoConversadorConUnPrometedor: unPersonajeJugador  
	self aumentarEgoPorInteractuarConPrometedor: unPersonajeJugador! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:02:32'!
actuarSiendoInfluyenteCon: unPersonajeJugador siguiendo: unaOpinion 
	unaOpinion actuaSiendoInfluyente: self con: unPersonajeJugador! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:30:31'!
actuarSiendoInfluyenteConUnDesconocido: unPersonajeJugador
	opinionDeMiPueblo pnj: self conocioA: unPersonajeJugador.
	self siCumpleLosRequisitosHacerPrometedorA: unPersonajeJugador.! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:25:36'!
actuarSiendoInfluyenteConUnPrometedor: unPersonajeJugador
	opinionDeMiPueblo aumentarConfianzaCon: unPersonajeJugador porHablarCon: self! !

!PersonajeNoJugador methodsFor: 'private - actuar' stamp: 'JMB 11/6/2021 10:29:49'!
haFinalizadoElHiloDeConversacionCon: unPersonajeJugador
	^ (self cantidadDeInteraccionesCon: unPersonajeJugador) >= (self frasesPara: unPersonajeJugador) size! !


!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 11/3/2021 11:35:23'!
aumentarEgoPorInteractuarConPrometedor: unPJPrometedor
	prometedoresConocidos add: unPJPrometedor.! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 19:58:11'!
cantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	^ cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar ifAbsent: [ 0 ]! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'JMB 11/6/2021 10:37:36'!
frasesPara: unPersonajeJugadorAInteractuar
	| opinion |
	opinion := opinionDeMiPueblo opinionDe: unPersonajeJugadorAInteractuar.
	^ opinion frasesParaResponderDe: self! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'JMB 11/6/2021 10:14:34'!
frasesParaPersonajesDesconocidos
	^ frasesParaPersonajesDesconocidos! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'JMB 11/6/2021 10:14:23'!
frasesParaPersonajesPrometedores
	^ frasesParaPersonajesPrometedores! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 20:27:29'!
indiceDeLaSiguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesAResponder
	| cantidadDeInteracciones |
	cantidadDeInteracciones := self cantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar.
	^ cantidadDeInteracciones min: frasesAResponder size ! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 20:37:54'!
olvidarInteraccionesCon: unPersonajeJugador 
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: 0.! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 19:57:44'!
recordarInteraccionCon: unPersonajeJugadorAInteractuar
	| cantidadDeInteracciones |
	cantidadDeInteracciones := self cantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar. 
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar put: cantidadDeInteracciones + 1
! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 20:15:03'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	| frasesParaElPersonaje |
	frasesParaElPersonaje := self frasesPara: unPersonajeJugadorAInteractuar. 
	^ self siguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesParaElPersonaje.! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'JMB 11/5/2021 21:48:46'!
siCumpleLosRequisitosHacerPrometedorA: unPersonajeJugador
	rol siAlcanzanParaInfluenciarLasInteracciones: (opinionDeMiPueblo cantidadDePNJsQueConocenA: unPersonajeJugador) hacer: [
		opinionDeMiPueblo verComoPrometedorA: unPersonajeJugador.		
	].! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 20:27:10'!
siguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesAResponder
	| indice |
	indice := self indiceDeLaSiguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesAResponder.
	^ frasesAResponder at: indice.! !


!PersonajeNoJugador methodsFor: 'initialization' stamp: 'JMB 11/5/2021 21:29:54'!
initializeWithOpinion: anOpinionDeUnPueblo frasesParaPersonajesDesconocidos: unasFrasesParaPersonajesDesconocidos frasesParaPersonajesPrometedores: unasFrasesParaPersonajesPrometedores siendo: unRol 
	self olvidar.
	prometedoresConocidos := Set new.
	opinionDeMiPueblo := anOpinionDeUnPueblo.
	frasesParaPersonajesDesconocidos := unasFrasesParaPersonajesDesconocidos.
	frasesParaPersonajesPrometedores := unasFrasesParaPersonajesPrometedores.
	rol := unRol
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PersonajeNoJugador class' category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
PersonajeNoJugador class
	instanceVariableNames: ''!

!PersonajeNoJugador class methodsFor: 'instance creation' stamp: 'JMB 11/6/2021 10:06:06'!
queSigue: unaOpinionDeUnPueblo frasesParaPersonajesDesconocidos: unasFrasesParaPJDesconocidos frasesParaPersonajesPrometedores: unasFrasesParaPJPrometedores siendo: unRol 
	| personajeNoJugador |
	personajeNoJugador := self new
		initializeWithOpinion: unaOpinionDeUnPueblo
		frasesParaPersonajesDesconocidos: unasFrasesParaPJDesconocidos
		frasesParaPersonajesPrometedores: unasFrasesParaPJPrometedores siendo: unRol	.
	unaOpinionDeUnPueblo agregarSeguidor: personajeNoJugador.
	^ personajeNoJugador
! !


!classDefinition: #PropagacionDeOpiniones category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Object subclass: #PropagacionDeOpiniones
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!PropagacionDeOpiniones methodsFor: 'opinion' stamp: 'JMB 12/7/2021 19:40:15'!
opinionDe: unaOpinionDeUnaRegion sobre: unPersonajeJugador 
	self subclassResponsibility ! !


!classDefinition: #PropagacionCentralizada category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
PropagacionDeOpiniones subclass: #PropagacionCentralizada
	instanceVariableNames: 'opinionDominante'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!PropagacionCentralizada methodsFor: 'initialization' stamp: 'JMB 12/7/2021 19:47:53'!
initializeSigueA: anOpinionDeUnPueblo 
	opinionDominante := anOpinionDeUnPueblo.! !


!PropagacionCentralizada methodsFor: 'opinion' stamp: 'JMB 12/12/2021 16:36:42'!
opinionDe: unaOpinionDeUnaRegion sobre: unPersonajeJugador
	 ^ opinionDominante esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPersonajeJugador! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PropagacionCentralizada class' category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
PropagacionCentralizada class
	instanceVariableNames: ''!

!PropagacionCentralizada class methodsFor: 'instance creation' stamp: 'JMB 12/7/2021 19:47:24'!
sigueA: anOpinionDeUnPueblo 
	^self new initializeSigueA: anOpinionDeUnPueblo ! !


!classDefinition: #PropagacionPorMayoria category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
PropagacionDeOpiniones subclass: #PropagacionPorMayoria
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!PropagacionPorMayoria methodsFor: 'opinion' stamp: 'JMB 12/12/2021 16:36:42'!
opinionDe: unaOpinionDeUnaRegion sobre: unPersonajeJugador
	 ^ (unaOpinionDeUnaRegion cantidadDeSeguidoresQueCumplen: [ :opinion | opinion esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPersonajeJugador ]) > (unaOpinionDeUnaRegion cantidadDeSeguidoresQueCumplen: [ :opinion | (opinion esVistoSinLaInfluenciaDelReferenteComoPrometedor: unPersonajeJugador) not ]) ! !


!classDefinition: #RolDePNJ category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Object subclass: #RolDePNJ
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!RolDePNJ methodsFor: 'actuar' stamp: 'JMB 11/5/2021 21:15:22'!
actuarLuegoDeInteraccionDe: unPersonajeNoJugador con: unPersonajeJugador siguiendo: unaOpinion
	self subclassResponsibility! !


!classDefinition: #Conversador category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
RolDePNJ subclass: #Conversador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!Conversador methodsFor: 'actuar' stamp: 'JMB 11/5/2021 21:15:22'!
actuarLuegoDeInteraccionDe: unPersonajeNoJugador con: unPersonajeJugador siguiendo: unaOpinion
	unPersonajeNoJugador actuarSiendoConversadorCon: unPersonajeJugador siguiendo: unaOpinion! !


!classDefinition: #Influyente category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
RolDePNJ subclass: #Influyente
	instanceVariableNames: 'cantidadDePNJRequeridosParaInfluenciar'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-PNJ-2021-2C-2doParcial'!

!Influyente methodsFor: 'influir' stamp: 'JMB 11/5/2021 21:50:13'!
siAlcanzanParaInfluenciarLasInteracciones: unaCantidadDeInteracciones hacer: unBloqueAEvaluarAlInfluenciar
	unaCantidadDeInteracciones >= cantidadDePNJRequeridosParaInfluenciar
		ifTrue: unBloqueAEvaluarAlInfluenciar ! !


!Influyente methodsFor: 'initialization' stamp: 'JMB 11/5/2021 21:43:42'!
initializeRequiriendoSerConocidoPor: unaCantidadDePNJs 
	cantidadDePNJRequeridosParaInfluenciar := unaCantidadDePNJs.! !


!Influyente methodsFor: 'actuar' stamp: 'JMB 11/5/2021 21:15:22'!
actuarLuegoDeInteraccionDe: unPersonajeNoJugador con: unPersonajeJugador siguiendo: unaOpinion
	unPersonajeNoJugador actuarSiendoInfluyenteCon: unPersonajeJugador siguiendo: unaOpinion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Influyente class' category: 'AlgoIII-PNJ-2021-2C-2doParcial'!
Influyente class
	instanceVariableNames: ''!

!Influyente class methodsFor: 'instance creation' stamp: 'JMB 11/5/2021 21:42:13'!
queRequireSerConocidoPor: unaCantidadDePNJs 
	^self new initializeRequiriendoSerConocidoPor: unaCantidadDePNJs! !
