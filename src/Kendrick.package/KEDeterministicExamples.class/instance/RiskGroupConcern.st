examples
RiskGroupConcern

	| RiskGroupConcern |
	RiskGroupConcern := KEConcern new.
	RiskGroupConcern 
		addAttribute: #riskGroup 
		value: (1 to: 5) asArray.
		
	^ RiskGroupConcern 