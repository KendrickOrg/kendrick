
!PPODEGrammarTest methodsFor: 'as yet unclassified'!
testUnary

self parse:'-beta' rule: #unary.

self parse:'-(beta + 5)' rule:#unary.! !
