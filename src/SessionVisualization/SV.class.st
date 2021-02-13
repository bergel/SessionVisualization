Class {
	#name : #SV,
	#superclass : #Object,
	#instVars : [
		'entries',
		'rules',
		'startTime'
	],
	#category : #'SessionVisualization-Core'
}

{ #category : #public }
SV >> addEntry: anEntry [
	rules do: [ :r |
		(r match: anEntry content)
			ifTrue: [ 
				entries ifEmpty: [ startTime := anEntry timestamp ].
				
				anEntry second: anEntry timestamp asSeconds - startTime asSeconds.
				entries add: anEntry.
				r addEntry: anEntry.
				^ self ] ]
	

	
]

{ #category : #adding }
SV >> addRule: oneArgBlock named: aName color: aColor [ 
	self addRule: oneArgBlock named: aName color: aColor mark: false
]

{ #category : #adding }
SV >> addRule: oneArgBlock named: aName color: aColor mark: aBoolean [
	rules add: (SVRule new block: oneArgBlock; name: aName; color: aColor; shouldMark: aBoolean)
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

{ #category : #metrics }
SV >> numberOfEntries [
	^ entries size
]

{ #category : #metrics }
SV >> numberOfRules [
	^ rules size
]

{ #category : #'instance creation' }
SV >> open [

	| c maxWidth scale shape lbl box allCircles line verticalLine |
	c := RSCanvas new.
	
	"Simply open the canvas if there is no entry"
	entries ifEmpty: [ ^ c open ].
	
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
		
		line := RSLine new.
		line from: 0 @ (index * 20).
		line to: maxWidth @ (index * 20).
		line color: Color gray lighter lighter lighter lighter.
		line dashed.
		c add: line.
		
		r entries do: [ :entry |
			shape := RSEllipse new.
			shape size: 10.
			shape color: (r color alpha: 0.5).
			shape model: entry.
			c add: shape.
			shape @ RSPopup.
			shape when: RSMouseClick do: [ :evt | evt shape model inspect ].
			shape translateTo: (scale scale: entry second) @ (index * 20).
			
			r shouldMark ifTrue: [ 
				verticalLine := RSLine new color: Color red lighter.
				verticalLine from: (shape position x @ 10). 
				verticalLine to: (shape position x @ (self numberOfRules + 0.5* 20)).
				c add: verticalLine
			]
		]
	].
	
	allCircles := c nodes select: [ :s | s class == RSEllipse ].
	RSNormalizer size
		shapes: allCircles;
		from: 5; to: 15;
		normalize: [ :entry | entry relevantContent lines size ].
	
	c @ RSCanvasController.
	
"RSPDFExporter new
		canvas: c;
		exportToFile: '/tmp/foo.pdf' asFileReference."

	^ c open
]

{ #category : #'public - VRIDE' }
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

{ #category : #'public - VRIDE' }
SV >> processStream: aStream [
	| isInMultiLine currentEvent l lineNumber |
	lineNumber := 0.
	isInMultiLine := false.
	currentEvent := WriteStream on: String new.
	[ aStream atEnd ] whileFalse: [ 
		l := aStream nextLine.		
		lineNumber := lineNumber + 1.
		(l beginsWith: '[ ') 
			ifTrue: [ 
				currentEvent isEmpty ifFalse: [ self processSingleEventAsString: currentEvent contents ].
				isInMultiLine := false. currentEvent := WriteStream on: String new. currentEvent nextPutAll: l. ]
			ifFalse: [ isInMultiLine := true. currentEvent nextPutAll: String cr, l ].
		 ].
	currentEvent isEmpty ifFalse: [ self processSingleEventAsString: currentEvent contents ].
]

{ #category : #'public - VRIDE' }
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

{ #category : #'public - TorchAnalysis' }
SV >> processTorchStream: stream [
	
]
