evaluating
evaluateWithModel: aModel

| left right |
left := leftHandSide evaluateWithModel: aModel.
right := rightHandSide evaluateWithModel: aModel.

(left isArray | right isArray) ifTrue: [ 
	left isNumber ifTrue: [ left := (self convertToAnArray: left  inFormat: right )].
	right isNumber ifTrue: [ right := (self convertToAnArray: right  inFormat: left )].
	^ (self calculateArraysBetween: left with: right).
	 ]. 
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