:- dynamic(hbest_sofar/2),
[objetivo].

% retorna a distancia do caminho atual
eval(C,D) :- distancia_caminho(C,D).

% verifica se existe outro caminho possivel
change(X,Y, SNEW):- findall(C, caminho(X,Y,C),L),length(L,LE),random(0,LE,R),nth0(R,L,SNEW).

% determina um caminho inicial e inicia o metodo hillclimbling com 20 iterações
demo:- caminho(l1,l2,Caminho), hill_climbing(l1,l2,Caminho,[20,20,0,min],_),!.

% internal auxiliary rules, used to update hbest_sofar:
update_hbest(S,E,Opt):-	hbest_sofar(SB,EB),
                    	best_opt(0,Opt,S,E,SB,EB,SR,ER),
                        retract(hbest_sofar(SB,EB)),assert(hbest_sofar(SR,ER)).

% return SR,ER the best value of S1 and S2:
best(Prob,Opt,S1,E1,S2,E2,SR,ER):- 
	eval(S2,E2),
        update_hbest(S2,E2,Opt), % update hbest_sofar if needed
	best_opt(Prob,Opt,S1,E1,S2,E2,SR,ER).

best_opt(Prob,_,_,_,S2,E2,S2,E2):- 
	random(X), % random from 0 to 1,
	X< Prob. % accept new solution
	
best_opt(_,Opt,S1,E1,S2,E2,SR,ER):- % else, select the best one
    ((Opt=max,max_list([E1,E2],ER));(Opt=min,min_list([E1,E2],ER))),
    ((ER==E1,SR=S1); (ER==E2,SR=S2)).

% show evolution:
show(final,Verbose,S1,E1,_,_):- 
	 Verbose>0,
	 write('final:'),write(' S:'),write(S1),write(' E:'),write(E1),nl,!.
show(final2,Verbose,_,_,SB,EB):- 
	 Verbose>0,nl,nl,
	 write(' _________________________________________________________________________________________'),nl,
	 write('|'),nl,
	 write('| Melhor Solucao:'),nl,
	 write('| Caminho:'),write(SB),nl,
	 write('| Distancia:'),write(EB),nl,!,
	 write('|________________________________________________________________________________________').
show(0,Verbose,S1,E1,_,_):- 
	Verbose>0,
	write('init:'),write(' S0:'),write(S1),write(' E0:'),
	write(E1),nl,!.
show(I,Verbose,S1,E1,S2,E2):-
	0 is I mod Verbose,
	write('iter:'),write(I),write(' S1:'),write(S1),
	write(' E1:'),write(E1),write(' S2:'),write(S2),
	write(' E2:'),write(E2),nl,!.
show(_,_,_,_,_,_).

% hill climbing
% Prob=0 is pure hill climbing, Prob>0 means Stochastic Hill Climbing
% S0 is the initial solution, 
% Control is a list with the number of iterations, 
% verbose in console, probability and type of optimization.
% ---
% more detail about Control:
% Iter -- the maximum number of iterations, the algorithm stops 
%         after Iter iterations.
% Verbose -- used to show the algorithm progress, every Verbose 
%           iterations it shows current solution and evaluation.
% Prob -- numeric value from 0.0 to 1.0; 
%         if 0.0, then a pure hill climbing is performed, 
%         if > 0.0, then Stochastic Hill Climbing is executed.
% Opt -- max or min. If max then a maximization task is assumed, 
%                    if min then a minimization task is executed.

% /3 arity, main function:
hill_climbing(X,Y,S0,[Iter,Verbose,Prob,Opt],SB):-
	eval(S0,E0),
        retractall(hbest_sofar(_,_)), % remove any previous hbest_sofar
        assert(hbest_sofar(S0,E0)), % update hbest_sofar
        show(0,Verbose,S0,E0,_,_),
	hill_climbing(X,Y,S0,E0,0,Iter,Verbose,Prob,Opt,S1),
        hbest_sofar(SB,EB),
	eval(S1,E1),
        show(final2,Verbose,S1,E1,SB,EB).
% /8 arity, auxiliary function:
hill_climbing(_,_,S,_,Iter,Iter,_,_,_,S):-!. 
hill_climbing(X,Y,S1,E1,I,Iter,Verbose,Prob,Opt,SFinal):-
	change(X,Y,SNew),
	best(Prob,Opt,S1,E1,SNew,_,S2,E2),
	I1 is I+1,
        show(I1,Verbose,S1,E1,S2,E2),
	hill_climbing(X,Y,S2,E2,I1,Iter,Verbose,Prob,Opt,SFinal),!.