as yet unclassified
deterministicSimulationIn: constructor

	"run the deterministic simulation of the model"
		|donne x name|
		x:=0.
		constructor list
		title: 'Deterministic simulation';
		display: [ :a | donne := a runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.001 ];
		format: [name:=donne keys at:(x:=x+1).];
		selectionAct: [:courbe | courbe selection plot:{}] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].
		