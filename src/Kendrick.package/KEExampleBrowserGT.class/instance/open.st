instance creation
open
	| tmp1 |
	tmp1 := GLMPager new.
	tmp1
		title: 'Kendrick examples browser';
		showFirst: [ :arg1 | arg1 list format: #label ];
		show: [ :arg2 :arg3 | 
			arg2
				title: [ GTInspector new printObjectAsAnItem: arg3 ];
				dynamicActions: [ :arg4 | arg3 gtInspectorActions asOrderedCollection ].
			arg2 dynamic
				display: [ :arg5 | 
					(GLMCompositePresentation new
						with: [ :arg6 | arg3 gtInspectorPresentationsIn: arg6 inContext: tmp1 ])
						startOn: arg5 ] ];
		openOn: (KEExamples allSubclasses collect: #new)