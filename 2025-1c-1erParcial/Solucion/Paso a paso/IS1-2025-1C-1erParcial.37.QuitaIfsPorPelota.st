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
	instanceVariableNames: 'xxx fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Arquero methodsFor: 'caracteristicasBase' stamp: 'NR 9/21/2023 23:39:15'!
fuerza
	
	^fuerzaBase! !

!Arquero methodsFor: 'caracteristicasBase' stamp: 'LL 4/16/2025 16:52:24'!
xxx
	
	^xxx! !


!Arquero methodsFor: 'initialization' stamp: 'LL 4/16/2025 16:52:15'!
initializeCon: unXXX conFuerza: fuerzaBaseDelArquero 
	
	xxx := unXXX.
	fuerzaBase := fuerzaBaseDelArquero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Arquero class' category: #'IS1-2025-1C-1erParcial'!
Arquero class
	instanceVariableNames: ''!

!Arquero class methodsFor: 'instance creation' stamp: 'LL 4/16/2025 16:52:09'!
eligeDireccionAntesDeTiroSuFuerzaBaseEs: fuerzaBaseDelArquero
	
	^self new initializeCon: #EligeDireccionAntesTiro conFuerza: fuerzaBaseDelArquero! !

!Arquero class methodsFor: 'instance creation' stamp: 'LL 4/16/2025 16:52:09'!
esperaPorTiroYSeAdelantaSuFuerzaBaseEs: fuerzaBaseDelArquero

	^self new initializeCon: #EsperaTiroYSeAdelanta conFuerza: fuerzaBaseDelArquero! !


!classDefinition: #Delantero category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Delantero
	instanceVariableNames: 'tecnicaDeRemate fuerzaBase'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Delantero methodsFor: 'caracteristicasBase' stamp: 'NR 9/17/2023 17:21:36'!
fuerza
	^fuerzaBase ! !

!Delantero methodsFor: 'caracteristicasBase' stamp: 'JMB 4/21/2025 17:24:45'!
rematar: unPenal vs: unArquero con: unaPelota
	
	^tecnicaDeRemate aplicarEn: unPenal vs: unArquero con: unaPelota! !


!Delantero methodsFor: 'initialization' stamp: 'JMB 4/21/2025 17:24:07'!
initializeCon: unXXX conFuerza: fuerzaBaseDelDelantero 
	
	tecnicaDeRemate := unXXX.
	fuerzaBase := fuerzaBaseDelDelantero.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Delantero class' category: #'IS1-2025-1C-1erParcial'!
Delantero class
	instanceVariableNames: ''!

!Delantero class methodsFor: 'instance creation' stamp: 'JMB 4/21/2025 16:59:44'!
decideTirarAColocarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	| delantero |
	delantero := self new.
	delantero initializeCon: (RemateAColocar de: delantero) conFuerza: fuerzaBaseDelDelantero.
	^ delantero! !

!Delantero class methodsFor: 'instance creation' stamp: 'JMB 4/21/2025 17:00:16'!
decideTirarAMatarSuFuerzaBaseEs: fuerzaBaseDelDelantero
	
	| delantero |
	delantero := self new.
	delantero initializeCon: (RemateAMatar de: delantero) conFuerza: fuerzaBaseDelDelantero.
	^ delantero! !


!classDefinition: #Pelota category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Pelota
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!


!Pelota methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:39:05'!
serRematadaAColocarEn: unPenal vs: unArquero
	self subclassResponsibility ! !

!Pelota methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:41:36'!
serRematadaAMatarEn: unPenal vs: unArquero
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pelota class' category: #'IS1-2025-1C-1erParcial'!
Pelota class
	instanceVariableNames: ''!

!Pelota class methodsFor: 'instance creation' stamp: 'JMB 4/21/2025 17:41:05'!
jabulaniSudafricanaRapida
	
	^ PelotaJabulani new! !

!Pelota class methodsFor: 'instance creation' stamp: 'JMB 4/21/2025 17:41:16'!
playeraLentaCostaAzul
	
	^PelotaPlayera new! !


!classDefinition: #PelotaJabulani category: #'IS1-2025-1C-1erParcial'!
Pelota subclass: #PelotaJabulani
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!PelotaJabulani methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:38:10'!
serRematadaAColocarEn: unPenal vs: unArquero

	unArquero xxx  = #EligeDireccionAntesTiro ifTrue:[
		unPenal fuerzaResultanteDeAtajada:  unArquero fuerza * 1.5.
	].
	unArquero xxx = #EsperaTiroYSeAdelanta ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | coordTiro x = coordAtajada x ].
	].! !

!PelotaJabulani methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:40:07'!
serRematadaAMatarEn: unPenal vs: unArquero

	unPenal afectarFuerzaResultanteDelTiroCon: 1.2.

	unArquero xxx  = #EligeDireccionAntesTiro ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | coordTiro x = coordAtajada x ].
	].
	unArquero xxx = #EsperaTiroYSeAdelanta ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | false ].
	].! !


!classDefinition: #PelotaPlayera category: #'IS1-2025-1C-1erParcial'!
Pelota subclass: #PelotaPlayera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!PelotaPlayera methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:38:44'!
serRematadaAColocarEn: unPenal vs: unArquero
	unPenal afectarFuerzaResultanteDelTiroCon: 0.8.

	unArquero xxx  = #EligeDireccionAntesTiro ifTrue:[
		unPenal fuerzaResultanteDeAtajada:  unArquero fuerza * 2.
	].
	unArquero xxx = #EsperaTiroYSeAdelanta ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | false ].
	].! !

!PelotaPlayera methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:40:32'!
serRematadaAMatarEn: unPenal vs: unArquero
	unPenal siNoFueAlAnguloAfectarDireccionDelTiroCon: [ :direccionDelTiro |  direccionDelTiro + (0@2)].

	unArquero xxx  = #EligeDireccionAntesTiro ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | coordTiro y = coordAtajada y ].
	].
	unArquero xxx = #EsperaTiroYSeAdelanta ifTrue:[
		unPenal arqueroEnCoordenadasCorrectas: [ :coordTiro :coordAtajada | true ].
		unPenal arqueroConFuerzaSuficiente: [ :fuerzaRemate :fuerzaAtajada | true].
	].! !


!classDefinition: #Penal category: #'IS1-2025-1C-1erParcial'!
Object subclass: #Penal
	instanceVariableNames: 'delantero arquero varDireccionRemate varFuerzaResultanteDeTiro varFuerzaResultanteDeAtajada varEsGol direccionRemate fuerzaResultanteDelTiro fuerzaResultanteDeAtajada arqueroEnCoordenadasCorrectas arqueroConFuerzaSuficiente direccionInicialDelTiro'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!Penal methodsFor: 'initialization' stamp: 'LL 4/16/2025 16:45:24'!
initializeConDelantero: unDelantero yArquero: unArquero 
	
	delantero := unDelantero.
	arquero := unArquero.
	varEsGol := false.
	
	! !


!Penal methodsFor: 'privado' stamp: 'JMB 4/20/2025 20:44:50'!
asegurarQueElArquiroNoSaleDelArco: direccionArquero

	^ (direccionArquero between: 0@0 and: 2@2) ifFalse: [ self error: self class direccionArqueroFueraDeRango ]! !

!Penal methodsFor: 'privado' stamp: 'JMB 4/20/2025 20:43:46'!
asegurarQueLaDireccionDeTiroVaAlArco: direccionTiro

	^ (direccionTiro between: 0@0 and: 2@2) ifFalse: [ self error: self class direccionTiroFueraDeRango ]! !


!Penal methodsFor: 'penal' stamp: 'JMB 4/21/2025 17:25:16'!
arbitroPitaConPelota: pelota delanteroRemataAlArcoConDireccion: direccionTiro arqueroSeLanzaEnDirección: direccionArquero
	
	|   coordenadasIgualadas fuerzaArqueroSuficiente    |
	
	self asegurarQueLaDireccionDeTiroVaAlArco: direccionTiro.
	self asegurarQueElArquiroNoSaleDelArco: direccionArquero.

	"empieza el algoritmo principal"
	fuerzaResultanteDelTiro := delantero fuerza.
	fuerzaResultanteDeAtajada := arquero fuerza.	
	direccionInicialDelTiro := direccionTiro.
	direccionRemate := direccionTiro.

	"reglas básicas de los penales (tests 9-11)"
	arqueroEnCoordenadasCorrectas := [ :coordTiro :coordAtajada | coordTiro = coordAtajada ].
	arqueroConFuerzaSuficiente := [ :fuerzaRemate :fuerzaAtajada | fuerzaAtajada >= fuerzaRemate ].
	
	delantero rematar: self vs: arquero con: pelota.

	"Informacion que reporta el VAR. De acá en adelante no debería ser necesario cambiar nada para que pasen los tests."

	varDireccionRemate := direccionRemate.
	varFuerzaResultanteDeTiro := fuerzaResultanteDelTiro.
	varFuerzaResultanteDeAtajada := fuerzaResultanteDeAtajada.

	coordenadasIgualadas := arqueroEnCoordenadasCorrectas value: direccionRemate value: direccionArquero.
	fuerzaArqueroSuficiente := arqueroConFuerzaSuficiente value: fuerzaResultanteDelTiro value: fuerzaResultanteDeAtajada.
	
	(direccionRemate between: 0@0 and: 2@2) ifFalse: [
		varEsGol := false
	] ifTrue: [
		(coordenadasIgualadas and: [ fuerzaArqueroSuficiente ]) ifTrue: 			[ 
			varEsGol := false
		] ifFalse: [ 
			varEsGol := true
		]
	].! !

!Penal methodsFor: 'penal' stamp: 'JMB 4/20/2025 20:40:05'!
fueAlAngulo: direccionTiro
	"hice una implemetacion diferente, lo malo que tiene es que no verifica que este dentro del arco, pero no fallan los tests."	
	"^(direccionTiro y = 0 or: [ direccionTiro y = 2]) and: [ direccionTiro x ~=  1 ]"
	^ {0@0. 0@2. 2@0. 2@2} includes: direccionTiro ! !


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


!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:32:31'!
afectarFuerzaResultanteDelTiroCon: unFactor 
	fuerzaResultanteDelTiro := fuerzaResultanteDelTiro * unFactor! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/20/2025 21:20:49'!
arqueroConFuerzaSuficiente: unCriterioDeComparacionDeFuerzaEntreArqueroYDelantero
	arqueroConFuerzaSuficiente := unCriterioDeComparacionDeFuerzaEntreArqueroYDelantero! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/20/2025 21:13:30'!
arqueroEnCoordenadasCorrectas: unCriterioDeAtajada 
	arqueroEnCoordenadasCorrectas := unCriterioDeAtajada! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/20/2025 21:19:48'!
direccionRemate: unaDireccion
	direccionRemate := unaDireccion! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/20/2025 21:11:33'!
fuerzaResultanteDeAtajada: aFuerzaResultanteDelTiro 
	fuerzaResultanteDeAtajada := aFuerzaResultanteDelTiro! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:10:15'!
siFueAlAnguloAfectarDireccionDelTiroCon: unClosure 
	| direccion |
	(self fueAlAngulo: direccionInicialDelTiro) ifTrue: [ 
		direccion := unClosure value: direccionInicialDelTiro.
		self direccionRemate: direccion. 
	].! !

!Penal methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:14:40'!
siNoFueAlAnguloAfectarDireccionDelTiroCon: unClosure 
	| direccion |
	(self fueAlAngulo: direccionInicialDelTiro) ifFalse: [ 
		direccion := unClosure value: direccionInicialDelTiro.
		self direccionRemate: direccion. 
	].! !

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


!classDefinition: #TecnicaDeRemate category: #'IS1-2025-1C-1erParcial'!
Object subclass: #TecnicaDeRemate
	instanceVariableNames: 'delantero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!TecnicaDeRemate methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:17:45'!
aplicarEn: unPenal vs: unArquero con: unaPelota
	self subclassResponsibility ! !


!TecnicaDeRemate methodsFor: 'initialization' stamp: 'JMB 4/21/2025 16:57:57'!
initializeCon: unDelantero
	delantero := unDelantero. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TecnicaDeRemate class' category: #'IS1-2025-1C-1erParcial'!
TecnicaDeRemate class
	instanceVariableNames: ''!

!TecnicaDeRemate class methodsFor: 'instance creation' stamp: 'JMB 4/21/2025 16:57:25'!
de: unDelantero
	^ self new initializeCon: unDelantero ! !


!classDefinition: #RemateAColocar category: #'IS1-2025-1C-1erParcial'!
TecnicaDeRemate subclass: #RemateAColocar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!RemateAColocar methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:39:31'!
aplicarEn: unPenal vs: unArquero con: unaPelota 
	unPenal afectarFuerzaResultanteDelTiroCon: 0.5.
	unaPelota serRematadaAColocarEn: unPenal vs: unArquero.! !


!classDefinition: #RemateAMatar category: #'IS1-2025-1C-1erParcial'!
TecnicaDeRemate subclass: #RemateAMatar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-2025-1C-1erParcial'!

!RemateAMatar methodsFor: 'as yet unclassified' stamp: 'JMB 4/21/2025 17:42:28'!
aplicarEn: unPenal vs: unArquero con: unaPelota 
	
	unPenal siFueAlAnguloAfectarDireccionDelTiroCon: [ :direccionDelTiro |  direccionDelTiro x@1 ].
	unaPelota serRematadaAMatarEn: unPenal vs: unArquero.! !
