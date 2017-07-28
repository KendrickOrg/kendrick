public-api
delay: symExpression
 
	"#(sigma , S -- lambda --> I  , E)"
	| varList delay targetLeftNode initialRate targetRightNode newNode |
	varList := symExpression 
		select: [ :token | (#(-- --> ,) includes: token) not ].
	delays add: varList.
	delay := varList first.
	targetLeftNode := self literalTransitionRefFor: varList second.
	initialRate := varList third.
	targetRightNode :=  self literalTransitionRefFor: varList fourth.
	newNode := { targetRightNode first key -> varList fifth }.
	
	backEndEntity atAttribute: targetRightNode first key add: varList fifth.
	(attributes at: targetRightNode first key) add: varList fifth.
	
	backEndEntity 
		removeTransitionFrom: targetLeftNode  
		to: targetRightNode.
	backEndEntity 
		addTransitionFrom: targetLeftNode  
		to: newNode  
    	probability: [ :aModel| aModel atParameter: initialRate ].
	backEndEntity 
    addTransitionFrom: newNode  
    to: targetRightNode  
    probability: [ :aModel| aModel atParameter: delay ].
	backEndEntity 
    addTransitionFrom: newNode 
    to: #empty 
    probability: [ :aModel| aModel atParameter: (emptyRate ifNil: [#mu]) "default value" ].