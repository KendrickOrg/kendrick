as yet unclassified
buildBrowser
	| tmp2 tmp10 tmp12 tmp14 tmp16 tmp18 tmp20 tmp22 tmp24 tmp26 tmp30 tmp32 |
	browser := GLMTabulator new initialExtent: 1500 @ 1000.
	browser
		title: 'Kendrick Browser';
		act: [ :arg1 | arg1 entity removeLast ]
			icon: GLMUIThemeExtraIcons glamorousRemove
			entitled: 'Remove the select Model on the Browser'.
	tmp2 := browser.
	tmp2
		row: [ :arg2 | 
			| tmp4 |
			tmp4 := arg2.
			tmp4
				column: #models;
				column: #populations;
				column: #compartments;
				column: #equations;
				column: #parameters ]
			size: 150;
		row: [ :arg3 | 
			| tmp6 |
			tmp6 := arg3.
			tmp6
				column: #modi_models;
				column: #modi_populations;
				column: #modi_compartments;
				column: #modi_equations;
				column: #modi_parameters ]
			size: 70;
		row: #options size: 70;
		row: [ :arg4 | 
			| tmp8 |
			tmp8 := arg4.
			tmp8
				column: #graph;
				column: #view ].
	tmp10 := browser transmit.
	tmp10
		to: #models;
		andShow: [ :arg5 | 
			arg5 title: 'Models'.
			self modelsIn: arg5 ].
	tmp12 := browser transmit.
	tmp12
		from: #models;
		to: #populations;
		andShow: [ :arg6 | 
			arg6 title: 'Populations'.
			self populationsIn: arg6 ].
	tmp14 := browser transmit.
	tmp14
		from: #populations;
		to: #compartments;
		andShow: [ :arg7 | 
			arg7 title: 'Compartments'.
			self compartimentsIn: arg7 ].
	tmp16 := browser transmit.
	tmp16
		from: #compartments;
		to: #modi_compartments;
		andShow: [ :arg8 :arg9 | self updateCompartmentIn: arg8 ].
	tmp18 := browser transmit.
	tmp18
		from: #models;
		to: #equations;
		andShow: [ :arg10 | 
			arg10 title: 'Equations'.
			self equationsIn: arg10 ].
	tmp20 := browser transmit.
	tmp20
		from: #equations;
		to: #modi_equations;
		andShow: [ :arg11 :arg12 | self updateEquationsIn: arg11 ].
	tmp22 := browser transmit.
	tmp22
		from: #models;
		to: #parameters;
		andShow: [ :arg13 | 
			arg13 title: 'Parameters'.
			self parametersIn: arg13 ].
	tmp24 := browser transmit.
	tmp24
		from: #parameters;
		to: #modi_parameters;
		andShow: [ :arg14 :arg15 | self updateParametersIn: arg14 ].
	tmp26 := browser transmit.
	tmp26
		from: #models;
		to: #options;
		andShow: [ :arg16 | 
			| tmp28 |
			tmp28 := arg16 dropDownList.
			tmp28
				title: 'Options';
				display: [ #('Deterministic Simulation' 'Stochastic Simulation' 'Individual-Based Simulation' 'Models like Box') ];
				selectedIndex: 4 ].
	tmp30 := browser transmit.
	tmp30
		from: #models;
		from: #options;
		to: #graph;
		andShow: [ :arg17 :arg18 :arg19 | 
			arg19 = 'Models like Box'
				ifTrue: [ self boxViewIn: arg17 ].
			arg19 = 'Deterministic Simulation'
				ifTrue: [ self deterministicSimulationIn: arg17 ].
			arg19 = 'Stochastic Simulation'
				ifTrue: [ self stochasticSimulationIn: arg17 ].
			arg19 = 'Individual Base Simulation'
				ifTrue: [ self individualBasedSimulationIn: arg17 ] ].
	tmp32 := browser transmit.
	tmp32
		from: #graph;
		to: #view;
		andShow: [ :arg20 | self graphView: arg20 ]