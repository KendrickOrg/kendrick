examples
riskGroupConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1 addAttribute: #riskGroup value: (1 to: 5) asArray.
	^ tmp1