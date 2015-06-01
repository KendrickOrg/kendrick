as yet unclassified
generate
	algorithm = #RungeKutta ifTrue: [ visitor := KECPPRK4Visitor new ].
	algorithm = #Gillespie ifTrue: [ visitor := KECPPGillespieDirectVisitor new ].
	algorithm = #TauLeap ifTrue: [ visitor := KECPPExplicitTauLeapVisitor new ].
	algorithm = #IBM ifTrue: [ visitor := KECPPIndividualBasedVisitor new ].
	visitor visit: model