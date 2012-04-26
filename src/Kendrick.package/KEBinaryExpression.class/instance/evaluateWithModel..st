as yet unclassified
evaluateWithModel: aModel

| left right |
left := leftHandSide evaluateWithModel: aModel.
right := rightHandSide evaluateWithModel: aModel.

op = #+ ifTrue:[
		^left+right].
op = #* ifTrue:[
		^left*right].
op = #/ ifTrue:[
		^left/right].
op = #-	ifTrue:[
		^left-right].
op = #^ ifTrue:[
		^left raisedTo: right]