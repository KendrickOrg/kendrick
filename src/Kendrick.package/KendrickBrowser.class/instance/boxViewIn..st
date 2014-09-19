as yet unclassified
boxViewIn: constructor

	"show the model like box and relation between its"
	constructor roassal2
			title: 'Model like box';
			act: [:p | p update]
				icon: GLMUIThemeExtraIcons glamorousRefresh
				entitled: 'Update';
			painting: [:view :models |
				| nodes transitcollection edgenamecollection arrow nd nb|
				nd:=0.
				nb:=0.
				"Collect all nodes of the graph"
				transitcollection := OrderedCollection new.
				edgenamecollection := OrderedCollection new.
				nodes := OrderedCollection new.
				
				models population getCompartments collect:[:each | nodes add: (each status asString)].
				
				"Generate relation between nodes"
				((KERuntimeEventImpl new) model: models) generateEvents do: [:event | 
	
					(((event fromStatus asString) = 'empty') and:[(event toStatus) isNotEmpty ]) ifTrue:[
						|nn|
						nn:= 'Naissance',(nb asString).
						nodes add: nn.
						transitcollection add: (nn->(event toStatus asString)).
						nb:=nb+1.
					].
					
					(((event fromStatus) isNotEmpty) and:[(event toStatus asString) =  'empty' ]) ifTrue:[
						|nn edgename|
						nn:= 'Deces',(nd asString).
						nodes add: nn.
						edgename := event rate asString.
						transitcollection add: ((event fromStatus asString)->nn).
						nd:=nd+1.
					].
					(((event fromStatus) isNotEmpty) and:[(event toStatus) isNotEmpty]) ifTrue:[
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
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.
				RTEdge model: 'lien'.
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView.
				"view @ (RTLabelled new color: Color red; view: view; offsetOnEdge: 0.3)"
			]