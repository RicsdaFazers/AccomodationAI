num_resi(X,Y):- alojamento(X,_,_,caracteristicas(single,Q,_,_),_,_), Y=<Q.
num_resi(X,Y):- alojamento(X,_,_,caracteristicas(double,Q,_,_),_,_), Y=<Q*2.

printResultado([]).
printResultado([A|B]):- 
    format('~w, situado na cidade de ~w com um custo de ~w euros por noite por pessoa\n', A),
    printResultado(B).

procurar(P,T,E,O,R,D):- findall([ID,Local,Preco], (alojamento(ID,P,Local,caracteristicas(_,_,T,E),_,Preco), 
                           num_resi(ID,R),Z=O/D, Z>=Preco), L),printResultado(L).

perfil(1,O,D,R):- procurar('Portugal',cidade,1,O,R,D),procurar('Portugal',cidade,2,O,R,D),
                    procurar('Portugal',cidade,3,O,R,D),procurar('Portugal',cidade,4,O,R,D),
                    procurar('Portugal',cidade,5,O,R,D).
perfil(6,O,D,R):- procurar('Espanha',cidade,1,O,R,D),procurar('Espanha',cidade,2,O,R,D),
                    procurar('Espanha',cidade,3,O,R,D),procurar('Espanha',cidade,4,O,R,D),
                    procurar('Espanha',cidade,5,O,R,D).
perfil(11,O,D,R):- procurar('Italia',cidade,1,O,R,D),procurar('Italia',cidade,2,O,R,D),
                    procurar('Italia',cidade,3,O,R,D),procurar('Italia',cidade,4,O,R,D),
                    procurar('Italia',cidade,5,O,R,D).
perfil(16,O,D,R):- procurar('Franca',cidade,1,O,R,D),procurar('Franca',cidade,2,O,R,D),
                    procurar('Franca',cidade,3,O,R,D),procurar('Franca',cidade,4,O,R,D),
                    procurar('Franca',cidade,5,O,R,D).
perfil(21,O,D,R):- procurar('Portugal',campo,1,O,R,D),procurar('Portugal',campo,2,O,R,D),
                    procurar('Portugal',campo,3,O,R,D),procurar('Portugal',campo,4,O,R,D),
                    procurar('Portugal',campo,5,O,R,D).
perfil(26,O,D,R):- procurar('Espanha',campo,1,O,R,D).
perfil(27,O,D,R):- procurar('Espanha',campo,2,O,R,D),procurar('Espanha',campo,3,O,R,D),
                    procurar('Espanha',campo,4,O,R,D),procurar('Espanha',campo,5,O,R,D).
perfil(31,O,D,R):- procurar('Italia',campo,1,O,R,D).
perfil(32,O,D,R):- procurar('Italia',campo,2,O,R,D),procurar('Italia',campo,3,O,R,D),
                    procurar('Italia',campo,4,O,R,D),procurar('Italia',campo,5,O,R,D).
perfil(36,O,D,R):- procurar('Franca',campo,1,O,R,D).
perfil(37,O,D,R):- procurar('Franca',campo,2,O,R,D),procurar('Franca',campo,3,O,R,D),
                    procurar('Franca',campo,4,O,R,D),procurar('Franca',campo,5,O,R,D).
perfil(41,O,D,R):- procurar('Portugal',montanha,1,O,R,D),procurar('Portugal',montanha,2,O,R,D),
                    procurar('Portugal',montanha,3,O,R,D),procurar('Portugal',montanha,4,O,R,D),
                    procurar('Portugal',montanha,5,O,R,D).
perfil(47,O,D,R):- procurar('Espanha',montanha,1,O,R,D),procurar('Espanha',montanha,2,O,R,D),
                    procurar('Espanha',montanha,3,O,R,D),procurar('Espanha',montanha,4,O,R,D),
                    procurar('Espanha',montanha,5,O,R,D).
perfil(52,O,D,R):- procurar('Italia',montanha,1,O,R,D),procurar('Italia',montanha,2,O,R,D),
                    procurar('Italia',montanha,3,O,R,D),procurar('Italia',montanha,4,O,R,D),
                    procurar('Italia',montanha,5,O,R,D).
perfil(57,O,D,R):- procurar('Franca',montanha,1,O,R,D),procurar('Franca',montanha,2,O,R,D),
                    procurar('Franca',montanha,3,O,R,D),procurar('Franca',montanha,4,O,R,D),
                    procurar('Franca',montanha,5,O,R,D).
perfil(61,O,D,R):- procurar('Portugal',praia,1,O,R,D),procurar('Portugal',praia,2,O,R,D),
                    procurar('Portugal',praia,3,O,R,D),procurar('Portugal',praia,4,O,R,D),
                    procurar('Portugal',praia,5,O,R,D).
perfil(67,O,D,R):- procurar('Espanha',praia,1,O,R,D),procurar('Espanha',praia,2,O,R,D),
                    procurar('Espanha',praia,3,O,R,D),procurar('Espanha',praia,4,O,R,D),
                    procurar('Espanha',praia,5,O,R,D).
perfil(72,O,D,R):- procurar('Italia',praia,1,O,R,D),procurar('Italia',praia,2,O,R,D),
                    procurar('Italia',praia,3,O,R,D),procurar('Italia',praia,4,O,R,D),
                    procurar('Italia',praia,5,O,R,D).
perfil(77,O,D,R):- procurar('Franca',praia,1,O,R,D),procurar('Franca',praia,2,O,R,D),
                    procurar('Franca',praia,3,O,R,D),procurar('Franca',praia,4,O,R,D),
                    procurar('Franca',praia,5,O,R,D).
