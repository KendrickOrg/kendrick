private
sum: anArray
	"self new sum: #(#(1 1) #(2 2) #(3 3))"
	"self new sum: #(1 2 3)"
	|first api temp|
	first := anArray first .
	first isNumber ifTrue: [ ^(anArray sum). ].
	first isArray ifTrue: 
		[ 
			api := KEBinaryExpression new.
			api op: #+.
			temp := api convertToAnArray: 0 inFormat: first.
			anArray do: [ :each| temp := api calculateArraysBetween: each with: temp ].
			^temp.
		].