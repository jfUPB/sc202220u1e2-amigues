/*@70          //Numero de letra que pone negra la pantalla
D=A           
@0
M=D          // Declara variable, se almacena 70 en posicion 0
@67          //Numero de letra que limpia la pantalla
D=A
@1
M=D          // Declara variable, se almacena 67 en posicion 1
*/
(START)			
	@KBD     //Casilla lectura de tecla
	D=M          // se almacena en D la letra
	@FILLORCLEAR	
	D;JNE           // si se esta presionando una tecla
	@START          
	0;JMP           // si no se esta presionando vuelve e inicia

(FILLORCLEAR)
// if key = f --> draw else if key = c --> clear
	@j
	M = D // save key //Se almacena la letra en la casilla 16 RAM
	@0
    A=M  // press f
	D = D-A
	@FILL
	D;JEQ
	@j
	D = M
	@1
    A=M
	D = D - A
	@CLEAR
	D;JEQ
	@START
	0;JMP

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
	D = A
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