tests-as yet unclassified
multiHostConcern

	| multiHostConcern |
	multiHostConcern := KEModelPart new.
	multiHostConcern 
		addAttribute: #species 
		value: #(#human #bird).
		
	^ multiHostConcern 