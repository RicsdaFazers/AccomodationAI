num_resi(X,Y):- alojamento(X,_,_,caracteristicas(single,Q,_,_),_,_), Y=<Q.
num_resi(X,Y):- alojamento(X,_,_,caracteristicas(double,Q,_,_),_,_), Y=<Q*2.

printResultado([]).
printResultado([A|B]):- 
    format('~w, situado na cidade de ~w com um custo de ~w euros por noite por pessoa\n', A),
    printResultado(B).

procurar(P,T,E,O,R,D):- findall([ID,Local,Preco], (alojamento(ID,P,Local,caracteristicas(_,_,T,E),_,Preco), 
                           num_resi(ID,R),Z=O/D, Z>=Preco), L),printResultado(L).

perfil(1,O,D,R):- procurar('Portugal',cidade,1,O,R,D).
perfil(2,O,D,R):- procurar('Portugal',cidade,2,O,R,D).
perfil(3,O,D,R):- procurar('Portugal',cidade,3,O,R,D).
perfil(4,O,D,R):- procurar('Portugal',cidade,4,O,R,D).
perfil(5,O,D,R):- procurar('Portugal',cidade,5,O,R,D).
perfil(6,O,D,R):- procurar('Espanha',cidade,1,O,R,D).
perfil(7,O,D,R):- procurar('Espanha',cidade,2,O,R,D).
perfil(8,O,D,R):- procurar('Espanha',cidade,3,O,R,D).
perfil(9,O,D,R):- procurar('Espanha',cidade,4,O,R,D).
perfil(10,O,D,R):- procurar('Espanha',cidade,5,O,R,D).
perfil(11,O,D,R):- procurar('Italia',cidade,1,O,R,D).
perfil(12,O,D,R):- procurar('Italia',cidade,2,O,R,D).
perfil(13,O,D,R):- procurar('Italia',cidade,3,O,R,D).
perfil(14,O,D,R):- procurar('Italia',cidade,4,O,R,D).
perfil(15,O,D,R):- procurar('Italia',cidade,5,O,R,D).
perfil(16,O,D,R):- procurar('Franca',cidade,1,O,R,D).
perfil(17,O,D,R):- procurar('Franca',cidade,2,O,R,D).
perfil(18,O,D,R):- procurar('Franca',cidade,3,O,R,D).
perfil(19,O,D,R):- procurar('Franca',cidade,4,O,R,D).
perfil(20,O,D,R):- procurar('Franca',cidade,5,O,R,D).
perfil(21,O,D,R):- procurar('Portugal',campo,1,O,R,D).
perfil(22,O,D,R):- procurar('Portugal',campo,2,O,R,D).
perfil(23,O,D,R):- procurar('Portugal',campo,3,O,R,D).
perfil(24,O,D,R):- procurar('Portugal',campo,4,O,R,D).
perfil(25,O,D,R):- procurar('Portugal',campo,5,O,R,D).
perfil(26,O,D,R):- procurar('Espanha',campo,1,O,R,D).
perfil(27,O,D,R):- procurar('Espanha',campo,2,O,R,D).
perfil(28,O,D,R):- procurar('Espanha',campo,3,O,R,D).
perfil(29,O,D,R):- procurar('Espanha',campo,4,O,R,D).
perfil(30,O,D,R):- procurar('Espanha',campo,5,O,R,D).
perfil(31,O,D,R):- procurar('Italia',campo,1,O,R,D).
perfil(32,O,D,R):- procurar('Italia',campo,2,O,R,D).
perfil(33,O,D,R):- procurar('Italia',campo,3,O,R,D).
perfil(34,O,D,R):- procurar('Italia',campo,4,O,R,D).
perfil(35,O,D,R):- procurar('Italia',campo,5,O,R,D).
perfil(36,O,D,R):- procurar('Franca',campo,1,O,R,D).
perfil(37,O,D,R):- procurar('Franca',campo,2,O,R,D).
perfil(38,O,D,R):- procurar('Franca',campo,3,O,R,D).
perfil(39,O,D,R):- procurar('Franca',campo,4,O,R,D).
perfil(40,O,D,R):- procurar('Franca',campo,5,O,R,D).
perfil(41,O,D,R):- procurar('Portugal',montanha,1,O,R,D).
perfil(42,O,D,R):- procurar('Portugal',montanha,2,O,R,D).
perfil(43,O,D,R):- procurar('Portugal',montanha,3,O,R,D).
perfil(44,O,D,R):- procurar('Portugal',montanha,4,O,R,D).
perfil(45,O,D,R):- procurar('Portugal',montanha,5,O,R,D).
perfil(46,O,D,R):- procurar('Espanha',montanha,1,O,R,D).
perfil(47,O,D,R):- procurar('Espanha',montanha,2,O,R,D).
perfil(48,O,D,R):- procurar('Espanha',montanha,3,O,R,D).
perfil(49,O,D,R):- procurar('Espanha',montanha,4,O,R,D).
perfil(50,O,D,R):- procurar('Espanha',montanha,5,O,R,D).
perfil(51,O,D,R):- procurar('Italia',montanha,1,O,R,D).
perfil(52,O,D,R):- procurar('Italia',montanha,2,O,R,D).
perfil(53,O,D,R):- procurar('Italia',montanha,3,O,R,D).
perfil(54,O,D,R):- procurar('Italia',montanha,4,O,R,D).
perfil(55,O,D,R):- procurar('Italia',montanha,5,O,R,D).
perfil(56,O,D,R):- procurar('Franca',montanha,1,O,R,D).
perfil(57,O,D,R):- procurar('Franca',montanha,2,O,R,D).
perfil(58,O,D,R):- procurar('Franca',montanha,3,O,R,D).
perfil(59,O,D,R):- procurar('Franca',montanha,4,O,R,D).
perfil(60,O,D,R):- procurar('Franca',montanha,5,O,R,D).
perfil(61,O,D,R):- procurar('Portugal',praia,1,O,R,D).
perfil(62,O,D,R):- procurar('Portugal',praia,2,O,R,D).
perfil(63,O,D,R):- procurar('Portugal',praia,3,O,R,D).
perfil(64,O,D,R):- procurar('Portugal',praia,4,O,R,D).
perfil(65,O,D,R):- procurar('Portugal',praia,5,O,R,D).
perfil(66,O,D,R):- procurar('Espanha',praia,1,O,R,D).
perfil(67,O,D,R):- procurar('Espanha',praia,2,O,R,D).
perfil(68,O,D,R):- procurar('Espanha',praia,3,O,R,D).
perfil(69,O,D,R):- procurar('Espanha',praia,4,O,R,D).
perfil(70,O,D,R):- procurar('Espanha',praia,5,O,R,D).
perfil(71,O,D,R):- procurar('Italia',praia,1,O,R,D).
perfil(72,O,D,R):- procurar('Italia',praia,2,O,R,D).
perfil(73,O,D,R):- procurar('Italia',praia,3,O,R,D).
perfil(74,O,D,R):- procurar('Italia',praia,4,O,R,D).
perfil(75,O,D,R):- procurar('Italia',praia,5,O,R,D).
perfil(76,O,D,R):- procurar('Franca',praia,1,O,R,D).
perfil(77,O,D,R):- procurar('Franca',praia,2,O,R,D).
perfil(78,O,D,R):- procurar('Franca',praia,3,O,R,D).
perfil(79,O,D,R):- procurar('Franca',praia,4,O,R,D).
perfil(80,O,D,R):- procurar('Franca',praia,5,O,R,D).