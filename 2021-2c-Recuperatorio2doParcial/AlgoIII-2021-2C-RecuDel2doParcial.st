!classDefinition: #RecuperatorioTest category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
TestCase subclass: #RecuperatorioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AlgoIII-2021-2C-RecuDel2doParcial'!

!RecuperatorioTest methodsFor: 'as yet unclassified' stamp: 'SF 12/19/2021 15:51:42'!
test00PodemosUsarMedidasDeElectricidadYAgua

	self assert: 10 * ep equals: 0 * ep + (10 * ep).
	self assert: 15 * wp equals: 0 * wp + (15 * wp).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RecuperatorioTest class' category: 'AlgoIII-2021-2C-RecuDel2doParcial'!
RecuperatorioTest class
	instanceVariableNames: ''!

!RecuperatorioTest class methodsFor: 'class initialization' stamp: 'SF 12/19/2021 15:02:52'!
initialize

	"Este método está para crear unidades"
	"No lo deben tocar ni darle importancia durante el examen"
	
	| ep wp |
	ep := BaseUnit named: 'energypoint' sign: 'ep'.
	wp := BaseUnit named: 'waterpoint' sign: 'wp'.
	
	Smalltalk at: #ep put: ep.
	Smalltalk at: #wp put: wp.! !

RecuperatorioTest initialize!