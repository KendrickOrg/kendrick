as yet unclassified
visit: arg1 algorithm: arg2
	arg2 = #RK4
		ifTrue: [ ^ KECPPRK4Visitor new visitNode: arg1 ].
	arg2 = #Gillespie
		ifTrue: [ ^ KECPPGillespieDirectVisitor new visitNode: arg1 ].
	arg2 = #ExplicitTauLeap
		ifTrue: [ ^ KECPPExplicitTauLeapVisitor new visitNode: arg1 ].
	arg2 = #IBM
		ifTrue: [ ^ KECPPIndividualBasedVisitor new visitNode: arg1 ]