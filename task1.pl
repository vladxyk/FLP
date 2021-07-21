member(X,[X|_]).
member(X,[_|L]):- member(X,L).


del(X,[X|L],L).
del(X,[Y|L],[Y|L1]):- del(X,L,L1).


add([],L,L).
add([X|L1],L2,[X|L3]):- add(L1,L2,L3).


except([],L,L).
except([X|L1],L2,Result):-
    member(X,L2),!,
    del(X,L2,L),
    except(L1,L,Result);
    except(L1,L2,Result).

union(L1,L2):-
    except(L1,L2,L3),
    add(L1,L3,Result),
    write('union='),write(Result), !.
