examples
mosquitoScriptForValidation
	"self new mosquitoScriptForValidation"
	| model simulator|
	
	model := self mosquitoModel.
	
	0 to: 0 do: [ :i| 
		|ts_mosquito ts_reservoir1 ts_reservoir2 stream fileSystem workDir|
		model resetCompartments.
		simulator := KESimulator new: #Gillespie from: 0.0 to: 0.5 by: 0.0027.
		simulator executeOn: model.
		ts_mosquito := simulator timeSeriesAt: '{#status: #I, #species: #mosquito}'.
		ts_reservoir1 := simulator timeSeriesAt: '{#status: #I, #species: #reservoir1}'.
		ts_reservoir2 := simulator timeSeriesAt: '{#status: #I, #species: #reservoir2}'.
		
		fileSystem := FileSystem disk workingDirectory.
		workDir := fileSystem resolvePath: (fileSystem path / 'data/mosquito/stc/data_I_stc_', i asString , '.txt').
		stream := workDir writeStream.
		1 to: (ts_mosquito  index size) do: [ :j|
			stream nextPutAll: (ts_mosquito index at: j) asString, String tab, (ts_mosquito data at: j) asString, String tab, (ts_reservoir1 data at: j) asString, String tab, (ts_reservoir2 data at: j) asString;cr.
		 	].
		stream close
	].
	
	
	
	