operations
DirectMethod: aFloatVector kernelName: kernelName into: resultBuffer
	| program kernel |
	program := VirtualGPU programFor: VGPULinearAlgebraSources >> #vectorKernels.
	kernel := program kernelNamed: kernelName.
	