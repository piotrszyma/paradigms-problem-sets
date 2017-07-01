arc(a,b).
arc(a,d).
arc(b,c).
arc(b,e).
arc(c,f).
arc(d,e).
arc(d,g).
arc(e,f).
arc(e,h).
arc(f,i).
arc(g,h).
arc(h,i).

path(X,Y) :- arc(X,Y).
path(X,Y) :- arc(X,Z), path(Z,Y).