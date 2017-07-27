public-api
allHierarchyTransitions
	| tmp2 |
	tmp2 := backEndEntity transitions copy.
	tmp2
		addAll:
			(structuralDependencies
				flatCollect: [ :arg1 | (KendrickModel withId: arg1) allHierarchyTransitions ]).
	^ tmp2 yourself