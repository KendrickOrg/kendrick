as yet unclassified
evaluateWithModel: aModel withTemporalParameters: parameters

| left right |
left := leftHandSide evaluateWithModel: aModel withTemporalParameters: parameters.
right := rightHandSide evaluateWithModel: aModel withTemporalParameters: parameters.

op = #+ ifTrue:[
		^left+right].
op = #* ifTrue:[
		^left*right].
op = #/ ifTrue:[
		^left/right].
op = #-	ifTrue:[
		^left-right].
op = #'^' ifTrue:[
		^left raisedTo: right]