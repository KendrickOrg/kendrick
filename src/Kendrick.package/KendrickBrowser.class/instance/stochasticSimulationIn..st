as yet unclassified
stochasticSimulationIn: constructor

	"run the stochastic simulation of the model"
	
		|x|
		x:=0.
		constructor list
		title: 'Stochastic Simulation';
		display: [ :a | donne := ((a run: #ExplicitTauLeap from: 0 to: 730 step: 1 ); simulator) data];
		format: [donne keys at:(x:=x+1).];
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].