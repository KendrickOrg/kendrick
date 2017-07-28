accessing
name
self
		deprecated: 'This method should be removed. Unecessary and bad idea to use this name.'.
	^ String
		streamContents: [ :stream | 
			(STON writer on: stream)
				prettyPrint: false;
				jsonMode: true;
				referencePolicy: #error;
				nextPut: population compartments ]