Class {
	#name : #KEExampleBrowserGT,
	#superclass : #RTObject,
	#category : 'Kendrick-Examples'
}

{ #category : #'world menu' }
KEExampleBrowserGT class >> menuCommandOn: aBuilder [

	((aBuilder item: #Kendrick) icon: KEIcon smallKendrick)
	withSeparatorAfter;
	with: [
		(aBuilder item: #'Kendrick Examples GT')
			order: 0.1; 
			parent: #Kendrick;
			label: 'Kendrick examples GT';
			icon: KEIcon smallKendrick;
			action: [ self new open ] ]
]

{ #category : #'instance creation' }
KEExampleBrowserGT >> open [
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
]
