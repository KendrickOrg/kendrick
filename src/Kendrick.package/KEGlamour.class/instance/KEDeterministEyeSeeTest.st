eyesee
KEDeterministEyeSeeTest
	<glmBrowser: 'Updateable individual presentations' input: '|collection magritteParentPrototype result|
	collection := KEExample sampleModelsV2.
	collection'>
	
	"
	|collection|
	collection := KEExample sampleModels.
	self new KEDeterministEyeSeeTest openOn: collection.
	"
	
	
	| browser |
	browser := GLMTabulator new initialExtent: 1100@900.
	browser
	     row: #models;		
	     row: #graph1 span:2;  row: #visual.    
	
	browser 
		act: [:b | b entity add: (KEModel new) ] 	
		icon: GLMUIThemeExtraIcons glamorousAdd
		entitled: 'Add an item in the collection'.
	browser 
		act: [:b | b entity removeLast ] 
		icon: GLMUIThemeExtraIcons glamorousRemove
		entitled: 'Remove last item from the collection'.
	browser 
		act: [:b | b update ] 
		icon: GLMUIThemeExtraIcons glamorousRefresh
		entitled: 'Update complete browser'.
	browser transmit to: #models; andShow: [ :a |
		a title: 'Updated automatically'.
		a stackedArrangement.
		a list title: [:x | 'List: ', x size printString ];
			shouldValidate: true;
			updateOn: GLMItemAdded from: #yourself;
			updateOn: GLMItemRemoved from: #yourself.
		].	
		
		
		
browser transmit
from: #models;
to: #graph1;
andShow: [ :a |
		
		a  list title: 'TestKESeriesData_Data';
		icon: GLMUIThemeExtraIcons glamorousGreenCircle;
		
		display: [:model  | model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.0001 ];
		format: [ :data | data asString ].
		
		a eyesee 
		display: [:data | data ];
			diagram: [:renderer :data |
	                       renderer lineDiagram 
						y: [ :x | (data atIndex: x) at: 1 ];
						models: data index;
						width: 900;
						height: 250;
						yAxisLabel: 'Number of individuals';
						regularAxis;
						valueAxis;
						defaultColor: Color red.

			]].




	
		
	^ browser 
