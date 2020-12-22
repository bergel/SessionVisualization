Class {
	#name : #SVEntry,
	#superclass : #Object,
	#instVars : [
		'rule',
		'content',
		'timestamp',
		'second'
	],
	#category : #SessionVisualization
}

{ #category : #accessing }
SVEntry >> content [

	^ content
]

{ #category : #accessing }
SVEntry >> content: anObject [

	content := anObject
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

	^ second
]

{ #category : #accessing }
SVEntry >> second: anInteger [

	second := anInteger
]

{ #category : #accessing }
SVEntry >> timestamp [

	^ timestamp
]

{ #category : #accessing }
SVEntry >> timestamp: anObject [

	timestamp := anObject
]