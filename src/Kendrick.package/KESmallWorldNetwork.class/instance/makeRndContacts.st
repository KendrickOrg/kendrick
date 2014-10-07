as yet unclassified
makeRndContacts
	|rand|
	rand := Random new.
	"if the number of random contacts is not declared, take the default value"
	rndContact ifNil: [ rndContact := ((self nodes size)//3) ].
	1 to: rndContact do: [ :k|
		|i j|
		i := 1. 
		j := 1.
		[ (i = j) | ((self checkEdge: (Array with: i with: j)) ~= 0) ] 
		whileTrue: [ 
			i := ((rand next) * (self nodes size)) ceiling.
			j := ((rand next) * (self nodes size)) ceiling.
			 ].
		self with: (Array with: i with: j) weight: #contact value: 1
		 ]
	