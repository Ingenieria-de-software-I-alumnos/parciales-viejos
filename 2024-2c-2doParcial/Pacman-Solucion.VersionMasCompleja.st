!classDefinition: #PacmanBoardTest category: #Pacman!
TestCase subclass: #PacmanBoardTest
	instanceVariableNames: 'visitedElements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:01:42'!
test01CannotCreateABoardWithoutThePacman

	self 
		should: [ PacmanBoard representedAs: #('BPKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard characterIsMissingErrorDescriptionFor: PacmanBoard pacmanName)
		! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:04:31'!
test02CannotCreateABoardWithMoreThanOnePacman

	self 
		should: [ PacmanBoard representedAs: #('BPKCpp') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard shouldBeUniqueErrorDescriptionFor: PacmanBoard pacmanName)
		! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:04:51'!
test03CannotCreateABoardWithoutBlinky

	self 
		should: [ PacmanBoard representedAs: #('pPKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard characterIsMissingErrorDescriptionFor: PacmanBoard blinkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:42'!
test04CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ PacmanBoard representedAs: #('pBBPKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard shouldBeUniqueErrorDescriptionFor: PacmanBoard blinkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:05'!
test05CannotCreateABoardWithoutPinky

	self 
		should: [ PacmanBoard representedAs: #('pBKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard characterIsMissingErrorDescriptionFor: PacmanBoard pinkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:50'!
test06CannotCreateABoardWithMoreThanOneBlinky

	self 
		should: [ PacmanBoard representedAs: #('pBPPKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard shouldBeUniqueErrorDescriptionFor: PacmanBoard pinkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:15'!
test07CannotCreateABoardWithoutInky

	self 
		should: [ PacmanBoard representedAs: #('pBPC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard characterIsMissingErrorDescriptionFor: PacmanBoard inkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:59'!
test08CannotCreateABoardWithMoreThanOneInky

	self 
		should: [ PacmanBoard representedAs: #('pBPKKC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard shouldBeUniqueErrorDescriptionFor: PacmanBoard inkyName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:05:27'!
test09CannotCreateABoardWithoutClyde

	self 
		should: [ PacmanBoard representedAs: #('pBPK') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard characterIsMissingErrorDescriptionFor: PacmanBoard clydeName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:06:08'!
test10CannotCreateABoardWithMoreThanOneClyde

	self 
		should: [ PacmanBoard representedAs: #('pBPKCC') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard shouldBeUniqueErrorDescriptionFor: PacmanBoard clydeName)! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:07:12'!
test11AllRowsHaveSameSize

	self 
		should: [ PacmanBoard representedAs: #('pBPKC' '') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: PacmanBoard rowsMustHaveSameSizeErrorDescription! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:14:52'!
test12VisitElementsWithRightPosition

	| board |
	
	visitedElements := Dictionary new.
	
	board := PacmanBoard representedAs: #('pBPKC#-*=').
	board visitElementsWith: self.
	
	self assert: (visitedElements at: #pacman) equals: 1@1.
	self assert: (visitedElements at: #blinky) equals: 2@1.
	self assert: (visitedElements at: #pinky) equals: 3@1.
	self assert: (visitedElements at: #inky) equals: 4@1.
	self assert: (visitedElements at: #clyde) equals: 5@1.
	self assert: (visitedElements at: #wall) equals: 6@1.
	self assert: (visitedElements at: #smallPill) equals: 7@1.
	self assert: (visitedElements at: #bigPill) equals: 8@1.
	self assert: (visitedElements at: #space) equals: 9@1.
	self assert: visitedElements size equals: 9
	
	
	! !

!PacmanBoardTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:38:10'!
test13InvalidCharactersAreNotAllowed

	self 
		should: [ PacmanBoard representedAs: #('pBPKCx') ]
		raise: Error - MessageNotUnderstood 
		withMessageText: (PacmanBoard notAllowCharaterErrorDescriptionFor: $x)! !


!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:25'!
visitBigPillAt: position 
	
	visitedElements at: #bigPill put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:27'!
visitBlinkyAt: position 
	
	visitedElements at: #blinky put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:56'!
visitClydeAt: position 
	
	visitedElements at: #clyde put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:48'!
visitInkyAt: position 
	
	visitedElements at: #inky put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:10'!
visitPacmanAt: position 
	
	visitedElements at: #pacman put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:15:37'!
visitPinkyAt: position 
	
	visitedElements at: #pinky put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:14'!
visitSmallPillAt: position 
	
	visitedElements at: #smallPill put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:17:12'!
visitSpaceAt: position 
	
	visitedElements at: #space put: position ! !

!PacmanBoardTest methodsFor: 'visiting board elements' stamp: 'HAW 11/20/2024 17:16:05'!
visitWallAt: position 
	
	visitedElements at: #wall put: position ! !


!classDefinition: #PacmanGameTest category: #Pacman!
TestCase subclass: #PacmanGameTest
	instanceVariableNames: 'randomValues'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:51:48'!
test00GameStartsWithThreeLivesAndCeroPoints

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'######').
 	
	game := PacmanGame board: board randomizingWith: self.
	
	self assert: 3 equals: game pacmanLives.
	self assert: 0 equals: game points 
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:50:25'!
test01PacmanStartMovingLeft

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'######').
 	
	game := PacmanGame board: board randomizingWith: self.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#p=--#'
'######').
	! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:53:19'!
test02EatingOneSmallPillAddsOnePoint

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game tick.
	
	self assert: game points equals: 1! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:58:19'!
test03EatingSmallPillsAddsPointsAsNumberOfEatenPills

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#--p-#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game tick.
	game tick.
	
	self assert: game points equals: 2.
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#p==-#'
'######').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:56:28'!
test04EatingBigPillAddsTwoPointsPerPill

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#**p-#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game tick; tick.
	
	self assert: game points equals: 4.
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#p==-#'
'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:58:46'!
test05PacmanDoesNotGoInsideWall

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'######').

 	game := PacmanGame board: board randomizingWith: self.
	game tick.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#p=--#'
'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:59:06'!
test06PacmanCanMoveRight

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game startMovingPacmanRight.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#-=p-#'
'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:59:16'!
test07PacmanCanMoveUp

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#----#'
'#-p--#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game startMovingPacmanUp.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#-p--#'
'#-=--#'
'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 17:59:29'!
test08PacmanCanMoveDown

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#-p--#'
'#----#'
'######').
 	game := PacmanGame board: board randomizingWith: self.
	game startMovingPacmanDown.
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'######'
'#BPKC#'
'#-=--#'
'#-p--#'
'######').! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 18:02:49'!
test09BlinkyStartsMovingLeftAfterThreeTicks

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#------#'
'#-BPKC-#'
'#--p---#'
'#------#'
'########').
 	game := PacmanGame board: board randomizingWith: self.
	3 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#------#' 
'#B=PKC-#' 
'#p==---#'
'#------#'
'########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 18:03:19'!
test10PinkyStartsMovingUpAfterFourTicks

	| board game |
	
	board := PacmanBoard representedAs:#(
'#########'
'#-------#'
'#--BPKC-#'
'#---p---#'
'#-------#'
'#########').
 	game := PacmanGame board: board randomizingWith: self.
	4 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'#########'
'#---P---#'
'#B-==KC-#'
'#p===---#'
'#-------#'
'#########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:16:16'!
test11InkyStartsMovingDownAfterFiveTicks

	| board game |
	
	board := PacmanBoard representedAs:#(
'#########'
'#-------#'
'#--BPKC-#'
'#---p---#'
'#-------#'
'#########').
	randomValues := ReadStream on: #(1 1).
 	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'#########'
'#---P---#'
'#B-===C-#'
'#p===K--#'
'#-------#'
'#########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:16:30'!
test12ClydeStartsMovingRightAfterSixTicks

	| board game |
	
	board := PacmanBoard representedAs:#(
'#########'
'#-------#'
'#--BPKC-#'
'#---p---#'
'#-------#'
'#########').
	randomValues := ReadStream on: #(1 1 1 1).
 	game := PacmanGame board: board randomizingWith: self.
	6 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'#########'
'#---P---#'
'#B-====C#'
'#p===---#'
'#----K--#'
'#########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:16:36'!
test13GhostMovesUpWhenHittingAWallWithRandomThree

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#------#'
'#-BPKC-#'
'#--p---#'
'#------#'
'########').

	randomValues := ReadStream on: #(3).
 	game := PacmanGame board: board randomizingWith: self.
	4 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#B-P---#' 
'#-==KC-#' 
'#p==---#'
'#------#'
'########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:16:46'!
test14GhostMovesLeftWhenHittingAWallWithRandomTwo

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#------#'
'#-BPKC-#'
'#--p---#'
'#------#'
'########').

	randomValues := ReadStream on: #(3 1 2).
 	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#BP----#' 
'#-===C-#' 
'#p==K--#'
'#------#'
'########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:16:55'!
test15GhostMovesDownWhenHittingAWallWithRandomFour

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#------#'
'#-BPKC-#'
'#--p---#'
'#------#'
'########').

	randomValues := ReadStream on: #(3 4 2).
 	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#-P----#' 
'#B===C-#' 
'#p==K--#'
'#------#'
'########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:04'!
test16GhostMovesRightWhenHittingAWallWithRandomFive

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#------#'
'#-BPKC-#'
'#--p---#'
'#------#'
'########').

	randomValues := ReadStream on: #(3 1 5).
 	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].
	game tick.
	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#B--P--#' 
'#-===C-#' 
'#p==K--#'
'#------#'
'########').
! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:13'!
test17PacmanLoosesLifeWhenEatedByGhost

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#-BPKC-#'
'#p-----#'
'########').

	randomValues := ReadStream on: #(1 1 1).
 	game := PacmanGame board: board randomizingWith: self.
	3 timesRepeat: [ game tick ].
	game startMovingPacmanUp.
	game tick.

	self assert: game pacmanLives equals: 2.	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#=BPKC-#'
'#p-----#'
'########').

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:37'!
test18AllActorsStartAtInitialPositionWhenPacmanIsEaten

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#p-----#'
'#-BPKC-#'
'#------#'
'########').

	randomValues := ReadStream on: #(1 1 1 1 1 1 1 1 1 1 3 1 1 1).
 	game := PacmanGame board: board randomizingWith: self.
	8 timesRepeat: [ game tick ].
	game tick.

	self assert: game pacmanLives equals: 2.	
	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#p-----#'
'#-BPKC-#'
'#------#'
'########').

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 18:11:33'!
test19CannotDoAnyActionWhenPacmanHasCeroLifes

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#pBPKC-#'
'########').

	game := PacmanGame board: board randomizingWith: self.
	4*3 timesRepeat: [ game tick ].

	self assertCannotDo: [ game tick ].
	self assertCannotDo: [ game startMovingPacmanLeft ].
	self assertCannotDo: [ game startMovingPacmanUp ].
	self assertCannotDo: [ game startMovingPacmanDown ].
	self assertCannotDo: [ game startMovingPacmanRight ].

	

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 18:16:26'!
test20CannotDoAnyActionWhenAllPillsHaveBeenEaten

	| board game |
	
	board := PacmanBoard representedAs:#(
'######'
'#BPKC#'
'#*--p#'
'######').

	game := PacmanGame board: board randomizingWith: self.
	3 timesRepeat: [ game tick ].

	self assertCannotDo: [ game tick ].
	self assertCannotDo: [ game startMovingPacmanLeft ].
	self assertCannotDo: [ game startMovingPacmanUp ].
	self assertCannotDo: [ game startMovingPacmanDown ].
	self assertCannotDo: [ game startMovingPacmanRight ].

	

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:45'!
test21GhostCanPassThroughtBigPill

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#-*BPKC#'
'#p-----#'
'########').

	randomValues := ReadStream on: #(1).
	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].

	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#B*=PKC#'
'#p-----#'
'########').

	

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:51'!
test22PacmanCanPassThroughtSpace

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#--BPKC#'
'#-=p---#'
'########').

	randomValues := ReadStream on: #(1).
	game := PacmanGame board: board randomizingWith: self.
	2 timesRepeat: [ game tick ].

	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#--BPKC#'
'#p==---#'
'########').

	

! !

!PacmanGameTest methodsFor: 'tests' stamp: 'HAW 11/20/2024 19:17:55'!
test23GhostCanPassThroughtSpace

	| board game |
	
	board := PacmanBoard representedAs:#(
'########'
'#-=BPKC#'
'#-=p---#'
'########').

	randomValues := ReadStream on: #(1).
	game := PacmanGame board: board randomizingWith: self.
	5 timesRepeat: [ game tick ].

	self assert: game stringRepresentationOfBoard equals: #(
'########'
'#B==PKC#'
'#p==---#'
'########').

	

! !


!PacmanGameTest methodsFor: 'random simulation' stamp: 'HAW 11/18/2024 21:38:37'!
nextInteger: aLimit

	randomValues atEnd ifTrue: [ self error: 'random values not configured correctly' ].
	^randomValues next! !


!PacmanGameTest methodsFor: 'assertions' stamp: 'HAW 11/20/2024 18:13:00'!
assertCannotDo: aGameAction

	self 
		should: aGameAction 
		raise: Error - MessageNotUnderstood 
		withMessageText: PacmanGame gameIsOverErrorDescription! !


!classDefinition: #PacmanBoard category: #Pacman!
Object subclass: #PacmanBoard
	instanceVariableNames: 'stringRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanBoard methodsFor: 'initialization' stamp: 'HAW 11/18/2024 19:29:26'!
initializeRepresentedAs: aStringRepresentation 
	
	stringRepresentation := aStringRepresentation.! !


!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:23:48'!
bigPillCharacter

	^self class bigPillCharacter! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:20'!
blinkyCharacter

	^ self class blinkyCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:30'!
clydeCharacter

	^ self class clydeCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:39'!
inkyCharacter

	^ self class inkyCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:24:52'!
pacmanCharacter

	^ self class pacmanCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:01'!
pinkyCharacter

	^ self class pinkyCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:15'!
smallPillCharacter

	^self class smallPillCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:25:37'!
spaceCharacter

	^self class spaceCharacter ! !

!PacmanBoard methodsFor: 'element character' stamp: 'HAW 11/20/2024 17:26:00'!
wallCharacter

	^self class wallCharacter! !


!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:21'!
isBigPill: anElement

	^ anElement = self bigPillCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:36'!
isBlinky: anElement

	^ anElement = self blinkyCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:09'!
isClyde: anElement

	^ anElement = self clydeCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:57'!
isInky: anElement

	^ anElement = self inkyCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:17'!
isPacman: anElement

	^ anElement = self pacmanCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:48'!
isPinky: anElement

	^ anElement = self pinkyCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:12'!
isSmalltPill: anElement

	^ anElement = self smallPillCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:21:29'!
isSpace: anElement

	^ anElement = self spaceCharacter! !

!PacmanBoard methodsFor: 'testing' stamp: 'HAW 11/20/2024 17:20:03'!
isWall: anElement

	^ anElement = self wallCharacter! !


!PacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:27:47'!
visit: anElement at: position with: aPacmanBoardVisitor

	(self isWall: anElement) ifTrue: [ ^aPacmanBoardVisitor visitWallAt: position ].
	(self isSmalltPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSmallPillAt: position ].
	(self isBigPill: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBigPillAt: position ].
	(self isBlinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitBlinkyAt: position ].
	(self isPinky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPinkyAt: position ].
	(self isInky: anElement) ifTrue: [ ^aPacmanBoardVisitor visitInkyAt: position ].
	(self isClyde: anElement) ifTrue: [ ^aPacmanBoardVisitor visitClydeAt: position ].
	(self isPacman: anElement) ifTrue: [ ^aPacmanBoardVisitor visitPacmanAt: position ].
	(self isSpace: anElement) ifTrue: [ ^aPacmanBoardVisitor visitSpaceAt: position ].
	
	"No hay necesidad de generar un error porque no se permite crear un board con caracteres distintos a todos estos - Hernan"! !

!PacmanBoard methodsFor: 'visiting' stamp: 'HAW 11/20/2024 17:22:41'!
visitElementsWith: aPacmanBoardVisitor

	stringRepresentation withIndexDo: [ :aRow :y |
		aRow withIndexDo: [ :anElement :x | 
			self visit: anElement at: x@y with: aPacmanBoardVisitor.]]! !


!PacmanBoard methodsFor: 'extent' stamp: 'HAW 11/18/2024 19:30:10'!
extent
	
	^stringRepresentation first size @ stringRepresentation size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanBoard class' category: #Pacman!
PacmanBoard class
	instanceVariableNames: ''!

!PacmanBoard class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 17:48:03'!
representedAs: aStringRepresentation 
	
	| elementCharactersCount |
	
	elementCharactersCount := self elementCharacterCountOf: aStringRepresentation.	
	self asserltAllActorsAreIn: elementCharactersCount.
	"If I get here the ther is always a row - Hernan"
	self assertAllRowsHaveSameSizeIn: aStringRepresentation.
	
	^self new initializeRepresentedAs: aStringRepresentation 
	! !


!PacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:30'!
characterIsMissingErrorDescriptionFor: aCharacterName
	
	^aCharacterName, ' is missing'! !

!PacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:39:12'!
notAllowCharaterErrorDescriptionFor: aCharacter

	^'Character ', aCharacter asString, ' is not allowed'! !

!PacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:07:31'!
rowsMustHaveSameSizeErrorDescription
	
	^'Rows must have same number of columns'! !

!PacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 17:09:57'!
shouldBeAtLeastOneRowErrorDescription
	
	^'There sould be at least one row'! !

!PacmanBoard class methodsFor: 'error description' stamp: 'HAW 11/20/2024 16:58:01'!
shouldBeUniqueErrorDescriptionFor: aCharacterName
	
	^'There should be only one ', aCharacterName ! !


!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:43:12'!
allowedCharacters
	
	^ {
	self pacmanCharacter.
	self pinkyCharacter .
	self blinkyCharacter.
	self inkyCharacter.
	self clydeCharacter.
	self wallCharacter.
	self bigPillCharacter.
	self smallPillCharacter.
	self spaceCharacter.
	}! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:24:06'!
bigPillCharacter
	
	^ $*! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:25'!
blinkyCharacter
	
	^$B! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:42'!
clydeCharacter
	
	^$C! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:33'!
inkyCharacter
	
	^$K! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:41:25'!
pacmanCharacter
	
	^$p! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 16:56:29'!
pinkyCharacter
	
	^$P! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:24'!
smallPillCharacter
	
	^ $-! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:25:46'!
spaceCharacter
	
	^ $=! !

!PacmanBoard class methodsFor: 'elements characters' stamp: 'HAW 11/20/2024 17:26:06'!
wallCharacter
	
	^ $#! !


!PacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:12'!
blinkyName

	^ #blinky! !

!PacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:29'!
clydeName

	^ #clyde! !

!PacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:24'!
inkyName

	^ #inky! !

!PacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:05'!
pacmanName

	^ #pacman! !

!PacmanBoard class methodsFor: 'character names' stamp: 'HAW 11/20/2024 17:02:19'!
pinkyName

	^ #pinky! !


!PacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
asserltAllActorsAreIn: elementCharactersCount

	{ self pacmanName. self blinkyName. self pinkyName. self inkyName. self clydeName } do: [ :aCharacterName | 
		self assertActorIsCorrect: aCharacterName in: elementCharactersCount ]! !

!PacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:04'!
assert: anElementCharacter isAllowed: allowedCharacters

	(allowedCharacters includes: anElementCharacter) ifFalse: [ self error: (self notAllowCharaterErrorDescriptionFor: anElementCharacter) ]! !

!PacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:48:41'!
assertActorIsCorrect: aCharacterName in: elements 
	
	| characterIdentifier |
	
	characterIdentifier := self perform: (aCharacterName, #Character) asSymbol.
	(elements includes: characterIdentifier)
		ifFalse: [ self error: (self characterIsMissingErrorDescriptionFor: aCharacterName) ].
		
	(elements occurrencesOf: characterIdentifier) > 1
		ifTrue: [ self error: (self shouldBeUniqueErrorDescriptionFor: aCharacterName) ].
! !

!PacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:16'!
assertAllRowsHaveSameSizeIn: aStringRepresentation

	(aStringRepresentation allSatisfy: [ :aRow | aRow size = aStringRepresentation first size ]) ifFalse: [ 
		self error: self rowsMustHaveSameSizeErrorDescription ]! !

!PacmanBoard class methodsFor: 'assertions' stamp: 'HAW 11/20/2024 17:49:30'!
elementCharacterCountOf: aStringRepresentation

	| elementCharactersCount allowedCharacters |
	
	elementCharactersCount := Bag new.
	allowedCharacters := self allowedCharacters.
	
	aStringRepresentation do: [ :aRow |
		aRow do: [ :anElementCharacter | 
			self assert: anElementCharacter isAllowed: allowedCharacters.
			elementCharactersCount add: anElementCharacter ]].
	
	^elementCharactersCount ! !


!classDefinition: #PacmanGame category: #Pacman!
Object subclass: #PacmanGame
	instanceVariableNames: 'points grid pacman blinky ticks pinky inky clyde random boardExtent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanGame methodsFor: 'initialization' stamp: 'HAW 11/20/2024 18:45:40'!
initializeBoard: aBoard randomizingWith: aRandom  
	
	points := 0.
	ticks := 0.
	random := aRandom.
	self translateBoard: aBoard.
	
	! !


!PacmanGame methodsFor: 'points/lives' stamp: 'HAW 11/20/2024 18:53:11'!
numberOfPills
	
	^grid count: [ :anElement | anElement isPill ].! !

!PacmanGame methodsFor: 'points/lives' stamp: 'HAW 11/20/2024 18:45:18'!
pacmanLives
	
	^pacman lives ! !

!PacmanGame methodsFor: 'points/lives' stamp: 'HAW 11/16/2024 18:12:10'!
points
	
	^points! !


!PacmanGame methodsFor: 'assertions' stamp: 'HAW 11/20/2024 18:47:09'!
assertGameIsNotOver

	self isOver ifTrue: [ self error: self class gameIsOverErrorDescription ].
	! !


!PacmanGame methodsFor: 'testing' stamp: 'HAW 11/20/2024 18:47:04'!
isOver

	^ pacman isDead or: [ self numberOfPills = 0 ]! !


!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:19:41'!
ghost: aGhost wantsToMoveIntoBigPill: aBigPill 
	
	self moveGhost: aGhost into: aBigPill! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:19:41'!
ghost: aGhost wantsToMoveIntoSmallPill: aSmallPill 
	
	self moveGhost: aGhost into: aSmallPill ! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:19:55'!
ghost: aGhost wantsToMoveIntoSpace: aSpace 
	
	self moveGhost: aGhost into: aSpace 
	! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:15:50'!
ghost: aGhost wantsToMoveIntoWall: aWall 
	
	| ghostPositionElement randomDisplacementSelector |
	
	randomDisplacementSelector := random nextInteger: 5.
	
	randomDisplacementSelector = 1 ifTrue: [ ^self ].
	randomDisplacementSelector = 2 ifTrue: [ aGhost startMovingLeft ].
	randomDisplacementSelector = 3 ifTrue: [ aGhost startMovingUp ].
	randomDisplacementSelector = 4 ifTrue: [ aGhost startMovingDown ].
	randomDisplacementSelector = 5 ifTrue: [ aGhost startMovingRight ].
	
	ghostPositionElement := grid at: aGhost nextPosition.
	ghostPositionElement ghost: aGhost wantsToMoveIntoIn: self! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:20:27'!
ghostWantsToMoveIntoPacman: aGhost 
	
	pacman die.
	
	ticks > 3 ifTrue: [ self restartGhost: blinky ].
	ticks > 4 ifTrue: [ self restartGhost: pinky ].
	ticks > 5 ifTrue: [ self restartGhost: inky ].
	ticks > 6 ifTrue: [ self restartGhost: clyde ].
	
	grid at: pacman position put: Space new.
	pacman restart.
	grid at: pacman position put: pacman.
	
	ticks := 0.
! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 18:40:13'!
moveGhost: aGhost

	| ghostNextPositionElement | 

	ghostNextPositionElement := grid at: aGhost nextPosition.
	ghostNextPositionElement ghost: aGhost wantsToMoveIntoIn: self! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/20/2024 19:20:45'!
moveGhost: aGhost into: anElement

	grid at: aGhost position put: aGhost previousPositionElement.
	grid at: (aGhost moveInto: anElement) put: aGhost! !

!PacmanGame methodsFor: 'ghost movement' stamp: 'HAW 11/19/2024 16:17:06'!
restartGhost: aGhost

	grid at: aGhost position put: aGhost previousPositionElement.
	aGhost restart.
	grid at: aGhost position put: aGhost! !


!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/20/2024 18:40:26'!
movePacman

	| nextPositionElement |
	
	nextPositionElement := grid at: pacman nextPosition.
	nextPositionElement pacmanWantsToMoveIntoIn: self! !

!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/20/2024 19:22:29'!
movePacmanIntoNextPosition

	grid at: pacman position put: Space new.
	grid at: pacman move put: pacman! !

!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/20/2024 19:22:29'!
pacmanWantsToMoveToBigPill
	
	points := points + 2.
	self movePacmanIntoNextPosition
	! !

!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/20/2024 19:22:29'!
pacmanWantsToMoveToSmallPill
	
	points := points + 1.
	self movePacmanIntoNextPosition
	! !

!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/20/2024 19:22:29'!
pacmanWantsToMoveToSpace
	
	self movePacmanIntoNextPosition
	! !

!PacmanGame methodsFor: 'pacman movement' stamp: 'HAW 11/18/2024 20:37:54'!
pacmanWantsToMoveToWall
	
	! !


!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/20/2024 19:01:45'!
representationOfRowNumber: y
	
	| row |
		
	row := WriteStream on: String new.
	
	1 to: boardExtent x do: [ :x |
		row nextPut: (grid at: x@y) characterRepresentation ].
	
	^row contents ! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/20/2024 19:01:45'!
stringRepresentationOfBoard
	
	| rows |
	
	rows := OrderedCollection new.
	1 to: boardExtent y do: [ :y | 
		rows add: (self representationOfRowNumber: y) ].
	
	^rows asArray! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/20/2024 18:55:36'!
translateBoard: aBoard 
	
	grid := Dictionary new.
	boardExtent := aBoard extent.
	aBoard visitElementsWith: self! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 20:36:22'!
visitBigPillAt: aPosition 
	
	grid at: aPosition put: BigPill new! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 20:55:25'!
visitBlinkyAt: aPosition 
	
	blinky := Ghost blinkyAt: aPosition.
	grid at: aPosition put: blinky ! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 21:07:41'!
visitClydeAt: aPosition 
	
	clyde := Ghost clydeAt: aPosition.
	grid at: aPosition put: clyde! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 21:06:55'!
visitInkyAt: aPosition 
	
	inky := Ghost inkyAt: aPosition.
	grid at: aPosition put: inky! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 19:47:26'!
visitPacmanAt: aPosition 
	
	pacman := Pacman stratingAt: aPosition.
	grid at: aPosition put: pacman ! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 21:05:50'!
visitPinkyAt: aPosition 
	
	pinky := Ghost pinkyAt: aPosition.
	grid at: aPosition put: pinky! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 19:36:18'!
visitSmallPillAt: aPosition 
	
	grid at: aPosition put: SmallPill new! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/20/2024 19:11:39'!
visitSpaceAt: aPosition

	grid at: aPosition put: Space new
	
	! !

!PacmanGame methodsFor: 'board representation' stamp: 'HAW 11/18/2024 19:31:15'!
visitWallAt: aPosition 
	
	grid at: aPosition put: Wall new! !


!PacmanGame methodsFor: 'actions' stamp: 'HAW 11/20/2024 18:14:37'!
startMovingPacmanDown
	
	self assertGameIsNotOver.

	pacman startMovingDown ! !

!PacmanGame methodsFor: 'actions' stamp: 'HAW 11/20/2024 18:14:44'!
startMovingPacmanLeft

	self assertGameIsNotOver.

	pacman startMovingLeft ! !

!PacmanGame methodsFor: 'actions' stamp: 'HAW 11/20/2024 18:14:50'!
startMovingPacmanRight
	
	self assertGameIsNotOver.

	pacman startMovingRight! !

!PacmanGame methodsFor: 'actions' stamp: 'HAW 11/20/2024 18:14:55'!
startMovingPacmanUp
	
	self assertGameIsNotOver.

	pacman startMovingUp! !

!PacmanGame methodsFor: 'actions' stamp: 'HAW 11/20/2024 18:14:20'!
tick

	self assertGameIsNotOver.
	
	ticks := ticks + 1.

	self movePacman.
	
	ticks > 3 ifTrue: [ self moveGhost: blinky ].
	ticks > 4 ifTrue: [ self moveGhost: pinky ].	
	ticks > 5 ifTrue: [self moveGhost: inky ].
	ticks > 6 ifTrue: [self moveGhost: clyde ]. 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PacmanGame class' category: #Pacman!
PacmanGame class
	instanceVariableNames: ''!

!PacmanGame class methodsFor: 'instance creation' stamp: 'HAW 11/18/2024 21:31:20'!
board: aBoard randomizingWith: aRandom  
	
	^self new initializeBoard: aBoard randomizingWith: aRandom! !


!PacmanGame class methodsFor: 'error descriptions' stamp: 'HAW 11/20/2024 18:13:11'!
gameIsOverErrorDescription
	
	^'Game is over'! !


!classDefinition: #PacmanGameElement category: #Pacman!
Object subclass: #PacmanGameElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanGameElement methodsFor: 'testing' stamp: 'HAW 11/20/2024 18:23:00'!
isPill

	^false! !


!PacmanGameElement methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:25:21'!
characterRepresentation

	self subclassResponsibility! !


!PacmanGameElement methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:03:33'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame

	self subclassResponsibility! !

!PacmanGameElement methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:03:43'!
pacmanWantsToMoveIntoIn: aPacmanGame

	self subclassResponsibility! !


!classDefinition: #PacmanGameActor category: #Pacman!
PacmanGameElement subclass: #PacmanGameActor
	instanceVariableNames: 'displacement initialPosition position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!PacmanGameActor methodsFor: 'position' stamp: 'HAW 11/20/2024 18:35:17'!
nextPosition
	
	^position + displacement ! !

!PacmanGameActor methodsFor: 'position' stamp: 'HAW 11/20/2024 18:35:23'!
position
	
	^position! !


!PacmanGameActor methodsFor: 'movement' stamp: 'HAW 11/20/2024 18:34:46'!
startMovingDown
	
	displacement := 0@1! !

!PacmanGameActor methodsFor: 'movement' stamp: 'HAW 11/20/2024 18:34:53'!
startMovingLeft
	
	displacement := -1@0! !

!PacmanGameActor methodsFor: 'movement' stamp: 'HAW 11/20/2024 18:34:59'!
startMovingRight
	
	displacement := 1@0! !

!PacmanGameActor methodsFor: 'movement' stamp: 'HAW 11/20/2024 18:35:04'!
startMovingUp
	
	displacement := 0@-1! !


!PacmanGameActor methodsFor: 'restarting' stamp: 'HAW 11/20/2024 18:36:25'!
restart

	self subclassResponsibility! !


!classDefinition: #Ghost category: #Pacman!
PacmanGameActor subclass: #Ghost
	instanceVariableNames: 'name previousElement initialDisplacement characterRepresentation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!Ghost methodsFor: 'initialization' stamp: 'HAW 11/20/2024 18:28:12'!
initializeNamed: aName at: aPosition displacement: aDisplacement repesentedAs: aCharacterRepresentation  
	
	name := aName.
	
	initialPosition := aPosition.
	position := aPosition.
	
	initialDisplacement := aDisplacement.
	displacement := aDisplacement.
	
	characterRepresentation := aCharacterRepresentation.
	
	previousElement := Space new! !


!Ghost methodsFor: 'moving' stamp: 'HAW 11/18/2024 21:05:06'!
moveInto: anElement 
	
	previousElement := anElement.
	^position := self nextPosition ! !

!Ghost methodsFor: 'moving' stamp: 'HAW 11/18/2024 21:03:54'!
previousPositionElement
	
	^previousElement! !


!Ghost methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:27:20'!
characterRepresentation
	
	^characterRepresentation! !


!Ghost methodsFor: 'printing' stamp: 'HAW 11/18/2024 21:44:51'!
printOn: aStream

	aStream nextPutAll: name! !


!Ghost methodsFor: 'restarting' stamp: 'HAW 11/19/2024 14:54:49'!
restart
	
	position := initialPosition.
	displacement := initialDisplacement! !


!Ghost methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:04:27'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame

	self error: 'No hay que implementarlo' ! !

!Ghost methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:04:36'!
pacmanWantsToMoveIntoIn: aPacmanGame
 
	self error: 'No hay que implementarlo' ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ghost class' category: #Pacman!
Ghost class
	instanceVariableNames: ''!

!Ghost class methodsFor: 'names' stamp: 'HAW 11/16/2024 17:04:15'!
blinkyName
	
	^'Blinky'! !

!Ghost class methodsFor: 'names' stamp: 'HAW 11/16/2024 17:17:36'!
clydeName
	
	^'Clyde'! !

!Ghost class methodsFor: 'names' stamp: 'HAW 11/16/2024 17:16:25'!
inkyName
	
	^'Inky'! !

!Ghost class methodsFor: 'names' stamp: 'HAW 11/16/2024 17:09:32'!
pinkyName
	
	^'Pinky'! !


!Ghost class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 18:29:49'!
blinkyAt: aPosition 
	
	^self named: self blinkyName at: aPosition displacement: -1@0 representedAs: PacmanBoard blinkyCharacter ! !

!Ghost class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 18:29:59'!
clydeAt: aPosition 
	
	^self named: self clydeName at: aPosition displacement: 1@0 representedAs: PacmanBoard clydeCharacter ! !

!Ghost class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 18:30:18'!
inkyAt: aPosition 
	
	^self named: self inkyName at: aPosition displacement: 0@1 representedAs: PacmanBoard inkyCharacter ! !

!Ghost class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 18:29:35'!
named: aName at: aPosition displacement: aDisplacement representedAs: aCharacterRepresentation  
	
	^self new initializeNamed: aName at: aPosition displacement: aDisplacement repesentedAs: aCharacterRepresentation ! !

!Ghost class methodsFor: 'instance creation' stamp: 'HAW 11/20/2024 18:30:07'!
pinkyAt: aPosition 
	
	^self named: self pinkyName at: aPosition displacement: 0@-1 representedAs: PacmanBoard pinkyCharacter ! !


!classDefinition: #Pacman category: #Pacman!
PacmanGameActor subclass: #Pacman
	instanceVariableNames: 'lives'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!Pacman methodsFor: 'initialization' stamp: 'HAW 11/20/2024 18:45:58'!
initializeStratingAt: aPosition 
	
	initialPosition := aPosition.
	position := aPosition.
	lives := 3.
	self startMovingLeft! !


!Pacman methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 18:40:13'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame ghostWantsToMoveIntoPacman: aGhost! !

!Pacman methodsFor: 'actor movement' stamp: 'HAW 11/18/2024 19:54:17'!
move
	
	^position := self nextPosition ! !

!Pacman methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:05:12'!
pacmanWantsToMoveIntoIn: aPacmanGame

	self error: 'No debería pasar' ! !


!Pacman methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:35:43'!
characterRepresentation
	
	^PacmanBoard pacmanCharacter ! !


!Pacman methodsFor: 'restarting' stamp: 'HAW 11/19/2024 14:52:58'!
restart
	
	position := initialPosition.
	self startMovingLeft ! !


!Pacman methodsFor: 'lives' stamp: 'HAW 11/20/2024 18:46:44'!
die
	
	lives := lives - 1! !

!Pacman methodsFor: 'lives' stamp: 'HAW 11/20/2024 18:46:30'!
isDead
	
	^lives = 0! !

!Pacman methodsFor: 'lives' stamp: 'HAW 11/20/2024 18:46:15'!
lives
	
	^lives! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Pacman class' category: #Pacman!
Pacman class
	instanceVariableNames: ''!

!Pacman class methodsFor: 'instance creation' stamp: 'HAW 11/18/2024 19:47:43'!
stratingAt: aPosition 
	
	^self new initializeStratingAt: aPosition ! !


!classDefinition: #Pill category: #Pacman!
PacmanGameElement subclass: #Pill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!Pill methodsFor: 'testing' stamp: 'HAW 11/20/2024 18:22:20'!
isPill
	
	^true! !


!classDefinition: #BigPill category: #Pacman!
Pill subclass: #BigPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!BigPill methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:07:58'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame ghost: aGhost wantsToMoveIntoBigPill: self! !

!BigPill methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 18:40:26'!
pacmanWantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame pacmanWantsToMoveToBigPill! !


!BigPill methodsFor: 'representation' stamp: 'HAW 11/20/2024 19:09:39'!
characterRepresentation
	
	^PacmanBoard bigPillCharacter ! !


!classDefinition: #SmallPill category: #Pacman!
Pill subclass: #SmallPill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!SmallPill methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 18:40:13'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame ghost: aGhost wantsToMoveIntoSmallPill: self! !

!SmallPill methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 18:40:26'!
pacmanWantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame pacmanWantsToMoveToSmallPill! !


!SmallPill methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:37:38'!
characterRepresentation
	
	^PacmanBoard smallPillCharacter ! !


!classDefinition: #Space category: #Pacman!
PacmanGameElement subclass: #Space
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!Space methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:38:19'!
characterRepresentation
	
	^PacmanBoard spaceCharacter ! !


!Space methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:14:18'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame ghost: aGhost wantsToMoveIntoSpace: self ! !

!Space methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:12:00'!
pacmanWantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame pacmanWantsToMoveToSpace! !


!classDefinition: #Wall category: #Pacman!
PacmanGameElement subclass: #Wall
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Pacman'!

!Wall methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 19:15:38'!
ghost: aGhost wantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame ghost: aGhost wantsToMoveIntoWall: self! !

!Wall methodsFor: 'actor movement' stamp: 'HAW 11/20/2024 18:40:26'!
pacmanWantsToMoveIntoIn: aPacmanGame 
	
	aPacmanGame pacmanWantsToMoveToWall! !


!Wall methodsFor: 'representation' stamp: 'HAW 11/20/2024 18:38:46'!
characterRepresentation
	
	^PacmanBoard wallCharacter ! !
