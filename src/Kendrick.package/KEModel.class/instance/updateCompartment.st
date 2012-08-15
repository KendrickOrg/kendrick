as yet unclassified
updateCompartment

compartments do:[:eachComp|
			|ct|
			ct:=0.
			listOfIndividuals do: [:eachIndi|
				((eachComp status) = (eachIndi currentStatus)) ifTrue: [ct:=ct+1].
				].
			eachComp numberOfIndividuals: ct.
			].	