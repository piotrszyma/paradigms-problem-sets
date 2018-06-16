sieve(N,L) :-
    sieve(L,Strumien,[]),
    numlist(2,N,X),
    X = Strumien.

sieve(L,Strumien,X) :-
    freeze(Strumien,
        (   Strumien =[H|T],
            filter(H,T,Z),
            sieve(L,Z,[H|X])
        )).
sieve(L,[],L).

filter(H,S,X) :-
    filter(H,S,X,[]).

filter(_,[],X,X).
filter(H,S,X,Y) :-
    freeze(S,S =[H1|T]),
    ( H1 mod H =\= 0 ->
        append(Y,[H1],Y2),
        filter(H,T,X,Y2)
    ;
        filter(H,T,X,Y)
    ).