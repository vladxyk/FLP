run:-
  write('¬ведите им€ входного файла:'),
  read(F1),
  write('¬ведите им€ выходного файла:'),
  read(F2),
  open(F1,read,S1),
  open(F2,write,S2),
  repeat,
    read_line_to_codes(S1,C),
    atom_chars(S,C),
    atomic_list_concat(L,' ',S),
    writestr(S2,L),
  at_end_of_stream(S1),
  close(S2),
  close(S1).

empty([]).
empty(_):-fail.

writeword(S2,W):-
    sub_string(W,Before,_,0,'ing'),
    sub_string(W,0,Before,_,Wed),
    write(S2,Wed),
    write(S2,'ed').
writeword(S2,W):-
    not(sub_string(W,_,_,0,'ing')),
    write(S2,W).

writestr(S2,[H|T]):-
    writeword(S2,H),
    not(empty(T)),
    writestr(S2,T).
writestr(S2,[_|T]):-
    empty(T),
    nl(S2).
