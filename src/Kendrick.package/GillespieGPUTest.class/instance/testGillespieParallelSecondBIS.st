tests
testGillespieParallelSecondBIS
	| speciesArray speciesResult speciesBytes speciesBytesResult ratesArray stoichioMatrix reactantIndexArray propensityArray propensityResult propensityBytesResult flagsMem  size size1 rand1 rand2 	indexFiredReaction|
	"simulationDataArray"
	self createContext.
	self buildProgram.

	numberSpecies := 3.
	numberReactions := 4.
	size := numberSpecies * 4.
	size1 := numberReactions  * 4.
	rand1 := 0.
	rand2 := 0.
		
	speciesArray := Array new: numberSpecies.
	speciesResult := Array new: numberSpecies.	
	speciesBytes := ByteArray new: size.
	speciesBytesResult := ByteArray new: size.
	
	ratesArray := Array new: numberReactions.
	stoichioMatrix := Array new: numberReactions  * numberSpecies.
	
	propensityArray := Array new: numberReactions.
	"propensityBytes := Array new: size1."
	propensityBytesResult := ByteArray new: size1.	
	propensityResult := Array new: numberReactions.
	
	reactantIndexArray := Array new: numberReactions.
	
	"Initialize data"
	speciesArray := #(10000 1 0).
	stoichioMatrix := #(-1  0 0 2 -1 0 -2 1 0 0 -1 1).
	reactantIndexArray := #(0 0 1 1).
	
	ratesArray at: 1 put: (1 * 1/10000) asFloat. 
	ratesArray at: 2 put: 0.002 asFloat. 
	ratesArray at: 3 put: 0.5 asFloat. 
	ratesArray at: 4 put: 0.04 asFloat. 
	
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
	
	"speciesBytes  := speciesArray asCLInt32Array."
	tMin := Float new.
	tMax := Float new.
	tMin := 0.0.
	tMax := 20.0.
	
 [tMin <= tMax] whileTrue: [ 
	| deltaT |
	deltaT := 0.0.
	" Create the kernel and the command queue."
	kernel := program createKernel: 'updatePropensity'.
	commandQueue := context createCommandQueueFor: device properties: 0.
	
	"Allocate buffers"
	flagsMem := OpenCLConstants new.
	speciesBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_WRITE size:size.
	ratesBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_ONLY size: size1.
	stoichBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_ONLY size: (numberSpecies *numberReactions *4).
	reactantBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_ONLY size: size1.
	propensityBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_WRITE size: size1.
	
	"Copy data from host memory(CPU) to device memory(GPU)"
	commandQueue enqueueWriteBuffer: speciesBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: size  ptr:(speciesArray asCLInt32Array).
	commandQueue enqueueWriteBuffer: ratesBuffer  blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: numberReactions  ptr:(ratesArray asCLFloatArray).
	commandQueue enqueueWriteBuffer: stoichBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: 	(numberReactions * numberSpecies * 4) ptr:(stoichioMatrix asCLFloatArray) .
	commandQueue enqueueWriteBuffer: reactantBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: size1  ptr:(reactantIndexArray asCLInt32Array).
	commandQueue enqueueWriteBuffer: propensityBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: size1 ptr:(propensityArray asCLFloatArray).
	
	"Set kernel arguments updatePropensity kernel"
	kernel argAt: 0 mem: speciesBuffer.
	kernel argAt: 1 mem: ratesBuffer.
	kernel argAt: 2 mem: stoichBuffer.
	kernel argAt: 3 mem: reactantBuffer.
	kernel argAt: 4 mem: propensityBuffer.
	kernel argAt: 5 int: numberSpecies.
	kernel argAt: 6 int: numberReactions.

	"Run the kernel."
	commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberReactions.
	
	"Read the arguments."
	commandQueue enqueueReadBuffer: propensityBuffer blocking: OpenCLConstants CL_BLOCKING offset: 0 size: size1 ptr: propensityBytesResult.
	
	"......................................................................................................................................"
	
	propensityResult := propensityBytesResult asFloatArrayFromCL.
	"self halt ."
	"Calculate the time deltaT"
	
	"Generate random Number rand1"
	rand1 := MersenneTwisterRandom new. 
	deltaT := self calculateTime:  (rand1 next) rates: propensityResult.
	
	
	"select reaction or event to be fired"
	rand2 := MersenneTwisterRandom new. 
	indexFiredReaction := self selectReaction: (rand2 next) select: propensityResult.
	"self  halt."
	
	"Update species numbers"
	" Create the kernel and the command queue."
	kernel := program createKernel: 'updateSpecies'.
	commandQueue := context createCommandQueueFor: device properties: 0.
	
	"Allocate buffers"
	flagsMem := OpenCLConstants new.
	speciesBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_WRITE size:size.
	stoichBuffer := context createBuffer: OpenCLConstants CL_MEM_READ_ONLY size: (numberSpecies * numberReactions * 4).
	
	"Copy data from host memory(CPU) to device memory(GPU)"
	commandQueue enqueueWriteBuffer: speciesBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: size  ptr:(speciesArray asCLInt32Array).
	commandQueue enqueueWriteBuffer: stoichBuffer blocking: OpenCLConstants CL_BLOCKING  offset: 0 size: 	(numberReactions * numberSpecies * 4) ptr:(stoichioMatrix asCLFloatArray).
	
	"Set kernel arguments updatePropensity kernel"
	kernel argAt: 0 mem: speciesBuffer.
	kernel argAt: 1 mem: stoichBuffer.
	kernel argAt: 2 int: (indexFiredReaction - 1).
	kernel argAt: 3 int: numberSpecies.
	kernel argAt: 4 int: numberReactions.
	"Run the kernel."
	commandQueue enqueue1DRangeKernel: kernel globalWorkSize: numberSpecies.
	"Read the arguments."
	commandQueue enqueueReadBuffer: speciesBuffer blocking: OpenCLConstants CL_BLOCKING offset: 0 size: size ptr: speciesBytesResult.	
	
	speciesResult := speciesBytesResult asInt32ArrayFromCL.
	speciesArray := speciesResult.
	propensityArray := propensityResult.
	
	
	"Update simulation time"
	(deltaT < 0.0) ifTrue: [self halt.]
	ifFalse:[tMin := tMin + deltaT]. 
	Transcript show: tMin; show:' '.
	].
	"self halt."
	"self assert: tMin < tMax."