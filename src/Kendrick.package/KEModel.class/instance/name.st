accessing
name
	self
		deprecated: 'This method should be removed. Unecessary and bad idea to use this name.'.
	^ String
		streamContents: [ :arg1 | 
			| tmp2 |
			tmp2 := STON writer on: arg1.
			tmp2
				prettyPrint: false;
				jsonMode: true;
				referencePolicy: #error;
				nextPut: population compartments ]