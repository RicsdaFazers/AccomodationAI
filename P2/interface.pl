
:-[objetivo,result].

menu:-nl,nl,
	  write('********************************************************************************************************'),nl,
	  write('**    Bem-vindo ao melhor aconselhador de estadias no mercado, vamos dar inicio a sua experiencia.    **'),nl,
	  write('********************************************************************************************************'),nl,
	  write('**                 Por favor responda as seguintes perguntas para o poder ajudar!                     **'),nl,
	  write('**          Para responder as perguntas necessita de inserir o numero correspondente,                 **'),nl,
	  write('**                          seguido de um ponto e pressione ENTER                                     **'),nl,
	  write('********************************************************************************************************'),nl,
	  write('**   Menu:'),nl,
	  write('**   1 - Iniciar uma procura gerar-testar'), nl,
    write('**   2 - Iniciar Hill Climbing de l1 a l2'), nl,
	  write('**   3 - Sair.'), nl,
	  read(Y), nl,
		(Y==1 ->  pergunta0;
    Y==2 ->  perguntah; 
		Y==3 ->  write('Ate a proxima!'), halt; 
		write('Por favor introduza uma opcao valida.'), nl, menu).

pergunta0 :- nl,write("_____________________________________________________________________
_____________________________________________________________________

               Locais possiveis para deslocamento:

                        l1(digite l1.)
                        l2(digite l2.)
                        l3(digite l3.)
                        l4(digite l4.)
                        l5(digite l5.)
                        l6(digite l6.)
                        l7(digite l7.)
                        l8(digite l8.)

_____________________________________________________________________
_____________________________________________________________________"), nl, nl,nl, write('Indique o seu ponto de partida: '), nl, nl, read(A), pergunta1(A).


pergunta1(A):- nl,nl,nl, write('Qual o destino que pretende com partida em '),write(A), write(' ?'), nl, nl, read(B), pergunta2(A,B).


pergunta2(A,B):- nl,nl,nl,write('Percursos disponiveis com partida em '), write(A), write(' e destino em '), write(B),write(' : '), nl, nl, resposta1(A,B).

listar([X|Y]) :- listar1(X), nl , listar(Y).
listar(_).

listar1([X|Y]) :- write(X), write(' ') , listar1(Y).
listar1(_).

resposta1(A,B):- findall(L,caminho(A,B,L),L1), listar(L1), pergunta3(A,B).


pergunta3(A,B) :- nl, nl, write('Melhor percurso possivel (com custo menor ou igual a 450$ e a menor distancia possivel), com partida em '), write(A), write(' e destino em '), write(B), nl, nl, resposta2(A,B).


resposta2(A,B) :- final(A,B,C), write(C), finalizar().

perguntah:- demo, finalizar.


finalizar():- nl, nl,write("_____________________________________________________________________
_____________________________________________________________________


                           BOA VIAGEM
                      Introduzir 0. Sair.
             Introduzir 1. Criar um novo percurso.
        Introduzir 2. Efetuar o Hill Climbing de l1 a l2.

_____________________________________________________________________
_____________________________________________________________________"), nl,
            read(Z),((Z == 0), halt;
                     (Z == 1), pergunta0;
                     (Z == 2), perguntah).
