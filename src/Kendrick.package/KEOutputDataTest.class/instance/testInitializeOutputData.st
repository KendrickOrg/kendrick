as yet unclassified
testInitializeOutputData
	|names output|
	names := STON fromString: '[{#status: #S}, {#status: #I}, {#status: #R}]'.
	output := KEOutputData from: names.
	
	self assert: (output data isDictionary) equals: true.
	