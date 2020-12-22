Class {
	#name : #SVRule,
	#superclass : #Object,
	#instVars : [
		'block',
		'name',
		'color',
		'entries'
	],
	#category : #SessionVisualization
}

{ #category : #adding }
SVRule >> addEntry: anEntry [
	entries add: anEntry
]

{ #category : #accessing }
SVRule >> block [

	^ block
]

{ #category : #accessing }
SVRule >> block: anObject [

	block := anObject
]

{ #category : #accessing }
SVRule >> color [

	^ color
]

{ #category : #accessing }
SVRule >> color: anObject [

	color := anObject
]

{ #category : #accessing }
SVRule >> entries [

	^ entries
]

{ #category : #accessing }
SVRule >> entries: anObject [

	entries := anObject
]

{ #category : #initialization }
SVRule >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #accessing }
SVRule >> match: aContent [
	^ block value: aContent
]

{ #category : #accessing }
SVRule >> name [

	^ name
]

{ #category : #accessing }
SVRule >> name: anObject [

	name := anObject
]
