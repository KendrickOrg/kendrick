private
calculateBetween: m with: n and: p
	p isNumber ifTrue: [ ^(m*n*p) ]
		ifFalse: [ 
			p isArray ifTrue: [ 
				^(self calculateBetween: m with: n andArray: p)
				 ]
			 ]