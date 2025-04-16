!classDefinition: #DialogosConPNJsTest category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!
TestCase subclass: #DialogosConPNJsTest
	instanceVariableNames: 'trebor opinionDeRiverwood carolina'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:00:39'!
test01CuandoElConversadorInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 'Hola forastero' equals: mensaje.
! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:00:54'!
test02CuandoElConversadorInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: '¿Todo bien?' equals: mensaje.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:01:06'!
test03CuandoElConversadorOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor olvidar.
	
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 'Hola forastero' equals: mensaje.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:01:18'!
test04CuandoElConversadorInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: '¿Algún problema?' equals: mensaje.! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:01:53'!
test05ElConversadorMantieneInteraccionesEnParaleloConDiferentesPersonajes

	self assert: 'Hola forastero' equals: (self pnjConversadorTrebor interactuarCon: self pjHamilton).
	self assert: 'Hola forastero' equals: (self pnjConversadorTrebor interactuarCon: self pjTirion).! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:03:19'!
test06ElConversadorMantieneInteraccionesCompletasEnParaleloConDiferentesPersonajes
	
	self assert: 'Hola forastero' equals: (self pnjConversadorTrebor interactuarCon: self pjHamilton).
	
	self assert: 'Hola forastero' equals: (self pnjConversadorTrebor interactuarCon: self pjTirion).
	self assert: '¿Todo bien?' equals: (self pnjConversadorTrebor interactuarCon: self pjTirion).
	self assert: '¿Algún problema?' equals: (self pnjConversadorTrebor interactuarCon: self pjTirion).
	
	self assert: '¿Todo bien?' equals: (self pnjConversadorTrebor interactuarCon: self pjHamilton).
	self assert: '¿Algún problema?' equals: (self pnjConversadorTrebor interactuarCon: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:03:32'!
test07CuandoElConversadorInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 'Bienvenido aventurero!!' equals: mensaje.
! !

!DialogosConPNJsTest methodsFor: 'tests - conversador' stamp: 'JMB 11/6/2021 01:03:42'!
test08CuandoElConversadorInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	mensaje := self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 'Espero que tengas una buena estadia en Riverwood' equals: mensaje.! !


!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/5/2021 00:21:33'!
test09CuandoUnInfluyenteTerminaSuRepertorioDeFrasesConUnPersonajeNoCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorSiNoLoConocenSuficientesPNJs
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	
	self deny: (self esVistoPorElPuebloComoPrometedor: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/5/2021 00:22:50'!
test10CuandoUnInfluyenteTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorSiLoConocenSuficientesPNJs
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.

	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	
	self assert: (self esVistoPorElPuebloComoPrometedor: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/6/2021 01:04:08'!
test11CuandoUnInfluyenteCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.

	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	
	self assert: 'Salud aventurero!!' equals: (self pnjInfluyenteCarolina interactuarCon: self pjHamilton)! !

!DialogosConPNJsTest methodsFor: 'tests - influyente' stamp: 'JMB 11/6/2021 01:04:22'!
test12CuandoUnInfluyenteCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaLosHilosDeDialogosDelRestoDeLosPNJs
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.	

	self assert: 'Bienvenido aventurero!!' equals: (self pnjConversadorTrebor interactuarCon: self pjHamilton)! !


!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/6/2021 01:04:38'!
test13SiNoHuboInteraccionesLaOpinionDeUnPuebloDiceQueQueNadieConoceANingunPJ
	
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjTirion).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:34:31'!
test14CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoLaOpinionDelPuebloDiceQueEsConocidoPorUno
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 1 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:35:38'!
test15CuandoUnPNJNoTerminaSuRepertorioConUnPJDesconocidoLaOpinionDelPuebloDiceQueEsConocidoPor0

	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:38:15'!
test16CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoNoAfectaLaCantidadDePNJsQueConocenAUnNuevoPJ
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 0 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjTirion).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:41:12'!
test17CuandoUnPNJTerminaSuRepertorioConUnPJDesconocidoSiSigueInteractuandoNoSubeLaCantidadDePNJsQueLoConocen
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	
	self assert: 1 equals: (opinionDeRiverwood cantidadDePNJsQueConocenA: self pjHamilton).! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:41:52'!
test18UnConversadorTieneCeroEgoCuandoNoInteractuóConNingunPrometedor
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.

	self pnjConversadorTrebor interactuarCon: self pjTirion.
	self pnjConversadorTrebor interactuarCon: self pjTirion.
	self pnjConversadorTrebor interactuarCon: self pjTirion.
	
	self assert: 0 equals: self pnjConversadorTrebor cantidadDeEgo.
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:42:36'!
test19UnConversadorTieneUnoDeEgoCuandoInteractuóConUnPrometedor

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.
	self pnjConversadorTrebor interactuarCon: self pjHamilton.

	self pnjConversadorTrebor interactuarCon: self pjTirion.
	self pnjConversadorTrebor interactuarCon: self pjTirion.
	self pnjConversadorTrebor interactuarCon: self pjTirion.
	
	self assert: 1 equals: self pnjConversadorTrebor cantidadDeEgo.
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:43:55'!
test20LaOpinionDeUnPuebloTieneCeroConfianzaConAlguienPrometedorSiNoInteractuoLoSuficienteConSusInfluyentes

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	
	self assert: 0 equals: (opinionDeRiverwood cantidadDeConfianzaHacia: self pjHamilton).
! !

!DialogosConPNJsTest methodsFor: 'tests - opinion del pueblo' stamp: 'JMB 11/5/2021 00:44:38'!
test21UnInfluyenteAumentaLaConfianzaSobreUnPJCuandoHablaConEl

	self hacerQueRiverwoodVeaPrometedorAHamilton.	
	
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	self pnjInfluyenteCarolina interactuarCon: self pjHamilton.
	
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

!DialogosConPNJsTest methodsFor: 'soporte' stamp: 'JMB 11/5/2021 01:06:26'!
setUp
	opinionDeRiverwood := OpinionDeUnPueblo new.
	
	trebor := PersonajeNoJugador
		queSigue: opinionDeRiverwood
		frasesParaPersonajesDesconocidos: #('Hola forastero' '¿Todo bien?' '¿Algún problema?' )
		frasesParaPersonajesPrometedores: #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	trebor tipo: #conversador.
	
	carolina := PersonajeNoJugador
		queSigue: opinionDeRiverwood
		frasesParaPersonajesDesconocidos: #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' )
		frasesParaPersonajesPrometedores: #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme').
	carolina tipo: #influyente.
	carolina cantidadDePNJsQueDebenConocerAPJ: 2.

	opinionDeRiverwood agregarSeguidor: trebor.
	opinionDeRiverwood agregarSeguidor: carolina.
! !


!classDefinition: #OpinionDeUnPueblo category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!
Object subclass: #OpinionDeUnPueblo
	instanceVariableNames: 'opiniones seguidores pjsDesconocidosConocidosPorPNJs prometedoresConocidosPorPNJsInfluyentes'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'SF 10/7/2021 20:11:50'!
notificarCambioDeOpinionSobre: unPersonajeJugadorACalificar
	seguidores do: [:unSeguidor |
		unSeguidor elPuebloHaCambiadoSuOpinionDe: unPersonajeJugadorACalificar.
	]. ! !

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'JMB 11/4/2021 23:48:02'!
opinionDesconocido
	^#desconocido.! !

!OpinionDeUnPueblo methodsFor: 'private' stamp: 'JMB 11/4/2021 23:48:16'!
opinionPrometedor
	^#prometedor.! !


!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:45:31'!
agregarSeguidor: unPersonajeNoJugador 
	seguidores add: unPersonajeNoJugador.! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:45:58'!
aumentarConfianzaCon: unPersonajeJugador porHablarCon: unPersonajeNoJugador 
	| pnjsQueInteractuaron |
	pnjsQueInteractuaron := prometedoresConocidosPorPNJsInfluyentes at: unPersonajeJugador ifAbsentPut: [Set new].
	pnjsQueInteractuaron add: unPersonajeNoJugador.! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:46:24'!
cantidadDeConfianzaHacia: unPersonajeJugador
	| pnjsQueInteractuaron cantidad |
	pnjsQueInteractuaron _ prometedoresConocidosPorPNJsInfluyentes at: unPersonajeJugador ifAbsentPut: [Set new].
	cantidad := 0.
	pnjsQueInteractuaron do: [ : unPNJ | cantidad := cantidad + 1 ].
	^ cantidad! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:49:41'!
cantidadDePNJsQueConocenA: unPersonajeJugador
	| cantidad pnjsQueConocenAlPJ |
	pnjsQueConocenAlPJ := pjsDesconocidosConocidosPorPNJs at: unPersonajeJugador ifAbsent: [Set new].
	cantidad := 0.
	pnjsQueConocenAlPJ do: [ : unPNJ | cantidad := cantidad + 1 ].
	^ cantidad! !

!OpinionDeUnPueblo methodsFor: 'public' stamp: 'JMB 11/4/2021 23:48:16'!
esVistoComoPrometedor: unPotencialPersonajeJugadorPrometedor 
	^ (self opinionDe: unPotencialPersonajeJugadorPrometedor) = self opinionPrometedor.! !

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


!classDefinition: #PersonajeNoJugador category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!
Object subclass: #PersonajeNoJugador
	instanceVariableNames: 'cantidadDeInteraccionesPorPersonaje frasesParaPersonajesPrometedores frasesParaPersonajesDesconocidos opinionDeMiPueblo cantidadDePNJsQueDebenConocerAPJ rol prometedoresConocidos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 11/3/2021 11:36:35'!
cantidadDeEgo
	^prometedoresConocidos size.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 11/3/2021 10:48:14'!
cantidadDePNJsQueDebenConocerAPJ: aSmallInteger 
	cantidadDePNJsQueDebenConocerAPJ _ aSmallInteger! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 10/7/2021 20:37:22'!
elPuebloHaCambiadoSuOpinionDe: unPersonajeJugador 
	self olvidarInteraccionesCon: unPersonajeJugador.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'JMB 11/6/2021 01:14:29'!
interactuarCon: unPersonajeJugador 
	| frase opinion |
	self recordarInteraccionCon: unPersonajeJugador.
	frase := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
	opinion := opinionDeMiPueblo opinionDe: unPersonajeJugador.
	(rol tipo = #conversador) ifTrue: [
		(opinion = #prometedor)
			ifTrue: [
				 (self cantidadDeInteraccionesCon: unPersonajeJugador) >= frasesParaPersonajesPrometedores size
					ifTrue: [
						self aumentarEgoPorInteractuarConPrometedor: unPersonajeJugador.
					].
			].
		(opinion = #desconocido)
			ifTrue: [
				 (self cantidadDeInteraccionesCon: unPersonajeJugador) >= frasesParaPersonajesDesconocidos size
					ifTrue: [opinionDeMiPueblo pnj: self conocioA: unPersonajeJugador]
		].
		((opinion ~= #prometedor) and: [opinion ~= #desconocido]) ifTrue: [self error: 'Opinion invalida'].
	].
	(rol tipo = #influyente) ifTrue: [
		(opinion = #prometedor)
			ifTrue: [
				 (self cantidadDeInteraccionesCon: unPersonajeJugador) >= frasesParaPersonajesPrometedores size
					ifTrue: [
						opinionDeMiPueblo aumentarConfianzaCon: unPersonajeJugador porHablarCon: self.
					]].
		(opinion = #desconocido)
			ifTrue: [	
				 (self cantidadDeInteraccionesCon: unPersonajeJugador) >= frasesParaPersonajesDesconocidos size
					ifTrue: [
						opinionDeMiPueblo pnj: self conocioA: unPersonajeJugador.
						self siCumpleLosRequisitosHacerPrometedorA: unPersonajeJugador.
						].
		].
		((opinion ~= #prometedor) and: [opinion ~= #desconocido]) ifTrue: [self error: 'Opinion invalida'].
	].
	((rol tipo ~= #conversador) and: [rol tipo ~= #influyente]) ifTrue: [self error: 'Tipo de PNJ desconocido'].
	^ frase.! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 10/7/2021 19:54:10'!
olvidar
	cantidadDeInteraccionesPorPersonaje := Dictionary new.
	! !

!PersonajeNoJugador methodsFor: 'public' stamp: 'SF 11/3/2021 10:47:55'!
tipo: aSymbol 
	rol := RolDePNJ new.
	rol tipo: aSymbol.! !


!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 11/3/2021 11:35:23'!
aumentarEgoPorInteractuarConPrometedor: unPJPrometedor
	prometedoresConocidos add: unPJPrometedor.! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 19:58:11'!
cantidadDeInteraccionesCon: unPersonajeJugadorAInteractuar
	^ cantidadDeInteraccionesPorPersonaje at: unPersonajeJugadorAInteractuar ifAbsent: [ 0 ]! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'JMB 11/6/2021 01:08:57'!
frasesPara: unPersonajeJugadorAInteractuar
	
	| opinion |
	opinion := opinionDeMiPueblo opinionDe: unPersonajeJugadorAInteractuar.
	opinion = #prometedor
		ifTrue: [ ^ frasesParaPersonajesPrometedores ].
	opinion = #desconocido
		ifTrue: [ ^ frasesParaPersonajesDesconocidos ].
	
	self error: 'Opinion invalida'
! !

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

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 11/2/2021 20:49:46'!
siCumpleLosRequisitosHacerPrometedorA: unPersonajeJugador
	(opinionDeMiPueblo cantidadDePNJsQueConocenA: unPersonajeJugador) >= cantidadDePNJsQueDebenConocerAPJ
		ifTrue: [
		opinionDeMiPueblo verComoPrometedorA: unPersonajeJugador.		
	].! !

!PersonajeNoJugador methodsFor: 'private' stamp: 'SF 10/7/2021 20:27:10'!
siguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesAResponder
	| indice |
	indice := self indiceDeLaSiguienteFrasePara: unPersonajeJugadorAInteractuar en: frasesAResponder.
	^ frasesAResponder at: indice.! !


!PersonajeNoJugador methodsFor: 'initialization' stamp: 'SF 11/3/2021 11:35:50'!
initializeWithOpinion: anOpinionDeUnPueblo frasesParaPersonajesDesconocidos: unasFrasesParaPersonajesDesconocidos frasesParaPersonajesPrometedores: unasFrasesParaPersonajesPrometedores
	self olvidar.
	prometedoresConocidos := Set new.
	opinionDeMiPueblo := anOpinionDeUnPueblo.
	frasesParaPersonajesDesconocidos := unasFrasesParaPersonajesDesconocidos.
	frasesParaPersonajesPrometedores := unasFrasesParaPersonajesPrometedores.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PersonajeNoJugador class' category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!
PersonajeNoJugador class
	instanceVariableNames: ''!

!PersonajeNoJugador class methodsFor: 'instance creation' stamp: 'JMB 11/5/2021 00:59:16'!
queSigue: unaOpinionDeUnPueblo frasesParaPersonajesDesconocidos: unasFrasesParaPJDesconocidos frasesParaPersonajesPrometedores: unasFrasesParaPJPrometedores
	^ self new
		initializeWithOpinion: unaOpinionDeUnPueblo
		frasesParaPersonajesDesconocidos: unasFrasesParaPJDesconocidos
		frasesParaPersonajesPrometedores: unasFrasesParaPJPrometedores	
! !


!classDefinition: #RolDePNJ category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!
Object subclass: #RolDePNJ
	instanceVariableNames: 'tipo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2020-2C-1Parcial-DialogosConPNJs-P3'!

!RolDePNJ methodsFor: 'as yet unclassified' stamp: 'SF 11/2/2021 19:50:43'!
tipo
	^tipo! !

!RolDePNJ methodsFor: 'as yet unclassified' stamp: 'SF 11/2/2021 19:48:03'!
tipo: aSymbol 
	tipo := aSymbol.! !
