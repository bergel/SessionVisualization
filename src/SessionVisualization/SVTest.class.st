Class {
	#name : #SVTest,
	#superclass : #TestCase,
	#category : #'SessionVisualization-Core'
}

{ #category : #tests }
SVTest >> testAccessingRules [

	| sv rule |
	sv := SV new.
	self should: [ sv getRuleNamed: 'MyRule' ] raise: Error.
	
	rule := SVRule new name: 'MyRule'.
	sv addRule: rule.
	
	self assert: (sv getRuleNamed: 'MyRule') equals: rule
]

{ #category : #tests }
SVTest >> testEmpty [

	SV new open delete
]

{ #category : #tests }
SVTest >> testSimple [

	| sv entry |
	sv := SV new.
	sv
		createRule: [ :l | '*' match: l ]
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
		createRule: [ :l | '*' match: l ]
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

{ #category : #tests }
SVTest >> testSimple3 [

	| sv entries rule |
	sv := SV new.
	rule := SVRule new name: 'Foo'.

	rule addEntry: (SVEntry new content: 'Hello'; timestampFromString: '10:15').
	rule addEntry: (SVEntry new content: 'World'; timestampFromString: '10:17').
	rule addEntry: (SVEntry new content: 'World'; timestampFromString: '10:18').
	
	self assert: 0 equals: sv numberOfEntries.
	self assert: 3 equals: rule entries size.
	
	rule entries do: [ :e | sv addEntry: e ]. 

	self assert: 0 equals: sv numberOfEntries.
	self assert: 3 equals: rule entries size.
	
	rule block: [ :l | true ].
	sv addRule: rule.
	rule entries do: [ :e | sv addEntry: e ]. 
	self assert: (rule match: 'Hello').
	self assert: 3 equals: sv numberOfEntries.
	self assert: 6 equals: rule entries size.

	
	entries := sv entries.
	self assert: entries first relativeStarttime equals: 0.
	self assert: entries second relativeStarttime equals: 2 * 60.
	sv open delete
]
