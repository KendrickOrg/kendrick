methods
executeOn: aModel
	| speciesArray speciesResult speciesBytes speciesBytesResult ratesArray stoichioMatrix reactantArray propensityArray propensityResult propensityBytesResult size size1 rand indexFiredReaction deltaT index  keysArray  previousT timeT  i |
	super executeOn: aModel.
	self createContext. 
	self buildProgram.
	numberSpecies := aModel compartments size.
	numberReactions := aModel transitions size.
	size := numberSpecies * 4.
	size1 := numberReactions * 4.
			
	speciesResult := Array new: numberSpecies.
	speciesBytes := ByteArray new: size.
	speciesBytesResult := ByteArray new: size.
	ratesArray := Array new: numberReactions.
	stoichioMatrix := Array new: numberReactions * numberSpecies withAll: 0.0.
	propensityArray := Array new: numberReactions withAll: (0.0 asFloat).
	propensityBytesResult := ByteArray new: size1.
	propensityResult := Array new: numberReactions.
	reactantArray := Array new: numberReactions.
	"Initialize data loaded from Kendrick model "
	speciesArray := aModel compartiments values.
	keysArray := Array newFrom: (aModel compartiments keys).
	index := 0.
	model transitions
		do: [ :tr | 
			| prob |
			tr from = #empty
				ifTrue: [ model parameters at: #inProcessingCompartment put: tr to ]
				ifFalse: [ model parameters at: #inProcessingCompartment put: tr from ].
			prob := (tr probability value: model) abs.
			ratesArray at: index put: prob asFloat.
			reactantArray at: index put: (model atCompartment: tr from).
			"1 to: numberSpecies do: [:j| stoichioMatrix at: index * numberSpecies + j put: 1.0 asFloat]."
			tr from = #empty  
				ifFalse: [ stoichioMatrix at: index * numberSpecies +(keysArray indexOf: (tr from)) put: -1 asFloat].
			tr to = #empty  
				ifFalse: [ stoichioMatrix at: index * numberSpecies +(keysArray indexOf: (tr to))   put: 1 asFloat].
			index := index + 1.
			].
		
	"tMin := 0.0.
	tMax := 1.0."
	timeT := tMin.
	previousT := timeT.
	deltaT := 0.0.	
		
	self saveCompartmentsValueAtTime: tMin.
		
		
	"Allocate buffers"
	speciesBuffer := context createBuffer: CL_MEM_READ_WRITE size: size.
	ratesBuffer := context createBuffer: CL_MEM_READ_ONLY size: size1.
	stoichBuffer := context createBuffer: CL_MEM_READ_ONLY size: numberSpecies * numberReactions * 4.
	reactantBuffer := context createBuffer: CL_MEM_READ_ONLY size: size1.
	propensityBuffer := context createBuffer: CL_MEM_READ_WRITE size: size1.
	[ tMin < tMax ]
		whileTrue: [ 
			"Create the kernel and the command queue."
			kernel := program createKernel: 'updatePropensity'.
			commandQueue := context createCommandQueueFor: device properties: 0.
			"Copy data from host memory(CPU) to device memory(GPU)"
			commandQueue
				enqueueWriteBuffer: ratesBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size1
				ptr: ratesArray asCLFloatArray.
			commandQueue
				enqueueWriteBuffer: reactantBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size1
				ptr: reactantArray asCLInt32Array.
			commandQueue
				enqueueWriteBuffer: propensityBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size1
				ptr: propensityArray asCLFloatArray.
			"Set kernel arguments updatePropensity kernel"
			kernel argAt: 0 mem: ratesBuffer.
			kernel argAt: 1 mem: reactantBuffer.
			kernel argAt: 2 mem: propensityBuffer.
			"Run the kernel."
			commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberReactions.
			"Read the arguments."
			commandQueue
				enqueueReadBuffer: propensityBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size1
				ptr: propensityBytesResult.
			propensityResult := propensityBytesResult asFloatArrayFromCL.	
			"Calculate deltaT time"
			rand := MersenneTwisterRandom new.
			deltaT := self calculateTime: rand next rates: propensityResult.
			"Select reaction or event to be fired"
			rand := MersenneTwisterRandom new.
			indexFiredReaction := self selectReaction: rand next select: propensityResult.	
			"Update species numbers"
			kernel := program createKernel: 'updateSpecies'.
			commandQueue := context createCommandQueueFor: device properties: 0.	
			"Copy data from host memory(CPU) to device memory(GPU)"
			commandQueue
				enqueueWriteBuffer: speciesBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size
				ptr: speciesArray asCLInt32Array.
			commandQueue
				enqueueWriteBuffer: stoichBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: numberReactions * numberSpecies * 4
				ptr: stoichioMatrix asCLFloatArray.	
			"Set kernel arguments updatePropensity kernel"
			kernel argAt: 0 mem: speciesBuffer.
			kernel argAt: 1 mem: stoichBuffer.
			kernel argAt: 2 int: indexFiredReaction - 1.
			kernel argAt: 3 int: numberSpecies.
			"Run the kernel."
			commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberSpecies.
			"Read the arguments."
			commandQueue
				enqueueReadBuffer: speciesBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size
				ptr: speciesBytesResult.
			speciesResult := speciesBytesResult asInt32ArrayFromCL.
			speciesArray := speciesResult.
			propensityArray := propensityResult.	
			
			i := 1.
			model population compartments keysDo: [ :k| model population compartments at: k put: (speciesArray at: i).
				i := i + 1]
			"Update simulation time"
			deltaT < 0.0
				ifFalse: [ 
					deltaT isNaN
						ifFalse: [ 
							timeT := timeT + deltaT. 
							timeT > (previousT + step) ifTrue: [
								 self saveCompartmentsValueAtTime: timeT.
								 previousT := timeT ] 
						] ] ]
					