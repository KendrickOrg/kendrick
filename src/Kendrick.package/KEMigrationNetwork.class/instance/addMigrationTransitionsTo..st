as yet unclassified
addMigrationTransitionsTo: model
	|names|
	names := model population compartments keys select: [ :k| (k associations includesAny: (self restrictions)) not].
	self nodes do: [ :n| 
		n adjacentNodes keysAndValuesDo: [ :k :v| 
			|l|
			l := names select: [ :each| each associations includesAll: n label ].
			l do: [ :from| |to|
				to := from copy.
				to at: attribute put: ((Dictionary newFrom: k) at: attribute).
				model transitions add: (KETransition from: from to: to probability: (KENumerical new number: v))
			] ] ]
	