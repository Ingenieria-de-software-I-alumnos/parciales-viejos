!classDefinition: #PenalesTest category: #'IS1-2025-1C-1erParcial'!
TestCase subclass: #PenalesTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test01DelanteroNoPuedeApuntarHaciaAfueraDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: -1@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionTiroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol			 ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test02DelanteroNoPuedeApuntarHaciaAfueraDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 3@0 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionTiroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test03DelanteroNoPuedeApuntarHaciaAbajoDelArco
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@-1 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionTiroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test04DelanteroNoPuedeApuntarHaciaArribaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@3 arqueroSeLanzaEnDirección: 0@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionTiroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test05ArqueroNoPuedePasarseDelPaloIzquierdo
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: -1@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionArqueroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test06ArqueroNoPuedePasarseDelPaloDerecho
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 3@0.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionArqueroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test07ArqueroNoPuedeMeterseAbajoDeLaTierra
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@-1.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionArqueroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test08ArqueroNoPuedeSaltarPorEncimaDelTravesaño
	
	| arquero delantero juegoPenales pelota |
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	self 
		should: [ juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@3.] 
		raise: Error
		withExceptionDo: [ :error |
			self assert: Penal direccionArqueroFueraDeRango equals: error messageText.
			self deny: juegoPenales varEsGol ]
	! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test09DireccionesDiferentesGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@1.
	
	self assert: juegoPenales varEsGol.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante
	"varXXXX es por VAR, de 'Video Assistant Referee'"! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test10MismasDireccionesInsuficienteFuerzaGolDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 10.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: juegoPenales varEsGol.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test11MismasDireccionesSuficienteFuerzaAtajaArquero
	
	| arquero delantero juegoPenales pelota |
	
	"Caso general del juego..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self deny: juegoPenales varEsGol.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test12DelanteroQueTiraAColocarPierde50PorcFuerza
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"(delantero sacrificia potencia para ganar mayor precisión)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self deny: juegoPenales varEsGol.
	self assert: 2@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test13ArqueroQueEligeAntesDeTiroVsJabulaniAColocarSuma50PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige donde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	"(el arquero llega más cómodo y aprovecha mejor su fuerza)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 34.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 51 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test14FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que elige adonde tirarse antes de un tiro a colocar de jabulani gana 50% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 32.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: juegoPenales varEsGol.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 50 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 48 equals: juegoPenales varFuerzaResultanteDeAtajada.! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test15ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAColocarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"El Arquero que espera y se adelanta ante un tiro de jabulani a colocar ignora la 2da coordenada (altura) al atajar..."	
	"(al adelanterse encara la pelota antes de que su elevación se transforme en un problema)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 50.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test16PelotaPlayeraUsadaAColocarLeHacePerder20PorcFuerzaExtraAlDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% de fuerza adicional al delantero que la use para colocar... (no importa el arquero)"
	"(no debería ser reglamentaria... al menos no es de trapo, nos responden)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 1.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@2.
	
	self assert: juegoPenales varEsGol.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test17ArqueroQueEligeAntesDeTiroVsPlayeraAColocarSuma100PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	"(a quien madruga...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 20.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test18FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsPlayeraAColocar
	
	| arquero delantero juegoPenales pelota |
	
	"La fuerza del Delantero se reduce en 50% siempre que tira a colocar... (no importa pelota, ni arquero)"
	"La humilde pelota playera le hace perder un 20% adicional de fuerza al delantero que la use para colocar... (no importa el arquero)"
	"Arquero que elige donde lanzarse antes de un remate de una pelota playera lenta a colocar, gana un 100% de su fuerza extra..."
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 19.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: juegoPenales varEsGol.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante.
	self assert: 40 equals: juegoPenales varFuerzaResultanteDeTiro.
	self assert: 38 equals: juegoPenales varFuerzaResultanteDeAtajada! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test19ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAColocarEsDescubiertoYPuntoParaDelantero
	
	| arquero delantero juegoPenales pelota |
	
	"Arquero que espera y se adelanta ante tiro con la lenta pelota playera, siempre es descubierto por el Árbitro, y el punto se le otorga al Delantero..."
	"(lo que servía de ventaja ante la Jabulani rápida, acá es tan obvio por lo que tarda en llegar la pelota al arco, que marchás preso...)"
	
	delantero := Delantero decideTirarAColocarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero  esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: juegoPenales varEsGol.
	self assert: 0@0 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test20DelanteroTiraAMatarAlAnguloInferiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 0@0.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test21DelanteroTiraAMatarAlAnguloSuperiorIzquierdoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@2.
	
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test22DelanteroTiraAMatarAlAnguloInferiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test23DelanteroTiraAMatarAlAnguloSuperiorDerechoLaAlturaDelTiroPasaAMedio
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@2.
	
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test24DelanteroTiraAMatarNoAlAnguloMantieneDireccionTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@2 arqueroSeLanzaEnDirección: 1@1.

	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test25DelanteroTiraAMatarUsa100PorcFuerzaBase
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"(tirar a matar no es tan preciso como tirar a colocar, hay desvios de altura. Sin embargo se usa el 100% de fuerza del jugador)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:150.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@0 arqueroSeLanzaEnDirección: 2@0.
	
	self assert: juegoPenales varEsGol.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 150 equals: juegoPenales varFuerzaResultanteDeTiro! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test26DelanteroTiraAMatarConJabulaniGana20PorcFuerzaExtra
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	"(Jabulani a matar es la elección de los guerreros Z)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 120.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self deny: juegoPenales varEsGol.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test27FuerzaInsuficienteDeArqueroQueEligeAntesDeTiroVsJabulaniAMatar
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando la jabulani rápida, el Delantero gana un 20% de fuerza extra... (no importa arquero)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 119.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 2@1.
	
	self assert: juegoPenales varEsGol.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante.
	self assert: 120 equals: juegoPenales varFuerzaResultanteDeTiro.! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test28ArqueroQueEligeAntesDeTiroVsJabulaniAMatarIgnoraAlturaTiro
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que elige donde tirarse antes de un tiro de jabulani a matar, ignora la 2da coordenada (altura) al atajar..."		
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@2 arqueroSeLanzaEnDirección: 0@0.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test29ArqueroQueEsperaPorTiroYSeAdelantaVsJabulaniAMatarNuncaAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera a ver la dirección del remate de una pelota jabulani rápida a matar antes de lanzarse, nunca la ataja sin importar nada, siquiera que se adelantó..."	
	"(su poder era de más de 9000!! era impresionante, no podía moverme, sólo la ví pasar... f )"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota jabulaniSudafricanaRapida.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@1 arqueroSeLanzaEnDirección: 1@1.
	
	self assert: juegoPenales varEsGol.
	self assert: 1@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test30DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAdentro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(y voló.. y me hizo volar... y yo volé de él...  pero acá por la arbolada... y el voló.. y se estrelló por acá por la pared...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 1@0.
	
	self assert: juegoPenales varEsGol.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test31DelanteroQueNoPateaAlAnguloConPlayeraAMatarSuma2AAlturaDeDireccionPelotaAfuera
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"(El caso auspiciado por el Pipita...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 200.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@1 arqueroSeLanzaEnDirección: 0@0.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@3 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test32ArqueroQueEligeAntesDeTiroVsPlayeraAMatarAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' a los ángulos, la 2da coordenada (altura) del remate pasa a 1 (altura media)... (no importa pelota, ni arquero)"	
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 0@0 arqueroSeLanzaEnDirección: 2@1.
	
	self deny: juegoPenales varEsGol.
	self assert: 0@1 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test33ArqueroQueEligeAntesDeTiroVsPlayeraAMatarNoAlAnguloIgnoraAnchoTiro
	
	| arquero delantero juegoPenales pelota |
	
	"Si se tira 'a matar' el Delantero usa el 100% de su fuerza... (no importa pelota, ni arquero)"
	"Si se tira 'a matar' usando una pelota playera a una dirección que no es un ángulo, la 2da coordenada del remate (altura) suma 2, es decir sale volando producto de su liviandez (y que quiere retornar al mar). Si la pelota se va fuera del arco, el puntaje va al arquero... (no importa arquero)"
	"Si el arquero elige donde tirarse antes del tiro a matar de la pelota playera, ignora la 1ra coordenada del remate (ancho) al atajar..."
	"(con agacharse, quedarse parado, o saltar le alcanza...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs: 100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero eligeDireccionAntesDeTiroSuFuerzaBaseEs: 100.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 1@0 arqueroSeLanzaEnDirección: 0@2.
	
	self deny: juegoPenales varEsGol.
	self assert: 1@2 equals: juegoPenales varDireccionRemateResultante! !

!PenalesTest methodsFor: 'tests' stamp: 'LL 4/16/2025 16:49:15'!
test34ArqueroQueEsperaPorTiroYSeAdelantaVsPlayeraAMatarSiempreAtaja
	
	| arquero delantero juegoPenales pelota |
	
	"El Arquero que espera y se adelanta ante una pelota playera lenta a matar, siempre la ataja sin importar nada..."	
	"(como la pelota es taaaan lentaaa, el arquero se puede ir a tomar un cafe, verse una serie, volver y aún atajar la pelota habiendose tirado a cualquier lado. Pero igual es más rapida que cuando se la tira a colocar, donde indefectiblemente el arbitro lo detecta...)"
	
	delantero := Delantero decideTirarAMatarSuFuerzaBaseEs:100.
	pelota := Pelota playeraLentaCostaAzul.
	arquero := Arquero esperaPorTiroYSeAdelantaSuFuerzaBaseEs: 1.
	
	juegoPenales := Penal conDelantero: delantero yArquero: arquero.
	
	juegoPenales arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: 2@2 arqueroSeLanzaEnDirección: 0@0.
	
	self deny: juegoPenales varEsGol.
	self assert: 2@1 equals: juegoPenales varDireccionRemateResultante! !


!classDefinition: #Arquero category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Arquero
	instanceVariableNames: 'fuerzaBase estrategiaDeAtajada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Arquero methodsFor: 'caracteristicasBase' stamp: 'NR 9/21/2023 23:39:15'!
fuerza
	
	^fuerzaBase! !


!Arquero methodsFor: 'initialization' stamp: 'LL 4/17/2025 02:11:36'!
initializeCon: unaEstrategiaDeAtajada conFuerza: fuerzaBaseDelArquero 
	
	estrategiaDeAtajada := unaEstrategiaDeAtajada.
	fuerzaBase := fuerzaBaseDelArquero.! !


!Arquero methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:08:37'!
atajarTiroAColocarConJabulaniDurante: unPenal

	estrategiaDeAtajada recibiendoTiroAColocarConJabulaniDurante: unPenal.! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:14:39'!
atajarTiroAColocarConPlayeraDurante: unPenal

	estrategiaDeAtajada recibiendoTiroAColocarConPlayeraDurante: unPenal.! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:23:57'!
atajarTiroAMatarConJabulaniDurante: unPenal

	estrategiaDeAtajada recibiendoTiroAMatarConJabulaniDurante: unPenal.! !

!Arquero methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:28:09'!
atajarTiroAMatarConPlayeraDurante: unPenal

	estrategiaDeAtajada recibiendoTiroAMatarConPlayeraDurante: unPenal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'IS1-2025-1C-1erParcial'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 02:10:35'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: fuerzaBaseDelArquero
	
	| arquero |
	arquero := self new.
	^arquero initializeCon: (ElegirDireccion siendo: arquero) conFuerza: fuerzaBaseDelArquero! !

!Arquero class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 02:11:14'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerzaBaseDelArquero

	| arquero |
	arquero := self new.
	^arquero initializeCon: (EsperarYAdelantarse siendo: arquero) conFuerza: fuerzaBaseDelArquero! !


!classDefinition: #Delantero category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Delantero
	instanceVariableNames: 'fuerzaBase tiroAlArco'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Delantero methodsFor: 'caracteristicasBase' stamp: 'NR 9/17/2023 17:21:36'!
fuerza
	^fuerzaBase ! !


!Delantero methodsFor: 'initialization' stamp: 'LL 4/16/2025 19:33:42'!
initializeCon: unaEstrategiaDeTiroAlArco conFuerza: fuerzaBaseDelDelantero 
	
	tiroAlArco := unaEstrategiaDeTiroAlArco.
	fuerzaBase := fuerzaBaseDelDelantero.! !


!Delantero methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 01:25:14'!
patearPelota: pelota contraArquero: arquero conDireccion: direccionTiro durante: penal 
	
	tiroAlArco conPelota: pelota conArquero: arquero conDireccion: direccionTiro durante: penal! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'IS1-2025-1C-1erParcial'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 01:14:29'!
decideTirarAColocarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	| delantero |
	delantero := self new.
	^delantero initializeCon: (TiroAColocar realizadoPor: delantero) conFuerza: fuerzaBaseDelDelantero! !

!Delantero class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 01:14:58'!
decideTirarAMatarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	| delantero |
	delantero := self new.
	^delantero initializeCon: (TiroAMatar realizadoPor: delantero) conFuerza: fuerzaBaseDelDelantero! !


!classDefinition: #EstrategiaDeAtajada category: #'IS1-2025-1C-1erParcial'!
Object subclass: #EstrategiaDeAtajada
	instanceVariableNames: 'arquero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!EstrategiaDeAtajada methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:03:41'!
initializeWith: unArquero

	arquero := unArquero! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EstrategiaDeAtajada class' category: #'IS1-2025-1C-1erParcial'!
EstrategiaDeAtajada class
	instanceVariableNames: ''!

!EstrategiaDeAtajada class methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:10:47'!
siendo: arquero

	^self new initializeWith: arquero! !


!classDefinition: #ElegirDireccion category: #'IS1-2025-1C-1erParcial'!
EstrategiaDeAtajada subclass: #ElegirDireccion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!ElegirDireccion methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:06:49'!
recibiendoTiroAColocarConJabulaniDurante: unPenal

	| fuerzaResultanteDeAtajada |
	fuerzaResultanteDeAtajada := arquero fuerza * 1.5.
	unPenal registrarFuerzaResultanteDeAtajada: fuerzaResultanteDeAtajada! !

!ElegirDireccion methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:12:55'!
recibiendoTiroAColocarConPlayeraDurante: unPenal

	| fuerzaResultanteDeAtajada |
	fuerzaResultanteDeAtajada := arquero fuerza * 2.
	unPenal registrarFuerzaResultanteDeAtajada: fuerzaResultanteDeAtajada.! !

!ElegirDireccion methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:21:47'!
recibiendoTiroAMatarConJabulaniDurante: unPenal

	| arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas  :=  [:coordTiro :coordAtajada | coordTiro x = coordAtajada x].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas! !

!ElegirDireccion methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:28:38'!
recibiendoTiroAMatarConPlayeraDurante: unPenal

	| arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas  :=  [:coordTiro :coordAtajada | coordTiro y = coordAtajada y].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas.! !


!classDefinition: #EsperarYAdelantarse category: #'IS1-2025-1C-1erParcial'!
EstrategiaDeAtajada subclass: #EsperarYAdelantarse
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!EsperarYAdelantarse methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:07:26'!
recibiendoTiroAColocarConJabulaniDurante: unPenal

	| arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas  :=  [:coordTiro :coordAtajada | coordTiro x = coordAtajada x].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas.! !

!EsperarYAdelantarse methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:22:59'!
recibiendoTiroAColocarConPlayeraDurante: unPenal

	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas := [:coordTiro :coordAtajada | true].
	arqueroConFuerzaSuficiente :=  [:fuerzaRemate :fuerzaAtajada | false].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas.
	unPenal registrarArqueroConFuerzaSuficiente: arqueroConFuerzaSuficiente.! !

!EsperarYAdelantarse methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:22:50'!
recibiendoTiroAMatarConJabulaniDurante: unPenal

	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas := [:coordTiro :coordAtajada | true].
	arqueroConFuerzaSuficiente :=  [:fuerzaRemate :fuerzaAtajada | false].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas.
	unPenal registrarArqueroConFuerzaSuficiente: arqueroConFuerzaSuficiente.

	! !

!EsperarYAdelantarse methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:29:02'!
recibiendoTiroAMatarConPlayeraDurante: unPenal

	| arqueroConFuerzaSuficiente arqueroEnCoordenadasCorrectas |
	arqueroEnCoordenadasCorrectas  := [:coordTiro :coordAtajada | true].
	arqueroConFuerzaSuficiente := [:fuerzaRemate :fuerzaAtajada | true].
	unPenal registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectas.
	unPenal registrarArqueroConFuerzaSuficiente: arqueroConFuerzaSuficiente.
	! !


!classDefinition: #Pelota category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'IS1-2025-1C-1erParcial'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 01:35:54'!
jabulaniSudafricanaRapida
	
	^Jabulani new! !

!Pelota class methodsFor: 'instance creation' stamp: 'LL 4/17/2025 01:35:45'!
playeraLentaCostaAzul
	
	^Playera new! !


!classDefinition: #Jabulani category: #'IS1-2025-1C-1erParcial'!
Pelota subclass: #Jabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Jabulani methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:32:21'!
serPateadaAColocarContraArquero: arquero conFuerza: fuerzaDeTiro durante: unPenal

	arquero atajarTiroAColocarConJabulaniDurante: unPenal! !

!Jabulani methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:26:37'!
serPateadaAMatarContraArquero: arquero conFuerza: fuerzaDeTiro yDireccion: direccionTiro durante: unPenal

	| fuerzaResultanteDeTiro |
	fuerzaResultanteDeTiro := fuerzaDeTiro * 1.2.
	unPenal registrarFuerzaResultanteDeTiro: fuerzaResultanteDeTiro.
	
	arquero atajarTiroAMatarConJabulaniDurante: unPenal.! !


!classDefinition: #Playera category: #'IS1-2025-1C-1erParcial'!
Pelota subclass: #Playera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Playera methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:20:06'!
serPateadaAColocarContraArquero: arquero conFuerza: fuerzaDelTiro durante: unPenal

	| fuerzaResultanteDelTiro |
	fuerzaResultanteDelTiro := fuerzaDelTiro * 0.8.
	unPenal registrarFuerzaResultanteDeTiro: fuerzaResultanteDelTiro.
		
	arquero atajarTiroAColocarConPlayeraDurante: unPenal! !

!Playera methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:29:24'!
serPateadaAMatarContraArquero: arquero conFuerza: fuerzaDeTiro yDireccion: direccionTiro durante: unPenal

	| direccionRemate |
	(unPenal fueAlAngulo: direccionTiro) ifFalse: [
		direccionRemate := (direccionTiro x)@(direccionTiro y+2).
		unPenal registrarDireccionRemate: direccionRemate.
	].

	arquero atajarTiroAMatarConPlayeraDurante: unPenal.! !


!classDefinition: #Penal category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Penal
	instanceVariableNames: 'delantero arquero varDireccionRemate varFuerzaResultanteDeTiro varFuerzaResultanteDeAtajada varEsGol arqueroEnCoordenadasCorrectas arqueroConFuerzaSuficiente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Penal methodsFor: 'initialization' stamp: 'LL 4/16/2025 16:45:24'!
initializeConDelantero: unDelantero yArquero: unArquero 
	
	delantero := unDelantero.
	arquero := unArquero.
	varEsGol := false.
	
	! !


!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:39:48'!
arbitroDeterminaResultadoConsiderando: direccionArquero
	
	| coordenadasIgualadas fuerzaArqueroSuficiente |
	
	coordenadasIgualadas := arqueroEnCoordenadasCorrectas value: varDireccionRemate value: direccionArquero.
	fuerzaArqueroSuficiente := arqueroConFuerzaSuficiente value: varFuerzaResultanteDeTiro value: varFuerzaResultanteDeAtajada.
	
	(varDireccionRemate between: 0@0 and: 2@2) ifFalse: [
		varEsGol := false
	] ifTrue: [
		(coordenadasIgualadas and: [ fuerzaArqueroSuficiente ]) ifTrue: 			[ 
			varEsGol := false
		] ifFalse: [ 
			varEsGol := true
		]
	].
! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:41:11'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero
	
	self assertarTiroDentroDelArco: direccionTiro.
	self assertarArqueroAtajaDentroDelArco: direccionArquero.

	self registrarValoresInicialesDelVar: direccionTiro.
	
	self registrarReglasBasicasDePenales.
	
	delantero patearPelota: pelota contraArquero: arquero conDireccion: varDireccionRemate durante: self.
	
	self arbitroDeterminaResultadoConsiderando: direccionArquero.
! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:40:27'!
assertarArqueroAtajaDentroDelArco: direccionArquero

	^ (self esDentroDelArco: direccionArquero) ifFalse: [ self error: Penal direccionArqueroFueraDeRango ]! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:40:44'!
assertarTiroDentroDelArco: direccionTiro

	^(self esDentroDelArco: direccionTiro) ifFalse: [ self error: Penal direccionTiroFueraDeRango ]! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:40:27'!
esDentroDelArco: unaCoordenada

	^ unaCoordenada between: 0@0 and: 2@2! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 01:26:49'!
fueAlAngulo: direccionTiro

	^ {0@0. 0@2. 2@0. 2@2} includes: direccionTiro! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:38:36'!
registrarReglasBasicasDePenales

	arqueroEnCoordenadasCorrectas := [ :coordTiro :coordAtajada | coordTiro = coordAtajada].
	arqueroConFuerzaSuficiente := [ :fuerzaRemate :fuerzaAtajada | fuerzaRemate <= fuerzaAtajada ]! !

!Penal methodsFor: 'penal' stamp: 'LL 4/17/2025 02:38:14'!
registrarValoresInicialesDelVar: direccionTiro

	varFuerzaResultanteDeTiro := delantero fuerza.
	varFuerzaResultanteDeAtajada := arquero fuerza.	
	varDireccionRemate := direccionTiro! !


!Penal methodsFor: 'VAR' stamp: 'LL 4/17/2025 00:20:38'!
registrarDireccionRemate: direccionTiro 
	varDireccionRemate := direccionTiro! !

!Penal methodsFor: 'VAR' stamp: 'LL 4/16/2025 19:34:38'!
registrarFuerzaResultanteDeAtajada: fuerzaResultanteDeAtajada 
	varFuerzaResultanteDeAtajada := fuerzaResultanteDeAtajada! !

!Penal methodsFor: 'VAR' stamp: 'LL 4/16/2025 19:34:28'!
registrarFuerzaResultanteDeTiro: fuerzaResultanteDelTiro 
	varFuerzaResultanteDeTiro := fuerzaResultanteDelTiro! !

!Penal methodsFor: 'VAR' stamp: 'NR 9/21/2023 23:44:03'!
varDireccionRemateResultante
	
	^varDireccionRemate
	! !

!Penal methodsFor: 'VAR' stamp: 'LL 4/16/2025 16:39:40'!
varEsGol
	
	^varEsGol
	! !

!Penal methodsFor: 'VAR' stamp: 'NR 9/24/2023 08:12:18'!
varFuerzaResultanteDeAtajada
	
	^varFuerzaResultanteDeAtajada
	! !

!Penal methodsFor: 'VAR' stamp: 'NR 9/24/2023 08:12:37'!
varFuerzaResultanteDeTiro
	
	^varFuerzaResultanteDeTiro
	! !


!Penal methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 01:26:16'!
registrarArqueroConFuerzaSuficiente: arqueroConFuerzaSuficienteClosure 
	arqueroConFuerzaSuficiente := arqueroConFuerzaSuficienteClosure! !

!Penal methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 01:26:07'!
registrarArqueroEnCoordenadasCorrectas: arqueroEnCoordenadasCorrectasClosure
	arqueroEnCoordenadasCorrectas := arqueroEnCoordenadasCorrectasClosure! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Penal class' category: #'IS1-2025-1C-1erParcial'!
Penal class
	instanceVariableNames: ''!

!Penal class methodsFor: 'instance creation' stamp: 'NR 5/2/2023 06:22:13'!
conDelantero: delantero yArquero: arquero 

	^self new initializeConDelantero: delantero yArquero: arquero ! !


!Penal class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:49'!
direccionArqueroFueraDeRango
	
	^'El arquero debe lanzarse a coordenadas válidas'! !

!Penal class methodsFor: 'message errors' stamp: 'NR 9/19/2023 06:12:32'!
direccionTiroFueraDeRango
	
	^'La pelota debe dirigirse a coordenadas válidas'! !


!classDefinition: #TiroAlArco category: #'IS1-2025-1C-1erParcial'!
Object subclass: #TiroAlArco
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!TiroAlArco methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 01:16:11'!
initializeDeDelantero: unDelantero

	delantero := unDelantero! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TiroAlArco class' category: #'IS1-2025-1C-1erParcial'!
TiroAlArco class
	instanceVariableNames: ''!

!TiroAlArco class methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 01:15:56'!
realizadoPor: unDelantero

	^self new initializeDeDelantero: unDelantero! !


!classDefinition: #TiroAColocar category: #'IS1-2025-1C-1erParcial'!
TiroAlArco subclass: #TiroAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!TiroAColocar methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:31:09'!
conPelota: pelota conArquero: arquero conDireccion: direccionTiro durante: unPenal

	| fuerzaDelTiro |
	fuerzaDelTiro := delantero fuerza * 0.5.
	unPenal registrarFuerzaResultanteDeTiro: fuerzaDelTiro.

	pelota serPateadaAColocarContraArquero: arquero conFuerza: fuerzaDelTiro durante: unPenal.! !


!classDefinition: #TiroAMatar category: #'IS1-2025-1C-1erParcial'!
TiroAlArco subclass: #TiroAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!TiroAMatar methodsFor: 'as yet unclassified' stamp: 'LL 4/17/2025 02:32:01'!
conPelota: pelota conArquero: arquero conDireccion: direccionTiro durante: unPenal

	| direccionRemate |
	
	unPenal registrarFuerzaResultanteDeTiro: delantero fuerza.
	
	(unPenal fueAlAngulo: direccionTiro) ifTrue: [
		direccionRemate := (direccionTiro x)@1.
		unPenal registrarDireccionRemate: direccionRemate.
	].
		
	pelota serPateadaAMatarContraArquero: arquero conFuerza: delantero fuerza yDireccion: direccionTiro durante: unPenal.! !
