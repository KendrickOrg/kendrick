as yet unclassified
stochasticSimulationIn: constructor

	"run the stochastic simulation of the model"
	
		|donne x name|
		x:=0.
		constructor list
		title: 'Stochastic Simulation';
		display: [ :a | donne := a runStochasticSimulationFrom: 0 to: 50/365 withStep:  0.5 / 365 ];
		format: [name:=donne keys at:(x:=x+1).];
		selectionAct: [:courbe | courbe selection plot:{}] on: $v entitled: 'View';
		icon: [GLMUIThemeExtraIcons glamorousRedCircle].