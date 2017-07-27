composite
KEDeterministTestV1
	<glmBrowser: 'Updateable individual presentations' input:
		'|collection magritteParentPrototype|
	collection := KEExample sampleModelsV2.
	collection'>
	| tmp1 tmp11 tmp15 tmp19 tmp23 tmp27 tmp31 tmp35 tmp39 tmp43 tmp47 tmp53 |
	tmp1 := GLMTabulator new initialExtent: 1100 @ 900.
	tmp1
		row: [ :arg1 | 
			| tmp3 |
			tmp3 := arg1.
			tmp3
				column: #models;
				column: [ :arg2 | 
					| tmp5 |
					tmp5 := arg2.
					tmp5
						row: #compartments span: 2;
						row: #affichage ]
					span: 2;
				column: [ :arg3 | 
					| tmp7 |
					tmp7 := arg3.
					tmp7
						row: #equation span: 2;
						row: #detail ]
					span: 2;
				column: [ :arg4 | 
					| tmp9 |
					tmp9 := arg4.
					tmp9
						row: #parameter span: 2;
						row: #valueParameter ]
					span: 2 ];
		row: #graph1;
		row: #visual;
		act: [ :arg5 | arg5 entity add: KEModel new ]
			icon: GLMUIThemeExtraIcons glamorousAdd
			entitled: 'Add an item in the collection';
		act: [ :arg6 | arg6 entity removeLast ]
			icon: GLMUIThemeExtraIcons glamorousRemove
			entitled: 'Remove last item from the collection';
		act: [ :arg7 | arg7 update ]
			icon: GLMUIThemeExtraIcons glamorousRefresh
			entitled: 'Update complete browser'.
	tmp11 := tmp1 transmit.
	tmp11
		to: #models;
		andShow: [ :arg8 | 
			| tmp13 |
			arg8
				title: 'Updated automatically';
				stackedArrangement.
			tmp13 := arg8 list.
			tmp13
				title: [ :arg9 | 'List: ' , arg9 size printString ];
				shouldValidate: true;
				updateOn: GLMItemAdded from: #yourself;
				updateOn: GLMItemRemoved from: #yourself ].
	tmp15 := tmp1 transmit.
	tmp15
		to: #models;
		andShow: [ :arg10 | 
			| tmp17 |
			tmp17 := arg10 list.
			tmp17
				display: [ :arg11 | arg11 ];
				title: 'Models';
				icon: GLMUIThemeExtraIcons glamorousRedCircle;
				format: [ :arg12 | arg12 name ] ].
	tmp19 := tmp1 transmit.
	tmp19
		from: #models;
		to: #compartments;
		andShow: [ :arg13 | 
			| tmp21 |
			arg13 stackedVerticallyArrangement.
			tmp21 := arg13 list.
			tmp21
				title: 'compartements';
				icon: GLMUIThemeExtraIcons glamorousGreenCircle;
				display: [ :arg14 | arg14 compartments asOrderedCollection ];
				format: [ :arg15 | arg15 status ] ].
	tmp23 := tmp1 transmit.
	tmp23
		from: #compartments;
		to: #affichage;
		andShow: [ :arg16 | 
			| tmp25 |
			magritteParentPrototype := arg16 magritte.
			tmp25 := magritteParentPrototype.
			tmp25
				title: 'Value of compartment';
				description: [ :arg17 | arg17 magritteDescription ];
				onAnswer: [ :arg18 :arg19 | tmp1 update ] ].
	tmp27 := tmp1 transmit.
	tmp27
		from: #models;
		to: #equation;
		andShow: [ :arg20 | 
			| tmp29 |
			tmp29 := arg20 list.
			tmp29
				title: 'KEEquation';
				icon: GLMUIThemeExtraIcons glamorousGreenCircle;
				display: [ :arg21 | arg21 equations asOrderedCollection ];
				format: [ :arg22 | arg22 asString ] ].
	tmp31 := tmp1 transmit.
	tmp31
		from: #equation;
		to: #detail;
		andShow: [ :arg23 | 
			| tmp33 |
			magritteParentPrototype := arg23 magritte.
			tmp33 := magritteParentPrototype.
			tmp33
				title: 'KEEquation_Expression';
				description: [ :arg24 | arg24 magritteDescription ];
				onAnswer: [ :arg25 :arg26 | tmp1 update ] ].
	tmp35 := tmp1 transmit.
	tmp35
		from: #models;
		to: #parameter;
		andShow: [ :arg27 | 
			| tmp37 |
			tmp37 := arg27 list.
			tmp37
				display: [ :arg28 | arg28 parameters asOrderedCollection ];
				format: [ :arg29 | arg29 symbol asString ] ].
	tmp39 := tmp1 transmit.
	tmp39
		from: #models;
		to: #parameter;
		andShow: [ :arg30 | 
			| tmp41 |
			arg30 stackedVerticallyArrangement.
			tmp41 := arg30 list.
			tmp41
				title: 'Parameter';
				icon: GLMUIThemeExtraIcons glamorousGreenCircle;
				display: [ :arg31 | arg31 parameters asOrderedCollection ];
				format: [ :arg32 | arg32 symbol asString ] ].
	tmp43 := tmp1 transmit.
	tmp43
		from: #parameter;
		to: #valueParameter;
		andShow: [ :arg33 | 
			| tmp45 |
			magritteParentPrototype := arg33 magritte.
			tmp45 := magritteParentPrototype.
			tmp45
				title: 'Value of parameters';
				description: [ :arg34 | arg34 magritteDescription ];
				onAnswer: [ :arg35 :arg36 | tmp1 update ] ].
	tmp47 := tmp1 transmit.
	tmp47
		from: #models;
		to: #graph1;
		andShow: [ :arg37 | 
			| tmp49 tmp51 |
			tmp49 := arg37 list.
			tmp49
				title: 'TestKESeriesData_Data';
				icon: GLMUIThemeExtraIcons glamorousGreenCircle;
				display: [ :arg38 | arg38 simulator data ];
				format: [ :arg39 | arg39 asString ].
			tmp51 := arg37 text.
			tmp51
				title: 'Updated automatically';
				act: [ :arg40 | arg40 update ]
					icon: GLMUIThemeExtraIcons glamorousRefresh
					entitled: 'Update complete browser' ].
	tmp53 := tmp1 transmit.
	tmp53
		from: #graph1;
		to: #visual;
		andShow: [ :arg41 | 
			| tmp55 |
			tmp55 := arg41 eyesee.
			tmp55
				title: 'Visualisation';
				display: [ :arg42 | arg42 ];
				diagram: [ :arg43 :arg44 | 
					| tmp57 |
					tmp57 := arg43 lineDiagram.
					tmp57
						y: [ :arg45 | (arg44 atIndex: arg45) at: 1 ];
						models: arg44 index;
						width: 900;
						height: 250;
						yAxisLabel: 'Number of individuals';
						regularAxis;
						valueAxis;
						defaultColor: Color red ] ].
	^ tmp1