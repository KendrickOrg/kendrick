examples
measlesScriptForValidation
	"self new measlesScriptForValidation"
	|model simulator |
	model := self measlesModel. 
	0 to: 199 do: [ :i| 
		model resetCompartments.
		simulator := KESimulator new: #Gillespie from: 0.0 to: 150 by: 1.
		simulator executeOn: model.
		(simulator timeSeriesAt: '{#status: #I}') save: 'data/measles/stc/data_I_stc_', i asString , '.txt'.
	].
	
	
	
	
	