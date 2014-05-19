tests
testGillespieDirectOnSIRMultiHostModel
	|model|
	model := self createSIRMultiHostModel.
	model run: 'stochastic' from: 0.0 to: 1.0 step: 0.01 algorithm: #GillespieDirect.
	"model plot: #I do: #sqrt."
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	self assert: (model simulator data at: #(0 1)) isDictionary equals: true.
	self assert: (model simulator data at: #(0 1)) size equals: 2.
	