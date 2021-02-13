Class {
	#name : #SVVRIDETest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'SessionVisualization-VRIDE'
}

{ #category : #example }
SVVRIDETest >> example [
	^ '[ 19-12-2020 13:28:00 ] Started interaction with a WindowDragging
[ 19-12-2020 13:28:15 ] Finished interaction with a WindowDragging. Time Spent: 14923 ms
[ 19-12-2020 13:29:09 ] Opened new window: Playground
[ 19-12-2020 13:29:09 ] Opened new window: Inspector
[ 19-12-2020 13:31:33 ] Started interaction with a WindowDragging
[ 19-12-2020 13:31:33 ] Finished interaction with a WindowDragging. Time Spent: 322 ms
[ 19-12-2020 13:32:52 ] Opened new window: Playground
[ 19-12-2020 13:32:53 ] Started interaction with a Playground
[ 19-12-2020 13:38:02 ] Finished interaction with a Playground. Time Spent: 308910 ms
[ 19-12-2020 13:38:03 ] Session ended.
[ 19-12-2020 17:12:21 ] Opened new window: Playground
[ 19-12-2020 17:12:21 ] Opened new window: Playground
[ 19-12-2020 17:12:21 ] Opened new window: Inspector
[ 19-12-2020 17:12:35 ] Started interaction with a WindowDragging
[ 19-12-2020 17:12:40 ] Finished interaction with a WindowDragging. Time Spent: 4876 ms
[ 19-12-2020 17:12:44 ] Started interaction with a WindowDragging
[ 19-12-2020 17:12:48 ] Finished interaction with a WindowDragging. Time Spent: 3387 ms
[ 19-12-2020 17:12:51 ] Started interaction with a WindowDragging
[ 19-12-2020 17:12:57 ] Started interaction with a WindowDragging'
]

{ #category : #example }
SVVRIDETest >> exampleWithMultiLine [
	^ '[ 19-12-2020 17:17:10 ] Executed code:
a 
with response:
OCUndeclaredVariableWarning: Undeclared temp: a

[ 19-12-2020 17:17:13 ] Started interaction with a Playground
[ 19-12-2020 17:17:17 ] Finished interaction with a Playground. Time Spent: 3687 ms'
]

{ #category : #tests }
SVVRIDETest >> testAllExamples [
"	SVExample selectors do: [ :s |
		(s beginsWith: 'example')
			ifTrue: [ (SVExample new perform: s) delete ] ]"
]

{ #category : #tests }
SVVRIDETest >> testExample [

	model := SV new.
	model createRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model createRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model createRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red.
	model processText: self example.
	
	self assert: model numberOfEntries equals: 10.
	self assert: model numberOfRules equals: 3.
	 

]

{ #category : #tests }
SVVRIDETest >> testExampleMultiline [


	model := SV new.
	model createRule: [ :l | '*interaction*' match: l ] named: 'Inspector' color: Color lightGreen.
	model createRule: [ :l | '*Executed code:*' match: l ] named: 'Executed' color: Color red.
	
	model processText: self exampleWithMultiLine.
	
	self assert: model numberOfEntries equals: 3.
	
	self assert: model entries first content equals: '[ 19-12-2020 17:17:10 ] Executed code:
a 
with response:
OCUndeclaredVariableWarning: Undeclared temp: a
'.
	self assert: model entries second content equals: '[ 19-12-2020 17:17:13 ] Started interaction with a Playground'.
	self assert: model entries third content equals: '[ 19-12-2020 17:17:17 ] Finished interaction with a Playground. Time Spent: 3687 ms'.	
]

{ #category : #tests }
SVVRIDETest >> testExampleMultiline2 [


	model := SV new.
	model createRule: [ :l | '*interaction*' match: l ] named: 'Inspector' color: Color lightGreen.
	model createRule: [ :l | '*Executed code:*' match: l ] named: 'Executed' color: Color red.
	model processStream: self exampleWithMultiLine readStream.
	
	self assert: model numberOfEntries equals: 3.
	
	self assert: model entries first content equals: '[ 19-12-2020 17:17:10 ] Executed code:
a 
with response:
OCUndeclaredVariableWarning: Undeclared temp: a
'.
	self assert: model entries second content equals: '[ 19-12-2020 17:17:13 ] Started interaction with a Playground'.
	self assert: model entries third content equals: '[ 19-12-2020 17:17:17 ] Finished interaction with a Playground. Time Spent: 3687 ms'.	
]

{ #category : #tests }
SVVRIDETest >> testExampleVerticalBar [

	model := SV new.
	model createRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model createRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model createRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red mark: true.
	model processText: self example.
	
	self assert: model numberOfEntries equals: 10.
	self assert: model numberOfRules equals: 3.
	
	model open delete
	 

]

{ #category : #tests }
SVVRIDETest >> testExampleWithStream [

	model := SV new.
	model createRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model createRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model createRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red.
	model processStream: self example readStream.
	
	self assert: model numberOfEntries equals: 10.
	self assert: model numberOfRules equals: 3.
	 

]
