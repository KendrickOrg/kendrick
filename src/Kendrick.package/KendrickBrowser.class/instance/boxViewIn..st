as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :model |
				| nodes transitcollection arrow nd nb events demography|
				nd:=0.
				nb:=0.
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				demography := OrderedCollection new.
				
				"Collect all nodes of the graph"
				model population compartments collect:[:each | nodes add: (each asString)].
			
				"Generate relation between nodes"
				events := (KEEventGenerator new) generateEvents: model.
				events do: [:event | 
					
				(((event fromStatus asString) = 'empty') and:[(event toStatus) isNotEmpty ]) ifTrue:[
						|nn|
						nn:= 'Naissance',(nb asString).
						demography add: nn.
						transitcollection add: (nn->(event toStatus asString)).
						nb:=nb+1.
					].
					
					(((event fromStatus) isNotEmpty) and:[(event toStatus asString) =  'empty' ]) ifTrue:[
						|nn|
						nn:= 'Deces',(nd asString).
						demography add: nn.
						transitcollection add: ((event fromStatus asString)->nn).
						nd:=nd+1.
					].
					(((event fromStatus) isNotEmpty) and:[(event toStatus) isNotEmpty]) ifTrue:[
						transitcollection add: ((event fromStatus asString)->(event toStatus asString)).
					]
				].
			
				"Build different nodes of graph"
				nodes do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := ((RTBox new size: 80) + RTLabel) elementOn: aLabel. n @ RTDraggable ].
					view add: n.
				].
				demography do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := (RTBox new) elementOn: aLabel. n @ RTDraggable  ].
					view add: n.
				].
			
				"Build the edges between box"
				arrow := RTArrowedLine new 
					color: Color red; 
					attachPoint: RTHorizontalAttachPoint instance.
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.	
								
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
			]