public-api
addStatus: arg1
	(attributes at: #status) add: arg1 first.
	backEndEntity addStatus: arg1