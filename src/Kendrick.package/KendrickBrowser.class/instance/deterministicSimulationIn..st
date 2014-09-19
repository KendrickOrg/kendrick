as yet unclassified
deterministicSimulationIn: constructor

	"run the deterministic simulation of the model"
		| x |
		x:=0.
		constructor list
		title: 'Deterministic simulation';
		display: [ :a | donne :=((a run: #RK4 from: 0.0 to: 200 step: 1); simulator) data.];
		format: [donne keys at:(x:=x+1).] ;
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].
		