eyesee
KEDeterministEyeSeeTest
	<glmBrowser: 'Updateable individual presentations' input:
		'|collection magritteParentPrototype result|
	collection := KEExample sampleModelsV2.
	collection'>
	| tmp1 tmp3 tmp7 |
	tmp1 := GLMTabulator new initialExtent: 1100 @ 900.
	tmp1
		row: #models;
		row: #graph1 span: 2;
		row: #visual;
		act: [ :arg1 | arg1 entity add: KEModel new ]
			icon: GLMUIThemeExtraIcons glamorousAdd
			entitled: 'Add an item in the collection';
		act: [ :arg2 | arg2 entity removeLast ]
			icon: GLMUIThemeExtraIcons glamorousRemove
			entitled: 'Remove last item from the collection';
		act: [ :arg3 | arg3 update ]
			icon: GLMUIThemeExtraIcons glamorousRefresh
			entitled: 'Update complete browser'.
	tmp3 := tmp1 transmit.
	tmp3
		to: #models;
		andShow: [ :arg4 | 
			| tmp5 |
			arg4
				title: 'Updated automatically';
				stackedArrangement.
			tmp5 := arg4 list.
			tmp5
				title: [ :arg5 | 'List: ' , arg5 size printString ];
				shouldValidate: true;
				updateOn: GLMItemAdded from: #yourself;
				updateOn: GLMItemRemoved from: #yourself ].
	tmp7 := tmp1 transmit.
	tmp7
		from: #models;
		to: #graph1;
		andShow: [ :arg6 | 
			| tmp9 tmp11 |
			tmp9 := arg6 list.
			tmp9
				title: 'TestKESeriesData_Data';
				icon: GLMUIThemeExtraIcons glamorousGreenCircle;
				display: [ :arg7 | arg7 runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.0001 ];
				format: [ :arg8 | arg8 asString ].
			tmp11 := arg6 eyesee.
			tmp11
				display: [ :arg9 | arg9 ];
				diagram: [ :arg10 :arg11 | 
					| tmp13 |
					tmp13 := arg10 lineDiagram.
					tmp13
						y: [ :arg12 | (arg11 atIndex: arg12) at: 1 ];
						models: arg11 index;
						width: 900;
						height: 250;
						yAxisLabel: 'Number of individuals';
						regularAxis;
						valueAxis;
						defaultColor: Color red ] ].
	^ tmp1