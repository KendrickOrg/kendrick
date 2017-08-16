private
addMoreTransitionsFrom: tr ToEvaluateRates: rates
	|trs|
	trs := model createMoreTransitions: tr.
	trs do: [ 
		:each|
		self evaluateRates: rates from: each.
		 ].