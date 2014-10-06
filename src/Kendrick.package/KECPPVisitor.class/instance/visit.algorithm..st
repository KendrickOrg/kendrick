as yet unclassified
visit: model algorithm: algorithm
	algorithm = #RK4 ifTrue: [ ^ (KECPPRK4Visitor new) visitNode: model ].
	algorithm = #GillespieDirect ifTrue: [ ^ (KECPPGillespieDirectVisitor new) visitNode: model ].
	algorithm = #ExplicitTauLeap ifTrue: [ ^ (KECPPExplicitTauLeapVisitor new) visitNode: model ].
	algorithm = #IBMDiscreteTime ifTrue: [ ^ (KECPPIndividualBasedVisitor new) visitNode: model ] 