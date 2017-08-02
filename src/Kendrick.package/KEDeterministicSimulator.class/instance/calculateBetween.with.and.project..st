private
calculateBetween: m with: n and: p project: k
	|nProjection pProjection|
	(p isNumber and: (n isNumber)) ifTrue: [ ^(m*n*p) ]
		ifFalse: [ 
			pProjection := p.
			p isArray ifTrue: [ 
				pProjection := self project: p into: k.
				 ].
			nProjection := n.
			n isArray ifTrue: [ 
				nProjection := self project: n into: k.
				 ].
			^(m * nProjection * pProjection ).
			 ]