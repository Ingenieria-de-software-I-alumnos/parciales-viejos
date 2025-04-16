!classDefinition: #FintechTest category: 'ALGO3-2020-2C-2doParcial'!
TestCase subclass: #FintechTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:43:02'!
test01WhenCreatingAWalletItsBalanceIsZeroFiubaCoin

	| fintech walletId |
	
	fintech := Fintech new.
	
	walletId := fintech createWallet.
	
	self assert: 0*fintech coin equals: (fintech balanceOf: walletId)! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:41:49'!
test02CanNotGetBalanceOfInvalidWalletId

	| fintech |
	
	fintech := Fintech new.
	
	self 
		should: [ fintech balanceOf: Object new ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: fintech invalidWalletIdErrorMessage ]
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:41:59'!
test03CreateWalletUsesDifferentIds

	| fintech sourceWalletId targetWalletId |
	
	fintech := Fintech new.
	sourceWalletId := fintech createWallet.
	targetWalletId := fintech createWallet.
	
	self deny: sourceWalletId = targetWalletId 
	! !

!FintechTest methodsFor: 'tests' stamp: 'JMB 2/6/2021 11:44:07'!
test04WhenCreatingAPromotionalWalletItsBalanceIsOneFiubaCoin

	| fintech aWalletId |
	
	fintech := Fintech new.
	aWalletId := fintech createPromotionalWallet.
	
	self assert: 1* fintech coin equals: (fintech balanceOf: aWalletId) 
	! !


!classDefinition: #Fintech category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #Fintech
	instanceVariableNames: 'wallets coin lastWalletId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!Fintech methodsFor: 'coin' stamp: 'JMB 2/6/2021 09:06:45'!
coin
	
	coin isNil ifTrue: [ coin := BaseUnit named: 'FiubaCoin' ].
	
	^coin! !


!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:15:19'!
balanceOf: aWalletId
	^(self walletIdentifiedAs: aWalletId) balance
	! !

!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:44:19'!
createPromotionalWallet
	^ self createWalletWithBalance: 1*self coin! !

!Fintech methodsFor: 'services' stamp: 'JMB 2/6/2021 11:43:26'!
createWallet
	^ self createWalletWithBalance: 0*self coin! !


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


!classDefinition: #Wallet category: 'ALGO3-2020-2C-2doParcial'!
Object subclass: #Wallet
	instanceVariableNames: 'initialBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ALGO3-2020-2C-2doParcial'!

!Wallet methodsFor: 'initialization' stamp: 'JMB 2/6/2021 11:16:31'!
initializeWith: anInitialBalance

	initialBalance := anInitialBalance.! !


!Wallet methodsFor: 'balance' stamp: 'JMB 2/6/2021 11:15:58'!
balance
	^ initialBalance ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Wallet class' category: 'ALGO3-2020-2C-2doParcial'!
Wallet class
	instanceVariableNames: ''!

!Wallet class methodsFor: 'instance creation' stamp: 'JMB 2/6/2021 09:15:31'!
with: anInitialBalance
	^self new initializeWith: anInitialBalance! !
