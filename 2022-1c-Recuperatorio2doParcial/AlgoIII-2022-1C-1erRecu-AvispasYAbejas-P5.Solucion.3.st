!classDefinition: #CicloReproductivoDeAvispasTest category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TestCase subclass: #CicloReproductivoDeAvispasTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:48'!
test01EnElInicioDeLosTiemposHayUnaCantidadDeAvispasVivas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	self assert: 2 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:41'!
test02EnElInicioDeLosTiemposNoHayHuevosDeAvispas

	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:13:35'!
test03LasAvispasMuerenAlCambiarDeTemporada
	| unHabitat |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 0.	
	
	unHabitat avanzarUnaTemporada.
	
	self assert: 0 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:32'!
test04AlReproducirseUnaAvispaEnLaTemporadaSiguienteSeGestaLaAvispaDescendiente
	| unHabitat avispaQueDejaUnHuevo |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnHuevo := unHabitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	unHabitat avanzarUnaTemporada.
	
	self assert: 1 equals: unHabitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:49'!
test05ReproducirseUnaAvispaEnLaTemporadaSiguienteSeGestaLaAvispaDescendientePeroNoPuedeGestarNingunaEnDosTemporadas
	| habitat avispaQueDejaUnaCria |
	habitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnaCria := habitat avispas first.
	avispaQueDejaUnaCria intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	habitat avanzarUnaTemporada.
	
	self assert: 0 equals: habitat cantidadDeAvispasVivas.
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/19/2022 23:54:57'!
test06AlReproducirseUnaAvispaComeOrugasEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:11:45'!
test07AlReproducirseUnaAvispaComePolillasEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo |
	habitat := Habitat conAvispasComePolillas: 2 yConPolillas: 1.
	avispaQueDejaUnHuevo := habitat avispas first.
	avispaQueDejaUnHuevo intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueDejaUnHuevo ]).
	! !

!CicloReproductivoDeAvispasTest methodsFor: 'tests' stamp: 'JMB 6/20/2022 00:01:29'!
test08AlReproducirseUnaAvispaLadronaEnLaTemporadaSiguienteGestaUnaDescendienteConSuFirmaGenetica
	| habitat avispaQueDejaUnHuevo avispaQueRoba |
	habitat := Habitat conAvispasComeOrugas: 1 ladronas: 	1 yConOrugas: 1 conPolillas: 0.
	avispaQueDejaUnHuevo := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]) first.
	avispaQueRoba := (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]) first.
	avispaQueDejaUnHuevo intentarReproducirse.
	avispaQueRoba intentarReproducirse.
	
	habitat avanzarUnaTemporada.
	
	self assert: 1 equals: (habitat cantidadDeAvispasVivasCumplanCon: [ : unaAvispa | unaAvispa tieneMismaFirmaGeneticaDe: avispaQueRoba ]).
	! !


!classDefinition: #ControlPoblacionalTest category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TestCase subclass: #ControlPoblacionalTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!ControlPoblacionalTest methodsFor: 'tests poblaciones iniciales' stamp: 'JMB 6/20/2022 22:13:13'!
test01EnElInicioDeLosTiemposElHabitatComienzaConUnaPoblacionDeOrugas
	| habitat |
	habitat := Habitat conOrugas: 1.
	self assert: 1 equals: habitat cantidadDeOrugas. ! !

!ControlPoblacionalTest methodsFor: 'tests poblaciones iniciales' stamp: 'JMB 6/20/2022 22:13:21'!
test02EnElInicioDeLosTiemposElHabitatComienzaConUnaPoblacionDePolillas
	| habitat |
	habitat := Habitat conPolillas: 1.
	self assert: 1 equals: habitat cantidadDePolillas. ! !


!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:04:54'!
test03AlVariarPorPoblacionConConstanteCeroLaPoblacionDeOrugasDeLaSiguienteTemporadaPasaASerVacia
	
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 0 alVariarCon: (VariacionPoblacionalConstante con: 0)! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:06:09'!
test04AlVariarPorPoblacionConConstanteMayorACeroLaPoblacionDeOrugasDeLaSiguienteTemporadaPasaATenerEsaCantidadDeIndividuos
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 10 alVariarCon: (VariacionPoblacionalConstante con: 10)! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 18:22:54'!
test05LaVariacionPoblacionalConstanteDebeTenerUnTamañoPoblacionalMayorACero
	self 
		should: [ VariacionPoblacionalConstante con: -1 ] 
		raise: Error - MessageNotUnderstood  
		withExceptionDo: [ : anError  | anError messageText = VariacionPoblacionalConstante mensajeDeErrorTamañoDePoblacionInvalido ]

	! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:07:12'!
test06AlVariarPorPoblacionSegunTamañoActualConTasaCeroLaPoblacionDeOrguasDeLaSiguienteTemporadaEsDelMismoTamañoDeLaPoblacionQueFinalizoLaTemporadaAnterior

	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: self cantidadInicialDeOrugas alVariarCon: (VariacionPoblacionalSegunPoblacionActual conTasa: 0)! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:09:08'!
test07AlVariarPorPoblacionSegunTamañoActualConTasaMayorACeroLaPoblacionDeOrguasDeLaSiguienteTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueFinalizoLaTemporadaAnterior

	self 
		assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: self cantidadInicialDeOrugas + (self cantidadInicialDeOrugas * self tasaNoNula) truncated 
		alVariarCon: (VariacionPoblacionalSegunPoblacionActual conTasa: self tasaNoNula)! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:11:05'!
test08AlVariarPorPoblacionSegunTamañoInicialConTasaCeroLaPoblacionDeOrguasDeLaSiguienteTemporadaEsDelMismoTamañoDeLaPoblacionQueFinalizoLaTemporadaAnterior
	
	self 
		assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: self cantidadInicialDeOrugas 
		alVariarCon: (VariacionPoblacionalSegunPoblacionInicial conTasa: 0).
! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:12:15'!
test09AlVariarPorPoblacionSegunTamañoInicialConTasaMayorACeroLaPoblacionDeOrguasDeLaSiguienteTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior

	self 
		assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: self cantidadInicialDeOrugas + (self cantidadInicialDeOrugas * self tasaNoNula) truncated 
		alVariarCon: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula)! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:14:38'!
test10AlVariarPorPoblacionSegunTamañoInicialLaPoblacionDeOrugasDeLaSiguienteTemporadaCuandoCambioALoLargoDeLaTemporadaActualSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior
	
	self 
		assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: self cantidadInicialDeOrugas + (self cantidadInicialDeOrugas * self tasaNoNula) truncated 
		alVariarCon: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula)
		muriendoEnLaTemporada: 1.
! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas' stamp: 'JMB 6/24/2022 21:27:24'!
test11AlVariarPorPoblacionSegunTamañoInicialLaPoblacionDeOrguasTemporadaTrasTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior
	| habitat tamañoAlInicioDeLaTemporada |
	habitat := Habitat conOrugas: self cantidadInicialDeOrugas conVariacionPoblacional: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula).
	habitat tomarUnaOrugaSiNoHayHace: [ self fail ].
	habitat avanzarUnaTemporada.
	tamañoAlInicioDeLaTemporada := self cantidadInicialDeOrugas + (self cantidadInicialDeOrugas*self tasaNoNula) truncated.
	
	habitat avanzarUnaTemporada.
	
	self assert: tamañoAlInicioDeLaTemporada + (tamañoAlInicioDeLaTemporada*self tasaNoNula) truncated equals: habitat cantidadDeOrugas.! !


!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:18:29'!
test12AlVariarPorPoblacionConConstanteCeroLaPoblacionDePolillasDeLaSiguienteTemporadaPasaASerVacia

	self assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: 0 alVariarCon: (VariacionPoblacionalConstante con: 0).! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:20:10'!
test13AlVariarPorPoblacionConConstanteMayorACeroLaPoblacionDePolillasDeLaSiguienteTemporadaPasaATenerEsaCantidadDeIndividuos

	self assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: 10 alVariarCon: (VariacionPoblacionalConstante con: 10).! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:23:42'!
test14AlVariarPorPoblacionSegunTamañoActualLaPoblacionDePolillasDeLaSiguienteTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueFinalizoLaTemporadaAnterior
	
	self 
		assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: self cantidadInicialDePolillas + (self cantidadInicialDePolillas*self tasaNoNula) truncated
		alVariarCon: (VariacionPoblacionalSegunPoblacionActual conTasa: self tasaNoNula).! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:24:57'!
test15AlVariarPorPoblacionSegunTamañoInicialLaPoblacionDePolillasDeLaSiguienteTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior

	self 
		assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: self cantidadInicialDePolillas + (self cantidadInicialDePolillas*self tasaNoNula) truncated
		alVariarCon: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula).! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:26:09'!
test16AlVariarPorPoblacionSegunTamañoInicialLaPoblacionDePolillasDeLaSiguienteTemporadaCuandoCambioALoLargoDeLaTemporadaActualSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior

	self 
		assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: self cantidadInicialDePolillas + (self cantidadInicialDePolillas*self tasaNoNula) truncated
		alVariarCon: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula)
		muriendoEnLaTemporada: 1.! !

!ControlPoblacionalTest methodsFor: 'tests variacion de orugas polillas' stamp: 'JMB 6/24/2022 21:26:59'!
test17AlVariarPorPoblacionSegunTamañoInicialLaPoblacionDePolillasTemporadaTrasTemporadaSeModificaProporcionalmenteAlTamañoDeLaPoblacionQueInicioLaTemporadaAnterior
	| habitat tamañoAlInicioDeLaTemporada |
	habitat := Habitat conPolillas: self cantidadInicialDePolillas conVariacionPoblacional: (VariacionPoblacionalSegunPoblacionInicial conTasa: self tasaNoNula).
	habitat tomarUnaPolillaSiNoHayHace: [ self fail ].
	habitat avanzarUnaTemporada.
	tamañoAlInicioDeLaTemporada := self cantidadInicialDePolillas + (self cantidadInicialDePolillas*self tasaNoNula) truncated.
	
	habitat avanzarUnaTemporada.
	
	self assert: tamañoAlInicioDeLaTemporada + (tamañoAlInicioDeLaTemporada*self tasaNoNula) truncated equals: habitat cantidadDePolillas.! !


!ControlPoblacionalTest methodsFor: 'tests temporadas seleccionadas' stamp: 'JMB 6/24/2022 21:28:48'!
test18UnaPoblacionEsModificadaPorUnaVariacionConstanteNulaParaLaTemporadaSeleccionada
	| variacionPoblacional |
	variacionPoblacional _ VariacionPoblacionalSelectiva 
		para: #(1)
		usar: (VariacionPoblacionalConstante con: 0)
		enCasoContrario: (VariacionPoblacionalConstante con: 0).
	
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 0 alVariarCon: variacionPoblacional! !

!ControlPoblacionalTest methodsFor: 'tests temporadas seleccionadas' stamp: 'JMB 6/24/2022 21:29:20'!
test19UnaPoblacionEsModificadaPorLaVariacionDefinidaParaLaTemporadaUnoCuandoEsSeleccionada
	| variacionPoblacional |
	variacionPoblacional _ VariacionPoblacionalSelectiva 
		para: #(1)
		usar: (VariacionPoblacionalConstante con: 10)
		enCasoContrario: (VariacionPoblacionalConstante con: 0).
	
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 10 alVariarCon: variacionPoblacional.! !

!ControlPoblacionalTest methodsFor: 'tests temporadas seleccionadas' stamp: 'JMB 6/24/2022 21:29:51'!
test20UnaPoblacionEsModificadaPorLaVariacionAlternativaEnLasTemporadasNoSeleccionadas
	| variacionPoblacional |
	variacionPoblacional _ VariacionPoblacionalSelectiva 
		para: #(2)
		usar: (VariacionPoblacionalConstante con: 10)
		enCasoContrario: (VariacionPoblacionalConstante con: 0).
	
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 0 alVariarCon: variacionPoblacional.! !

!ControlPoblacionalTest methodsFor: 'tests temporadas seleccionadas' stamp: 'JMB 6/24/2022 20:52:11'!
test21UnaPoblacionEsModificadaPorLaVariacionDefinidaParaLaTemporadaSeleccionada
	| variacionPoblacional habitat |
	variacionPoblacional _ VariacionPoblacionalSelectiva 
		para: #(2)
		usar: (VariacionPoblacionalConstante con: 10)
		enCasoContrario: (VariacionPoblacionalConstante con: 0).
	habitat := Habitat conOrugas: 10 conVariacionPoblacional: variacionPoblacional.
	habitat avanzarUnaTemporada.
	
	habitat avanzarUnaTemporada.
	 
	self assert: 10 equals: habitat cantidadDeOrugas.! !

!ControlPoblacionalTest methodsFor: 'tests temporadas seleccionadas' stamp: 'JMB 6/24/2022 21:30:27'!
test22UnaPoblacionEsModificadaPorLaVariacionDefinidaParaLasTemporadasSeleccionadas
	| variacionPoblacional |
	variacionPoblacional _ VariacionPoblacionalSelectiva 
		para: #(1 2)
		usar: (VariacionPoblacionalConstante con: 10)
		enCasoContrario: (VariacionPoblacionalConstante con: 0).
	
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: 10 alVariarCon: variacionPoblacional.! !


!ControlPoblacionalTest methodsFor: 'asserts' stamp: 'JMB 6/18/2022 14:02:23'!
assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional
	self assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional muriendoEnLaTemporada: 0! !

!ControlPoblacionalTest methodsFor: 'asserts' stamp: 'JMB 6/24/2022 21:05:27'!
assertLaPobacionDeOrugasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional muriendoEnLaTemporada: unaCantidadDeOrugasAMorir 
	| habitat |
	habitat := Habitat conOrugas: self cantidadInicialDeOrugas conVariacionPoblacional: unaVariacionPoblacional.
	unaCantidadDeOrugasAMorir timesRepeat: [ habitat tomarUnaOrugaSiNoHayHace: [ self fail ] ].
	
	habitat avanzarUnaTemporada.
	
	self assert: unTamañoEsperado equals: habitat cantidadDeOrugas. ! !

!ControlPoblacionalTest methodsFor: 'asserts' stamp: 'JMB 6/18/2022 13:38:18'!
assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional 
	self assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional muriendoEnLaTemporada: 0! !

!ControlPoblacionalTest methodsFor: 'asserts' stamp: 'JMB 6/24/2022 21:23:31'!
assertLaPobacionDePolillasDeLaSiguienteTemporadaEs: unTamañoEsperado  alVariarCon: unaVariacionPoblacional muriendoEnLaTemporada: unaCantidadDePolillasAMorir 
	| habitat |
	habitat := Habitat conPolillas: self cantidadInicialDePolillas conVariacionPoblacional: unaVariacionPoblacional.
	unaCantidadDePolillasAMorir timesRepeat: [ habitat tomarUnaPolillaSiNoHayHace: [ self fail ] ].
	
	habitat avanzarUnaTemporada.
	
	self assert: unTamañoEsperado equals: habitat cantidadDePolillas. ! !


!ControlPoblacionalTest methodsFor: 'poblacion y variaciones' stamp: 'JMB 6/24/2022 21:10:06'!
cantidadInicialDeOrugas
	^ 11! !

!ControlPoblacionalTest methodsFor: 'poblacion y variaciones' stamp: 'JMB 6/18/2022 13:24:51'!
cantidadInicialDePolillas
	^ 20! !

!ControlPoblacionalTest methodsFor: 'poblacion y variaciones' stamp: 'JMB 6/18/2022 12:26:29'!
tasaNoNula
	^ 20 / 100! !


!classDefinition: #ReproduccionAvispasTests category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TestCase subclass: #ReproduccionAvispasTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test01CuandoUnAvispaComeOrugasSeReproducePorPrimeraVezDejaUnHuevo
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test02CadaVezQueUnaAvispaComeOrugasSeReproduceDejaUnHuevoMas
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 2.		
	self assert: 2 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test03ParaDejarUnHuevoUnaAvispaComeOrugasReduceLaPoblacionDeUnaOrugaANinguna
	| unHabitat |
	unHabitat := self habitatConOrugas: 1 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 0 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test04ParaDejarUnHuevoUnaAvispaComeOrugasDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	| unHabitat |
	unHabitat := self habitatConOrugas: 2 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.		
	self assert: 1 equals: unHabitat cantidadDeOrugas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come orugas' stamp: 'JMB 5/19/2022 18:54:29'!
test05CuandoNoHayOrugasUnaAvispaComeOrugasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConOrugas: 0 yUnaAvispaComeOrugasQueIntentoReproducirse: 1.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test06CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevo
	| unHabitat |.
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 1 equals: unHabitat cantidadDeHuevosDeAvispas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test07ParaDejarUnHuevoUnaAvispaComePolillasReduceLaPoblacionDeUnaPolillaANinguna
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 1.	
	self assert: 0 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test08ParaDejarUnHuevoUnaAvispaComePolillasDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 2.	
	self assert: 1 equals: unHabitat cantidadDePolillas.! !

!ReproduccionAvispasTests methodsFor: 'avispas come polillas' stamp: 'JMB 5/19/2022 18:52:26'!
test09CuandoNoHayPolillasUnaAvispaComePolillasNoPuedeDejarHuevos
	| unHabitat |
	unHabitat := self habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: 0.	
	self assert: 0 equals: unHabitat cantidadDeHuevosDeAvispas.! !


!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/19/2022 23:55:36'!
test10CuandoUnaAvispaComeOrugasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: 1.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/20/2022 00:13:26'!
test11CuandoUnaAvispaComeOrugasAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: 0.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaAReproducirse intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaAReproducirse firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/20/2022 00:07:10'!
test12CuandoUnaAvispaComePolillasSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaComePolillas unaAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 0 yConOrugas: 0 conPolillas: 1.
	unaAvispaComePolillas := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	unaAvispaComePolillas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComePolillas firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'firma genetica' stamp: 'JMB 6/19/2022 23:55:49'!
test13DosAvispasDelMismoTipoDejanHuevosDeLaMismaLineaGenetica
	| unHabitat unaAvispaComeOrugas otraAvispaComeOrugas |
	unHabitat := Habitat conAvispasComeOrugas: 2 yConOrugas: 1.
	unaAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaComeOrugas := (self elegirAvispasComeOrugasDe: unHabitat) last.
	
	unaAvispaComeOrugas intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaComeOrugas firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaComeOrugas firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:01:41'!
test14CuandoUnaAvispaLadronaSeReproduceDejaUnHuevoConSuFirmaGenetica
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:01:55'!
test15CuandoUnaAvispaLadronaSeReproduceLeSacaUnHuevoAOtraAvispa
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:05:00'!
test16CuandoUnaAvispaLadronaSeReproduceSoloRobaUnHuevo
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 2 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas' stamp: 'JMB 6/20/2022 00:02:30'!
test17CuandoUnaAvispaLadronaNoTieneRecursosNoDejaUnHuevo
	| unHabitat unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 ladronas: 1 yConOrugas: 0 conPolillas: 0.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	 
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).! !


!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:56:29'!
test18CuandoUnaAvispaLadronaSeReproduceRobaHuevosDeVariasAvispas
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1 yConOrugas: 1 conPolillas: 1.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:58:14'!
test19CuandoUnaAvispaLadronaSeReproduceNoVuelveARobarDeLaUltimaLineaGeneticaQueYaHaRobado
	| unHabitat unaAvispaASerRobada unaAvispaLadrona |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 0 ladronas: 1 yConOrugas: 2 conPolillas: 0.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse. 
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).! !

!ReproduccionAvispasTests methodsFor: 'avispas ladronas - selectivas' stamp: 'JMB 6/19/2022 23:58:35'!
test20CuandoUnaAvispaLadronaSeReproduceNoRobaHuevosDeNingunaFirmaGeneticaALaQueLeHayaRobadoPreviamente
	| unHabitat unaAvispaASerRobada unaAvispaLadrona otraAvispaASerRobada |
	unHabitat := Habitat conAvispasComeOrugas: 1 comePolillas: 1 ladronas: 1 yConOrugas: 2 conPolillas: 2.
	unaAvispaASerRobada := (self elegirAvispasComeOrugasDe: unHabitat) first.
	otraAvispaASerRobada := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaLadrona := (self elegirAvispasLadronasDe: unHabitat) first.
	unaAvispaASerRobada intentarReproducirse.
	unaAvispaASerRobada intentarReproducirse.
	otraAvispaASerRobada intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	unaAvispaLadrona intentarReproducirse.
	
	unaAvispaLadrona intentarReproducirse.
	
	self assert: 1 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaASerRobada firmaGenetica).
	self assert: 0 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: otraAvispaASerRobada firmaGenetica).
	self assert: 2 equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispaLadrona firmaGenetica).
	! !


!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:03'!
elegirAvispasComeOrugasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:10'!
elegirAvispasComePolillasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComePolillas]! !

!ReproduccionAvispasTests methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:28:19'!
elegirAvispasLadronasDe: unHabitat

	^ unHabitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esLadrona]! !


!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 6/19/2022 23:55:26'!
habitatConOrugas: unaCantidadDeOrugasAGestar yUnaAvispaComeOrugasQueIntentoReproducirse: cantidadDeVecesAReproducirse
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComeOrugas: 1 yConOrugas: unaCantidadDeOrugasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComeOrugasDe: unHabitat) first.
	
	cantidadDeVecesAReproducirse timesRepeat: [ unaAvispaAReproducirse intentarReproducirse ].
	^ unHabitat ! !

!ReproduccionAvispasTests methodsFor: 'habitats' stamp: 'JMB 6/20/2022 00:11:57'!
habitatConUnaAvispaComePolillasQueSeIntentaReproducirUnaVezTeniendoPolillas: unaCantidadDePolillasAGestar
	| unHabitat unaAvispaAReproducirse |
	unHabitat := Habitat conAvispasComePolillas: 1 yConPolillas: unaCantidadDePolillasAGestar.
	unaAvispaAReproducirse := (self elegirAvispasComePolillasDe: unHabitat) first.
	unaAvispaAReproducirse intentarReproducirse.
	
	^ unHabitat! !


!classDefinition: #ReproduccionDeAvispasConFactoresClimaticosTest category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TestCase subclass: #ReproduccionDeAvispasConFactoresClimaticosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:51:02'!
test01AvispaComeOrugasNoPuedePonerHuevosSiEstaInundado
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Inundado.
	avispa := self unaAvispaComeOrugasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:51:21'!
test02AvispaComeOrugasNoPuedeCazarSiEstaRevuelto
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Revuelto.
	avispa := self unaAvispaComeOrugasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 1 orugasEn: habitat y: 0 huevosDe: avispa.

	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:51:50'!
test03AvispaComeOrugasPuedeCazarPeroNoTransportarSiEstaVentoso
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Ventoso.
	avispa := self unaAvispaComeOrugasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 0 huevosDe: avispa.

	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 20:03:14'!
test04AvispaComeOrugasNoVuelveACazarSiTienePresa
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 2 orugasConClima: #Ventoso.
	avispa := self unaAvispaComeOrugasDe: habitat.

	avispa intentarReproducirse.	
	avispa intentarReproducirse.
	
	self asertarQueHay: 1 orugasEn: habitat y: 0 huevosDe: avispa.
! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:52:52'!
test05AvispaComeOrugasPuedePonerHuevosSiEstaVentoso
	"pudo cazar, transportar pero no poner huevos,  luego en clima ventoso puede poner huevo "
	
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Inundado.
	avispa := self unaAvispaComeOrugasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Ventoso.	
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 1 huevosDe: avispa.
! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:53:11'!
test06AvispaComeOrugasPuedePonerHuevosSiEstaRevuelto
	"pudo cazar, transportar pero no poner huevos,  luego en clima revuelto puede poner huevo "
	
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Inundado.
	avispa := self unaAvispaComeOrugasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Revuelto.
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 1 huevosDe: avispa.
! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:57:13'!
test07AvispaComeOrugasNoPuedeTransportarEnClimaRevuelto
	"pudo cazar pero no transportar, luego en clima revuelto tampoco pudo transportar (porque no hay huevos pero si podía ponerlos por test anterior)"
	
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 1 orugasConClima: #Ventoso.
	avispa := self unaAvispaComeOrugasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Revuelto.
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 0 huevosDe: avispa.
! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests orugas' stamp: 'LL 7/26/2022 19:53:54'!
test08AvispaComeOrugasPuedeReproducirseMasDeUnaVez
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComeOrugasY: 2 orugasConClima: #Despejado.
	avispa := self unaAvispaComeOrugasDe: habitat.

	avispa intentarReproducirse.
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 orugasEn: habitat y: 2 huevosDe: avispa.
! !


!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 19:58:27'!
test09AvispaComePolillasNoPuedePonerHuevosSiEstaInundado
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Inundado.
	avispa := self unaAvispaComePolillasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 polillasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 19:58:50'!
test10AvispaComePolillasNoPuedeCazarSiEstaRevuelto
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Revuelto.
	avispa := self unaAvispaComePolillasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 1 polillasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 19:59:14'!
test11AvispaComePolillasPuedeCazarPeroNoTransportarSiEstaVentoso
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Ventoso.
	avispa := self unaAvispaComePolillasDe: habitat.
	
	avispa intentarReproducirse.
	
	self asertarQueHay: 0 polillasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 19:59:34'!
test12AvispaComePolillasNoVuelveACazarSiTienePresa
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 2 polillasConClima: #Ventoso.
	avispa := self unaAvispaComePolillasDe: habitat.

	avispa intentarReproducirse.
	avispa intentarReproducirse.	
	
	self asertarQueHay: 1 polillasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 19:59:56'!
test13AvispaComePolillasPuedePonerHuevosSiEstaVentoso
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Inundado.
	avispa := self unaAvispaComePolillasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Ventoso.
	avispa intentarReproducirse.	
	
	self asertarQueHay: 0 polillasEn: habitat y: 1 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 20:00:21'!
test14AvispaComePolillasPuedePonerHuevosSiEstaRevuelto
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Inundado.
	avispa := self unaAvispaComePolillasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Revuelto.
	avispa intentarReproducirse.	
	
	self asertarQueHay: 0 polillasEn: habitat y: 1 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 20:00:42'!
test15AvispaComePolillasNoPuedeTransportarEnClimaRevuelto
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 1 polillasConClima: #Ventoso.
	avispa := self unaAvispaComePolillasDe: habitat.

	avispa intentarReproducirse.
	habitat cambiarClimaA: #Revuelto.
	avispa intentarReproducirse.	
	
	self asertarQueHay: 0 polillasEn: habitat y: 0 huevosDe: avispa.
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'tests polillas' stamp: 'LL 7/26/2022 20:01:00'!
test16AvispaComePolillasPuedeReproducirseMasDeUnaVez
	| avispa habitat |
	habitat := self unHabitatConUnaAvispaComePolillasY: 2 polillasConClima: #Despejado.
	avispa := self unaAvispaComePolillasDe: habitat.

	avispa intentarReproducirse.
	avispa intentarReproducirse.	
	
	self asertarQueHay: 0 polillasEn: habitat y: 2 huevosDe: avispa.
	! !


!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:19:46'!
asertarQueHay: unaCantidadEsperadaDeOrugas orugasEn: unHabitat y: unaCantidadDeHuevos huevosDe: unaAvispa
	
	self assert: unaCantidadEsperadaDeOrugas equals: unHabitat cantidadDeOrugas.
	self assert: unaCantidadDeHuevos equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispa firmaGenetica)
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:38:26'!
asertarQueHay: unaCantidadEsperadaDePolillas polillasEn: unHabitat y: unaCantidadDeHuevos huevosDe: unaAvispa
	
	self assert: unaCantidadEsperadaDePolillas equals: unHabitat cantidadDePolillas.
	self assert: unaCantidadDeHuevos equals: (unHabitat cantidadDeHuevosConLaFirmaGenetica: unaAvispa firmaGenetica)
	! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:30:09'!
unHabitatConUnaAvispaComeOrugasY: unaCantidadInicialDeOrugas orugasConClima: unClima
	| habitat |
	habitat := Habitat conAvispasComeOrugas: 1 yConOrugas: unaCantidadInicialDeOrugas.
	habitat cambiarClimaA: unClima.
	
	^habitat! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:37:39'!
unHabitatConUnaAvispaComePolillasY: unaCantidadInicialDePolillas polillasConClima: unClima
	| habitat |
	habitat := Habitat conAvispasComePolillas: 1 yConPolillas: unaCantidadInicialDePolillas.
	habitat cambiarClimaA: unClima.
	
	^habitat! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:07:35'!
unaAvispaComeOrugasDe: habitat

	^ (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComeOrugas]) first! !

!ReproduccionDeAvispasConFactoresClimaticosTest methodsFor: 'mensajes auxiliares' stamp: 'LL 7/26/2022 19:08:26'!
unaAvispaComePolillasDe: habitat

	^ (habitat elegirAvispasQueCumplanCon: [: cadaAvispa | cadaAvispa esComePolillas]) first! !


!classDefinition: #Avispa category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #Avispa
	instanceVariableNames: 'habitat estrategiaReproductiva'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!Avispa methodsFor: 'initialization' stamp: 'JMB 5/22/2022 23:00:33'!
initializeEn: unHabitat  siguiendo: unaEstrategiaReproductiva
	habitat := unHabitat.
	estrategiaReproductiva := unaEstrategiaReproductiva! !


!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
esComeOrugas
	^ estrategiaReproductiva usaOrugasParaAlimentarLasCrias! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
esComePolillas
	^ estrategiaReproductiva usaPolillasParaAlimentarLasCrias ! !

!Avispa methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
esLadrona
	^ estrategiaReproductiva robaHuevos ! !

!Avispa methodsFor: 'testing' stamp: 'JMB 5/22/2022 21:44:17'!
tieneMismaFirmaGeneticaDe: unaAvispa
	^ self firmaGenetica = unaAvispa firmaGenetica! !


!Avispa methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:36:28'!
firmaGenetica
	^ estrategiaReproductiva firmaGenetica ! !

!Avispa methodsFor: 'reproduccion' stamp: 'JMB 7/6/2022 22:49:45'!
intentarReproducirse
	estrategiaReproductiva realizarPor: self en: habitat.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Avispa class
	instanceVariableNames: ''!

!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/23/2022 18:30:02'!
en: unHabitat con: unaFirmaGenetica
	
	^ self en: unHabitat siguiendo: (EstrategiaReproductiva empleadaPor: unaFirmaGenetica)! !

!Avispa class methodsFor: 'instance creation' stamp: 'JMB 5/22/2022 23:01:04'!
en: unHabitat siguiendo: unaEstrategiaReproductiva
	^self new initializeEn: unHabitat siguiendo: unaEstrategiaReproductiva! !


!classDefinition: #EstrategiaReproductiva category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #EstrategiaReproductiva
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
robaHuevos
	^ false! !

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
usaOrugasParaAlimentarLasCrias
	^ false! !

!EstrategiaReproductiva methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
usaPolillasParaAlimentarLasCrias
	^ false! !


!EstrategiaReproductiva methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:43:55'!
firmaGenetica
	^ self class firmaGenetica ! !

!EstrategiaReproductiva methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 22:23:37'!
realizarPor: unaAvispa en: unHabitat
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaReproductiva class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
EstrategiaReproductiva class
	instanceVariableNames: ''!

!EstrategiaReproductiva class methodsFor: 'instance creation' stamp: 'JMB 5/23/2022 18:31:01'!
empleadaPor: unaFirmaGenetica 
	
	^ self subclasses 
		detect: [ : cadaEstrategiaReproductiva | cadaEstrategiaReproductiva esEmpleadaPor: unaFirmaGenetica ] 
		ifFound: [ : tipoDeAvispaCompatible | tipoDeAvispaCompatible new ]
		ifNone: [ self error: 'La firma genetica no es compatible con ninguna estrategia repreductiva' ]! !


!EstrategiaReproductiva class methodsFor: 'firma genetica' stamp: 'JMB 5/23/2022 18:31:01'!
esEmpleadaPor: unaFirmaGenetica
	^ self firmaGenetica = unaFirmaGenetica ! !

!EstrategiaReproductiva class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:01'!
firmaGenetica
	self subclassResponsibility ! !


!classDefinition: #AlimentaCriasConOrugas category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
EstrategiaReproductiva subclass: #AlimentaCriasConOrugas
	instanceVariableNames: 'siguienteTarea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!AlimentaCriasConOrugas methodsFor: 'initialization' stamp: 'JMB 7/6/2022 22:02:49'!
initialize
	super initialize.
	siguienteTarea := Cazar para: self.! !


!AlimentaCriasConOrugas methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:26'!
usaOrugasParaAlimentarLasCrias
	^ true! !


!AlimentaCriasConOrugas methodsFor: 'reproduccion' stamp: 'JMB 7/6/2022 23:57:12'!
realizarPor: unaAvispa en: unHabitat
	siguienteTarea := siguienteTarea realizarSiEsPosiblePor: unaAvispa en: unHabitat ! !


!AlimentaCriasConOrugas methodsFor: 'privado - tareas' stamp: 'JMB 7/6/2022 23:56:20'!
tomarPresaEn: unHabitat siNoHayHace: unBloqueAEvaluarCuandoNoHayPresas
	unHabitat tomarUnaOrugaSiNoHayHace: unBloqueAEvaluarCuandoNoHayPresas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlimentaCriasConOrugas class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
AlimentaCriasConOrugas class
	instanceVariableNames: ''!

!AlimentaCriasConOrugas class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:13'!
firmaGenetica
	^#'come-orugas'! !


!classDefinition: #AlimentaCriasConPolillas category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
EstrategiaReproductiva subclass: #AlimentaCriasConPolillas
	instanceVariableNames: 'siguienteTarea'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!AlimentaCriasConPolillas methodsFor: 'initialization' stamp: 'JMB 7/6/2022 22:24:22'!
initialize
	super initialize.
	siguienteTarea := Cazar para: self.! !


!AlimentaCriasConPolillas methodsFor: 'testing' stamp: 'JMB 5/22/2022 22:58:59'!
usaPolillasParaAlimentarLasCrias
	^ true! !


!AlimentaCriasConPolillas methodsFor: 'reproduccion' stamp: 'JMB 7/6/2022 23:57:20'!
realizarPor: unaAvispa en: unHabitat
	siguienteTarea := siguienteTarea realizarSiEsPosiblePor: unaAvispa en: unHabitat ! !


!AlimentaCriasConPolillas methodsFor: 'privado - tareas' stamp: 'JMB 7/6/2022 23:55:26'!
tomarPresaEn: unHabitat siNoHayHace: unBloqueAEvaluarCuandoNoHayPresas
	unHabitat tomarUnaPolillaSiNoHayHace: unBloqueAEvaluarCuandoNoHayPresas.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlimentaCriasConPolillas class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
AlimentaCriasConPolillas class
	instanceVariableNames: ''!

!AlimentaCriasConPolillas class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:22'!
firmaGenetica
	^#'come-polillas'! !


!classDefinition: #RobaHuevos category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
EstrategiaReproductiva subclass: #RobaHuevos
	instanceVariableNames: 'firmasGeneticasExceptuadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!RobaHuevos methodsFor: 'initialization' stamp: 'JMB 5/22/2022 23:36:03'!
initialize
	super initialize.
	firmasGeneticasExceptuadas := OrderedCollection with: self firmaGenetica! !


!RobaHuevos methodsFor: 'reproduccion' stamp: 'JMB 5/22/2022 23:36:16'!
realizarPor: unaAvispa en: unHabitat
	| firmaGeneticaRobada  |
	firmaGeneticaRobada := unHabitat robarUnHuevoQueNoSeaDe: firmasGeneticasExceptuadas siNoHayHace: [ ^ self ].
	unHabitat dejarUnHuevoDeAvispa: unaAvispa.
	self exceptuarFirmaGenetica: firmaGeneticaRobada.! !


!RobaHuevos methodsFor: 'testing' stamp: 'JMB 6/20/2022 22:03:51'!
robaHuevos
	^ true! !


!RobaHuevos methodsFor: 'privados' stamp: 'JMB 5/22/2022 23:36:16'!
exceptuarFirmaGenetica: firmaGeneticaRobada

	^ firmasGeneticasExceptuadas add: firmaGeneticaRobada! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RobaHuevos class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
RobaHuevos class
	instanceVariableNames: ''!

!RobaHuevos class methodsFor: 'firma genetica' stamp: 'JMB 5/22/2022 22:43:37'!
firmaGenetica
	^#ladrona! !


!classDefinition: #Habitat category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #Habitat
	instanceVariableNames: 'avispas cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica poblacionDeOrugas poblacionDePolillas clima'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!Habitat methodsFor: 'initialization' stamp: 'JMB 6/24/2022 18:11:12'!
initializeConAvispas: unasAvispasIniciales conPoblacionDeOrugas: unaPoblacionDeOrugas conPoblacionDePolillas: unaPoblacionDePolillas  
	avispas := unasAvispasIniciales.
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new.	
	poblacionDeOrugas := unaPoblacionDeOrugas.
	poblacionDePolillas := unaPoblacionDePolillas.
! !


!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 01:09:25'!
avispas
	^ avispas! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/17/2022 21:13:53'!
cantidadDeAvispasVivas
	^ avispas size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:44:36'!
cantidadDeAvispasVivasCumplanCon: unaCondicion 
	^ (self elegirAvispasQueCumplanCon: unaCondicion) size! !

!Habitat methodsFor: 'avispas' stamp: 'JMB 5/20/2022 20:38:25'!
elegirAvispasQueCumplanCon: unaCondicionASeleccionar 
	^ avispas select: unaCondicionASeleccionar ! !


!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:05:53'!
cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica ifAbsent: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 12:14:19'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica values sum: [ : unaCantidadDeHuevos | unaCantidadDeHuevos ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/18/2022 16:40:25'!
dejarUnHuevoDeAvispa: unaAvispaAAovar
	| cantidadDeHuevos |
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaAvispaAAovar firmaGenetica.
	self contabilizar: cantidadDeHuevos + 1 a: unaAvispaAAovar firmaGenetica.! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/22/2022 23:31:19'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas siNoHayHace: unBloqueAEvaluarSiNoHayHuevosARobar
	
	(self tieneHuevosDeAvispasQueNoSeanDe: firmasGeneticasExcluidas) 
		ifFalse: [ ^ unBloqueAEvaluarSiNoHayHuevosARobar value ].
	^ self robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas! !

!Habitat methodsFor: 'huevos de avispas' stamp: 'JMB 5/20/2022 20:41:07'!
tieneHuevosDeAvispasQueNoSeanDe: unasFirmasGeneticas

	^ self cantidadDeHuevosDeAvispas > (self cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas)! !


!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 6/24/2022 17:58:28'!
cantidadDeOrugas
	^ poblacionDeOrugas tamaño! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 6/24/2022 18:07:39'!
cantidadDePolillas
	^ poblacionDePolillas tamaño ! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 6/24/2022 17:59:33'!
tomarUnaOrugaSiNoHayHace: unBloqueAEvaluarSiNoNoHayOrugas
	poblacionDeOrugas tomarUnIndividuoSiNoHayHace: unBloqueAEvaluarSiNoNoHayOrugas! !

!Habitat methodsFor: 'alimentos de las avispas' stamp: 'JMB 6/24/2022 18:08:11'!
tomarUnaPolillaSiNoHayHace: unBloqueAEvaluarSiNoHayPolillas
	^ poblacionDePolillas tomarUnIndividuoSiNoHayHace: unBloqueAEvaluarSiNoHayPolillas ! !


!Habitat methodsFor: 'ciclo' stamp: 'JMB 6/20/2022 00:33:02'!
avanzarUnaTemporada
	self gestarNuevaGeneracionDeAvispas.
	self consumirHuevosDeAvispas.
	self avanzarUnaTemporadaEnLasPoblacionesControladas! !


!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 6/24/2022 18:07:55'!
avanzarUnaTemporadaEnLasPoblacionesControladas
	poblacionDeOrugas cambioDeTemporada.
	poblacionDePolillas cambioDeTemporada.! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/20/2022 21:05:13'!
consumirHuevosDeAvispas

	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica := Dictionary new! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/22/2022 23:12:17'!
gestarNuevaGeneracionDeAvispas
	"
	avispas := OrderedCollection new.
 	self firmasGeneticaConHuevos do: [ : unaFirmaGenetica | 		avispas addAll: (self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica)].
	"
	avispas := self firmasGeneticaConHuevos inject: OrderedCollection new addingAll: [ :  unaFirmaGenetica | 
		self gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica].! !

!Habitat methodsFor: 'ciclo - privados' stamp: 'JMB 5/22/2022 23:02:47'!
gestarNuevaGeneracionDeAvispasPara: unaFirmaGenetica
	| cantidadDeAvispasAGestar |
	cantidadDeAvispasAGestar := 		self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica.
	^ (1 to: cantidadDeAvispasAGestar) collect: [ :each | Avispa en: self con: unaFirmaGenetica ].
	! !


!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:40:46'!
cantidadDeHuevosConLasFirmasGeneticas: unasFirmasGeneticas

	^ unasFirmasGeneticas sum: [ : unaFirmaGenetica | self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGenetica ] ifEmpty: [ 0 ]! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 16:38:08'!
contabilizar: unaCantidadDeHuevos a: unaFirmaGenetica
	cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica at: unaFirmaGenetica put: unaCantidadDeHuevos! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 20:47:27'!
firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas
	^ (self firmasGeneticaConHuevos difference: firmasGeneticasExcluidas) first! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/20/2022 21:03:25'!
firmasGeneticaConHuevos
	
	^ cantidadDeHuevosDeAvispasYSuAlimentoPorLineaGenetica keys select: [: cadaFirmaGenetica | (self cantidadDeHuevosConLaFirmaGenetica: cadaFirmaGenetica) > 0]! !

!Habitat methodsFor: 'privados' stamp: 'JMB 5/18/2022 22:33:05'!
robarUnHuevoQueNoSeaDe: firmasGeneticasExcluidas
	| cantidadDeHuevos unaFirmaGeneticaARobar |
	unaFirmaGeneticaARobar := self firmaGeneticaARobarQueNoSea: firmasGeneticasExcluidas.
	cantidadDeHuevos := self cantidadDeHuevosConLaFirmaGenetica: unaFirmaGeneticaARobar.
	self contabilizar: cantidadDeHuevos - 1 a: unaFirmaGeneticaARobar.
	^ unaFirmaGeneticaARobar! !


!Habitat methodsFor: 'as yet unclassified' stamp: 'JMB 7/6/2022 19:53:34'!
cambiarClimaA: unClima
	clima := unClima! !

!Habitat methodsFor: 'as yet unclassified' stamp: 'JMB 7/6/2022 19:55:48'!
tieneClima: unClima 
	^ clima = unClima! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Habitat class
	instanceVariableNames: ''!

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 18:17:55'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: unaCantidadDeAvispasComePolillas ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas
	| unasAvispas habitat |
	habitat := self new.
	unasAvispas := (self gestarEn: habitat avispas: unaCantidadDeAvispasComeOrugas siguiendo: AlimentaCriasConOrugas new) asOrderedCollection.
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasComePolillas siguiendo: AlimentaCriasConPolillas new).
	unasAvispas addAll: (self gestarEn: habitat avispas: unaCantidadDeAvispasLadronas siguiendo: RobaHuevos new).
	^habitat
		initializeConAvispas: unasAvispas 
		conPoblacionDeOrugas: (PoblacionControlada deTamaño: unaCantidadInicialDeOrugas variandoPor: (VariacionPoblacionalConstante con: 0))
		conPoblacionDePolillas: (PoblacionControlada deTamaño: unaCantidadInicialDePolillas variandoPor: (VariacionPoblacionalConstante con: 0)).! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:03:41'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: unaCantidadDeAvispasLadronas yConOrugas: unaCantidadInicialDeOrugas conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/19/2022 23:53:25'!
conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas yConOrugas: unaCantidadInicialDeOrugas
	^ self conAvispasComeOrugas: unaCantidadDeAvispasComeOrugas comePolillas: 0 ladronas: 0 yConOrugas: unaCantidadInicialDeOrugas conPolillas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:11:29'!
conAvispasComePolillas: unaCantidadDeAvispasComePolillas yConPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: unaCantidadDeAvispasComePolillas ladronas: 0 yConOrugas: 0 conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 00:18:04'!
conOrugas: unaCantidadInicialDeOrugas
	^ self conAvispasComeOrugas: 0 comePolillas: 0 ladronas: 0 yConOrugas: unaCantidadInicialDeOrugas conPolillas: 0! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 18:18:41'!
conOrugas: unaCantidadInicialDeOrugas conVariacionPoblacional: unaVariacionPoblacional 
	^self new
		initializeConAvispas: #() 
		conPoblacionDeOrugas: (PoblacionControlada deTamaño: unaCantidadInicialDeOrugas variandoPor: unaVariacionPoblacional)
		conPoblacionDePolillas: (PoblacionControlada deTamaño: 0 variandoPor: (VariacionPoblacionalConstante con: 0)). ! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/20/2022 20:59:22'!
conPolillas: unaCantidadInicialDePolillas
	^ self conAvispasComeOrugas: 0 comePolillas: 0 ladronas: 0 yConOrugas: 0 conPolillas: unaCantidadInicialDePolillas! !

!Habitat class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 18:19:20'!
conPolillas: unaCantidadInicialDePolillas conVariacionPoblacional: unaVariacionPoblacional 
	^self new
		initializeConAvispas: #() 
		conPoblacionDeOrugas: (PoblacionControlada deTamaño: 0 variandoPor: (VariacionPoblacionalConstante con: 0))
		conPoblacionDePolillas: (PoblacionControlada deTamaño: unaCantidadInicialDePolillas variandoPor: unaVariacionPoblacional). ! !


!Habitat class methodsFor: 'privado' stamp: 'JMB 5/23/2022 18:28:54'!
gestarEn: unHabitat avispas: unaCantidadDeAvispas siguiendo: unaEstrategiaReproductiva
	^ (1 to: unaCantidadDeAvispas) collect: [ : each | Avispa en: unHabitat siguiendo: unaEstrategiaReproductiva ]
	! !


!classDefinition: #PoblacionControlada category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #PoblacionControlada
	instanceVariableNames: 'tamañoActual tamañoAlInicioDeTemporada variacion temporada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!PoblacionControlada methodsFor: 'initialization' stamp: 'JMB 6/24/2022 20:09:31'!
initializeCon: unTamaño variandoPor: unaVariacionPoblacional 
	tamañoActual := unTamaño.
	tamañoAlInicioDeTemporada := unTamaño. 
	variacion := unaVariacionPoblacional.
	temporada := 0.! !


!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 20:09:16'!
cambioDeTemporada
	temporada := temporada + 1. 
	tamañoActual := variacion evaluarEn: self.
	tamañoAlInicioDeTemporada := tamañoActual. ! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 20:07:50'!
estaEnTemporada: unaTemporada 
	^ temporada = unaTemporada! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 17:58:55'!
tamaño
	^ tamañoActual ! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 19:55:21'!
tamañoAlInicioDeTemporada
	^ tamañoAlInicioDeTemporada! !

!PoblacionControlada methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 18:00:46'!
tomarUnIndividuoSiNoHayHace: unBloqueAEvaluarSiNoNoHayIndividuos
	^ tamañoActual > 0
		ifTrue: [ 	tamañoActual := tamañoActual - 1 ]
		ifFalse: unBloqueAEvaluarSiNoNoHayIndividuos! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PoblacionControlada class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
PoblacionControlada class
	instanceVariableNames: ''!

!PoblacionControlada class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 17:49:33'!
deTamaño: unTamaño variandoPor: unaVariacionPoblacional
	^self new initializeCon: unTamaño variandoPor: unaVariacionPoblacional ! !


!classDefinition: #TareaDeEstrategiaReproductiva category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #TareaDeEstrategiaReproductiva
	instanceVariableNames: 'estrategiaReproductiva'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!TareaDeEstrategiaReproductiva methodsFor: 'initialization' stamp: 'JMB 7/6/2022 22:04:34'!
initializePara: unaEstrategiaReproductiva 
	estrategiaReproductiva := unaEstrategiaReproductiva.! !


!TareaDeEstrategiaReproductiva methodsFor: 'evaluacion' stamp: 'JMB 7/6/2022 23:49:46'!
realizarSiEsPosiblePor: unaAvispa en: unHabitat
	(self puedeRealizarseEn: unHabitat) 
		ifTrue: [ ^ self realizarPor: unaAvispa en: unHabitat ]
		ifFalse: [ ^ self ] ! !


!TareaDeEstrategiaReproductiva methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:53:54'!
climasBloqueantes
	self subclassResponsibility ! !

!TareaDeEstrategiaReproductiva methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:53:54'!
puedeRealizarseEn: unHabitat
	^ self climasBloqueantes noneSatisfy: [ : unClimaBloqueante | unHabitat tieneClima: unClimaBloqueante ] ! !

!TareaDeEstrategiaReproductiva methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:50:10'!
realizarPor: unaAvispa en: unHabitat
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TareaDeEstrategiaReproductiva class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TareaDeEstrategiaReproductiva class
	instanceVariableNames: ''!

!TareaDeEstrategiaReproductiva class methodsFor: 'instance creation' stamp: 'JMB 7/6/2022 22:13:10'!
para: unaEstrategiaReproductiva
	^self new initializePara: unaEstrategiaReproductiva ! !


!classDefinition: #Cazar category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TareaDeEstrategiaReproductiva subclass: #Cazar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!Cazar methodsFor: 'accion' stamp: 'JMB 7/6/2022 23:58:12'!
realizarPor: unaAvispa en: unHabitat
	| siguiente |
	estrategiaReproductiva tomarPresaEn: unHabitat siNoHayHace: [ ^ self ].
	siguiente := TransportarPresa para: estrategiaReproductiva.
	^ siguiente realizarSiEsPosiblePor: unaAvispa en: unHabitat.
! !


!Cazar methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:58:22'!
climasBloqueantes
	^ #(#Revuelto)! !


!classDefinition: #PonerHuevo category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TareaDeEstrategiaReproductiva subclass: #PonerHuevo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!PonerHuevo methodsFor: 'accion' stamp: 'JMB 7/6/2022 23:58:22'!
realizarPor: unaAvispa en: unHabitat
	unHabitat dejarUnHuevoDeAvispa: unaAvispa.
	^ Cazar para: estrategiaReproductiva.! !


!PonerHuevo methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:55:11'!
climasBloqueantes
	^ #(#Inundado)! !


!classDefinition: #TransportarPresa category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
TareaDeEstrategiaReproductiva subclass: #TransportarPresa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!TransportarPresa methodsFor: 'accion' stamp: 'JMB 7/6/2022 23:58:34'!
realizarPor: unaAvispa en: unHabitat
	| siguiente |
	siguiente := PonerHuevo para: estrategiaReproductiva.
	^ siguiente realizarSiEsPosiblePor: unaAvispa en: unHabitat.
! !


!TransportarPresa methodsFor: 'privado' stamp: 'JMB 7/6/2022 22:54:36'!
climasBloqueantes
	^ #(#Revuelto, #Ventoso)! !


!classDefinition: #VariacionPoblacional category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
Object subclass: #VariacionPoblacional
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!VariacionPoblacional methodsFor: 'evaluar' stamp: 'JMB 6/24/2022 19:57:52'!
evaluarEn: unaPoblacionControlada
	self subclassResponsibility ! !


!classDefinition: #VariacionPoblacionalConstante category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacional subclass: #VariacionPoblacionalConstante
	instanceVariableNames: 'tamañoDePoblacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!VariacionPoblacionalConstante methodsFor: 'initialization' stamp: 'JMB 6/24/2022 17:40:25'!
initializeCon: unTamañoDePoblacion 
	tamañoDePoblacion := unTamañoDePoblacion.! !


!VariacionPoblacionalConstante methodsFor: 'evaluar' stamp: 'JMB 6/24/2022 19:56:52'!
evaluarEn: unaPoblacionControlada
	^ tamañoDePoblacion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionalConstante class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacionalConstante class
	instanceVariableNames: ''!

!VariacionPoblacionalConstante class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 17:37:55'!
con: unTamañoDePoblacion 
	unTamañoDePoblacion < 0 ifTrue: [ self error: self mensajeDeErrorTamañoDePoblacionInvalido ].
	^self new initializeCon: unTamañoDePoblacion ! !


!VariacionPoblacionalConstante class methodsFor: 'as yet unclassified' stamp: 'JMB 6/24/2022 17:36:53'!
mensajeDeErrorTamañoDePoblacionInvalido
	^ 'El tamaño de la población debe ser mayor o igual a cero'! !


!classDefinition: #VariacionPoblacionalSegunPoblacionActual category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacional subclass: #VariacionPoblacionalSegunPoblacionActual
	instanceVariableNames: 'tasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!VariacionPoblacionalSegunPoblacionActual methodsFor: 'initialization' stamp: 'JMB 6/24/2022 17:40:31'!
initializeConTasa: unaTasa 
	tasa := unaTasa.! !


!VariacionPoblacionalSegunPoblacionActual methodsFor: 'evaluar' stamp: 'JMB 6/24/2022 19:57:23'!
evaluarEn: unaPoblacionControlada
	^ unaPoblacionControlada tamaño + (unaPoblacionControlada tamaño*tasa) truncated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionalSegunPoblacionActual class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacionalSegunPoblacionActual class
	instanceVariableNames: ''!

!VariacionPoblacionalSegunPoblacionActual class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 17:38:55'!
conTasa: unaTasa
	^ self new initializeConTasa: unaTasa! !


!classDefinition: #VariacionPoblacionalSegunPoblacionInicial category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacional subclass: #VariacionPoblacionalSegunPoblacionInicial
	instanceVariableNames: 'tasa'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!VariacionPoblacionalSegunPoblacionInicial methodsFor: 'initialization' stamp: 'JMB 6/24/2022 17:39:36'!
initializeConTasa: unaTasa 
	tasa := unaTasa.! !


!VariacionPoblacionalSegunPoblacionInicial methodsFor: 'evaluar' stamp: 'JMB 6/24/2022 19:58:15'!
evaluarEn: unaPoblacionControlada
	 
	^ unaPoblacionControlada tamañoAlInicioDeTemporada + (unaPoblacionControlada tamañoAlInicioDeTemporada*tasa) truncated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionalSegunPoblacionInicial class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacionalSegunPoblacionInicial class
	instanceVariableNames: ''!

!VariacionPoblacionalSegunPoblacionInicial class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 17:39:04'!
conTasa: unaTasa
	^ self new initializeConTasa: unaTasa! !


!classDefinition: #VariacionPoblacionalSelectiva category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacional subclass: #VariacionPoblacionalSelectiva
	instanceVariableNames: 'temporadas variacionPoblacionalParaLasTemporadasSeleccionadas variacionPoblacionalParaElRestoDeLasTemporadas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!

!VariacionPoblacionalSelectiva methodsFor: 'initialization' stamp: 'JMB 6/24/2022 20:12:39'!
initializePara: unasTemporadas usar: unaVariacionPoblacionalParaLasTemporadasSeleccionadas enCasoContrario: unaVariacionPoblacionalParaElRestoDeLasTemporadas 
	temporadas := unasTemporadas.
	variacionPoblacionalParaLasTemporadasSeleccionadas := unaVariacionPoblacionalParaLasTemporadasSeleccionadas.
	variacionPoblacionalParaElRestoDeLasTemporadas := unaVariacionPoblacionalParaElRestoDeLasTemporadas.! !


!VariacionPoblacionalSelectiva methodsFor: 'privado' stamp: 'JMB 6/24/2022 20:59:06'!
estaEnUnaTemporadaSeleccionada: unaPoblacionControlada

	^ temporadas anySatisfy: [ : unaTemporada | unaPoblacionControlada estaEnTemporada: unaTemporada]! !


!VariacionPoblacionalSelectiva methodsFor: 'evaluar' stamp: 'JMB 6/24/2022 20:59:06'!
evaluarEn: unaPoblacionControlada 
	
	(self estaEnUnaTemporadaSeleccionada: unaPoblacionControlada)
		ifTrue: [ 	^ variacionPoblacionalParaLasTemporadasSeleccionadas evaluarEn: unaPoblacionControlada ]
		ifFalse: [ ^ variacionPoblacionalParaElRestoDeLasTemporadas evaluarEn: unaPoblacionControlada ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VariacionPoblacionalSelectiva class' category: 'AlgoIII-2022-1C-1erRecu-AvispasYAbejas-P5'!
VariacionPoblacionalSelectiva class
	instanceVariableNames: ''!

!VariacionPoblacionalSelectiva class methodsFor: 'instance creation' stamp: 'JMB 6/24/2022 20:12:27'!
para: unasTemporadas usar: unVariacionPoblacionalParaLasTemporadasSeleccionadas enCasoContrario: unaVariacionPoblacionalParaElRestoDeLasTemporadas
	^self new initializePara: unasTemporadas usar: unVariacionPoblacionalParaLasTemporadasSeleccionadas enCasoContrario: unaVariacionPoblacionalParaElRestoDeLasTemporadas! !
