examples
multiHostConcern

	| multiHostConcern |
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ multiHostConcern 