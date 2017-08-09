private
createMoreTransitions: tr 
	|trs species|
	"ThanhNT 8-Aug-2017"
	"Some transitions - in case multi hosts - doesnt have information"
	"about species, such as From {status->#I} to {status->#R}. So we"
	"should add the species into its keys"
	"Run the exampleRK4SIRModelMultiHost in class KEIndexedVariableTest to know"
	species := self attributes at: #species.
	trs := Array new: (species size).
	1 to: (species size) do: [ 
		:each|
		|t from to| 
		t := KETransition new.
		from := Dictionary new: 2.
		to := Dictionary new: 2.
		from add: ((tr from) associationAt: #status).
		from at: #species put: (species at: each).
		
		to add: ((tr to) associationAt: #status).
		to at: #species put: (species at: each).	
		
		t from: from.
		t to: to.
		t probability: tr probability.
		trs at: each put: t.
		 ].
	^trs.