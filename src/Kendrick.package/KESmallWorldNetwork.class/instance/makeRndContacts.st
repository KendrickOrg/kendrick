as yet unclassified
makeRndContacts
	|rand|
	rand := Random new.
	rndContact ifNil: [ rndContact := (nbInd//3) ].
	1 to: rndContact do: [ :k|
		|i j|
		i := 1. 
		j := 1.
		[ (i = j) | ((self checkEdge: (Array with: i with: j)) ~= 0) ] 
		whileTrue: [ 
			i := ((rand next) * nbInd) ceiling.
			j := ((rand next) * nbInd) ceiling.
			 ].
		self with: (Array with: i with: j) weight: #contact value: 1
		 ].
	