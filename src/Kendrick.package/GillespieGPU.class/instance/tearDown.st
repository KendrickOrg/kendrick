as yet unclassified
tearDown
	vectorTransitions  ifNotNil: [ vectorTransitions releaseMemObject ].
	vectorSpecies ifNotNil: [ vectorSpecies releaseMemObject ].
	kernel ifNotNil: [ kernel releaseKernel ].
	program ifNotNil:  [ program releaseProgram ].
	context ifNotNil: [ context releaseContext ].
