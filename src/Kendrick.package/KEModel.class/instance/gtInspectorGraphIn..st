as yet unclassified
gtInspectorGraphIn:composite
<gtInspectorPresentationOrder: 30>
     composite list
          title: 'Box View';
          display: [ 
				| view nodes transitcollection arrow nd nb events demography|
				nd:=0.
				nb:=0.
				transitcollection := OrderedCollection new.
				nodes := OrderedCollection new.
				demography := OrderedCollection new.
				
				view := RTView new.
				"Collect all nodes of the graph"
				self population compartments collect:[:each | nodes add: (each status asString)].
			
				"Generate relation between nodes"
				events := (KEEventGenerator new) generateEvents: self.
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
				arrow := RTArrow new 
					color: Color red; 
					attachPoint: RTHorizontalAttachPoint instance.
				RTEdge buildEdgesFromObjects: transitcollection from: #key to: #value using: arrow inView: view.	
								
				"Add the layout"
				RTHorizontalTreeLayout new;
				on: view elements.
				view @ RTDraggableView. ]