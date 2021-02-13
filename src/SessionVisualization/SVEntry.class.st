Class {
	#name : #SVEntry,
	#superclass : #Object,
	#instVars : [
		'rule',
		'content',
		'timestamp',
		'relativeStartime'
	],
	#category : #'SessionVisualization-Core'
}

{ #category : #accessing }
SVEntry >> content [

	^ content
]

{ #category : #accessing }
SVEntry >> content: anObject [

	content := anObject
]

{ #category : #printing }
SVEntry >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	str nextPutAll: timestamp asString.
	str nextPut: $>.
]

{ #category : #'as yet unclassified' }
SVEntry >> relativeStarttime [
	^ relativeStartime
]

{ #category : #'as yet unclassified' }
SVEntry >> relativeStarttime: secondsAsInteger [
	relativeStartime := secondsAsInteger
]

{ #category : #accessing }
SVEntry >> relevantContent [
	| lines i |
	lines := self content lines.
	i := lines indexOf: 'with response:'.
	^ String cr join: (lines first: i)
]

{ #category : #accessing }
SVEntry >> rule [

	^ rule
]

{ #category : #accessing }
SVEntry >> rule: anObject [

	rule := anObject
]

{ #category : #accessing }
SVEntry >> second [

	^ relativeStartime
]

{ #category : #accessing }
SVEntry >> second: anInteger [

	relativeStartime := anInteger
]

{ #category : #accessing }
SVEntry >> timestamp [

	^ timestamp
]

{ #category : #accessing }
SVEntry >> timestamp: anObject [

	timestamp := anObject
]

{ #category : #'as yet unclassified' }
SVEntry >> timestampFromString: aString [
	"aString could be 11:45:12"
	timestamp := Time fromString: aString
]
