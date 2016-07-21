examples
riskGroupConcern

	| riskGroupConcern |
	riskGroupConcern := KEModelPart new.
	riskGroupConcern 
		addAttribute: #riskGroup 
		value: (1 to: 5) asArray.
		
	^ riskGroupConcern 