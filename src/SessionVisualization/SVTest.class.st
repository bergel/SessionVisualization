Class {
	#name : #SVTest,
	#superclass : #TestCase,
	#category : #'SessionVisualization-Core'
}

{ #category : #tests }
SVTest >> testEmpty [

	SV new open delete
]

{ #category : #tests }
SVTest >> testSimple [

	| sv entry |
	sv := SV new.
	sv
		addRule: [ :l | '*' match: l ]
		named: 'Class definition'
		color: Color purple darker.

	entry := SVEntry new content: 'Hello'; timestampFromString: '10:15'.
	sv addEntry: entry.
	sv open delete
]

{ #category : #tests }
SVTest >> testSimple2 [

	| sv entries |
	sv := SV new.
	sv
		addRule: [ :l | '*' match: l ]
		named: 'Class definition'
		color: Color purple darker.
	sv addEntry: (SVEntry new content: 'Hello'; timestampFromString: '10:15').
	sv addEntry: (SVEntry new content: 'World'; timestampFromString: '10:17').
	sv addEntry: (SVEntry new content: 'World'; timestampFromString: '10:18').
	
	self assert: 3 equals: sv numberOfEntries.
	
	entries := sv entries.
	self assert: entries first relativeStarttime equals: 0.
	self assert: entries second relativeStarttime equals: 2 * 60.
	sv open delete
]
