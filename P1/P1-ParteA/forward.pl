%fonte: slides aulas T
%forward chaining

:- op( 800, fx, if).
:- op( 700, xfx, then).
:- op( 300, xfy, or).
:- op( 500, xfy, and).

demo:- new_derived_fact(P),             
   !,
   end(P), nl,
   assert(fact(P)).          

new_derived_fact( Concl)  :-
   if Cond then Concl,               
   \+ fact( Concl),                 
   composed_fact( Cond).             

composed_fact( Cond)  :-
   fact( Cond).                      

composed_fact( Cond1 and Cond2)  :-
   composed_fact( Cond1),
   composed_fact( Cond2).            

composed_fact( Cond1 or Cond2)  :-
   composed_fact( Cond1)
   ;
   composed_fact( Cond2).