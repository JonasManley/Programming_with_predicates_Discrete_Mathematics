student(jonas,23).
student(christoffer,23).
student(kasper,23).
student(ian,24).

class(jonas,a).
class(christoffer,a).
class(kasper,b).
class(ian,b).

room(1,a).
room(2,b).

skema(a,[mondays,thursday,wednesday]).
skema(a,[mondays,thursday,wednesday]).

%rules
classmates(A,B):-
    class(Class,A),
    class(Class,B),
    write(A  "and " B "are in the same class" Class).

studentInfo(A):- 
      class(Class, A),
      writeln(Class),
      skema(class, Skema),
      writeln(Skema),



antent_class(Name,Class):-
    skema(Class,_),
    class(Name,Class),
    write('you atent').
