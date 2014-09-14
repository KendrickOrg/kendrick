as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :models |
				| nodes transitcollection arrow|
				
				"Collect all nodes of the graph"
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				nodes add: 'Deces';
						add: 'Naissance'.
				models population getCompartments collect:[:each | nodes add: (each status asString)].
				
				"Generate relation between nodes"
				((KERuntimeEventImpl new) model: models) generateEvents do: [:event | 
					
					(((event fromStatus) isNil) and:[(event toStatus) isNotNil]) ifTrue:[				
						transitcollection add: ('Naissance'->(event toStatus asString)).
					].
					(((event fromStatus) isNotNil) and:[(event toStatus) isNil]) ifTrue:[
						transitcollection add: ((event fromStatus asString)->'Deces').
					].
					(((event fromStatus) isNotNil) and:[(event toStatus) isNotNil]) ifTrue:[
						transitcollection add: ((event fromStatus asString)->(event toStatus asString)).
					]
				].
	
				"Build the nodes"
				nodes do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := ((RTBox new size: 80) + RTLabel) elementOn: aLabel. n @ RTDraggable ].
					view add: n.
				].
			
				"Build the edges"
				arrow := RTArrow new 
					color: Color red; 
					attachPoint: RTHorizontalAttachPoint instance.
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.""
				
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
			]