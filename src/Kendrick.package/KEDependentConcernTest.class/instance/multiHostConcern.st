tests-as yet unclassified
multiHostConcern

	| multiHostConcern |
	multiHostConcern := KEConcern new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ multiHostConcern 