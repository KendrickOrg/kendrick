as yet unclassified
testAt
	|names output|
	names := STON fromString: '[{#status: #S}, {#status: #I}, {#status: #R}]'.
	output := KEOutputData from: names.
	
	self assert: (output data at: names first) size equals: 0 
	