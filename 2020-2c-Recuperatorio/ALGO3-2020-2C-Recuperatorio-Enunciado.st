!classDefinition: #FintechTest category: 'ALGO3-2020-2C-Examen-15Mar2021'!
TestCase subclass: #FintechTest
	instanceVariableNames: 'clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

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

!FintechTest methodsFor: 'tests' stamp: 'LL 3/14/2021 15:22:58'!
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


!classDefinition: #InvestmentsTest category: 'ALGO3-2020-2C-Examen-15Mar2021'!
TestCase subclass: #InvestmentsTest
	instanceVariableNames: 'clock fintech'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!InvestmentsTest methodsFor: 'setUp/tearDown' stamp: 'SF 3/13/2021 09:49:33'!
setUp

	clock := ManualClock new.
	fintech := Fintech measuringTimeWith: clock.
! !


!InvestmentsTest methodsFor: 'test objects' stamp: 'LL 3/14/2021 16:02:58'!
normalWalletWith1FiubaCOIN
	
	| sourceWallet newWallet |
	sourceWallet := fintech createPromotionalWallet.
	newWallet := fintech createWallet.
	fintech transfer: 1 * fintech coin from: sourceWallet to: newWallet.
	clock advanceTime: 1 * hour.
	^newWallet.
! !


!classDefinition: #Clock category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Object subclass: #Clock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!Clock methodsFor: 'public' stamp: 'LL 2/19/2021 23:36:08'!
now

	self subclassResponsibility! !


!classDefinition: #ManualClock category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Clock subclass: #ManualClock
	instanceVariableNames: 'now'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

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


!classDefinition: #Fintech category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Object subclass: #Fintech
	instanceVariableNames: 'wallets coin lastWalletId clock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!Fintech methodsFor: 'coin' stamp: 'JMB 2/6/2021 09:06:45'!
coin
	
	coin isNil ifTrue: [ coin := BaseUnit named: 'FiubaCoin' ].
	
	^coin! !


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

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 15:23:16'!
createPromotionalWallet
	^ self createWalletWithBalance: 1 * self coin! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 15:23:24'!
createWallet
	^ self createWalletWithBalance: 0 * self coin! !

!Fintech methodsFor: 'services' stamp: 'LL 3/14/2021 15:22:21'!
transfer: amountToTransfer from: aSourceWalletId to: aTargetWalletId
	| aSourceWallet aTargetWallet |
	aSourceWallet := self walletIdentifiedAs: aSourceWalletId.
	aTargetWallet := self walletIdentifiedAs: aTargetWalletId.
	
	^ Transfer of: amountToTransfer from: aSourceWallet to: aTargetWallet at: clock now commission: self commission impactDuration: self impactDuration.! !


!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:09:36'!
invalidWalletIdErrorMessage
	
	^'Invalid wallet id'! !

!Fintech methodsFor: 'exceptions and error descriptions' stamp: 'JMB 2/6/2021 09:20:27'!
signalInvalidWalletId
	
	^self error: self invalidWalletIdErrorMessage ! !


!Fintech methodsFor: 'initialization' stamp: 'JMB 2/6/2021 09:27:15'!
initialize
	super initialize.
	wallets := Dictionary new.
	lastWalletId := 0 ! !

!Fintech methodsFor: 'initialization' stamp: 'JMB 3/1/2021 15:42:12'!
initializeMeasuringTimeWith: aClock 
	clock := aClock.! !


!Fintech methodsFor: 'private' stamp: 'JMB 2/6/2021 11:37:41'!
createWalletWithBalance: anInitialBalance
	| wallet |
	wallet := Wallet with: anInitialBalance.
	lastWalletId := lastWalletId + 1.
	wallets at: lastWalletId put: wallet.
	
	^lastWalletId! !

!Fintech methodsFor: 'private' stamp: 'JMB 2/6/2021 09:29:38'!
walletIdentifiedAs: aWalletId

	^wallets at: aWalletId ifAbsent: [ self signalInvalidWalletId ]! !


!Fintech methodsFor: 'transfer properties' stamp: 'LL 3/14/2021 15:21:10'!
commission
	
	^ 0.02! !

!Fintech methodsFor: 'transfer properties' stamp: 'JMB 3/1/2021 17:35:31'!
impactDuration
	^ 1* hour.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fintech class' category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Fintech class
	instanceVariableNames: ''!

!Fintech class methodsFor: 'instance creation' stamp: 'JMB 3/1/2021 15:41:51'!
measuringTimeWith: aClock 
	^self new initializeMeasuringTimeWith: aClock.! !


!classDefinition: #TransactionTransferLeg category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Object subclass: #TransactionTransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!TransactionTransferLeg methodsFor: 'balance' stamp: 'JMB 3/1/2021 17:41:30'!
affectBalance: aBalance at: aDateAndTime 
	self subclassResponsibility ! !


!TransactionTransferLeg methodsFor: 'initialization' stamp: 'JMB 3/1/2021 17:41:14'!
initializeNewFor: aTransfer 
	transfer := aTransfer.! !


!TransactionTransferLeg methodsFor: 'testing' stamp: 'LL 3/13/2021 21:41:17'!
isPendingAt: aDateAndTime 
	self subclassResponsibility! !


!TransactionTransferLeg methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:40:38'!
amount
	 ^ transfer amount! !

!TransactionTransferLeg methodsFor: 'accessing' stamp: 'JMB 3/1/2021 17:49:10'!
moment
	^ transfer moment! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransactionTransferLeg class' category: 'ALGO3-2020-2C-Examen-15Mar2021'!
TransactionTransferLeg class
	instanceVariableNames: ''!

!TransactionTransferLeg class methodsFor: 'instance creation' stamp: 'JMB 3/1/2021 17:41:49'!
newFor: aTransfer 
	^self new initializeNewFor: aTransfer ! !


!classDefinition: #DepositTransferLeg category: 'ALGO3-2020-2C-Examen-15Mar2021'!
TransactionTransferLeg subclass: #DepositTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!DepositTransferLeg methodsFor: 'balance' stamp: 'JMB 3/1/2021 17:50:10'!
affectBalance: aBalance at: aDateAndTime
	(self isPendingAt: aDateAndTime) 
		ifTrue: [ ^ aBalance ]
		ifFalse: [ ^ aBalance + self amount ]! !


!DepositTransferLeg methodsFor: 'testing' stamp: 'LL 3/14/2021 15:16:22'!
isPendingAt: aDateAndTime 
	^ (self moment distanceTo: aDateAndTime) < transfer impactDuration! !


!classDefinition: #WithdrawTransferLeg category: 'ALGO3-2020-2C-Examen-15Mar2021'!
TransactionTransferLeg subclass: #WithdrawTransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!WithdrawTransferLeg methodsFor: 'balance' stamp: 'LL 3/14/2021 15:18:36'!
affectBalance: aBalance at: aDateAndTime
	^ aBalance - self amount - (self amount * self commission)! !


!WithdrawTransferLeg methodsFor: 'testing' stamp: 'JMB 3/1/2021 17:34:42'!
isPendingAt: aDateAndTime 
	^ false! !


!WithdrawTransferLeg methodsFor: 'accessing' stamp: 'LL 3/14/2021 15:16:43'!
commission

	^ transfer commission! !


!classDefinition: #Transfer category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Object subclass: #Transfer
	instanceVariableNames: 'amount withdrawLeg depositLeg moment commission impactDuration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!Transfer methodsFor: 'initialization' stamp: 'LL 3/14/2021 15:17:49'!
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

!Transfer methodsFor: 'accessing' stamp: 'SF 3/13/2021 10:08:27'!
commission

	^commission.! !

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

!classDefinition: 'Transfer class' category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'LL 3/14/2021 15:19:27'!
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


!classDefinition: #Wallet category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Object subclass: #Wallet
	instanceVariableNames: 'initialBalance transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-Examen-15Mar2021'!

!Wallet methodsFor: 'initialization' stamp: 'JMB 3/1/2021 17:47:11'!
initializeWith: anInitialBalance

	initialBalance := anInitialBalance.
	transactions := OrderedCollection new.! !


!Wallet methodsFor: 'balance' stamp: 'LL 3/13/2021 21:26:13'!
balanceAt: aDateAndTime
	^ transactions inject: initialBalance into: [ : aBalance : eachTransaction | eachTransaction affectBalance: aBalance at: aDateAndTime ]! !


!Wallet methodsFor: 'transactions' stamp: 'JMB 3/1/2021 17:47:37'!
allPendingTransactionsAt: aDateAndTime 
	^ transactions select: [ : eachTransaction | eachTransaction isPendingAt: aDateAndTime ]! !

!Wallet methodsFor: 'transactions' stamp: 'JMB 3/1/2021 18:20:45'!
allTransactions
	^ transactions copy! !

!Wallet methodsFor: 'transactions' stamp: 'LL 3/13/2021 21:26:25'!
register: aTransaction
	transactions add: aTransaction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wallet class' category: 'ALGO3-2020-2C-Examen-15Mar2021'!
Wallet class
	instanceVariableNames: ''!

!Wallet class methodsFor: 'instance creation' stamp: 'JMB 2/6/2021 09:15:31'!
with: anInitialBalance
	^self new initializeWith: anInitialBalance! !
