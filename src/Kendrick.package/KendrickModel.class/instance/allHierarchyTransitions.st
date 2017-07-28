public-api
allHierarchyTransitions

	^ backEndEntity transitions copy 
		addAll: (structuralDependencies 
			flatCollect: [ :name | (KendrickModel withId: name) allHierarchyTransitions ]);
		yourself