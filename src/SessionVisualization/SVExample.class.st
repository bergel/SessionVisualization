Class {
	#name : #SVExample,
	#superclass : #Object,
	#category : #SessionVisualization
}

{ #category : #'as yet unclassified' }
SVExample >> exampleVerySmall [
	<script: 'self new exampleVerySmall'>
	| model |
	model := SV new.
	model addRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model addRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model addRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red.
	model processText: SVTest new example.
	
	^ model open
]
