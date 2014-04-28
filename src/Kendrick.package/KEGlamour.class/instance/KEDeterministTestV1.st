composite
KEDeterministTestV1
	"
	|collection|
	collection := KEExample sampleModelsV2.
	self new KEDeterministTestV1 openOn: collection.
	"

	<glmBrowser: 'Updateable individual presentations' input:
		'|collection magritteParentPrototype|
	collection := KEExample sampleModelsV2.
	collection'>
	| browser |
	browser := GLMTabulator new initialExtent: 1100 @ 900.
	browser
		row: [ :row | 
					row
						column: #models;
						column: [ :r | 
									r
										row: #compartments span: 2;
										row: #affichage ]
							span: 2;
						column: [ :r | 
									r
										row: #equation span: 2;
										row: #detail ]
							span: 2;
						column: [ :r | 
									r
										row: #parameter span: 2;
										row: #valueParameter ]
							span: 2 ];
		row: #graph1;
		row: #visual.
	browser
		act: [ :b | b entity add: KEModel new ]
		icon: GLMUIThemeExtraIcons glamorousAdd
		entitled: 'Add an item in the collection'.
	browser
		act: [ :b | b entity removeLast ]
		icon: GLMUIThemeExtraIcons glamorousRemove
		entitled: 'Remove last item from the collection'.
	browser act: [ :b | b update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Update complete browser'.
	browser transmit
		to: #models;
		andShow: [ :a | 
					a title: 'Updated automatically'.
					a stackedArrangement.
					a list
						title: [ :x | 'List: ' , x size printString ];
						shouldValidate: true;
						updateOn: GLMItemAdded from: #yourself;
						updateOn: GLMItemRemoved from: #yourself ].
	browser transmit
		to: #models;
		andShow: [ :a | 
					a list
						display: [ :model | model ];
						title: 'Models';
						icon: GLMUIThemeExtraIcons glamorousRedCircle;
						format: [ :model | model name ] ].
	browser transmit
		from: #models;
		to: #compartments;
		andShow: [ :a | 
					a stackedVerticallyArrangement.
					a list
						title: 'compartements';
						icon: GLMUIThemeExtraIcons glamorousGreenCircle;
						display: [ :model | model compartments asOrderedCollection ];
						format: [ :compartment | compartment status ] ].
	browser transmit
		from: #compartments;
		to: #affichage;
		andShow: [ :a | 
					magritteParentPrototype := a magritte.
					magritteParentPrototype
						title: 'Value of compartment';
						description: [ :compartment | compartment magritteDescription ];
						onAnswer: [ :compartment :presentation | browser update ] ].
	browser transmit
		from: #models;
		to: #equation;
		andShow: [ :a | 
					a list
						title: 'KEEquation';
						icon: GLMUIThemeExtraIcons glamorousGreenCircle;
						display: [ :model | model equations asOrderedCollection ];
						format: [ :equation | equation asString ] ].	"browser transmit
from: #equation;
to: #detail;
andShow: [ :a |
		a list title: 'TestKEEquation_Data';
		icon: GLMUIThemeExtraIcons glamorousGreenCircle;
		display: [:equation | equation expression ];
		format: [:equation | equation asString ]

	].
"
	browser transmit
		from: #equation;
		to: #detail;
		andShow: [ :a | 
					magritteParentPrototype := a magritte.
					magritteParentPrototype
						title: 'KEEquation_Expression';
						description: [ :equation | equation magritteDescription ];
						onAnswer: [ :equation :presentation | browser update ] ].
	browser transmit
		from: #models;
		to: #parameter;
		andShow: [ :a | 
					a list
						display: [ :model | model parameters asOrderedCollection ];
						format: [ :parameter | parameter symbol asString ] ].
	browser transmit
		from: #models;
		to: #parameter;
		andShow: [ :a | 
					a stackedVerticallyArrangement.
					a list
						title: 'Parameter';
						icon: GLMUIThemeExtraIcons glamorousGreenCircle;
						display: [ :model | model parameters asOrderedCollection ];
						format: [ :parameter | parameter symbol asString ] ].
	browser transmit
		from: #parameter;
		to: #valueParameter;
		andShow: [ :a | 
					magritteParentPrototype := a magritte.
					magritteParentPrototype
						title: 'Value of parameters';
						description: [ :parameter | parameter magritteDescription ];
						onAnswer: [ :parameter :presentation | browser update ] ].
	browser transmit
		from: #models;
		to: #graph1;
		andShow: [ :a | 
					a list
						title: 'TestKESeriesData_Data';
						icon: GLMUIThemeExtraIcons glamorousGreenCircle;
						display: [ :model | model simulator data ];
						format: [ :data | data asString ].
					a text
						title: 'Updated automatically';
						act: [ :b | b update ] icon: GLMUIThemeExtraIcons glamorousRefresh entitled: 'Update complete browser' ].
	browser transmit
		from: #graph1;
		to: #visual;
		andShow: [ :a | 
					a eyesee
						title: 'Visualisation';
						display: [ :data | data ];
						diagram: [ :renderer :data | 
									renderer lineDiagram
										y: [ :x | (data atIndex: x) at: 1 ];
										models: data index;
										width: 900;
										height: 250;
										yAxisLabel: 'Number of individuals';
										regularAxis;
										valueAxis;
										defaultColor: Color red ] ].
	^ browser