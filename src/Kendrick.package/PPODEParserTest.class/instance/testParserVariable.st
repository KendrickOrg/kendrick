tests
testParserVariable
	|dsdt betaEqu|
	"dsdt := self parserClass parse: 'S:t=-beta*S*I'."
	dsdt := 'S:t=-beta*S*I' parseAsAnEquation.
	betaEqu := 'beta = exp(-d^2)' parseAsAnEquation.
	self assert: (dsdt variable symbol) equals: #S.
	self assert: (dsdt tVariable symbol) equals: #t.
	self assert: (betaEqu variable symbol) equals: #beta.