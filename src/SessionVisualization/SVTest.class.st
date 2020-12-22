Class {
	#name : #SVTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #SessionVisualization
}

{ #category : #example }
SVTest >> example [
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

{ #category : #tests }
SVTest >> testAllExamples [
	SVExample selectors do: [ :s |
		(s beginsWith: 'example')
			ifTrue: [ (SVExample new perform: s) delete ] ]
]

{ #category : #tests }
SVTest >> testExample [

	model := SV new.
	model addRule: [ :l | l endsWith: 'Opened new window: Playground' ] named: 'Playground' color: Color green.
	model addRule: [ :l | l endsWith: 'Opened new window: Inspector' ] named: 'Inspector' color: Color lightGreen.
	model addRule: [ :l | '*Finished interaction with a WindowDragging*' match: l ] named: 'Drag' color: Color red.
	model processText: self example.
	
	self assert: model numberOfEntries equals: 10.
	self assert: model numberOfRules equals: 3.
	 

]
