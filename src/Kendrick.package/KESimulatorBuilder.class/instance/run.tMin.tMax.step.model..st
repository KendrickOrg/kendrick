as yet unclassified
run: algorithm tMin: tMin tMax: tMax step: step model: model
	self adapters do: [ :each|
		each atArgument: #model put: model.
		each init
		].
	simulator := (KESimulator passType: algorithm) 
							new: algorithm 
							tMin: tMin 
							tMax: tMax 
							step: step 
							model: model.
	self execute.