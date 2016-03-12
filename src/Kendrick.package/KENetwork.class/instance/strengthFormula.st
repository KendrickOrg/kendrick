accessing
strengthFormula
	strengthFormula ifNil: [ strengthFormula := [:rho| rho] ].
	^ strengthFormula 