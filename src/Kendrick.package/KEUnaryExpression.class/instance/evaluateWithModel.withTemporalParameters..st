as yet unclassified
evaluateWithModel: aModel withTemporalParameters: parameters
	|value|
	value := expression evaluateWithModel: aModel withTemporalParameters: parameters.
	op = #- ifTrue:[^ value negated]