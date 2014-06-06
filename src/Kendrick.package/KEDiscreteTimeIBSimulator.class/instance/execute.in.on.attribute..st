as yet unclassified
execute: eChosen in: events on: ind attribute: attribute
	"This function is called in calProb:"
	|e rate prob rand|
	e := events at: eChosen.
	rand := Random new.
	attribute = #moveTo 
	ifTrue: [ rate := (self eventRates at: (ind pid)) at: eChosen ]
	ifFalse: [ rate := (self eventRates at: (ind currentStatus)) at: eChosen ].
	rate = -1 ifTrue: [ rate := (e evaluateIntraPopInteractionWithModel: model) + (e evaluateInterPopInteractionWithModel: model) ].
	prob := 1 - (((step * rate) negated) exp).
	(prob > (rand next)) ifTrue: [ 
		ind attributes at: attribute put: (e toStatus)
		 ].
	^ ind