
!PPODEGrammar methodsFor: 'grammar'!
power
	^ primary separatedBy: $^ asParser token trim! !
