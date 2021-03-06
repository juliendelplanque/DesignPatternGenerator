Class {
	#name : #MPLClassDeprecator,
	#superclass : #MPLAbstractCommand,
	#instVars : [
		'classToDeprecate'
	],
	#category : #MetaProgrammingLibrary
}

{ #category : #'instance creation' }
MPLClassDeprecator class >> classToDeprecate: classToDeprecate [
	^ self new
		classToDeprecate: classToDeprecate;
		yourself
]

{ #category : #execution }
MPLClassDeprecator class >> deprecate: aClass [
	^ (self classToDeprecate: aClass)
		execute;
		yourself
]

{ #category : #accessing }
MPLClassDeprecator >> classToDeprecate [
	^ classToDeprecate
]

{ #category : #accessing }
MPLClassDeprecator >> classToDeprecate: anObject [
	classToDeprecate := anObject
]

{ #category : #executing }
MPLClassDeprecator >> execute [
	(PCGMethodNode selector: #isDeprecated)
		bodyBlock: [ :body |
			body << true asPCG returnIt ];
		protocol: 'deprecation';
		withGeneratedPragma: self withGeneratedPragma;
		installOn: self classToDeprecate classSide
]
