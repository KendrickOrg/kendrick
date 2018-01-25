public-api
allTransitions

	^ ((Composition Temp concern: self id) instVarNamed: #backEndEntity) transitions copy 
		