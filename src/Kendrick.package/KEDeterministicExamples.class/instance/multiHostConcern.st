examples
multiHostConcern

	| multiHostConcern |
	multiHostConcern := KEConcern new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ multiHostConcern 