as yet unclassified
deterministicSimulationIn: constructor

	"run the deterministic simulation of the model"
	
			constructor list
				title: 'Determinstic simulation';
				display: [ :each | each runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.001"; plot: { #S . #I . #R }"];
				format: [ :each | each data asString].