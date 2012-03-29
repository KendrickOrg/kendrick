
!PPODEParser methodsFor: 'grammar'!
identifier

^ super identifier flatten ==> [:string | (KEVariable new) symbol: string asSymbol]! !
