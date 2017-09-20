as yet unclassified
exampleExplicitTauLeapOnSIRModelPart
	"self new exampleExplicitTauLeapOnSIRModelPart"

	| model simulator dB t |
	t := KEIndexedVariableTest new.
	model := t modelSIRKEModelPart.
	
	simulator := KESimulator
		new: #TauLeap
		from: 0
		to: 0.4
		by: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: simulator timeSeries.
	^ dB open