Class {
	#name : #SV,
	#superclass : #Object,
	#instVars : [
		'entries',
		'rules',
		'startTime'
	],
	#category : #SessionVisualization
}

{ #category : #adding }
SV >> addRule: oneArgBlock named: aName color: aColor [
	rules add: (SVRule new block: oneArgBlock; name: aName; color: aColor)
]

{ #category : #initialization }
SV >> initialize [
	super initialize.
	rules := OrderedCollection new.
	entries := OrderedCollection new.
	startTime := Time fromString: '00:00:00'
]

{ #category : #'as yet unclassified' }
SV >> numberOfEntries [
	^ entries size
]

{ #category : #'as yet unclassified' }
SV >> numberOfRules [
	^ rules size
]

{ #category : #'instance creation' }
SV >> open [

	^ RSCanvas new open
]

{ #category : #'as yet unclassified' }
SV >> processLine: aLine [

	| entry t |
	rules do: [ :r |
		(r match: aLine)
			ifTrue: [ 
				t := Time fromString: aLine substrings third.
				entries ifEmpty: [ startTime := t ].
				
				entry := SVEntry new content: aLine; rule: r; timestamp: t; second: (t asSeconds - startTime asSeconds).
				entries add: entry.
				r addEntry: entry.
				^ self
				 ] ]
	

	
]

{ #category : #'as yet unclassified' }
SV >> processText: aText [
	aText lines do: [ :l | self processLine: l ]
]
