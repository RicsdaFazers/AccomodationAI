:- dynamic comprimento/2.

arco(l1,l3).
arco(l1,l5).
arco(l1,l6).
arco(l1,l7).
arco(l1,l8).
arco(l3,l4).
arco(l4,l2).
arco(l5,l2).
arco(l6,l2).
arco(l7,l2).
arco(l7,l6).
arco(l8,l3).
arco(l8,l7).

custo(l1,50).
custo(l2,0).
custo(l3,240).
custo(l4,150).
custo(l5,400).
custo(l6,70).
custo(l7,30).
custo(l8,100).

distancia(l1,l3,25).
distancia(l1,l5,100).
distancia(l1,l6,55).
distancia(l1,l7,34).
distancia(l1,l8,55).
distancia(l3,l4,40).
distancia(l4,l2,20).
distancia(l5,l2,25).
distancia(l6,l2,30).
distancia(l7,l2,47).
distancia(l7,l6,15).
distancia(l8,l3,77).
distancia(l8,l7,25).

comprimento([],0). 
comprimento([_|R],N):- comprimento(R,N1), N is N1+1.

caminhocurto(X,Y,C):- caminho(X,Y,C), maiscurto(X,Y,C).
caminho(X,Z,C):-caminho(X,Z,[X],C).
caminho(X,X,C,C). 
caminho(X,Z,V,C) :- arco(X,Y), \+member(Y,V), caminho(Y,Z,[Y | V],C).
maiscurto(X,Y,C):- comprimento(C,NC), \+menor(X,Y,NC). 
menor(X,Y,NC):- caminho(X,Y,C1), comprimento(C1,NC1), NC1<NC.

calcular_custo([],0).
calcular_custo([X|R],Soma) :- custo(X,Custo), calcular_custo(R,CustoT), Soma is Custo + CustoT.

calcular_distancia(_,[],0).
calcular_distancia(P1,[P2|R2], Soma):- distancia(P2,P1,Distancia), 
calcular_distancia(P2, R2, DistanciaPercorrida), Soma is Distancia + DistanciaPercorrida.

distancia_caminho([P1|R1], Valor):-  calcular_distancia(P1,R1,Valor).

lista_caminhos(X,Y,Lista):- findall(C,caminho(X,Y,C),Lista).

guardardistancia([]).
guardardistancia([P1|R1]):- calcular_distancia(P1,R1,Valor), assertz(comprimento([P1|R1], Valor)).

gerar_distancias_caminhos([]).
gerar_distancias_caminhos([C1|R1]):- guardardistancia(C1), gerar_distancias_caminhos(R1).

caminho_mais_curto(X,Y,Caminho):- retractall(comprimento(_,_)), lista_caminhos(X,Y,Lista), 
gerar_distancias_caminhos(Lista), maiscurto(Caminho).

maiscurto(Caminho):- comprimento(Caminho, V), \+ (comprimento(_, V1), V > V1).

com_orcamento(L):- calcular_custo(L,S), S=<450.

caminhos_com_orcamento(X,Y,Z):- findall(L,(caminho(X,Y,L),com_orcamento(L)),Z).

final(X,Y,Z):- retractall(comprimento(_,_)),caminhos_com_orcamento(X,Y,L),gerar_distancias_caminhos(L),
                maiscurto(Z).


