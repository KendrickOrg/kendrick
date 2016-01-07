examples
MultiHostConcern

	| MultiHostConcern |
	MultiHostConcern := KEConcern new.
	MultiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ MultiHostConcern 