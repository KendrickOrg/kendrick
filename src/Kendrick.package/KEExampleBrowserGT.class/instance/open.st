as yet unclassified
open
	| pager |
	pager := GLMPager new.
	pager title: 'Kendrick examples browser'.
	pager showFirst: [ :a | a list format: #label ].
	pager show: [ :a :each |
			a title: [ GTInspector new printObjectAsAnItem: each ].
			a dynamicActions: [ :aPresentation | 
				each gtInspectorActions asOrderedCollection ].
			a dynamic 
				display: [ :x | 
					(GLMCompositePresentation new with: [:d | 
						each 
							gtInspectorPresentationsIn: d 
							inContext: pager ])
							startOn: x ] ].
	pager openOn: (KEExamples allSubclasses collect: #new)