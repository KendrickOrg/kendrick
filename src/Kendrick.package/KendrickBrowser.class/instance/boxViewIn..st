as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :model |
				| nodes transitcollection arrow edges deces naissance events|
				
				deces:= OrderedCollection new.
				naissance := OrderedCollection new.
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				edges := OrderedCollection new.
				
				"Collect all nodes of the graph"
				model population compartments collect:[:each | nodes add: (each status asString)].
				
				"Build the nodes"
				nodes do: [ :aLabel |
					| n |
					n := view elementFromModel: aLabel.
					n ifNil: [ n := ((RTBox new size: 80) + RTLabel) elementOn: aLabel. n @ RTDraggable ].
					view add: n.
				].
			
				"Generate relation between nodes"
				events := (KEEventGenerator new) generateEvents: model.
				events do: [:event | 
	
					(((event fromStatus asString) = 'empty') and:[(event toStatus) isNotEmpty ]) ifTrue:[
						naissance add: (event toStatus asString).
					].
				
					(((event fromStatus) isNotEmpty) and:[(event toStatus asString) =  'empty' ]) ifTrue:[		
						deces add: (event fromStatus asString).						
					].
				
					(((event fromStatus) isNotEmpty) and:[(event toStatus) isNotEmpty]) ifTrue:[
						transitcollection add: ((event fromStatus asString)->(event toStatus asString)).						
					]
				].
			
				"Build the edges between box"
				arrow := RTArrow new 
					color: Color red; 
					attachPoint: RTHorizontalAttachPoint instance.
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.
								
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
				
				"Add edges of demography"
				
				deces do:[ :ele|
					|a b|
					a := view elementFromModel:ele.
					b := RTBox element.
					b := b translateTo: a position +  (0 @ 100).
					edges add: ((RTArrow new color: Color red) edgeFrom: a to: b).
				].
				naissance do:[ :ele|
					|a b|
					a := view elementFromModel:ele.
					b := RTBox element.
					b := b translateTo: a position +  (-100 @ 0).
					edges add: ((RTArrow new color: Color red) edgeFrom: b to: (a)).
				].			
				view addAll: edges.
				"view @ (RTLabelled new color: Color red; view: view; offsetOnEdge: 0.3)"
			]