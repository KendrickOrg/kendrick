accessing
from: aCompartment
	|reader|
	(aCompartment isDictionary) "| (aCompartment isSymbol)" ifTrue: [ ^ from := aCompartment ].
	aCompartment = #empty ifTrue: [ ^ self from: { #status -> #empty } ].
	(aCompartment isArray) ifTrue: [ ^ from := Dictionary newFrom: aCompartment ].
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	^ from := reader next