accessing
from: aCompartment
	|reader|
	(aCompartment isDictionary) | (aCompartment isSymbol) ifTrue: [ ^ from := aCompartment ].
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	^ from := reader next