public-api
addStatus: symExpression

	(attributes at: #status) add: symExpression first.
	backEndEntity addStatus: symExpression.