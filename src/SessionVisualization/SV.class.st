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

{ #category : #'instance creation' }
SV >> entries [
	^ entries
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

	| c maxWidth scale shape lbl box |
	c := RSCanvas new.
	
	maxWidth := 500.
	scale := NSScale linear.
	scale range: { 0 . maxWidth }.
	scale domain: { 0 . entries last second }.
	
	box := RSBox new color: Color transparent; withBorder.
	box fromRectangle: ((0 @ 10) extent: (maxWidth @ (self numberOfRules  * 20))).
	c add: box.
	
	rules doWithIndex: [ :r :index |
		lbl := RSLabel text: r name.
		c add: lbl.
		lbl translateMiddleRightTo: -20 @ (index * 20).
		
		r entries do: [ :entry |
			shape := RSEllipse new.
			shape size: 10.
			shape color: (r color alpha: 0.8).
			c add: shape.
			shape translateTo: (scale scale: entry second) @ (index * 20)
		]
	].
	
	
	
	c @ RSCanvasController.
	^ c open
]

{ #category : #'as yet unclassified' }
SV >> processSingleEventAsString: aLine [

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
	| isInMultiLine currentEvent |
	isInMultiLine := false.
	currentEvent := nil.
	aText lines do: [ :l | 
		
		(l beginsWith: '[ ') 
			ifTrue: [ 
				currentEvent ifNotNil: [ self processSingleEventAsString: currentEvent ].
				isInMultiLine := false. currentEvent := l. ]
			ifFalse: [ isInMultiLine := true. currentEvent := currentEvent, String cr, l ].
		 ].
	currentEvent ifNotNil: [ self processSingleEventAsString: currentEvent ].
]
