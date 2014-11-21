accessing
from: aCompartment
	|reader|
	(reader := STONReader on: aCompartment readStream) allowComplexMapKeys: true.
	from := reader next