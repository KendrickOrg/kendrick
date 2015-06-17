methods
executeOn:aModel
	| speciesArray speciesResult speciesBytes speciesBytesResult ratesArray stoichioMatrix reactantArray propensityArray propensityResult propensityBytesResult   size size1 rand indexFiredReaction deltaT|
		
	self createContext.
	self buildProgram.
	numberSpecies := aModel compartments size.
	numberReactions := aModel transitions size.
	size := numberSpecies * 4.
	size1 := numberReactions  * 4.

	speciesResult := Array new: numberSpecies.	
	speciesBytes := ByteArray new: size.
	speciesBytesResult := ByteArray new: size.
	
	ratesArray := Array new: numberReactions.
	stoichioMatrix := Array new: numberReactions  * numberSpecies.
	
	propensityArray := Array new: numberReactions.
	propensityBytesResult := ByteArray new: size1.	
	propensityResult := Array new: numberReactions.
	
	reactantArray := Array new: numberReactions.
	
	"Initialize data"
	speciesArray := aModel compartiments values.
	model transitions do: [ :tr :i| 
		|prob|
		(tr from = #empty)
		ifTrue: [ model parameters at: #inProcessingCompartment put: (tr to) ] 
		ifFalse: [ model parameters at: #inProcessingCompartment put: (tr from) ].
		prob := (tr probability value: model) abs.
		ratesArray at: i put: prob asFloat.
		reactantArray at: i put: (model atCompartment: tr from).
		].
	
	stoichioMatrix at: 1  put:  -1 asFloat.
	stoichioMatrix at: 2  put:   0 asFloat.
	stoichioMatrix at: 3  put:   0 asFloat.
	stoichioMatrix at: 4  put:   2 asFloat.
	stoichioMatrix at: 5  put:  -1 asFloat.
	stoichioMatrix at: 6  put:   0 asFloat.
	stoichioMatrix at: 7  put:  -2 asFloat.
	stoichioMatrix at: 8  put:   1 asFloat.
	stoichioMatrix at: 9  put:   0 asFloat.
	stoichioMatrix at: 10 put:  0 asFloat.
	stoichioMatrix at: 11 put: -1 asFloat.
	stoichioMatrix at: 12 put:  1 asFloat.

	(1 to: numberReactions) do: [ :i |
		propensityArray at: i put: 0 asFloat. 
	].
		
	tMin := Float new.
	tMax := Float new.
	tMin := 0.0.
	tMax := 1.0.
	deltaT := 0.0.
	
	"Allocate buffers"
	speciesBuffer := context createBuffer:  CL_MEM_READ_WRITE size:size.
	ratesBuffer := context createBuffer:  CL_MEM_READ_ONLY size: size1.
	stoichBuffer := context createBuffer:  CL_MEM_READ_ONLY size: (numberSpecies * numberReactions * 4).
	reactantBuffer := context createBuffer:  CL_MEM_READ_ONLY size: size1.
	propensityBuffer := context createBuffer:  CL_MEM_READ_WRITE size: size1.
	
	[tMin < tMax] whileTrue: [
 		"Create the kernel and the command queue."
		kernel := program createKernel: 'updatePropensity'.
		commandQueue := context createCommandQueueFor: device properties: 0.
		"Copy data from host memory(CPU) to device memory(GPU)"
		commandQueue enqueueWriteBuffer: ratesBuffer  blocking:  CL_BLOCKING  offset: 0 size: size1  		ptr:(ratesArray asCLFloatArray).
		commandQueue enqueueWriteBuffer: reactantBuffer blocking:  CL_BLOCKING  offset: 0 size: size1  		ptr:(reactantArray asCLInt32Array).
		commandQueue enqueueWriteBuffer: propensityBuffer blocking:  CL_BLOCKING  offset: 0 size: size1 		ptr:(propensityArray asCLFloatArray).
		"Set kernel arguments updatePropensity kernel"
		kernel argAt: 0 mem: ratesBuffer.
		kernel argAt: 1 mem: reactantBuffer.
		kernel argAt: 2 mem: propensityBuffer.
		"Run the kernel."
		commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberReactions.
		"Read the arguments."
		commandQueue enqueueReadBuffer: propensityBuffer blocking:  CL_BLOCKING offset: 0 size: size1 ptr: 		propensityBytesResult.
	
		propensityResult := propensityBytesResult asFloatArrayFromCL.
		"Calculate the time deltaT"
		rand := MersenneTwisterRandom new. 
		deltaT := self calculateTime:  (rand next) rates: propensityResult.
		"select reaction or event to be fired"
		rand := MersenneTwisterRandom new. 
		indexFiredReaction := self selectReaction: (rand next) select: propensityResult.
		
		"Update species numbers"
		kernel := program createKernel: 'updateSpecies'.
		commandQueue := context createCommandQueueFor: device properties: 0.
		"Copy data from host memory(CPU) to device memory(GPU)"
		commandQueue enqueueWriteBuffer: speciesBuffer blocking:  CL_BLOCKING  offset: 0 size: size  		ptr:(speciesArray asCLInt32Array).
		commandQueue enqueueWriteBuffer: stoichBuffer blocking:  CL_BLOCKING  offset: 0 size: 	(numberReactions * 		numberSpecies * 4) ptr:(stoichioMatrix asCLFloatArray).
		"Set kernel arguments updatePropensity kernel"
		kernel argAt: 0 mem: speciesBuffer.
		kernel argAt: 1 mem: stoichBuffer.
		kernel argAt: 2 int: (indexFiredReaction - 1).
		kernel argAt: 3 int: numberSpecies.
		"Run the kernel."
		commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberSpecies.
		"Read the arguments."
		commandQueue enqueueReadBuffer: speciesBuffer blocking:  CL_BLOCKING offset: 0 size: size ptr: 		speciesBytesResult.	
	
		speciesResult := speciesBytesResult asInt32ArrayFromCL.
		speciesArray := speciesResult.
		propensityArray := propensityResult.
		
		"Update simulation time"
		(deltaT < 0.0) ifFalse: [ (deltaT isNaN) ifFalse: [tMin := tMin + deltaT. 
										Transcript show: tMin; show:'  '; show: speciesArray asString;cr.]]. 
	].

