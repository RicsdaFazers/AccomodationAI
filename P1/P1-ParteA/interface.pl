:-dynamic(fact/1), 
[forward, basedados, proof, baseconhecimento, operacoes].

menu:-nl,nl,
	  write('********************************************************************************************************'),nl,
	  write('**    Bem-vindo ao melhor aconselhador de estadias no mercado, vamos dar inicio a sua experiencia.    **'),nl,
	  write('********************************************************************************************************'),nl,
	  write('**                 Por favor responda as seguintes perguntas para o poder ajudar!                     **'),nl,
	  write('**          Para responder as perguntas necessita de inserir o numero correspondente,                 **'),nl,
	  write('**                          seguido de um ponto e pressione ENTER                                     **'),nl,
	  write('********************************************************************************************************'),nl,
	  write('**   Menu:'),nl,
	  write('**   1 - Iniciar;'), nl,
	  write('**   2 - Sair.'), nl,
	  read(Y), nl,
		(Y==1 ->  questao1; 
		Y==2 ->  write('Ate a proxima!'), halt; 
		write('Por favor introduza uma opcao valida.'), nl, menu).

questao1:- 
	write('********************************************************************************************************'),nl,
	write('**   Quantos dias deseja ficar alojado?'),nl,
	read(Dias), nl,
	(
		(integer(Dias)),assert(variavel1(Dias)), questao2;
		write('Por favor introduza uma opcao valida.'), nl, questao1
	).

questao2:- 
	write('********************************************************************************************************'),nl,
	write('**   Quantas pessoas irao ficar hospedadas?'),nl,
	read(Pessoas), nl,
	(
		(integer(Pessoas)), assert(variavel2(Pessoas)), questao3;
		nl, write('Por favor introduza uma opcao valida.'), nl, questao2
	).

questao3:-
	write('********************************************************************************************************'),nl,
	write('**   Que pais desejaria visitar?'),nl,
	write('**   1- Portugal'),nl,
	write('**   2- Espanha'),nl,
	write('**   3- Italia'),nl,
	write('**   4- Franca'),nl,
	read(Q3),nl,
		(Q3==1 -> assert(fact(portugal)),questao4;
		Q3==2 -> assert(fact(espanha)),questao4;
		Q3==3 -> assert(fact(italia)),questao4;
		Q3==4 -> assert(fact(franca)),questao4;
		write('Por favor introduza uma opcao valida.'),nl,questao3
		).

questao4:- 
	write('********************************************************************************************************'),nl,
	write('**   Que experiencia gostaria de ter perto do seu alojamento?'),nl,
	write('**   1- Historica'),nl,
	write('**   2- Calorosa'),nl,
	write('**   3- Relaxante'),nl,
	write('**   4- Invernal'),nl,
	write('**   5- Diversidade gastronomica'),nl,
	write('**   6- Aquatica'),nl,
	write('**   7- Solitaria'),nl,
	write('**   8- Selvagem'),nl,
	read(Q4), nl,
    	(Q4==1 ->  assert(fact(cidade)), questao5;
        Q4==2 ->  assert(fact(praia)), questao5;
		Q4==3 ->  assert(fact(campo)), questao5;
		Q4==4 ->  assert(fact(montanha)), questao5;
		Q4==5 ->  assert(fact(cidade)), questao5;
		Q4==6 ->  assert(fact(praia)), questao5;
		Q4==7 ->  assert(fact(campo)), questao5;
		Q4==8 ->  assert(fact(montanha)), questao5;
		write('Por favor introduza uma opcao valida.'), nl, questao4
       	).

questao5:- 
	write('********************************************************************************************************'),nl,
	write('**   Que qualidade desejaria que o seu alojamento tivesse?'),nl,
	write('**   1- Muito discreto'),nl,
	write('**   2- Discreto'),nl,
	write('**   3- Modesto'),nl,
	write('**   4- Requintado'),nl,
	write('**   5- Muito requintado'),nl,
	read(Q5), nl,
    	(Q5==1 ->  assert(fact(e1)), orcamento;
		Q5==2 ->  assert(fact(e2)), orcamento;
		Q5==3 ->  assert(fact(e3)), orcamento;
		Q5==4 ->  assert(fact(e4)), orcamento;
		Q5==5 ->  assert(fact(e5)), orcamento;
		write('Por favor introduza uma opcao valida.'), nl, questao5
       	).			

orcamento:- 
	write('********************************************************************************************************'),nl,	
	write('**   Que quantia maxima estaria disposto a gastar para reservar a sua estadia?'), nl,
	read(Orcamento), nl,
	(
		(integer(Orcamento)), assert(variavel3(Orcamento)), demo;
		write('Por favor introduza uma opcao valida.'), nl, orcamento
	).

end(P):-variavel1(Dias), variavel2(Pessoas), variavel3(Orcamento),
	  	write('********************************************************************************************************'),nl,	
		write('**                 Consoante as suas respostas, seguem de entao as nossas recomendacoes            **'),nl,
		write('********************************************************************************************************\n\n'),
	  	perfil(P,Orcamento,Dias,Pessoas), nl,nl,
	  	final.

final:- write('**   Foi um prazer ajuda-lo!'), nl,
		write('**   1- Procurar outro alojamento;'), nl,
		write('**   2- Mudar o orcamento;'), nl,
		write('**   3- Sair.'), nl,
		read(Z),
			(Z==1 ->  retract(variavel1(_)), retract(variavel2(_)), retract(variavel3(_)), retractall(fact(_)), questao1;
			Z==2 ->  retract(variavel3(_)), orcamento;
	       	Z==3 ->  nl, write('Boas ferias!'), nl, halt;
			write('Por favor introduza uma opcao valida.'), nl, final
			).