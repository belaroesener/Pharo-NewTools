"
Provides a color picker with a toolbar to confirm or cancel the selected color.

"
Class {
	#name : 'SpColorPickerPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'colorPickerPresenter'
	],
	#category : 'ColorPicker',
	#package : 'ColorPicker'
}

{ #category : 'accessing' }
SpColorPickerPresenter class >> defaultPreferredExtent [

	^ 350 @ 550
]

{ #category : 'instance creation' }
SpColorPickerPresenter class >> open [
	<script>

	^ (self newApplication: StPharoApplication current) open
]

{ #category : 'accessing' }
SpColorPickerPresenter >> color [

	^ colorPickerPresenter color
]

{ #category : 'accessing' }
SpColorPickerPresenter >> color: aColor [

	^ colorPickerPresenter setColor: aColor
]

{ #category : 'layout' }
SpColorPickerPresenter >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: colorPickerPresenter;
		yourself
]

{ #category : 'initialization' }
SpColorPickerPresenter >> initializePresenters [

	colorPickerPresenter := self newColorPicker
]

{ #category : 'initialization' }
SpColorPickerPresenter >> toolbarButtons [
	| buttons |

	buttons := OrderedCollection new.
	buttons 
			add: (self newToolbarButton
					 label: 'Cancel';
					 icon: (self iconNamed: #smallCancel);
					 help: 'Cancel the color selection';
					 action: [ self delete ];
					 yourself);
			add: (self newToolbarButton
			 label: 'Select';
			 icon: (self iconNamed: #smallOk);
			 help: 'Select and close';
			 action: [ self delete ];
			 yourself).

	^ buttons
]

{ #category : 'initialization' }
SpColorPickerPresenter >> windowIcon [

	^ self iconNamed: #smallPaint
]

{ #category : 'initialization' }
SpColorPickerPresenter >> windowTitle [

	^ 'Color Picker'
]
