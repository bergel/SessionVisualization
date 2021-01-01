Class {
	#name : #BaselineOfSessionVisualization,
	#superclass : #BaselineOf,
	#category : #BaselineOfSessionVisualization
}

{ #category : #baseline }
BaselineOfSessionVisualization >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do:
			[ 
"			spec project: 'Roassal3' with: [
				spec
					className: #ConfigurationOfFicus;
					versionString: #development;
					loads: #FicusMonticello;
					repository: 'http://smalltalkhub.com/mc/MartinDias/Ficus/main' ].
"			
			spec package: 'SessionVisualization'.

			spec
				group: 'default' with: #('SessionVisualization')
			]
]
