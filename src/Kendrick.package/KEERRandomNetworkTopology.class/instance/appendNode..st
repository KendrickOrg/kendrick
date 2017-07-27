as yet unclassified
appendNode: arg1
	| tmp1 tmp2 tmp3 |
	tmp1 := arg1 key.
	tmp2 := arg1 value.
	tmp3 := Random new.
	activeNodes
		do: [ :arg2 | 
			p > tmp3 next
				ifTrue: [ tmp2 edgesFrom: tmp1 toAll: (Array with: arg2) ] ];
		add: tmp1