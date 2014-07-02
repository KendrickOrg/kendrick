as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :models |
				|transit nodes transitcollection arrow|
				
				"Collect all nodes of the graph"
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				nodes add: 'Deces';
						add: 'Naissance'.
				models compartments collect:[:each | nodes add: (each status asString)].
				
				"Generate relation between nodes"
				models generateEvents do: [:event | 
					transit := KETransition new. 
					event actions keysAndValuesDo: [:key :value|  
						value < 0 ifTrue: [ transit fromStatus: key];
						 		     ifFalse: [transit toStatus: key].
						].
					(((transit fromStatus) isNil) and:[(transit toStatus) isNotNil]) ifTrue:[				
						transitcollection add: ('Naissance'->(transit toStatus asString)).
					].
					(((transit fromStatus) isNotNil) and:[(transit toStatus) isNil]) ifTrue:[
						transitcollection add: ((transit fromStatus asString)->'Deces').
					].
					(((transit fromStatus) isNotNil) and:[(transit toStatus) isNotNil]) ifTrue:[
						transitcollection add: ((transit fromStatus asString)->(transit toStatus asString)).
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
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow "(RTLine new color: (Color blue alpha: 0.4))" inView: view.
				
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
			]