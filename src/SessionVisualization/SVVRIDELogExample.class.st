Class {
	#name : #SVVRIDELogExample,
	#superclass : #Object,
	#category : #'SessionVisualization-VRIDE'
}

{ #category : #'as yet unclassified' }
SVVRIDELogExample >> configureModel: model [

	model
		addRule: [ :l | l endsWith: 'Opened new window: Playground' ]
		named: 'New playground'
		color: Color green.
	model
		addRule: [ :l | l endsWith: 'Opened new window: Inspector' ]
		named: 'New inspector'
		color: Color green.
	model
		addRule: [ :l | '*Finished interaction*' match: l ]
		named: 'Interaction'
		color: Color green.

	model
		addRule: [ :l | '*Executed code:*' match: l ]
		named: 'Executing'
		color: Color blue
		mark: true.
	model
		addRule: [ :l | '*Inspected variable:*' match: l ]
		named: 'Executing & Inspecting'
		color: Color blue
		mark: true.

	model
		addRule: [ :l | '*Defined class with code:*' match: l ]
		named: 'Class definition'
		color: Color purple darker.
	model
		addRule: [ :l | '*Defined method with code:*' match: l ]
		named: 'Method definition'
		color: Color purple darker
]

{ #category : #'as yet unclassified' }
SVVRIDELogExample >> exampleLargeJhonny [

	<script: 'self new exampleLargeJhonny'>
	| model |
	model := SV new.
	self configureModel: model.
	model processStream:
		'/Users/alexandrebergel/Dropbox/GitRepos/SessionVisualization/data/Jhonny.txt'
			asFileReference readStream.
	^ model open
]

{ #category : #'as yet unclassified' }
SVVRIDELogExample >> exampleLargeMilton [
	<script: 'self new exampleLargeMilton'>
	| model |
	model := SV new.
	self configureModel: model.	
	model processStream: '/Users/alexandrebergel/Dropbox/GitRepos/SessionVisualization/data/Milton.txt' asFileReference readStream. 
	
	^ model open
]

{ #category : #'as yet unclassified' }
SVVRIDELogExample >> exampleSmallMilton [
	<script: 'self new exampleLargeMilton'>
	| model |
	model := SV new.
	model addRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model addRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model addRule: [ :l | '*Finished interaction*' match: l ] named: 'Window interaction' color: Color gray.
	model addRule: [ :l | '*Executed code:*' match: l ] named: 'Execution' color: Color red.
	model addRule: [ :l | '*Inspected variable:*' match: l ] named: 'Variable inspection' color: Color red.
	model addRule: [ :l | '*Defined class with code:*' match: l ] named: 'Class definition' color: Color red.
	model addRule: [ :l | '*Defined method with code:*' match: l ] named: 'Method definition' color: Color red.
	
	model processStream: '/Users/alexandrebergel/Dropbox/GitRepos/SessionVisualization/data/MiltonSmall.txt' asFileReference readStream. 
	
	^ model open
]

{ #category : #'as yet unclassified' }
SVVRIDELogExample >> exampleVerySmall [
	<script: 'self new exampleVerySmall'>
	| model |
	model := SV new.
	model addRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model addRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model addRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red.
	model processText: SVVRIDETest new example.
	
	^ model open
]
