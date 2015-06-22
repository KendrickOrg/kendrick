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
		