initialize opencl
testCreateKernel
	self buildProgram.
	" Create the kernel and the command queue."
	kernel := program createKernel: 'updatePropensity'.
