jednokrotnie(X, L) :-
	select(X, L, R),
	\+ member(X, R).
	
dwukrotnie(E,L) :- 
    append(Pre,[E|Post],L), 
    \+ member(E,Pre), 
    select(E, Post, R),
    \+ member(E,R).