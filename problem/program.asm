//@70          //Numero de letra que pone negra la pantalla
//D=A           
//@0
//M=D          // Declara variable, se almacena 70 en posicion 0
//@67          //Numero de letra que limpia la pantalla
//D=A
//@1
//M=D          // Declara variable, se almacena 67 en posicion 1

(START)
			
	@KBD     
	D=M          
	@FILLORCLEAR	// verificar si alguna tecla está presionada 
	D;JNE           
	@START          
	0;JMP           

(FILLORCLEAR)
// if key = f --> draw else if key = c --> clear
	@j
	M = D // Verificar que la misma tecla que está almacenada en la posicion 0 esta presionada
	@0
    A=M  
	D = D-A
	@FILL
	D;JEQ

	@j
	D = M
	@1
    A=M
	D = D - A //Revisa si la tecla presionada es la misma en la posición 1
	@CLEAR  
	D;JEQ

	@START
	0;JMP //While 

(FILL)
	@value
	M = -1
	@DRAW  
	0;JMP

(CLEAR)
	@value
	M = 0
	@DRAW 
	0;JMP

(DRAW)
	@SCREEN
	D = A        //Se cambia de estado el primer pixel a -1
	@i
	M = D

(LOOP)
	@value
	D = M
	@i
	A = M
	M = D
	@i
	M = M + 1
	@24576
	D = A
	@i
	D = M - D
	@LOOP
	D;JNE
	@START
	0;JMP