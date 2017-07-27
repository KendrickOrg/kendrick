tests
testUpdateAttributes
	| tmp1 |
	tmp1 := KEIndividual new
		currentStatus:
			(Dictionary
				newFrom:
					{(#status -> #S).
					(#region -> #A)}).
	tmp1
		nextStatus:
			(Dictionary
				newFrom:
					{(#status -> #I).
					(#region -> #A)});
		updateAttributes: tmp1 nextStatus.
	self
		assert: (tmp1 attributes at: #status) equals: #I;
		assert: (tmp1 attributes at: #region) equals: #A