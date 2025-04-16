!classDefinition: #FintechTest category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
TestCase subclass: #FintechTest
	instanceVariableNames: 'clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 15:36:34'!
setUp
	super setUp.
	clock := ManualClock new.! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 16:20:21'!
test01WhenCreatingAWalletItsBalanceIsZeroFiubaCoin

	| fintech walletId |
	
	fintech := Fintech measuringTimeWith: clock.
	
	walletId := fintech createWallet.
	
	self assert: 0*fintech coin equals: (fintech balanceOf: walletId)! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 16:20:17'!
test02CanNotGetBalanceOfInvalidWalletId

	| fintech |
	
	fintech := Fintech measuringTimeWith: clock.
	
	self 
		should: [ fintech balanceOf: Object new ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: fintech invalidWalletIdErrorMessage ]
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 16:20:13'!
test03CreateWalletUsesDifferentIds

	| fintech sourceWalletId targetWalletId |
	
	fintech := Fintech measuringTimeWith: clock.
	sourceWalletId := fintech createWallet.
	targetWalletId := fintech createWallet.
	
	self deny: sourceWalletId = targetWalletId 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 16:20:07'!
test04WhenCreatingAPromotionalWalletItsBalanceIsOneFiubaCoin

	| fintech aWalletId |
	
	fintech := Fintech measuringTimeWith: clock.
	aWalletId := fintech createPromotionalWallet.
	
	self assert: 1* fintech coin equals: (fintech balanceOf: aWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:10:46'!
test05TransferWithdrawsAmountAndComisionFromSourceWallet

	| fintech aSourceWalletId aTargetWalletId amountToTransfer sourceWalletBalanceBeforeTransfer |
	
	fintech := Fintech measuringTimeWith: clock.
	aSourceWalletId := fintech createPromotionalWallet.
	aTargetWalletId := fintech createPromotionalWallet.
	sourceWalletBalanceBeforeTransfer := fintech balanceOf: aSourceWalletId.
	amountToTransfer := 0.5 * fintech coin.
	
	
	fintech transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId. 
	
	self assert: sourceWalletBalanceBeforeTransfer - amountToTransfer  - (amountToTransfer *0.02) equals: (fintech balanceOf: aSourceWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:11:05'!
test06ManyTransfersWithdrawAmountAndComisionFromSourceWallet

	| fintech aSourceWalletId aTargetWalletId amountToTransfer sourceWalletBalanceBeforeTransfer |
	
	fintech := Fintech measuringTimeWith: clock.
	aSourceWalletId := fintech createPromotionalWallet.
	aTargetWalletId := fintech createPromotionalWallet.
	sourceWalletBalanceBeforeTransfer := fintech balanceOf: aSourceWalletId.
	amountToTransfer := 0.25 * fintech coin.
	
	
	fintech transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId. 
	fintech transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId. 
	
	self assert: sourceWalletBalanceBeforeTransfer - (2*(amountToTransfer  + (amountToTransfer *0.02))) equals: (fintech balanceOf: aSourceWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:11:57'!
test07TransferDepositsImpactAfterOneHour

	| fintech aSourceWalletId aTargetWalletId amountToTransfer targetWalletBalanceBeforeTransfer |
	
	fintech := Fintech measuringTimeWith: clock.
	aSourceWalletId := fintech createPromotionalWallet.
	aTargetWalletId := fintech createPromotionalWallet.
	targetWalletBalanceBeforeTransfer := fintech balanceOf: aTargetWalletId.
	amountToTransfer := 0.5 * fintech coin.
	
	
	fintech transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId. 
	
	clock advanceTime: 1 * hour.
	
	self assert: targetWalletBalanceBeforeTransfer + amountToTransfer equals: (fintech balanceOf: aTargetWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:12:22'!
test08TransferDepositsDoNotImpactBeforeOneHour

	| fintech aSourceWalletId aTargetWalletId amountToTransfer targetWalletBalanceBeforeTransfer |
	
	fintech := Fintech measuringTimeWith: clock.
	aSourceWalletId := fintech createPromotionalWallet.
	aTargetWalletId := fintech createPromotionalWallet.
	targetWalletBalanceBeforeTransfer := fintech balanceOf: aTargetWalletId.
	amountToTransfer := 0.5 * fintech coin.
	
	
	fintech transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId.
	self assert: targetWalletBalanceBeforeTransfer equals: (fintech balanceOf: aTargetWalletId) 
	! !

!FintechTest methodsFor: 'tests' stamp: 'LL 3/14/2021 15:08:01'!
test09CanNotMakeTransferWithLessThanMinimumAmount
	| fintech amountToBeTransfered initialBalanceOfTargetWallet initialBalanceOfSourceWallet sourceWalletId targetWalletId |
	
	fintech := Fintech measuringTimeWith: clock.
	sourceWalletId := fintech createPromotionalWallet.
	targetWalletId := fintech createPromotionalWallet.	
	initialBalanceOfSourceWallet := fintech balanceOf: sourceWalletId.
	initialBalanceOfTargetWallet := fintech balanceOf: targetWalletId.
	amountToBeTransfered := 0.000001 * fintech coin.	
		
	self 
		should: [ fintech transfer: amountToBeTransfered from: sourceWalletId to: targetWalletId. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer transferAmountTooSmallErrorMessage.
			self assert: initialBalanceOfSourceWallet equals: (fintech balanceOf: sourceWalletId).
			clock advanceTime: fintech impactDuration.
			self assert: initialBalanceOfTargetWallet equals: (fintech balanceOf: targetWalletId) ]! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:17:17'!
test10AllTransfersAreRegistered
	| fintech sourceWalletId targetWalletId transfer |
	
	fintech := Fintech measuringTimeWith: clock.
	sourceWalletId := fintech createPromotionalWallet.
	targetWalletId := fintech createPromotionalWallet.	
	
	transfer := fintech transfer: 0.25 * fintech coin from: sourceWalletId to: targetWalletId.
		
	self assert: {transfer withdrawLeg} asOrderedCollection equals: (fintech allTransactionsOf: sourceWalletId).
	self assert: {transfer depositLeg} asOrderedCollection equals: (fintech allTransactionsOf: targetWalletId).! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:23:22'!
test11TransferDepositAreRegisteredAsPendingBeforeImpactDuration
	| fintech amountToBeTransfered sourceWalletId targetWalletId transfer |
	
	fintech := Fintech measuringTimeWith: clock.
	sourceWalletId := fintech createPromotionalWallet.
	targetWalletId := fintech createPromotionalWallet.	
	amountToBeTransfered := 0.25 * fintech coin.	
	transfer := fintech transfer: amountToBeTransfered from: sourceWalletId to: targetWalletId.
		
	self assert: {transfer depositLeg} asOrderedCollection equals: (fintech allPendingTransactionsOf: targetWalletId).! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:35:01'!
test12TransferDepositAreNotRegisteredAsPendingAfterImpactDuration
	| fintech amountToTransfer sourceWalletId targetWalletId |
	
	fintech := Fintech measuringTimeWith: clock.
	sourceWalletId := fintech createPromotionalWallet.
	targetWalletId := fintech createPromotionalWallet.	
	amountToTransfer := 0.25 * fintech coin.	
	
	fintech transfer: amountToTransfer from: sourceWalletId to: targetWalletId.

	clock advanceTime: fintech impactDuration.	
	self assert: (fintech allPendingTransactionsOf: targetWalletId) isEmpty.! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 3/1/2021 17:34:20'!
test13TransferWithdrawsAreNeverPending

	| fintech aSourceWalletId aTargetWalletId |
	
	fintech := Fintech measuringTimeWith: clock.
	aSourceWalletId := fintech createPromotionalWallet.
	aTargetWalletId := fintech createPromotionalWallet.
		
	fintech transfer: (0.5 * fintech coin) from: aSourceWalletId to: aTargetWalletId.
		 	
	self assert: (fintech allPendingTransactionsOf: aSourceWalletId) isEmpty.
	
	
	
	! !


!classDefinition: #InvestmentsTest category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
TestCase subclass: #InvestmentsTest
	instanceVariableNames: 'clock fintech'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!InvestmentsTest methodsFor: 'setUp/tearDown' stamp: 'SF 3/13/2021 09:49:33'!
setUp

	clock := ManualClock new.
	fintech := Fintech measuringTimeWith: clock.
! !


!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:08'!
test01CannotInvestZeroOrLess
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	self 
		should: [ fintech invest: 0 * fintech coin from: investingWalletId ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Investment invalidAmountErrorMessage equals: anError messageText ]	
! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:12'!
test02APositiveAmountOfFiubaCoinsCanBeInvested
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	fintech invest: 0.5 * fintech coin from: investingWalletId.

	self assert: 0.5 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:15'!
test03InvestingWhileInvestingRaisesAnError
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	fintech invest: 0.5 * fintech coin from: investingWalletId.

	self 
		should: [ fintech invest: 0.5 * fintech coin from: investingWalletId ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: fintech alreadyInvestingErrorMessage equals: anError messageText ]	
! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:19'!
test04AnotherWalletCanInvestWhileAnotherWalletIsInvesting
	|  investingWalletId anotherInvestingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	anotherInvestingWalletId := fintech createPromotionalWallet.
	
	fintech invest: 0.5 * fintech coin from: investingWalletId.
	fintech invest: 0.4 * fintech coin from: anotherInvestingWalletId.

	self assert: 0.6 * fintech coin equals: (fintech balanceOf: anotherInvestingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:24'!
test05CannotStopInvestingfNotAlreadyInvesting
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	self 
		should: [ fintech stopInvestmentOn: investingWalletId ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: fintech cannotUninvestErrorMessage equals: anError messageText ]	! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:28'!
test06SoppingInvesmentRestoresPreviousBalance
	|  investingWalletId |
	investingWalletId := self normalWalletWith1FiubaCOIN.
	
	fintech invest: 0.5 * fintech coin from: investingWalletId.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:32'!
test07AfterStoppingInvesmentCanInvestAgain
	|  investingWalletId |
	investingWalletId := self normalWalletWith1FiubaCOIN.
	
	fintech invest: 0.5 * fintech coin from: investingWalletId.
	fintech stopInvestmentOn: investingWalletId.
	fintech invest: 0.5 * fintech coin from: investingWalletId.

	self assert: 0.5 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:46'!
test08CanInvestOtherThanHalfFiubaCOIN
	|  investingWalletId |
	investingWalletId := self normalWalletWith1FiubaCOIN.
	
	fintech invest: 0.3 * fintech coin from: investingWalletId.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:51'!
test09ReturnOfInvestmentInNormalWalletInLessThanAWeekIsZero
	|  investingWalletId |
	investingWalletId := self normalWalletWith1FiubaCOIN.
	
	fintech invest: 1 * fintech coin from: investingWalletId.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:54'!
test10ReturnOfInvestmentInPromotionalWalletInLessThanAWeekIs1Percent
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	fintech invest: 1 * fintech coin from: investingWalletId.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1.01 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:08:58'!
test11ReturnOfInvestmentInNormalWalletInMoreThanAWeekIs1Percent
	|  investingWalletId |
	investingWalletId := self normalWalletWith1FiubaCOIN.
	
	fintech invest: 1 * fintech coin from: investingWalletId.
	clock advanceTime: 1 * week.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1.01 * fintech coin equals: (fintech balanceOf: investingWalletId).! !

!InvestmentsTest methodsFor: 'tests' stamp: 'LL 3/14/2021 16:09:01'!
test12ReturnOfInvestmentInPromotionalWalletInMoreThanAWeekIs2Percent
	|  investingWalletId |
	investingWalletId := fintech createPromotionalWallet.
	
	fintech invest: 1 * fintech coin from: investingWalletId.
	clock advanceTime: 1 * week.
	fintech stopInvestmentOn: investingWalletId.

	self assert: 1.02 * fintech coin equals: (fintech balanceOf: investingWalletId).! !


!InvestmentsTest methodsFor: 'test objects' stamp: 'LL 3/14/2021 16:07:46'!
normalWalletWith1FiubaCOIN
	
	| sourceWallet newWallet |
	sourceWallet := fintech createPromotionalWallet.
	newWallet := fintech createWallet.
	fintech transfer: 1 * fintech coin from: sourceWallet to: newWallet.
	clock advanceTime: 1 * hour.
	^newWallet.
! !


!classDefinition: #Clock category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!Clock methodsFor: 'public' stamp: 'LL 2/19/2021 23:36:08'!
now

	self subclassResponsibility! !


!classDefinition: #ManualClock category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!ManualClock methodsFor: 'public' stamp: 'LL 2/19/2021 23:39:23'!
advanceTime: aTimeMeasure

	now := now next: aTimeMeasure! !

!ManualClock methodsFor: 'public' stamp: 'LL 2/19/2021 23:37:05'!
now

	^ now! !

!ManualClock methodsFor: 'public' stamp: 'LL 2/24/2021 15:35:04'!
revertTime: aTimeMeasure

	now := now previous: aTimeMeasure! !


!ManualClock methodsFor: 'initialization' stamp: 'LL 2/19/2021 23:37:27'!
initialize

	now := GregorianDateTime now.! !


!classDefinition: #Fintech category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #Fintech
	instanceVariableNames: 'wallets coin lastWalletId clock investmentWallet investments'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!Fintech methodsFor: 'coin' stamp: 'JMB 2/6/2021 09:06:45'!
coin
	
	coin isNil ifTrue: [ coin := BaseUnit named: 'FiubaCoin' ].
	
	^coin! !


!Fintech methodsFor: 'initialization' stamp: 'LL 3/14/2021 15:02:58'!
initialize
	super initialize.
	wallets := Dictionary new.
	lastWalletId := 0.
	investmentWallet := Wallet with: 1000 * self coin.
	investments := Dictionary new.! !

!Fintech methodsFor: 'initialization' stamp: 'JMB 3/1/2021 15:42:12'!
initializeMeasuringTimeWith: aClock 
	clock := aClock.! !


!Fintech methodsFor: 'services' stamp: 'JMB 3/1/2021 17:24:12'!
allPendingTransactionsOf: aWalletId 
	^ (self walletIdentifiedAs: aWalletId) allPendingTransactionsAt: clock now! !

!Fintech methodsFor: 'services' stamp: 'JMB 3/1/2021 17:03:11'!
allTransactionsOf: aWalletId 
	^ (self walletIdentifiedAs: aWalletId) allTransactions
	! !

!Fintech methodsFor: 'services' stamp: 'JMB 3/1/2021 16:24:24'!
balanceOf: aWalletId
	^(self walletIdentifiedAs: aWalletId) balanceAt: clock now
	! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 14:44:08'!
createPromotionalWallet

	^ self registerNewWallet: (PromotionalWallet with: 1 * self coin).! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 14:44:27'!
createWallet
	
	^ self registerNewWallet: (Wallet with: 0 * self coin)! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 15:09:27'!
invest: investmentAmount from: investingWalletId
	
	| investingWallet investment |
	investingWallet := self walletIdentifiedAs: investingWalletId.

	self assertNotInvestingAlready: investingWalletId.

	investment := Investment amount: investmentAmount for: investingWallet beginningAt: clock now usingFundsFrom: investmentWallet.
		
	investments at: investingWalletId put: investment.! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 14:42:47'!
stopInvestmentOn: aWalletId
	
	| investment |
	self walletIdentifiedAs: aWalletId.
	
	self assertIsInvesting: aWalletId.
	
	investment := investments at: aWalletId.
	
	investment stopInvestingAt: clock now.
	
	investments removeKey: aWalletId.! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 15:07:14'!
transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId

	| aSourceWallet aTargetWallet |
	aSourceWallet := self walletIdentifiedAs: aSourceWalletId.
	aTargetWallet := self walletIdentifiedAs: aTargetWalletId.
	
	^ Transfer of: amountToTransfer from: aSourceWallet to: aTargetWallet at: clock now commission: self commission impactDuration: self impactDuration.
! !


!Fintech methodsFor: 'assertions' stamp: 'LL 3/14/2021 14:42:15'!
assertIsInvesting: uninvestingWalletId

	^ (self isInvesting: uninvestingWalletId) ifFalse: [ self signalCannotUninvestError ]! !

!Fintech methodsFor: 'assertions' stamp: 'LL 3/14/2021 14:34:51'!
assertNotInvestingAlready: investingWalletId

	^ (self isInvesting: investingWalletId) ifTrue: [ self signalAlreadyInvestingError ]! !


!Fintech methodsFor: 'transfer properties' stamp: 'SF 3/13/2021 10:04:23'!
commission
	^0.02! !

!Fintech methodsFor: 'transfer properties' stamp: 'JMB 3/1/2021 17:35:31'!
impactDuration
	^ 1* hour.! !


!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'SF 3/13/2021 10:25:06'!
alreadyInvestingErrorMessage
	^'Wallet is already investing'.! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'SF 3/13/2021 10:46:06'!
cannotUninvestErrorMessage
	^'Cannot uninvest'.! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:09:36'!
invalidWalletIdErrorMessage
	
	^'Invalid wallet id'! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'SF 3/13/2021 10:24:24'!
signalAlreadyInvestingError
	self error: self alreadyInvestingErrorMessage.! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'SF 3/13/2021 10:45:40'!
signalCannotUninvestError
	self error: self cannotUninvestErrorMessage.! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:20:27'!
signalInvalidWalletId
	
	^self error: self invalidWalletIdErrorMessage ! !


!Fintech methodsFor: 'private' stamp: 'SF 3/13/2021 11:22:35'!
isInvesting: uninvestingWalletId

	^ investments includesKey: uninvestingWalletId! !

!Fintech methodsFor: 'private' stamp: 'LL 3/14/2021 14:43:43'!
registerNewWallet: aNewWallet
	lastWalletId := lastWalletId + 1.
	wallets at: lastWalletId put: aNewWallet.
	
	^lastWalletId! !

!Fintech methodsFor: 'private' stamp: 'JMB 2/6/2021 09:29:38'!
walletIdentifiedAs: aWalletId

	^wallets at: aWalletId ifAbsent: [ self signalInvalidWalletId ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fintech class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Fintech class
	instanceVariableNames: ''!

!Fintech class methodsFor: 'instance creation' stamp: 'JMB 3/1/2021 15:41:51'!
measuringTimeWith: aClock 
	^self new initializeMeasuringTimeWith: aClock.! !


!classDefinition: #Investment category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #Investment
	instanceVariableNames: 'investingWallet beginTime amount investmentWallet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!Investment methodsFor: 'initialization' stamp: 'LL 3/14/2021 14:55:08'!
initializeAmount: investmentAmount for: aWallet beginningAt: aGregorianDateTime usingFundsFrom: anInvestmentWallet  
	amount := investmentAmount.
	investingWallet := aWallet.
	beginTime := aGregorianDateTime.
	investmentWallet := anInvestmentWallet.! !


!Investment methodsFor: 'stopping' stamp: 'LL 3/14/2021 14:53:07'!
stopInvestingAt: aMomentInTime
	
	| return |
	return := self returnWhenUninvestingAt: aMomentInTime.
	
	Transfer of: return from: investmentWallet to: investingWallet at: aMomentInTime commission: 0 impactDuration: 0.! !


!Investment methodsFor: 'private' stamp: 'SF 3/14/2021 11:04:16'!
hasPassed1WeekBy: aGregorianDateTime

	^ self isOlderThan: 1 * week at: aGregorianDateTime! !

!Investment methodsFor: 'private' stamp: 'SF 3/14/2021 10:36:05'!
isOlderThan: aDuration at: aGregorianDateTime 
	^(beginTime distanceTo: aGregorianDateTime) >= aDuration.! !

!Investment methodsFor: 'private' stamp: 'LL 3/14/2021 14:56:02'!
nonPromotionalReturnWhenUninvestingAt: aGregorianDateTime 
	^(self hasPassed1WeekBy: aGregorianDateTime)
				ifTrue: [amount * 1.01]
				ifFalse: [amount * 1.00].! !

!Investment methodsFor: 'private' stamp: 'LL 3/14/2021 14:55:51'!
promotionalReturnWhenUninvestingAt: aGregorianDateTime
	^(self hasPassed1WeekBy: aGregorianDateTime)
				ifTrue: [amount * 1.02]
				ifFalse: [amount * 1.01].! !

!Investment methodsFor: 'private' stamp: 'LL 3/14/2021 14:53:07'!
returnWhenUninvestingAt: aGregorianDateTime 
	
	^investingWallet returnFor: self at: aGregorianDateTime.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Investment class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Investment class
	instanceVariableNames: ''!

!Investment class methodsFor: 'instance creation' stamp: 'LL 3/14/2021 14:54:58'!
amount: investmentAmount for: aWallet beginningAt: aMomentInTime usingFundsFrom: anInvestmentWallet  

	self assertIsValid: investmentAmount.
	
	Transfer of: investmentAmount from: aWallet to: anInvestmentWallet at: aMomentInTime commission: 0 impactDuration: 0.
	
	^self new initializeAmount: investmentAmount for: aWallet beginningAt: aMomentInTime usingFundsFrom: anInvestmentWallet.! !


!Investment class methodsFor: 'assertions' stamp: 'LL 3/14/2021 14:39:45'!
assertIsValid: investmentAmount

	^ investmentAmount strictlyPositive ifFalse: [ self error: self invalidAmountErrorMessage ]! !


!Investment class methodsFor: 'error messages' stamp: 'LL 3/14/2021 12:39:49'!
invalidAmountErrorMessage
	^'Amount should be a positive non-zero amount of FiubaCOINs'.! !


!classDefinition: #TransactionTransferLeg category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #TransactionTransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!TransactionTransferLeg methodsFor: 'balance' stamp: 'JMB 3/1/2021 17:41:30'!
affectBalance: aBalance at: aDateAndTime 
	self subclassResponsibility ! !


!TransactionTransferLeg methodsFor: 'initialization' stamp: 'JMB 3/1/2021 17:41:14'!
initializeNewFor: aTransfer 
	transfer := aTransfer.! !


!TransactionTransferLeg methodsFor: 'testing' stamp: 'JMB 3/1/2021 17:41:00'!
isPendingAt: aDateAndTime 
	self subclassResponsibility ! !


!TransactionTransferLeg methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:40:38'!
amount
	 ^ transfer amount! !

!TransactionTransferLeg methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:49:10'!
moment
	^ transfer moment! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionTransferLeg class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
TransactionTransferLeg class
	instanceVariableNames: ''!

!TransactionTransferLeg class methodsFor: 'instance creation' stamp: 'JMB 3/1/2021 17:41:49'!
newFor: aTransfer 
	^self new initializeNewFor: aTransfer ! !


!classDefinition: #DepositTransferLeg category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
TransactionTransferLeg subclass: #DepositTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!DepositTransferLeg methodsFor: 'balance' stamp: 'JMB 3/1/2021 17:50:10'!
affectBalance: aBalance at: aDateAndTime
	(self isPendingAt: aDateAndTime) 
		ifTrue: [ ^ aBalance ]
		ifFalse: [ ^ aBalance + self amount ]! !


!DepositTransferLeg methodsFor: 'testing' stamp: 'SF 3/13/2021 11:01:40'!
isPendingAt: aDateAndTime 
	^ (self moment distanceTo: aDateAndTime) < transfer impactDuration! !


!classDefinition: #WithdrawTransferLeg category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
TransactionTransferLeg subclass: #WithdrawTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!WithdrawTransferLeg methodsFor: 'balance' stamp: 'JMB 3/1/2021 17:51:50'!
affectBalance: aBalance at: aDateAndTime
	^ aBalance - self amount - (self amount *self commission)! !


!WithdrawTransferLeg methodsFor: 'testing' stamp: 'JMB 3/1/2021 17:34:42'!
isPendingAt: aDateAndTime 
	^ false! !


!WithdrawTransferLeg methodsFor: 'accessing' stamp: 'SF 3/13/2021 10:08:46'!
commission

	^ transfer commission! !


!classDefinition: #Transfer category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'amount withdrawLeg depositLeg moment commission impactDuration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!Transfer methodsFor: 'initialization' stamp: 'SF 3/13/2021 10:08:27'!
commission

	^commission.! !

!Transfer methodsFor: 'initialization' stamp: 'LL 3/14/2021 16:12:26'!
initializeOf: anAmountToTransfer from: aWithdrawTransferLeg to: aDepositTransferLeg at: aDateAndTime commission: aCommission impactDuration: anImpactDuration   
	amount := anAmountToTransfer.
	withdrawLeg := aWithdrawTransferLeg.
	depositLeg := aDepositTransferLeg.
	moment := aDateAndTime.
	commission := aCommission.
	impactDuration := anImpactDuration.! !


!Transfer methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:46:31'!
amount
	^ amount! !

!Transfer methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:45:58'!
depositLeg
	^ depositLeg ! !

!Transfer methodsFor: 'accessing' stamp: 'SF 3/13/2021 11:01:08'!
impactDuration

	^impactDuration.! !

!Transfer methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:46:43'!
moment
	^ moment! !

!Transfer methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:46:06'!
withdrawLeg
	^ withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'LL 3/14/2021 16:12:37'!
of: anAmountToTransfer from: aSourceWallet to: aTargetWallet at: aDateAndTime commission: aCommission impactDuration: impactDuration     
	| transfer aDepositTransferLeg aWithdrawTransferLeg |
	
	self assertAmountBigEnough: anAmountToTransfer.
	
	transfer := self new.
	
	aDepositTransferLeg := DepositTransferLeg newFor: transfer.
	aWithdrawTransferLeg := WithdrawTransferLeg newFor: transfer.
	transfer initializeOf: anAmountToTransfer from: aWithdrawTransferLeg to: aDepositTransferLeg at: aDateAndTime commission: aCommission impactDuration: impactDuration.
	
	aSourceWallet register: aWithdrawTransferLeg.
	aTargetWallet register: aDepositTransferLeg.
	
	^ transfer
	! !


!Transfer class methodsFor: 'errors' stamp: 'LL 3/14/2021 15:06:15'!
signalTransferAmountTooSmall

	^ self error: self transferAmountTooSmallErrorMessage! !

!Transfer class methodsFor: 'errors' stamp: 'LL 3/14/2021 15:06:15'!
transferAmountTooSmallErrorMessage
	^ 'Transfer amount too small'! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 3/14/2021 15:07:43'!
assertAmountBigEnough: amountToBeTransfered
	
	amountToBeTransfered <= (0.000001 * Fintech new coin) ifTrue: [ self signalTransferAmountTooSmall ]! !


!classDefinition: #Wallet category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Object subclass: #Wallet
	instanceVariableNames: 'initialBalance transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!Wallet methodsFor: 'initialization' stamp: 'JMB 3/1/2021 17:47:11'!
initializeWith: anInitialBalance

	initialBalance := anInitialBalance.
	transactions := OrderedCollection new.! !


!Wallet methodsFor: 'balance' stamp: 'LL 3/14/2021 16:11:58'!
balanceAt: aDateAndTime
	^ transactions inject: initialBalance into: [ :aBalance :eachTransaction | eachTransaction affectBalance: aBalance at: aDateAndTime ]! !


!Wallet methodsFor: 'transactions' stamp: 'JMB 3/1/2021 17:47:37'!
allPendingTransactionsAt: aDateAndTime 
	^ transactions select: [ : eachTransaction | eachTransaction isPendingAt: aDateAndTime ]! !

!Wallet methodsFor: 'transactions' stamp: 'JMB 3/1/2021 18:20:45'!
allTransactions
	^ transactions copy! !

!Wallet methodsFor: 'transactions' stamp: 'LL 3/14/2021 16:11:42'!
register: aTransaction
	transactions add: aTransaction! !


!Wallet methodsFor: 'investments return' stamp: 'LL 3/14/2021 14:37:38'!
returnFor: anInvestment at: aMomentInTime

	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wallet class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Wallet class
	instanceVariableNames: ''!

!Wallet class methodsFor: 'instance creation' stamp: 'LL 3/14/2021 14:59:34'!
with: anInitialBalance
	^NormalWallet new initializeWith: anInitialBalance! !


!classDefinition: #NormalWallet category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Wallet subclass: #NormalWallet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!NormalWallet methodsFor: 'as yet unclassified' stamp: 'LL 3/14/2021 12:25:32'!
returnFor: anInvestment at: aMomentInTime

	^anInvestment nonPromotionalReturnWhenUninvestingAt: aMomentInTime! !


!classDefinition: #PromotionalWallet category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
Wallet subclass: #PromotionalWallet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!

!PromotionalWallet methodsFor: 'as yet unclassified' stamp: 'LL 3/14/2021 12:25:49'!
returnFor: anInvestment at: aMomentInTime

	^anInvestment promotionalReturnWhenUninvestingAt: aMomentInTime! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PromotionalWallet class' category: 'ALGO3-2020-2C-Recuperatorio-Solucion'!
PromotionalWallet class
	instanceVariableNames: ''!

!PromotionalWallet class methodsFor: 'as yet unclassified' stamp: 'LL 3/14/2021 12:20:38'!
with: anInitialBalance
	^PromotionalWallet new initializeWith: anInitialBalance! !
