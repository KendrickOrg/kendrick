as yet unclassified
findCouplingEvents
	|model eventList eventGenerator|
	model := self model.
	eventGenerator := KEEventGenerator new.
	eventList := eventGenerator generateEvents: model.
	eventList do: [ :each| 
		(self checkCouplingEvent: each) ifTrue: [  
			|couplingExpr couplingRate expr|
			each rate isUnaryExpression ifTrue: [ couplingRate := each rate negated ].
			couplingExpr := KECouplingExpression new 
									variable: each fromStatus; 
									couplingExpression: couplingRate; 
									couplingParameter: (each rate getParameter: model parameters).
			expr := (model atEquation: (each fromStatus)) expression.
			(model atEquation: (each fromStatus)) expression: (expr addExpression: couplingExpr negated).
			expr := (model atEquation: (each toStatus)) expression.
			(model atEquation: (each toStatus)) expression: (expr addExpression: couplingExpr)
			]
		]
	