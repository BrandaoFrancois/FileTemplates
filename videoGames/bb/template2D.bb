;
; @title: 
;	  2DTemplate
; @author: 
; 	Brandao Francois
; @description: 
;	  Template for a basic 2D game
;

Const TITLE = "MY GAME APPLICATION";
Const SCREEN_WIDTH = 800
Const SCREEN_HEIGHT = 600

Graphics SCREEN_WIDTH, SCREEN_HEIGHT
AppTitle "TITLE"

SetBuffer BackBuffer()

While Not KeyDown(1)

	Cls

	; Set here the game code

	Flip
	
Wend
