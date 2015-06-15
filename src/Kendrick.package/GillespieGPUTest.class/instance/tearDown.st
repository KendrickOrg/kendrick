initialize opencl
tearDown
	speciesBuffer ifNotNil: [ speciesBuffer  releaseMemObject ].
	ratesBuffer  ifNotNil: [ ratesBuffer releaseMemObject ].
	stoichBuffer ifNotNil: [ stoichBuffer  releaseMemObject ].
	reactantBuffer ifNotNil: [ reactantBuffer  releaseMemObject ].
	kernel ifNotNil: [ kernel releaseKernel ].
	program ifNotNil:  [ program releaseProgram ].
	context ifNotNil: [ context releaseContext ].
