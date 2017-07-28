as yet unclassified
benchmark: aBlock times: anInteger

	"µ the average time in ms and τ standard deviation"

	| runs average deviation |

	runs := [ 
		(1 to: anInteger) 
			collect: [ :each | Time millisecondsToRun: aBlock ] ] 
		valueUnpreemptively.
	average := runs average asFloat.
	deviation := ((runs 
		detectSum: [ :each | (each - average) * (each - average) ]) 
			/ runs size) sqrt.
	^ Array with: average with: deviation