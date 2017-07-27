tests
testAddParameterExpression
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addParameter: #beta value: [ :arg1 | arg1 t cos ];
		addParameter: #gamma value: 'cos(t)';
		t: 60.
	self
		assert: ((tmp1 parameters at: #beta) value: tmp1) equals: 60 cos;
		assert: ((tmp1 parameters at: #gamma) value: tmp1) equals: 60 cos