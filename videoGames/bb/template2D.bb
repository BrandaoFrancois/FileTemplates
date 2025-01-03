;
; @title: 
;	  2DTemplate
; @author: 
; 	Brandao Francois
; @description: 
;	  Template for a basic 2D game
;

Const SCREEN_WIDTH = 800
Const SCREEN_HEIGHT = 600

Graphics SCREEN_WIDTH, SCREEN_HEIGHT

SetBuffer BackBuffer()

While Not KeyDown(1)

	Cls

	; Mettre ici le code du jeu 

	Flip
	
Wend
