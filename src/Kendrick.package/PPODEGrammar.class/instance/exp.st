grammar
exp
	^ $e asParser trim, $x asParser trim, $p asParser trim, $( asParser trim, terms , $) asParser trim
	