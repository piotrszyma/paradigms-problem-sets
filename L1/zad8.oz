declare Ints
fun lazy {Ints N}
   N|{Ints N+1}
end
L = {Ints 1}
{Browse L.1}