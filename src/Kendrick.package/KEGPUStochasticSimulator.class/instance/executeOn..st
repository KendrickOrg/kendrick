methods
executeOn: aModel
	| speciesArray speciesResult speciesBytes speciesBytesResult ratesArray stoichioMatrix reactantArray propensityArray propensityResult propensityBytesResult size size1 rand indexFiredReaction deltaT index indexRates  keysArray  previousT timeT  i |
	super executeOn: aModel.
	self createContext. 
	self buildProgram.
	numberSpecies := model population compartments size.
	numberReactions := model transitions size.
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
	speciesArray := (model population compartments values).
	keysArray := Array newFrom: (model population compartments keys).
	index := 0.
	indexRates := 1.
	
	model transitions
		do: [ :tr | 
			| prob |
			tr from = #empty
				ifTrue: [ model currentCompartment: tr to ]
				ifFalse: [ model currentCompartment: tr from ].
			prob := (tr probability value: model) abs.
			ratesArray at: indexRates put: prob asFloat.
			reactantArray at: indexRates put: (model atCompartment: tr from).
			"1 to: numberSpecies do: [:j| stoichioMatrix at: index * numberSpecies + j put: 1.0 asFloat]."
			tr from = #empty  
				ifFalse: [ stoichioMatrix at: index * numberSpecies +(keysArray indexOf: (tr from)) put: -1 asFloat].
			tr to = #empty  
				ifFalse: [ stoichioMatrix at: index * numberSpecies +(keysArray indexOf: (tr to))   put: 1 asFloat].
			index := index + 1.
			indexRates := indexRates +1.
			].
	"
	Transcript show: ratesArray;cr; show:stoichioMatrix;cr. 	
		self halt."
	
	"tMin := 0.0."
	tMax := 10.0.
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

	
	
	kernel := program createKernel: 'updatePropensity'.
	commandQueue := context createCommandQueueFor: device properties: 0.
	kernel1 := program createKernel: 'updateSpecies'.
	commandQueue1 := context createCommandQueueFor: device properties: 0.
	
	
	[ timeT < tMax ]
		whileTrue: [ 
			"Create the kernel and the command queue."
			
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
			deltaT := (self calculateTime: rand next rates: propensityResult).
			"Select reaction or event to be fired"
			rand := Random new.
			indexFiredReaction := self selectReaction: rand next select: propensityResult.	
			
				
			"Copy data from host memory(CPU) to device memory(GPU)"
			commandQueue1
				enqueueWriteBuffer: speciesBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size
				ptr: speciesArray asCLInt32Array.
			commandQueue1
				enqueueWriteBuffer: stoichBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: numberReactions * numberSpecies * 4
				ptr: stoichioMatrix asCLFloatArray.	
			"Set kernel arguments updatePropensity kernel"
			kernel1 argAt: 0 mem: speciesBuffer.
			kernel1 argAt: 1 mem: stoichBuffer.
			kernel1 argAt: 2 int: indexFiredReaction - 1.
			kernel1 argAt: 3 int: numberSpecies.
			"Run the kernel."
			commandQueue1 enqueue1DRangeKernel: kernel1 globalWorkSize: numberSpecies.
			"Read the arguments."
			commandQueue1
				enqueueReadBuffer: speciesBuffer
				blocking: CL_BLOCKING
				offset: 0
				size: size
				ptr: speciesBytesResult.
			speciesResult := speciesBytesResult asInt32ArrayFromCL.
			speciesArray := speciesResult.
			propensityArray := propensityResult.	
			i := 1.
			model population compartments keysDo: [ :k| model population compartments at: k put: (speciesResult at: i).
				i := i + 1]."
			"Transcript show: model population compartments asArray;cr.
			
			indexRates :=1.
			model transitions
				do: [ :tr | 
					tr from = #empty
						ifTrue: [ model currentCompartment: tr to ]
						ifFalse: [ model currentCompartment: tr from ].
					reactantArray at: indexRates put: (model atCompartment: tr from).
					indexRates := indexRates +1.
					].
			
			timeT := timeT + deltaT.
			"previousT := timeT asFloat."
			
			deltaT < 0.0 ifFalse: [(timeT - previousT) > 0.006  ifTrue: [ self saveCompartmentsValueAtTime: timeT].previousT := timeT.].
			
			"timeT > (previousT + 0.01)
				ifTrue: [ 
					self saveCompartmentsValueAtTime: timeT.
					previousT := timeT ]." 
			
				"(speciesArray at:1) > 1000 ifTrue: [ self halt.]."
				].					