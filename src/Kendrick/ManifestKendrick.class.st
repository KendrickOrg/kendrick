"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestKendrick,
	#superclass : #PackageManifest,
	#category : #'Kendrick-Manifest'
}

{ #category : #'code-critics' }
ManifestKendrick class >> ruleRBMethodSourceContainsLinefeedsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#KEDiagramsBuilder #plotLog #false)) #'2021-02-21T13:32:08.331237+01:00') )
]
