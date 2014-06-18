as yet unclassified
individualBasedSimulationIn: constructor

	"run the individual base simulation of the model"
	|donne x name|
		x:=0.
		constructor list
		title: 'Individual Base Simulation';
		display: [ :a | donne := a  runIndividualBasedSimulationFrom: 0 to: 0.5 withStep: 0.0027 ];
		format: [name:=donne keys at:(x:=x+1).];
		selectionAct: [:courbe | courbe selection plot:{}] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].