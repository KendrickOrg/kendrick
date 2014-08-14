as yet unclassified
new: algorithm tMin: tMin tMax: tMax step: step model: model
	simulator := (KESimulator passType: algorithm) 
							new: algorithm 
							tMin: tMin 
							tMax: tMax 
							step: step 
							model: model.
	simulator adapters: self adapters
	