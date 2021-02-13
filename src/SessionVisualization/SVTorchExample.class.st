Class {
	#name : #SVTorchExample,
	#superclass : #Object,
	#category : #'SessionVisualization-TorchAnalysis'
}

{ #category : #'as yet unclassified' }
SVTorchExample >> configureModel: model [

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

{ #category : #example }
SVTorchExample >> example [
	<script: 'self new example inspect'>
	
	| raw session annotations |
	raw := STONJSON fromString: self source20210213.
	session := (raw at: 'videos') detect: [ :d | (d at: 'description') = 'Juan Pablo (Torch)' ].
	annotations := session at: 'marks'.
	^ annotations
]

{ #category : #'as yet unclassified' }
SVTorchExample >> exampleJuanPabloTorch [
	<script: 'self new exampleJuanPabloTorch'>
	| model |
	model := SV new.
	self configureModel: model.
	self processTorchSession: self sessionJuanPabloTorch.
	^ model open
]

{ #category : #'as yet unclassified' }
SVTorchExample >> processTorchSession: aSessionAsDictionaries [

	self halt.
]

{ #category : #example }
SVTorchExample >> sessionJuanPabloTorch [
	<script: 'self new sessionJuanPabloTorch inspect'>
	
	^ self sessionNamed: 'Juan Pablo (Torch)'
]

{ #category : #example }
SVTorchExample >> sessionNamed: aSessionName [
	<script: 'self new sessionJuanPabloTorch inspect'>
	
	| raw session annotations |
	raw := STONJSON fromString: self source20210213.
	session := (raw at: 'videos') detect: [ :d | (d at: 'description') = aSessionName ].
	annotations := session at: 'marks'.
	^ annotations
]

{ #category : #example }
SVTorchExample >> source20210213 [

^ '{
  "videos": [
    {
      "youtubeId": "1gKC7u_rbAI",
      "description": "Milton (Torch)",
      "marks": []
    },
    {
      "youtubeId": "oeABTYIXW-M",
      "description": "Milton (GH)",
      "marks": []
    },
    {
      "youtubeId": "G8KlMzNNcSg",
      "description": "Alexandre (Both)",
      "marks": []
    },
    {
      "youtubeId": "Gm95Can1RFg",
      "description": "Andreina (Both)",
      "marks": []
    },
    {
      "youtubeId": "DhkTyl7vvz8",
      "description": "Evelyn (Torch)",
      "marks": [
        {
          "timestamp": 103.819094864,
          "description": "Why this class was removed?",
          "tagId": "question"
        },
        {
          "timestamp": 134.87841549,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 177.651529901,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 193.761564562,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 293.108567837,
          "description": "Why this variable was changed?",
          "tagId": "question"
        },
        {
          "timestamp": 314.210297449,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 329.1020189727955,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 355.570596331,
          "description": "Why this variable was removed?",
          "tagId": "question"
        },
        {
          "timestamp": 396.356004383,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 407.088919522,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 422.688775466,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 425.902562811,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 428.350899503,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 549.32779033,
          "description": "Why this method was removed?",
          "tagId": "question"
        },
        {
          "timestamp": 608.797781931,
          "description": "Why this method was removed?",
          "tagId": "question"
        },
        {
          "timestamp": 612.559800526,
          "description": "Why this method was added?",
          "tagId": "question"
        },
        {
          "timestamp": 626.869423538,
          "description": "Were these methods removed or renamed?",
          "tagId": "question"
        },
        {
          "timestamp": 652.335752083,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 664.965703303,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 679.906538318,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 789.168066367,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 807.298390875,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 846.323745246,
          "description": "Why this method was added?",
          "tagId": "question"
        },
        {
          "timestamp": 965.49659856,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 990.392942042,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1040.197085522,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1064.461856232,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1108.788741424,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1177.446814877,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1179.877918808,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1182.743321611,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1188.6060372682557,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1231.402184687,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1250.791913478,
          "description": "Why this method was added?",
          "tagId": "question"
        },
        {
          "timestamp": 1328.819420293,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1355.192417847,
          "description": "What is the goal of a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1437.790451026,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1463.224897608,
          "description": "Was this method removed or renamed/moved?",
          "tagId": "question"
        },
        {
          "timestamp": 1470.7457384374281,
          "description": "Was this method removed or renamed/moved?",
          "tagId": "question"
        },
        {
          "timestamp": 1494.2406610866326,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1506.564263020642,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1515.3547364794952,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1658.544841135,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1758.790957793,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1905.233336274,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1952.984145738,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1971.55177366,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1975.518725651904,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1981.7370727483003,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 2094.545694673,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 2237.256178680035,
          "description": "What are the packages with changes and the added packages?",
          "tagId": "question"
        },
        {
          "timestamp": 2275.939565594275,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 2354.1107430185175,
          "description": "Was this class removed or renamed/moved?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "poB6wirIxb8",
      "description": "Evelyn (GH)",
      "marks": [
        {
          "timestamp": 21.596641899,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 97.79992711815015,
          "description": "What are the changes in the readme file",
          "tagId": "question"
        },
        {
          "timestamp": 135.098732239,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 211.057120737131,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 246.48011060533545,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 296.2325414815239,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 342.3556836027987,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 359.464090704,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 413.828772191,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "vz5Gufd7QVI",
      "description": "Juan Pablo (Torch)",
      "marks": [
        {
          "timestamp": 59.39830207791052,
          "description": "What packages have changed?",
          "tagId": "QGS"
        },
        {
          "timestamp": 68.523833459,
          "description": "What classes were added in this package?",
          "tagId": "US"
        },
        {
          "timestamp": 82.480009049,
          "description": "Is this new or it was refactored?",
          "tagId": "FFP"
        },
        {
          "timestamp": 112.718315936,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 123.343123629,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 149.196887561,
          "description": "What is the goal of this method?",
          "tagId": "FFP"
        },
        {
          "timestamp": 159.06393663001282,
          "description": "What was added in this class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 242.69579707553993,
          "description": "Why we have this class here?",
          "tagId": "FFP"
        },
        {
          "timestamp": 256.719804605,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 271.092255767,
          "description": "What is the goal of this method?",
          "tagId": "FFP"
        },
        {
          "timestamp": 328.321522529,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 332.963048236,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 357.420398644,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 365.495970231,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 373.233539165,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 382.01879153,
          "description": "Is this change big enough to be reported?",
          "tagId": "FFP"
        },
        {
          "timestamp": 392.101160802,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 406.2848909,
          "description": "Why this method was removed?",
          "tagId": "FFP"
        },
        {
          "timestamp": 464.2565814577955,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 481.280937219,
          "description": "Where is the method with that accomplishes this goal?",
          "tagId": "FFP"
        },
        {
          "timestamp": 490.96851798,
          "description": "What is the goal of this class?",
          "tagId": "FFP"
        },
        {
          "timestamp": 506.219674429,
          "description": "Why I need this method in this class?",
          "tagId": "FFP"
        },
        {
          "timestamp": 520.283558655,
          "description": "Is this change adding something new or it just a refactoring?",
          "tagId": "FFP"
        },
        {
          "timestamp": 598.47019621,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 662.6873657003131,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 671.7715176441853,
          "description": "What is the goal of this class?",
          "tagId": "FFP"
        },
        {
          "timestamp": 714.563294578,
          "description": "What clases were added/modified in a specific package?",
          "tagId": "US"
        },
        {
          "timestamp": 722.814476805,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 732.608160762,
          "description": "What are the changes in a specific class?",
          "tagId": "EFP"
        },
        {
          "timestamp": 741.250835448,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 778.69970381,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 823.850702625,
          "description": "Were these methods removed or renamed/moved?",
          "tagId": "US"
        },
        {
          "timestamp": 913.539141103,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 934.281577935,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 977.281945063,
          "description": "What are the changes in a specific method?",
          "tagId": "EFP"
        },
        {
          "timestamp": 1035.290501936,
          "description": "What clases were added/modified in a specific package?",
          "tagId": "US"
        }
      ]
    },
    {
      "youtubeId": "-zpA_fCxO0I",
      "description": "Juan Pablo (GH)",
      "marks": [
        {
          "timestamp": 59.00464962,
          "description": "How many commits were between the versions?",
          "tagId": "question"
        },
        {
          "timestamp": 75.609429633,
          "description": "What are the messages of the commits?",
          "tagId": "question"
        },
        {
          "timestamp": 111.916045446,
          "description": "How many files were change in total?",
          "tagId": "question"
        },
        {
          "timestamp": 157.854211512,
          "description": "What changed in the Readme?",
          "tagId": "question"
        },
        {
          "timestamp": 180.06473802137378,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 254.63208823,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 313.496568978,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 322.161170681,
          "description": "Is this an improvement or something new?",
          "tagId": "question"
        },
        {
          "timestamp": 349.68701544775405,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 374.319159843,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 432.863851769,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 464.472053785,
          "description": "What are the changes in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 380.62867712935,
          "description": "Is this a new feature or just an update to the new API?",
          "tagId": "question"
        },
        {
          "timestamp": 517.685546115,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 519.854218855,
          "description": "Was this class changed only because of refactorings?",
          "tagId": "question"
        },
        {
          "timestamp": 526.950350289,
          "description": "How made this change?",
          "tagId": "question"
        },
        {
          "timestamp": 573.521226441,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 591.275099589,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 595.497569583,
          "description": "Was this class changed only because of refactorings?",
          "tagId": "question"
        },
        {
          "timestamp": 611.449661877,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 623.760485007,
          "description": "Are all the test afffected by the same change?",
          "tagId": "question"
        },
        {
          "timestamp": 645.937051108,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 660.560369298,
          "description": "Were all the tests refactored?",
          "tagId": "question"
        },
        {
          "timestamp": 668.735412473,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 683.641302971,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 713.64993018,
          "description": "Why this class was added?",
          "tagId": "question"
        },
        {
          "timestamp": 756.705640913853,
          "description": "Were these changes only refactorings?",
          "tagId": "question"
        },
        {
          "timestamp": 785.05889278,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 822.3872672745911,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 850.857821973,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 858.170441986,
          "description": "Where are the classes related with this change?",
          "tagId": "question"
        },
        {
          "timestamp": 860.0849957885239,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 950.817722316,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1003.661743132,
          "description": "What classes were created to accomplish this change?",
          "tagId": "question"
        },
        {
          "timestamp": 1038.933487163,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1084.211903889,
          "description": "What are the changes in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 1093.588425745,
          "description": "Where is this variable used?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "iEkrhUWYpsY",
      "description": "2020-11-13 Sabine",
      "marks": []
    },
    {
      "youtubeId": "49bGLZHjNXE",
      "description": "2020-11-18 Stef (1)",
      "marks": []
    },
    {
      "youtubeId": "hg-Q5U_TQ3k",
      "description": "2020-11-18 Stef (2)",
      "marks": []
    },
    {
      "youtubeId": "jBJe1YNPch0",
      "description": "2020-11-25 Jhonny (GitHub)",
      "marks": []
    },
    {
      "youtubeId": "tQ0Aq-EADkY",
      "description": "2020-11-26 Jhonny (Torch)",
      "marks": []
    },
    {
      "youtubeId": "rl37JUMgVHk",
      "description": "2020-12-01 Alison (GitHub)",
      "marks": [
        {
          "timestamp": 429.90751912536746,
          "description": "How many files were changed?",
          "tagId": "question"
        },
        {
          "timestamp": 451.298482807738,
          "description": "What changed in a specific file?",
          "tagId": "question"
        },
        {
          "timestamp": 467.8040051045559,
          "description": "What classes concentrated most of the changes?",
          "tagId": "question"
        },
        {
          "timestamp": 482.9960728160223,
          "description": "What I adding in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 508.647768951,
          "description": "When these changes were made?",
          "tagId": "question"
        },
        {
          "timestamp": 705.512938106131,
          "description": "What changed in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 719.5384363094632,
          "description": "How many LOCS were modified for this change?",
          "tagId": "question"
        },
        {
          "timestamp": 748.4279918909106,
          "description": "What changed in a specific class?",
          "tagId": "question"
        },
        {
          "timestamp": 763.8393759566677,
          "description": "What was the goal of the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 833.177730652,
          "description": "Why is this call here?",
          "tagId": "question"
        },
        {
          "timestamp": 944.0826965596997,
          "description": "How many LOCS were modified for this change?",
          "tagId": "question"
        },
        {
          "timestamp": 982.658131101885,
          "description": "What is the goal of this change in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1066.9684688068178,
          "description": "What was the goal of the changes in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1160.4155936195305,
          "description": "What was the goal of the changes in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1197.4121538956613,
          "description": "Is this change in this method related with the previous method?",
          "tagId": "question"
        },
        {
          "timestamp": 1330.07888721,
          "description": "What are the commit messages realted with these changes?",
          "tagId": "question"
        },
        {
          "timestamp": 1357.644505202,
          "description": "Why I removed this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1441.5000764144409,
          "description": "What were the goals of the changes in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1457.0676677915048,
          "description": "Is this an improvement or a refactoring?",
          "tagId": "question"
        },
        {
          "timestamp": 1525.509128281,
          "description": "Why I removed this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1547.8996046473162,
          "description": "what was the goal of the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1584.926168291984,
          "description": "Why I add this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1636.615624587,
          "description": "Why I add this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1687.0318444145048,
          "description": "What was the goal of the changes in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1829.8349771629073,
          "description": "What are the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1926.437236508,
          "description": "What are the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1932.047734511,
          "description": "How these changes are related with functionality X?",
          "tagId": "question"
        },
        {
          "timestamp": 1982.153349045,
          "description": "What changes were made in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 2039.273712447,
          "description": "Why this class was added?",
          "tagId": "question"
        },
        {
          "timestamp": 2113.609980792278,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 2188.472486149553,
          "description": "Why this class was added?",
          "tagId": "question"
        },
        {
          "timestamp": 2275.263007810131,
          "description": "When this change was made?",
          "tagId": "question"
        },
        {
          "timestamp": 2324.915496355,
          "description": "Why I add this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2339.368710015,
          "description": "Is this method calling function x?",
          "tagId": "question"
        },
        {
          "timestamp": 2422.497872376,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2594.401344977,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2627.670277518,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 2675.986751388,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2710.508660854,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2774.75553512,
          "description": "How the methods of this class changed?",
          "tagId": "question"
        },
        {
          "timestamp": 2879.666991488,
          "description": "What is the goal of this method?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "PIRF-SLRaNA",
      "description": "2020-12-11 Alison (Torch)",
      "marks": [
        {
          "timestamp": 627.155846083,
          "description": "What classes were changed?",
          "tagId": "question"
        },
        {
          "timestamp": 648.361196613,
          "description": "What packages were changed?",
          "tagId": "question"
        },
        {
          "timestamp": 673.358979878,
          "description": "What change in a specific file?",
          "tagId": "question"
        },
        {
          "timestamp": 705.2285247283514,
          "description": "What changed in a specific file?",
          "tagId": "question"
        },
        {
          "timestamp": 994.9978684135942,
          "description": "What change in a specific package?",
          "tagId": "question"
        },
        {
          "timestamp": 1069.690943442853,
          "description": "What changed in a class?",
          "tagId": "question"
        },
        {
          "timestamp": 1083.0505878250542,
          "description": "What variables I changed in a class?",
          "tagId": "question"
        },
        {
          "timestamp": 1106.0143909186997,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1128.335973867543,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1136.3576279496135,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1143.2061834362428,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1148.7181096285942,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1177.838359361297,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1184.9389486815367,
          "description": "Why I''''m using this variable in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1207.3215360683514,
          "description": "What was the goals of the method that I removed?",
          "tagId": "question"
        },
        {
          "timestamp": 1258.1809646017764,
          "description": "What changes I made in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1289.8223521845175,
          "description": "Are the changes in these methods related?",
          "tagId": "question"
        },
        {
          "timestamp": 1325.0849244732588,
          "description": "What changes I made in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1396.947620459,
          "description": "What methods is calling this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1435.8451965493707,
          "description": "What changes I made in this class regarding functionality X?",
          "tagId": "question"
        },
        {
          "timestamp": 1495.3139803328147,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1505.6342863632556,
          "description": "Why I removed this set of methods in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1577.7236772568147,
          "description": "What is the goal of  this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1614.0217054987413,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1628.5682441047732,
          "description": "What methods is calling this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1741.3195886531694,
          "description": "Who implemented this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1753.4969846781853,
          "description": "What changes I made in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 1766.940810980965,
          "description": "What changed in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1781.7475945170575,
          "description": "How this method is related with functionality X?",
          "tagId": "question"
        },
        {
          "timestamp": 1835.305235614,
          "description": "How these 2 classes are related?",
          "tagId": "question"
        },
        {
          "timestamp": 1865.3431509509617,
          "description": "how this method was changed?",
          "tagId": "question"
        },
        {
          "timestamp": 1969.1967868032748,
          "description": "What change in a specific method?",
          "tagId": "question"
        },
        {
          "timestamp": 1999.40446493,
          "description": "What feature was implemented by means of this set of mehtods?",
          "tagId": "question"
        },
        {
          "timestamp": 2040.6325913187795,
          "description": "What changes were made in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 2053.491778116393,
          "description": "What changed in each method of the class?",
          "tagId": "question"
        },
        {
          "timestamp": 2107.248431507,
          "description": "Why this class was removed?",
          "tagId": "question"
        },
        {
          "timestamp": 2228.962640047591,
          "description": "What feature is implemented this method?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "wXqTXrVnNDs",
      "description": "2020-12-11 Vincent (Torch)",
      "marks": []
    },
    {
      "youtubeId": "VEazVS0vlSg",
      "description": "2020-12-14 Vincent (GitHub)",
      "marks": []
    },
    {
      "youtubeId": "M8QROZYpsvg",
      "description": "2020-12-22 Alejandro (Torch)",
      "marks": [
        {
          "timestamp": 608.040586008,
          "description": "how big are the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 622.7753487,
          "description": "Is this a refactoring or something new?",
          "tagId": "question"
        },
        {
          "timestamp": 644.9388414370767,
          "description": "What are the changes in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 844.784326119,
          "description": "What was the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 947.234806062,
          "description": "What changed in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 973.318676107,
          "description": "Are the changes in this class related with the previous change?",
          "tagId": "question"
        },
        {
          "timestamp": 991.82728988,
          "description": "What are the changes in this package?",
          "tagId": "question"
        },
        {
          "timestamp": 1026.105374222,
          "description": "Should I report this change in the changelog?",
          "tagId": "question"
        },
        {
          "timestamp": 1033.085923954,
          "description": "What is the goal of this package?",
          "tagId": "question"
        },
        {
          "timestamp": 1054.083485427,
          "description": "What change was implemeted by these two classes?",
          "tagId": "question"
        },
        {
          "timestamp": 1109.896260567,
          "description": "What was implemnented by this set of classes?",
          "tagId": "question"
        },
        {
          "timestamp": 1132.095629229,
          "description": "Why these methods were removed?",
          "tagId": "question"
        },
        {
          "timestamp": 1200.932298431,
          "description": "How these classes are related with the core of the project?",
          "tagId": "question"
        },
        {
          "timestamp": 1247.507368479,
          "description": "What changes were made in this package?",
          "tagId": "question"
        },
        {
          "timestamp": 1265.956382689,
          "description": "What part of the implementation are these classes testing?",
          "tagId": "question"
        },
        {
          "timestamp": 1285.441980372,
          "description": "What changes were made in this package?",
          "tagId": "question"
        },
        {
          "timestamp": 1294.564535942,
          "description": "How these classes are related?",
          "tagId": "question"
        },
        {
          "timestamp": 1358.098484255,
          "description": "What changed in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1363.769658321,
          "description": "Why this method was added?",
          "tagId": "question"
        },
        {
          "timestamp": 1372.736036286,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1395.08443962,
          "description": "How these two methods are related?",
          "tagId": "question"
        },
        {
          "timestamp": 1506.020455158147,
          "description": "When this commit was made?",
          "tagId": "question"
        }
      ]
    },
    {
      "youtubeId": "pUjEvEKgxMg",
      "description": "2020-12-23 Alejandro (GitHub)",
      "marks": [
        {
          "timestamp": 85.4005444608147,
          "description": "What files changed between the two versions?",
          "tagId": "question"
        },
        {
          "timestamp": 134.033991557,
          "description": "What are the commits messages?",
          "tagId": "question"
        },
        {
          "timestamp": 410.654379958,
          "description": "What changed in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 431.0023104240415,
          "description": "What change in this method?",
          "tagId": "question"
        },
        {
          "timestamp": 442.092218274,
          "description": "What are all the classes/methods related to a given package?",
          "tagId": "question"
        },
        {
          "timestamp": 518.950740185,
          "description": "What was the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 540.736146641,
          "description": "What changed in this class?",
          "tagId": "question"
        },
        {
          "timestamp": 568.150664825,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 582.005287794,
          "description": "What is the goal of this package?",
          "tagId": "question"
        },
        {
          "timestamp": 593.077166186,
          "description": "How is this method related with the core?",
          "tagId": "question"
        },
        {
          "timestamp": 612.784150902,
          "description": "Is this method related with the Spike functionality?",
          "tagId": "question"
        },
        {
          "timestamp": 659.2785188488531,
          "description": "Is this a refactoring or something new?",
          "tagId": "question"
        },
        {
          "timestamp": 664.607275872,
          "description": "Which functionality is related to this change?",
          "tagId": "question"
        },
        {
          "timestamp": 693.799548131,
          "description": "What is the goal of this class?",
          "tagId": "question"
        },
        {
          "timestamp": 742.539755169,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 757.936615578,
          "description": "Why these methods were removed?",
          "tagId": "question"
        },
        {
          "timestamp": 765.656153836,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 770.13754003,
          "description": "Which functionality is related to this change?",
          "tagId": "question"
        },
        {
          "timestamp": 782.560545804,
          "description": "Are these changes related with the previous functionality?",
          "tagId": "question"
        },
        {
          "timestamp": 796.235519431,
          "description": "Why we removed this method?",
          "tagId": "question"
        },
        {
          "timestamp": 799.407284047,
          "description": "Why I made this change?",
          "tagId": "question"
        },
        {
          "timestamp": 836.51663567,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 851.256842678,
          "description": "What is the goal of this mehtod?",
          "tagId": "question"
        },
        {
          "timestamp": 846.256842678,
          "description": "Is this change related with the previous change?",
          "tagId": "question"
        },
        {
          "timestamp": 913.707283227,
          "description": "With which functionality is this change related?",
          "tagId": "question"
        },
        {
          "timestamp": 985.420182843,
          "description": "What functionality is implementing this group of methods?",
          "tagId": "question"
        },
        {
          "timestamp": 1116.827615929,
          "description": "What is the goal of this mehtod?",
          "tagId": "question"
        },
        {
          "timestamp": 1141.810175625,
          "description": "Was this only renaming?",
          "tagId": "question"
        },
        {
          "timestamp": 1154.549082395,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1172.3735063876804,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1195.45786214,
          "description": "Is this change big enough to be reported in the changelog?",
          "tagId": "question"
        },
        {
          "timestamp": 1231.921452452,
          "description": "what changes were made in this file?",
          "tagId": "question"
        },
        {
          "timestamp": 1257.210537321,
          "description": "With which functionality are associated this changes?",
          "tagId": "question"
        },
        {
          "timestamp": 1278.271790145,
          "description": "What is the goal of this mehtod?",
          "tagId": "question"
        },
        {
          "timestamp": 1366.285113306,
          "description": "With which functionality are associated this changes?",
          "tagId": "question"
        },
        {
          "timestamp": 1387.08491686,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1406.082505547,
          "description": "What is the goal of this method?",
          "tagId": "question"
        },
        {
          "timestamp": 1407.0796490270352,
          "description": "How this method is related with the functionality X?",
          "tagId": "question"
        }
      ]
    }
  ],
  "tags": [
    {
      "id": "default",
      "description": "Just a comment",
      "keyBinding": "d",
      "color": "#0000ff"
    },
    {
      "id": "question",
      "description": "Question about the diff",
      "keyBinding": "q",
      "color": "#00ff6e"
    },
    {
      "id": "section",
      "description": "Delimiter for a section of the video",
      "keyBinding": "s",
      "color": "#ff7b00"
    },
    {
      "id": "FFP",
      "description": "Finding Focus Points",
      "keyBinding": "f",
      "color": "#0000ff"
    },
    {
      "id": "EFP",
      "description": "Expanding Focus Points",
      "keyBinding": "e",
      "color": "#ed719e"
    },
    {
      "id": "US",
      "description": "Understanding a Subgraph",
      "keyBinding": "u",
      "color": "#ff4013"
    },
    {
      "id": "QGS",
      "description": "Questions over Groups of Subgraphs",
      "keyBinding": "g",
      "color": "#669c35"
    }
  ]
}'
]
