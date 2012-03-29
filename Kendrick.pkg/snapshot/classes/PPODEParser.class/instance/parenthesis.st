
!PPODEParser methodsFor: 'grammar'!
parenthesis

^ super parenthesis ==> [:nodes |
	nodes second
	]! !
