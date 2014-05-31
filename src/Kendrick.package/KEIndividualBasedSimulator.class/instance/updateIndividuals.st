as yet unclassified
updateIndividuals
	model PIDList do: [ :pid|
		|subPop indList|
		model setPID: pid.
		subPop := model population at: pid.
		indList := subPop graph indList.
		1 to: indList size do: [ :i|
			|ind nextStt moveTo|
			ind := indList at: i.
			ind ifNotNil: [ 
				nextStt := ind attributes at: #nextStatus ifAbsent: [ nil ].
				nextStt ifNotNil: [ 
					ind updateStatus: subPop.
					 ].
				moveTo := ind attributes at: #moveTo ifAbsent: [ nil ].
				moveTo ifNotNil: [ 
					ind moveTo: (model population at: moveTo).
					subPop graph releaseRoom: i.
					(subPop at: (ind currentStatus)) removeIndividual: 1
					 ]
				 ]
			 ]
		 ]