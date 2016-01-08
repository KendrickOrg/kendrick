examples
riskGroupConcern

	| riskGroupConcern |
	riskGroupConcern := KEConcern new.
	riskGroupConcern 
		addAttribute: #riskGroup 
		value: (1 to: 5) asArray.
		
	^ riskGroupConcern 