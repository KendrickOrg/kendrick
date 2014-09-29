as yet unclassified
individualBasedSimulationIn: constructor

	"run the individual base simulation of the model"
		|x|
		x:=0.
		constructor list
		title: 'Individual Base Simulation';
		display: [ :a | |simulator|
			simulator := KESimulatorBuilder new.
			donne := (simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 10 step: 0.1 model: a) data.
			"donne := ((a  run: #IBMDiscreteTime from: 0.0 to: 10 step: 0.1); simulator) data" ];
		format: [donne keys at:(x:=x+1).];
		selectionAct: [:courbe | KEDiagramBuilder new plotSingleDiagram: (donne keyAtValue: courbe selection) data: courbe selection] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].