as yet unclassified
bench
	| tmp1 tmp2 tmp4 |
	tmp1 := self benchmark: [ self beforeBench ] times: 100.
	tmp2 := self benchmark: [ self afterBench ] times: 100.
	tmp4 := Transcript.
	tmp4
		show: tmp1;
		cr;
		show: tmp2;
		cr;
		show: (tmp2 at: 1) / (tmp1 at: 1);
		cr;
		cr