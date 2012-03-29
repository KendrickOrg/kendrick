
!PPODEParser methodsFor: 'grammar'!
number 

^ super number flatten ==> [:string | (KENumerical new) number: string asNumber]! !
