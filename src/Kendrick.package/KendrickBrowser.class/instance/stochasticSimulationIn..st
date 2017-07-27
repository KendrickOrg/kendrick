as yet unclassified
stochasticSimulationIn: arg1
	| tmp2 tmp4 |
	tmp2 := 0.
	tmp4 := arg1 list.
	tmp4
		title: 'Stochastic Simulation';
		display: [ :arg2 | 
			| tmp5 |
			tmp5 := KESimulatorBuilder new.
			donne := (tmp5
				run: #ExplicitTauLeap
				tMin: 0
				tMax: 730
				step: 1
				model: arg2) data ];
		format: [ donne keys at: (tmp2 := tmp2 + 1) ];
		selectionAct: [ :arg3 | 
			KEDiagramBuilder new
				plotSingleDiagram: (donne keyAtValue: arg3 selection)
				data: arg3 selection ]
			on: $v
			entitled: 'View';
		icon: [ GLMUIThemeExtraIcons glamorousRedCircle ]